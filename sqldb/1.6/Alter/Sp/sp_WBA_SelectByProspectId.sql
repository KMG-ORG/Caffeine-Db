ALTER PROCEDURE [dbo].[sp_WBA_SelectByProspectId]
@ProspectId int     
AS    
BEGIN     
SELECT w.Id As WBAId,w.ProspectId,    
concat(p.ProspectName,' ','-',w.EffectiveDate) AS WhiteBoardActivityName,    
p.ProspectName AS CompanyName,w.EIN, w.BusinessLineId, bl.Line,  
w.BusinessStatusId, bs.[Status],w.TargetPremium,w.EffectiveDate,  
w.ExpiringCarrierId,ec.Value,case when w.ResultId Is Null then 0 else w.ResultId End as ResultId,  
r.ResultName,w.PriorityId,pr.Value as PriorityName, case when w.AccountManagerUserId Is Null then 0 else w.AccountManagerUserId End as AccountManagerUserId,  
am.UserName as  AccountManagerUserName,w.LeadGenerateId as LeadGeneratorId,l.Value as LeadGeneratorName,case when w.ProgressId Is Null then 0 else w.ProgressId End as ProgressId,  
pg.ProgressName,w.UserId,u.UserName,w.ExpiringPremium,w.ExpiringRevenue,w.ContactId,concat(c.FirstName, '',c.LastName) as ContactName,w.OwnerUserId, u.UserName as OwnerUserName     
From WBA AS w   
INNER JOIN Contacts AS c ON w.ContactId = c.Id   
INNER JOIN  BusinessLine AS bl ON  w.BusinessLineId = bl.Id      
INNER JOIN  BusinessStatus AS bs ON w.BusinessStatusId = bs.Id    
LEFT JOIN  ExpiringCarrier AS ec ON w.ExpiringCarrierId = ec.Id    
LEFT JOIN  Result AS r ON w.ResultId = r.Id    
LEFT JOIN  WBAPriority AS pr ON w.PriorityId = pr.Id    
LEFT JOIN  users AS am ON w.AccountManagerUserId = am.Id    
LEFT JOIN  LeadGenerator AS l ON w.LeadGenerateId = l.Id    
LEFT JOIN  Progress AS pg ON w.ProgressId = l.Id    
LEFT JOIN  Users AS u ON w.OwnerUserId = u.Id    
INNER JOIN Prospects AS p ON w.ProspectId =p.Id      
WHERE (w.IsDeleted=0 or w.IsDeleted IS NULL)  And W.ProspectId = @ProspectId  
ORDER BY  w.Id DESC    
END