-- ===========================================================================================
-- Author:		<Vibhuti>
-- Create date: <01.05.2022>
-- Description:	<Get WBA details >
-- ============================================================================================
CREATE PROCEDURE [dbo].[sp_WBA_Select] 
AS
BEGIN    
SELECT w.Id As WBAId,w.ProspectId,
concat(p.ProspectName,' ',bl.Line,'-',w.EffectiveDate) AS WhiteBoardActivityName,
p.ProspectName AS CompanyName,w.EIN, w.BusinessLineId, bl.Line, w.BusinessStatusId, bs.[Status], w.BoundRevenue,w.UserId, u.UserName, 
w.EffectiveDate,w.CreatedBy,w.CreatedDateTime,w.ModifiedBy,w.ModifiedDateTime FROM WBA AS w   
INNER JOIN  BusinessLine AS bl ON  w.BusinessLineId = bl.Id  
INNER JOIN  BusinessStatus AS bs ON w.BusinessStatusId = bs.Id
INNER JOIN  Users AS u ON w.UserId = u.Id
INNER JOIN Prospects AS p ON w.ProspectId =p.Id
WHERE (w.IsDeleted=0 or w.IsDeleted IS NULL)
ORDER BY  w.Id DESC    
END


