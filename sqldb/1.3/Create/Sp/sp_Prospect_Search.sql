-- ===========================================================================================  
-- Author:  <KMG>  
-- Create date: <14.02.2022>  
-- Description: <Get all prospect details with Search >  
-- ============================================================================================  
CREATE PROCEDURE [dbo].[sp_Prospect_Search] 
@RowCount int , 
@SearchProspect Nvarchar(500)
AS  
BEGIN  

SELECT TOP(@RowCount)  
p.Id AS ProspectId ,p.ProspectName, p.City,p.[State],p.ZipCode,p.EmailAddress,p.PhoneNumber,p.AddressLine1,      
p.AddressLine2,p.IsActive,p.InActiveReasonId,    
pi.Id AS ProspectInformationId, pi.EIN,pi.YearsInBusiness,pi.NoOfEmployees,pi.Revenue,pi.NonProfit,  
pi.ProspectStatusId,ps.[Status],      
pi.IndustryId,pid.IndustryName,  
pi.ProspectSizeId,psz.Size,  
pi.IsInsuranceInformationAdded,pi.EXPMOD,pi.PackageExpirationDate,      
pi.PackageCarrier,pi.PackagePremium,pi.WorkersCompensationExpiration,pi.WorkersCompensationCarrier,      
pi.WorkersCompensationPremium     
FROM Prospects AS p      
LEFT JOIN  ProspectInformation AS pi ON p.Id =pi.ProspectId       
LEFT JOIN  ProspectStatus AS ps ON pi.ProspectStatusId =  ps.Id    
LEFT JOIN  ProspectSize AS psz  ON pi.ProspectSizeId = psz.Id  
LEFT JOIN  ProspectIndustry AS pid ON pi.IndustryId = pid.Id    

WHERE (p.IsDeleted=0 or p.IsDeleted IS NULL)  And 
(p.ProspectName LIKE  @SearchProspect 
OR p.City LIKE @SearchProspect 
OR p.[State] LIKE @SearchProspect 
OR p.ZipCode  LIKE @SearchProspect
OR p.EmailAddress LIKE @SearchProspect 
OR p.PhoneNumber LIKE @SearchProspect 
OR p.AddressLine1 LIKE @SearchProspect 
OR p.AddressLine2 LIKE @SearchProspect
OR  ps.[Status]  LIKE @SearchProspect 
OR pid.IndustryName Like @SearchProspect 
OR psz.Size Like @SearchProspect
OR pi.PackageExpirationDate LIKE @SearchProspect 
OR pi.PackageCarrier Like @SearchProspect 
OR pi.WorkersCompensationCarrier Like @SearchProspect)
ORDER BY  p.Id DESC        
END  
  