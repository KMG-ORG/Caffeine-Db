-- ===========================================================================    
-- Author:      <Vibhuti>    
-- Create Date: <16.12.2021 >    
-- Description: <Select all Tags from Tags table>    
-- ===========================================================================    
CREATE PROCEDURE  [dbo].[sp_TagMaintainence_SelectByEntity] 
	@EntityId int
AS    
BEGIN    
	SELECT t.Id,t.EntityId,te.EntityName ,t.ParentTagId,tp.ParentTagName,t.TagDescription,t.ModifiedDateTime 
	FROM TagMaintainence as t
	INNER JOIN TagEntity as te on t.EntityId = te.Id
	LEFT JOIN ParentTag as tp on t.ParentTagId = tp.Id
	WHERE (t.IsDeleted=0 OR t.IsDeleted IS NULL ) AND t.EntityId = @EntityId
	ORDER BY ModifiedDateTime DESC
END

