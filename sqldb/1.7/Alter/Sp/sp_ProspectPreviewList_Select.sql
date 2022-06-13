  
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
  SELECT @SqlQuery=FilterQuery FROM [CreateList] Where Id=@Id                
     -- Exec sp_CreateListFilterQuery_Select @Json,@JsonGroup, @SqlQuery OUTPUT                   
      END                             
     Else                              
      BEGIN                              
       Exec sp_CreateListFilterQuery_Select @CreateListJSON,@CreateListJSONGroup, @SqlQuery OUTPUT                              
      END                  
       Exec sp_Prospect_SelectByFilter @SqlQuery, @SearchProspect,@PageNumber,@PageSize                          
  END                  
  ELSE IF((SELECT  COUNT(ProspectIds) FROM StaticProspects LEFT JOIN CreateList C1 ON C1.Id=StaticProspects.ListId          
           WHERE ListId=@Id AND C1.ExpirationDate >= CAST(GETDATE()-1 AS DATE)) > 0 )                 
    BEGIN                   
    -- Display Record only static prospects                
          
    DECLARE @ProspectIds VARCHAR(MAX)                  
    SELECT @ProspectIds = ProspectIds FROM StaticProspects WHERE ListId=@Id;                   
                      
   -- SELECT * FROM ufn_SplictCommaToTable (''+@ProspectIds+'')                  
                  
                     
      -- SELECT * FROM Prospects WHERE Id IN (SELECT * FROM ufn_SplictCommaToTable(@ProspectIds))                  
                  
       SELECT *, COUNT(*) OVER() AS TotalRecords FROM             
(            
      SELECT ROW_NUMBER() OVER (PARTITION BY Prospects.Id ORDER BY Prospects.ProspectName) AS RowNum,            
   Prospects.Id AS ProspectId ,Prospects.ProspectName, Prospects.City,Prospects.[State],Prospects.ZipCode,Prospects.EmailAddress,Prospects.PhoneNumber,Prospects.PhoneExtension,Prospects.AddressLine1,                                        
      Prospects.AddressLine2,Prospects.IsActive,Prospects.InActiveReasonId,                                      
      ProspectInformation.Id AS ProspectInformationId, ProspectInformation.EIN,ProspectInformation.YearsInBusiness,ProspectInformation.NoOfEmployees,ProspectInformation.Revenue,ProspectInformation.NonProfit,                                    
      ProspectInformation.ProspectStatusId,ProspectStatus.[Status],                                        
      ProspectInformation.IndustryId,ProspectIndustry.IndustryName,                                    
      ProspectInformation.ProspectSizeId,ProspectSize.Size,Prospects.ModifiedDateTime ,                                 
      ProspectInformation.IsInsuranceInformationAdded,ProspectInformation.EXPMOD,ProspectInformation.PackageExpirationDate,                                        
      ProspectInformation.PackageCarrier,ProspectInformation.PackagePremium,ProspectInformation.WorkersCompensationExpiration,            
   ProspectInformation.WorkersCompensationCarrier,ProspectInformation.WorkersCompensationPremium,            
   Info,Website , (SELECT COUNT(*) from Disposition where ProspectId = Prospects.Id) as TotalDisposition,
   CASE WHEN final.Id > 0 THEN 'Yes' ELSE 'No' end FinalDispo,            
   (SELECT TOP 1 CreatedDateTime from FinalDisposition where ProspectId = Prospects.Id ORDER BY CreatedDateTime DESC) as FinalDispositionDate            
           
      FROM Prospects AS Prospects                                        
      LEFT JOIN  ProspectInformation AS ProspectInformation ON Prospects.Id =ProspectInformation.ProspectId                           
      LEFT JOIN  ProspectStatus AS ProspectStatus ON ProspectInformation.ProspectStatusId =  ProspectStatus.Id                                      
      LEFT JOIN  ProspectSize AS ProspectSize  ON ProspectInformation.ProspectSizeId = ProspectSize.Id                                    
      LEFT JOIN  ProspectIndustry AS ProspectIndustry ON ProspectInformation.IndustryId = ProspectIndustry.Id               
   LEFT JOIN FinalDisposition AS final ON final.ProspectId = Prospects.Id             
      WHERE Prospects.Id IN (SELECT * FROM ufn_SplictCommaToTable(@ProspectIds))            
   )as prospectList  WHERE prospectList.RowNum = 1 order BY prospectList.ModifiedDateTime DESC            
     OFFSET (@PageNumber -1)* @PageSize ROWS FETCH NEXT @PageSize ROWS ONLY             
      -- Note : (ufn_SplictCommaToTabl) this function Call for splict comma seprated to table                   
                    
    END                  
    ELSE          
    BEGIN          
    SELECT 0 AS RowNum,            
    0 AS ProspectId ,ProspectName, City,[State],ZipCode,EmailAddress,PhoneNumber, PhoneExtension,AddressLine1,AddressLine2,IsActive,InActiveReasonId,                                      
    0 AS ProspectInformationId, '' EIN,' 'YearsInBusiness,'' NoOfEmployees,0 Revenue,'' NonProfit, '' ProspectStatusId, '' [Status], '' IndustryId,          
    '' IndustryName,'' ProspectSizeId,'' Size, '' IsInsuranceInformationAdded,'' EXPMOD,'' PackageExpirationDate, '' PackageCarrier,'' PackagePremium,          
    '' WorkersCompensationExpiration, '' WorkersCompensationCarrier,'' WorkersCompensationPremium,  Info,Website ,
	0 AS TotalDisposition, 'No' AS FinalDispo,  NULL as FinalDispositionDate,            
    0 AS TotalRecords FROM Prospects WHERE Id = 0;              
    END          
                  
 END   