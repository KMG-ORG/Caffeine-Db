-- ===========================================================================================
-- Author:	Spectraltect
-- Create date: 27.03.2022
-- Description:	Get WBA details
-- MODS : Added   i) Target Premium   ii) ExpiringCarrier iii)Result
--        Removed i) User join (25th March 2022)
--		 convert inner join to left join (29th March 2022)
-- ============================================================================================
ALTER PROCEDURE [dbo].[sp_WBA_SelectByWBAId] 
@WBAId int 
AS
BEGIN
SELECT w.Id As WBAId,w.ProspectId,
concat(p.ProspectName,' ','-',w.EffectiveDate) AS WhiteBoardActivityName,
p.ProspectName AS CompanyName,w.EIN, w.BusinessLineId, bl.Line, w.BusinessStatusId, bs.[Status],
w.TargetPremium,w.EffectiveDate,w.ExpiringCarrierId,ec.Value,w.ResultId,r.ResultName,
w.PriorityId,pr.Value PriorityName, w.AccountManagerUserId,am.UserName as AccountManagerUserName,
w.LeadGenerateId as LeadGeneratorId,l.Value as LeadGeneratorName,w.ProgressId,pg.ProgressName,
w.UserId,u.UserName,w.ExpiringPremium,w.ExpiringRevenue, w.ContactId
From WBA AS w   
INNER JOIN  BusinessLine AS bl ON  w.BusinessLineId = bl.Id  
INNER JOIN  BusinessStatus AS bs ON w.BusinessStatusId = bs.Id
LEFT JOIN  ExpiringCarrier AS ec ON w.ExpiringCarrierId = ec.Id
LEFT JOIN  Result AS r ON w.ResultId = r.Id
LEFT JOIN  Priority AS pr ON w.PriorityId = pr.Id
LEFT JOIN  Users AS am ON w.AccountManagerUserId = am.Id
LEFT JOIN  LeadGenerator AS l ON w.LeadGenerateId = l.Id
LEFT JOIN  Progress AS pg ON w.ProgressId = l.Id
LEFT JOIN  Users AS u ON w.UserId = u.Id
INNER JOIN Prospects AS p ON w.ProspectId =p.Id
WHERE (w.IsDeleted=0 or w.IsDeleted IS NULL) and w.Id=@WBAId
ORDER BY  w.Id DESC 
END