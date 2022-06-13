
        
ALTER PROCEDURE [dbo].[sp_ProspectPreviewList_Select]                      
 @CreateListJSON [nvarchar](max)  ,                                   
 @CreateListJSONGroup [nvarchar](max) ,                   
 @Id Int,           
 @SearchProspect Nvarchar(500),          
 @PageNumber int,           
 @PageSize int              
AS                        
 BEGIN                 
    DECLARE @SqlQuery varchar(Max)='',@Json varchar(Max)='' ,@JsonGroup  varchar(Max)=''  , @StaticList VARCHAR(100)           
         
 SELECT @StaticList = TypeOfList FROM CreateList where Id=@Id AND TypeOfList='Static' ;        
     IF(@StaticList IS NULL OR @StaticList='')        
  BEGIN        
     IF (((SELECT Count(1) FROM CreateList Where Id=@Id)>0) And  @Id>0 )                   
      BEGIN                
   SELECT @Json= CreateListJSON, @JsonGroup=CreateListJSONGroup, @SqlQuery=FilterQuery FROM [CreateList] Where Id=@Id      
      Exec sp_CreateListFilterQuery_Select @Json,@JsonGroup, @SqlQuery OUTPUT         
      END                   
     Else                    
      BEGIN                    
       Exec sp_CreateListFilterQuery_Select @CreateListJSON,@CreateListJSONGroup, @SqlQuery OUTPUT                    
      END        
          
     Exec sp_Prospect_SelectByFilter @SqlQuery, @SearchProspect,@PageNumber,@PageSize                
  END        
  ELSE        
    BEGIN        
        
    -- Display Record only static prospects        
    DECLARE @ProspectIds VARCHAR(MAX)        
    SELECT @ProspectIds = ProspectIds FROM StaticProspects WHERE ListId=@Id;         
            
   -- SELECT * FROM ufn_SplictCommaToTable (''+@ProspectIds+'')        
        
           
      -- SELECT * FROM Prospects WHERE Id IN (SELECT * FROM ufn_SplictCommaToTable(@ProspectIds))        
        
       SELECT * FROM   
(  
      SELECT ROW_NUMBER() OVER (PARTITION BY Prospects.Id ORDER BY Prospects.ProspectName) AS RowNum,  
   Prospects.Id AS ProspectId ,Prospects.ProspectName, Prospects.City,Prospects.[State],Prospects.ZipCode,Prospects.EmailAddress,Prospects.PhoneNumber,Prospects.PhoneExtension,Prospects.AddressLine1,                              
      Prospects.AddressLine2,Prospects.IsActive,Prospects.InActiveReasonId,                            
      ProspectInformation.Id AS ProspectInformationId, ProspectInformation.EIN,ProspectInformation.YearsInBusiness,ProspectInformation.NoOfEmployees,ProspectInformation.Revenue,ProspectInformation.NonProfit,                          
      ProspectInformation.ProspectStatusId,ProspectStatus.[Status],                              
      ProspectInformation.IndustryId,ProspectIndustry.IndustryName,                          
      ProspectInformation.ProspectSizeId,ProspectSize.Size,                          
      ProspectInformation.IsInsuranceInformationAdded,ProspectInformation.EXPMOD,ProspectInformation.PackageExpirationDate,                              
      ProspectInformation.PackageCarrier,ProspectInformation.PackagePremium,ProspectInformation.WorkersCompensationExpiration,  
   ProspectInformation.WorkersCompensationCarrier,ProspectInformation.WorkersCompensationPremium,  
   Info,Website , CASE WHEN final.Id > 0 THEN 'Yes' ELSE 'No' end FinalDispo,  
   (SELECT TOP 1 CreatedDateTime from FinalDisposition where ProspectId = Prospects.Id ORDER BY CreatedDateTime DESC) as FinalDispositionDate,  
   (Select Count(Id) From Prospects where IsActive =1 AND (IsDeleted =0 OR IsDeleted IS NULL) ) AS TotalRecords  
      FROM Prospects AS Prospects                              
      LEFT JOIN  ProspectInformation AS ProspectInformation ON Prospects.Id =ProspectInformation.ProspectId                               
      LEFT JOIN  ProspectStatus AS ProspectStatus ON ProspectInformation.ProspectStatusId =  ProspectStatus.Id                            
      LEFT JOIN  ProspectSize AS ProspectSize  ON ProspectInformation.ProspectSizeId = ProspectSize.Id                          
      LEFT JOIN  ProspectIndustry AS ProspectIndustry ON ProspectInformation.IndustryId = ProspectIndustry.Id     
   LEFT JOIN FinalDisposition AS final ON final.ProspectId = Prospects.Id   
      WHERE Prospects.Id IN (SELECT * FROM ufn_SplictCommaToTable(@ProspectIds))  
   )as prospectList  WHERE prospectList.RowNum = 1 order BY prospectList.ProspectId DESC  
        
      -- Note : (ufn_SplictCommaToTabl) this function Call for splict comma seprated to table         
          
    END        
        
           
        
 END