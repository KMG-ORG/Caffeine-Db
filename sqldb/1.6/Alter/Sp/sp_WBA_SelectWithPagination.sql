-- =================================================================
-- Author:  <Vibhuti>  
-- Create date: <04-20-2022>  
-- Description: <Get all WBA details with Pagination > 
--MODS : Added OwnerName & ContactName(13th May 2022)
-- ==================================================================  
ALTER PROCEDURE [dbo].[sp_WBA_SelectWithPagination] 
	@PageNumber int,  
	@PageSize int  
AS  
BEGIN  

	SELECT w.Id As WBAId,w.ProspectId,  
	concat(p.ProspectName,' ','-',w.EffectiveDate) AS WhiteBoardActivityName,  
	p.ProspectName AS CompanyName,w.EIN, w.BusinessLineId, bl.Line, w.BusinessStatusId, bs.[Status],  
	w.TargetPremium,w.EffectiveDate,w.ExpiringCarrierId,ec.Value,w.ResultId,r.ResultName,  
	w.PriorityId,pr.Value as PriorityName, w.AccountManagerUserId,am.UserName as  AccountManagerUserName,  
	w.LeadGenerateId as LeadGeneratorId,l.Value as LeadGeneratorName,w.ProgressId,pg.ProgressName,w.UserId,  
	u.UserName,w.ExpiringPremium,w.ExpiringRevenue,w.ContactId,
	concat(c.FirstName, '',c.LastName) as ContactName, own.UserName as OwnerUserName,
	COUNT(*) OVER() AS TotalRecords  
	From WBA AS w  
	INNER JOIN Contacts AS c ON w.ContactId = c.Id
	INNER JOIN  BusinessLine AS bl ON  w.BusinessLineId = bl.Id    
	INNER JOIN  BusinessStatus AS bs ON w.BusinessStatusId = bs.Id  
	LEFT JOIN  ExpiringCarrier AS ec ON w.ExpiringCarrierId = ec.Id  
	LEFT JOIN  Result AS r ON w.ResultId = r.Id  
	LEFT JOIN  Priority AS pr ON w.PriorityId = pr.Id  
	LEFT JOIN  users AS am ON w.AccountManagerUserId = am.Id  
	LEFT JOIN  LeadGenerator AS l ON w.LeadGenerateId = l.Id  
	LEFT JOIN  Progress AS pg ON w.ProgressId = l.Id  
	LEFT JOIN  Users AS u ON w.UserId = u.Id  
	LEFT JOIN  users AS own ON w.OwnerUserId = own.Id
	INNER JOIN Prospects AS p ON w.ProspectId =p.Id  
	WHERE (w.IsDeleted=0 or w.IsDeleted IS NULL)  
	ORDER BY w.Id DESC 
	OFFSET (@PageNumber -1)* @PageSize ROWS  
	FETCH NEXT @PageSize ROWS ONLY   
END