 
 
CREATE PROCEDURE [dbo].[sp_ProspectSearchByCreatedListId_Select]        
 @CreatedListId Int,    
 @RowCount Int,    
 @SearchProspect Nvarchar(500)      
AS              
 BEGIN       
    DECLARE @SqlQuery varchar(Max)=''    
 SELECT @SqlQuery=FilterQuery FROM [CreateList] Where Id=@CreatedListId         
 DECLARE @SQL NVARCHAR(Max) = ('
 SELECT * FROM (
 
 SELECT TOP ('+Cast(@RowCount as varchar(10))+')    
   ROW_NUMBER() OVER (PARTITION BY Prospects.Id ORDER BY Prospects.ProspectName) AS RowNum,
   Prospects.Id AS ProspectId ,Prospects.ProspectName, Prospects.City,Prospects.[State],Prospects.ZipCode,Prospects.EmailAddress,Prospects.PhoneNumber,Prospects.PhoneExtension,Prospects.AddressLine1,                  
    Prospects.AddressLine2,Prospects.IsActive,Prospects.InActiveReasonId,                
    ProspectInformation.Id AS ProspectInformationId, ProspectInformation.EIN,ProspectInformation.YearsInBusiness,ProspectInformation.NoOfEmployees,ProspectInformation.Revenue,ProspectInformation.NonProfit,              
    ProspectInformation.ProspectStatusId,ProspectStatus.[Status],                  
    ProspectInformation.IndustryId,ProspectIndustry.IndustryName,              
    ProspectInformation.ProspectSizeId,ProspectSize.Size,              
    ProspectInformation.IsInsuranceInformationAdded,ProspectInformation.EXPMOD,ProspectInformation.PackageExpirationDate,                  
    ProspectInformation.PackageCarrier,ProspectInformation.PackagePremium,ProspectInformation.WorkersCompensationExpiration,ProspectInformation.WorkersCompensationCarrier,                  
    ProspectInformation.WorkersCompensationPremium,
	Prospects.Info,Prospects.Website , CASE WHEN final.Id > 0 THEN ''Yes'' ELSE ''No'' end FinalDispo,  
   (SELECT TOP 1 CreatedDateTime from FinalDisposition where ProspectId = Prospects.Id ORDER BY CreatedDateTime DESC) as FinalDispositionDate,  
   (Select Count(Id) From Prospects where IsActive =1 AND (IsDeleted =0 OR IsDeleted IS NULL) ) AS TotalRecords  
   FROM Prospects     
   LEFT JOIN  Contacts ON Prospects.Id =Contacts.ProspectId     
   LEFT JOIN  ProspectInformation AS ProspectInformation ON Prospects.Id =ProspectInformation.ProspectId                   
   LEFT JOIN  ProspectStatus AS ProspectStatus ON ProspectInformation.ProspectStatusId =  ProspectStatus.Id                
   LEFT JOIN  ProspectSize AS ProspectSize  ON ProspectInformation.ProspectSizeId = ProspectSize.Id              
   LEFT JOIN  ProspectIndustry AS ProspectIndustry ON ProspectInformation.IndustryId = ProspectIndustry.Id    
   LEFT JOIN FinalDisposition AS final ON final.ProspectId = Prospects.Id  
 WHERE ' + @SqlQuery )    
    
 if(@SearchProspect IS NOT NULL Or @SearchProspect  ='')    
 BEGIN    

 Set @SearchProspect= (replace(@SearchProspect,'*','%'));   

     Set @SearchProspect= '''%'+@SearchProspect+'%'''    
  Set @SQL =@SQL+ 'AND(Prospects.ProspectName LIKE '+ @SearchProspect      
 +' OR Prospects.City LIKE '+ @SearchProspect +'       
 OR Prospects.[State] LIKE '+ @SearchProspect +'       
 OR Prospects.ZipCode  LIKE '+ @SearchProspect +'     
 OR Prospects.EmailAddress LIKE '+ @SearchProspect  +'     
 OR Prospects.PhoneNumber LIKE '+@SearchProspect  +'     
 Or Prospects.PhoneExtension Like '+ @SearchProspect+'    
 OR Prospects.AddressLine1 LIKE '+@SearchProspect  +'     
 OR Prospects.AddressLine2 LIKE '+@SearchProspect +'      
 OR ProspectStatus.[Status]  LIKE '+@SearchProspect +'      
 OR IndustryName Like '+ @SearchProspect +'      
 OR ProspectSize.Size Like '+ @SearchProspect  +'    
 OR ProspectInformation.PackageExpirationDate LIKE '+@SearchProspect +'       
 OR ProspectInformation.PackageCarrier Like '+@SearchProspect +'    
 OR ProspectInformation.WorkersCompensationCarrier Like '+@SearchProspect +')'    
 END    

 SET @SQL  = @SQL + ' )as prospectList  WHERE prospectList.RowNum = 1 order BY prospectList.ProspectId DESC'

 --  SELECT @SQL
   EXEC sp_executesql @SQL        
 END
   