CREATE PROCEDURE [dbo].[sp_Prospect_LookUpWithPagination]  1,50 
 @PageNumber int,   
 @PageSize int    
AS    
BEGIN    
 SELECT
	p.Id AS ProspectId ,p.ProspectName, p.City,p.[State],p.ZipCode,
	p.EmailAddress,p.PhoneNumber,p.PhoneExtension,p.AddressLine1,        
	p.AddressLine2,p.IsActive,p.InActiveReasonId,      
	pi.Id AS ProspectInformationId, pi.EIN,pi.YearsInBusiness,
	pi.NoOfEmployees,pi.Revenue,pi.NonProfit,       
	pi.IsInsuranceInformationAdded,pi.EXPMOD,pi.PackageExpirationDate,        
	pi.PackageCarrier,pi.PackagePremium,pi.WorkersCompensationExpiration,
	pi.WorkersCompensationCarrier,        
	pi.WorkersCompensationPremium ,P.Info,P.Website ,   
	concat(c.FirstName , '',c.LastName) AS ContactName,
	c.JobTitle as ContactJobTitle,p.CreatedBy,
	COUNT(*) OVER() AS TotalRecords,
	p.ModifiedDateTime  
	FROM Prospects AS p        
	LEFT JOIN  ProspectInformation AS pi ON p.Id =pi.ProspectId               
	LEFT JOIN Contacts AS c ON c.ProspectId = p.Id   
	where (p.IsDeleted=0 or p.IsDeleted IS NULL)
	order BY p.ModifiedDateTime DESC
	OFFSET (@PageNumber -1)* @PageSize ROWS
	FETCH NEXT @PageSize ROWS ONLY
END 
