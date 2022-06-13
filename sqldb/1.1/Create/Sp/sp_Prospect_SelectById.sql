-- ===============================================================================================     
-- Author:  <Kamlesh>      
-- Create date: <11.09.2021>      
-- Description: <Get Prospect, Contact and ProspectInformation selected feilds >      
-- Mods     :  i)email address and phone number are removed from Contact and added in Prospect      
--            ii) IsPrimary is set to 1      
--            iii)Top row is selected if multiple PrimaryContact are present 
--            iv) added joins to get status , size value, state name and industry name
-- =============================================================================================    
CREATE PROCEDURE [dbo].[sp_Prospect_SelectById]      
@ProspectId int      
AS      
SELECT Top 1    
p.Id AS ProspectId ,p.ProspectName, p.City,p.[State],p.ZipCode,p.EmailAddress,p.PhoneNumber,p.AddressLine1,    
p.AddressLine2,p.IsActive,p.InActiveReasonId,p.IsActive,   
c.Id As ContactId, c.FirstName,c.LastName,c.JobTitle,c.IsPrimary,c.Office1PhoneNumber, c.Office1Email,c.Office1Extension,    
pi.Id AS ProspectInformationId, pi.EIN,pi.YearsInBusiness,pi.NoOfEmployees,pi.Revenue,pi.NonProfit,
pi.ProspectStatusId,ps.[Status],    
pi.IndustryId,pid.IndustryName,
pi.ProspectSizeId,psz.Size,
pi.IsInsuranceInformationAdded,pi.EXPMOD,pi.PackageExpirationDate,    
pi.PackageCarrier,pi.PackagePremium,pi.WorkersCompensationExpiration,pi.WorkersCompensationCarrier,    
pi.WorkersCompensationPremium   
FROM Prospects AS p    
LEFT JOIN  Contacts AS c ON p.Id = c.ProspectId AND c.IsPrimary=1    
LEFT JOIN  ProspectInformation AS pi ON p.Id =pi.ProspectId     
LEFT JOIN  ProspectStatus AS ps ON pi.ProspectStatusId =  ps.Id  
LEFT JOIN  ProspectSize AS psz  ON pi.ProspectSizeId = psz.Id
LEFT JOIN  ProspectIndustry AS pid ON pi.IndustryId = pid.Id   

WHERE p.Id =@ProspectId AND(p.IsDeleted = 0 OR p.IsDeleted IS NULL)
ORDER BY c.Id, p.Id DESC    
      
    
GO


