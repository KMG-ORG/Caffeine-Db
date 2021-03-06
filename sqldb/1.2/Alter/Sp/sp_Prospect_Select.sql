/****** Object:  StoredProcedure [dbo].[sp_Prospect_Select]    Script Date: 23-01-2022 10:23:53 ******/

-- ===========================================================================================
-- Author:		<Kamlesh>
-- Create date: <11.09.2021>
-- Description:	<Get all prospect details >
-- Mods  : i) Email Address and Phone Number are removed from Contact and added in Prospect
--        ii) added joins to get status , size value and industry name
--        iii)added RowsCount as input
-- ============================================================================================
ALTER PROCEDURE [dbo].[sp_Prospect_Select] 
@RowsCount int
AS
BEGIN
SELECT TOP(@RowsCount)
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
where (p.IsDeleted=0 or p.IsDeleted IS NULL)
ORDER BY  p.Id DESC   
END



