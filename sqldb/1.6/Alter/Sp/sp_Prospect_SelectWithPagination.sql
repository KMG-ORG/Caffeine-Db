-- ===========================================================================================  
-- Author:  <Spectraltech>  
-- Create date: <04.11.2022>  
-- Description: <Get all prospect details >  
-- Mods  : i)  Added FinalDispo & FinalDispositionDate
--         ii) Added TotalRecords
--         iii) Added ContactName
-- ============================================================================================  
ALTER PROCEDURE [dbo].[sp_Prospect_SelectWithPagination] 
	@PageNumber int, 
	@PageSize int  
AS  
BEGIN  
	SELECT * FROM 
	(
	SELECT ROW_NUMBER() OVER (PARTITION BY p.Id ORDER BY p.ProspectName) AS RowNum,
	p.Id AS ProspectId ,p.ProspectName, p.City,p.[State],p.ZipCode,p.EmailAddress,p.PhoneNumber,p.PhoneExtension,p.AddressLine1,      
	p.AddressLine2,p.IsActive,p.InActiveReasonId,    
	pi.Id AS ProspectInformationId, pi.EIN,pi.YearsInBusiness,pi.NoOfEmployees,pi.Revenue,pi.NonProfit,  
	pi.ProspectStatusId,ps.[Status],      
	pi.IndustryId,pid.IndustryName,  
	pi.ProspectSizeId,psz.Size,  
	pi.IsInsuranceInformationAdded,pi.EXPMOD,pi.PackageExpirationDate,      
	pi.PackageCarrier,pi.PackagePremium,pi.WorkersCompensationExpiration,pi.WorkersCompensationCarrier,      
	pi.WorkersCompensationPremium ,P.Info,P.Website , P.ModifiedDateTime,
	concat(c.FirstName , '',c.LastName) AS ContactName,c.JobTitle as ContactJobTitle,p.CreatedBy,
	COUNT(*) OVER() AS TotalRecords,  
	 CASE WHEN final.Id > 0 THEN 'Yes' ELSE 'No' end FinalDispo,
	 (SELECT TOP 1 CreatedDateTime from FinalDisposition where ProspectId = p.Id ORDER BY CreatedDateTime DESC) as FinalDispositionDate  
	FROM Prospects AS p      
	LEFT JOIN  ProspectInformation AS pi ON p.Id =pi.ProspectId       
	LEFT JOIN  ProspectStatus AS ps ON pi.ProspectStatusId =  ps.Id    
	LEFT JOIN  ProspectSize AS psz  ON pi.ProspectSizeId = psz.Id  
	LEFT JOIN  ProspectIndustry AS pid ON pi.IndustryId = pid.Id   
	LEFT JOIN FinalDisposition AS final ON p.Id =final.ProspectId 
	LEFT JOIN Contacts AS c ON c.ProspectId = p.Id 
	where (p.IsDeleted=0 or p.IsDeleted IS NULL) AND(c.IsPrimary = 1 OR c.IsPrimary IS NULL)
	)as prospectList  WHERE prospectList.RowNum = 1 order BY prospectList.ModifiedDateTime DESC
	OFFSET (@PageNumber -1)* @PageSize ROWS
	FETCH NEXT @PageSize ROWS ONLY 
END  