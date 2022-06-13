-----------------------------------------------------------------
-- ===========================================================================================    
-- Author:  <KMG>    
-- Create date: <14.02.2022>    
-- Description: <Get all prospect details with  Search >    
-- Mods  : i) Email Address and Phone Number are removed from Contact and added in Prospect    
--        ii) added joins to get status , size value and industry name    
--        iii)added RowsCount as input    
-- ============================================================================================    
 
 ALTER PROCEDURE [dbo].[sp_Prospect_Search]   
(  
@RowCount int,   
@SearchProspect Nvarchar(500)  
)  
AS    
BEGIN    
  
  SELECT * FROM (
SELECT TOP(@RowCount)
ROW_NUMBER() OVER (PARTITION BY p.Id ORDER BY p.ProspectName) AS RowNum,
p.Id AS ProspectId ,p.ProspectName, p.City,p.[State],p.ZipCode,p.EmailAddress,p.PhoneNumber,p.PhoneExtension,p.AddressLine1,        
p.AddressLine2,p.IsActive,p.InActiveReasonId,      
pi.Id AS ProspectInformationId, pi.EIN,pi.YearsInBusiness,pi.NoOfEmployees,pi.Revenue,pi.NonProfit,    
pi.ProspectStatusId,ps.[Status],        
pi.IndustryId,pid.IndustryName,    
pi.ProspectSizeId,psz.Size,    
pi.IsInsuranceInformationAdded,pi.EXPMOD,pi.PackageExpirationDate,        
pi.PackageCarrier,pi.PackagePremium,pi.WorkersCompensationExpiration,pi.WorkersCompensationCarrier,        
pi.WorkersCompensationPremium,
p.Info,p.Website , CASE WHEN final.Id > 0 THEN 'Yes' ELSE 'No' end FinalDispo,  
   (SELECT TOP 1 CreatedDateTime from FinalDisposition where ProspectId = p.Id ORDER BY CreatedDateTime DESC) as FinalDispositionDate,  
   (Select Count(Id) From Prospects where IsActive =1 AND (IsDeleted =0 OR IsDeleted IS NULL) ) AS TotalRecords  
FROM Prospects AS p        
LEFT JOIN  ProspectInformation AS pi ON p.Id =pi.ProspectId         
LEFT JOIN  ProspectStatus AS ps ON pi.ProspectStatusId =  ps.Id      
LEFT JOIN  ProspectSize AS psz  ON pi.ProspectSizeId = psz.Id    
LEFT JOIN  ProspectIndustry AS pid ON pi.IndustryId = pid.Id      
LEFT JOIN FinalDisposition AS final ON final.ProspectId = p.Id  
  
where (p.IsDeleted=0 or p.IsDeleted IS NULL)  And   
(p.ProspectName LIKE  @SearchProspect   
OR p.City LIKE @SearchProspect   
OR p.[State] LIKE @SearchProspect     
OR p.PhoneNumber LIKE @SearchProspect   
Or p.PhoneExtension Like @SearchProspect
OR p.AddressLine1 LIKE @SearchProspect   
OR p.AddressLine2 LIKE @SearchProspect  
OR  ps.[Status]  LIKE @SearchProspect   
OR pid.IndustryName Like @SearchProspect   
OR psz.Size Like @SearchProspect  
OR pi.PackageExpirationDate LIKE @SearchProspect   
OR pi.PackageCarrier Like @SearchProspect   
OR pi.WorkersCompensationCarrier Like @SearchProspect)  
ORDER BY  p.Id DESC      
)as prospectList  WHERE prospectList.RowNum = 1 order BY prospectList.ProspectId DESC
END    
  
  
-----------------------------------------------------------------
