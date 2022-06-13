CREATE PROCEDURE [dbo].[sp_Prospect_SelectByIdAndIsPrimary]  
@ProspectId int,  
@IsPrimary bit  
AS  
Select  
--Prospect Feilds :  
p.Id as ProspectId ,p.ProspectName, p.City,p.State,p.ZipCode,p.EmailAddress,p.PhoneNumber ,  
  
--Contact Feilds :  
c.Id as ContactId,c.FirstName,c.LastName,c.JobTitle,c.IsPrimary,c.Office1PhoneNumber, c.Office1Email,c.Office1Extension,  
  
--ProspectInformation Feilds :   
pi.EIN,pi.YearsInBusiness,pi.NoOfEmployees,pi.Revenue,pi.NonProfit,pi.ProspectStatusId,  
pi.IndustryId,pi.ProspectSizeId,pi.IsInsuranceInformationAdded,pi.EXPMOD,pi.PackageExpirationDate,  
pi.PackageCarrier,pi.PackagePremium,pi.WorkersCompensationExpiration,pi.WorkersCompensationCarrier,  
pi.WorkersCompensationPremium  
from Prospects as p  
  
--Joins :  
LEFT JOIN  Contacts as c On p.Id = c.ProspectId  
LEFT JOIN  ProspectInformation as pi On p.Id =pi.ProspectId   
where p.Id =@ProspectId AND c.IsPrimary=@IsPrimary AND(p.IsDeleted = 0 OR p.IsDeleted IS NULL)   
;  
  
GO


