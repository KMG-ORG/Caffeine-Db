-- ===============================================================================================       
-- Author:  <Spectraltech>        
-- Create date: <11.09.2021>        
-- Description: <Get Prospect, Contact and ProspectInformation selected feilds >        
-- Mods     :  i)email address and phone number are removed from Contact and added in Prospect        
--            ii) IsPrimary is set to 1        
--            iii)Top row is selected if multiple PrimaryContact are present   
--            iv) added joins to get status , size value, state name and industry name  
--            v) Added joins to get Offering Guide URL  
--            vi) Added Latitude & Longitude 
--			  v) Added Source
-- ========================================================================================      
ALTER PROCEDURE [dbo].[sp_Prospect_SelectById]        
@ProspectId int        
AS        
SELECT Top 1      
p.Id AS ProspectId ,p.ProspectName, p.City,p.[State],p.ZipCode,p.EmailAddress,p.PhoneNumber,p.PhoneExtension,p.AddressLine1,      
p.AddressLine2,p.IsActive,p.InActiveReasonId, p.CreatedBy,p.Latitude,p.Longitude,p.Source,    
pi.Id AS ProspectInformationId, pi.EIN,pi.YearsInBusiness,pi.NoOfEmployees,pi.Revenue,pi.NonProfit,  
pi.ProspectStatusId,ps.[Status],pi.IndustryId,pid.IndustryName,pi.ProspectSizeId,psz.Size,  
pi.IsInsuranceInformationAdded,pi.EXPMOD,pi.PackageExpirationDate,pi.PackageCarrier,pi.PackagePremium,  
pi.WorkersCompensationExpiration,pi.WorkersCompensationCarrier, pi.WorkersCompensationPremium,P.Info,P.Website
FROM Prospects AS p      
LEFT JOIN  ProspectInformation AS pi ON p.Id =pi.ProspectId       
LEFT JOIN  ProspectStatus AS ps ON pi.ProspectStatusId =  ps.Id    
LEFT JOIN  ProspectSize AS psz  ON pi.ProspectSizeId = psz.Id  
LEFT JOIN  ProspectIndustry AS pid ON pi.IndustryId = pid.Id  
WHERE p.Id =@ProspectId AND(p.IsDeleted = 0 OR p.IsDeleted IS NULL)  
ORDER BY p.Id DESC      