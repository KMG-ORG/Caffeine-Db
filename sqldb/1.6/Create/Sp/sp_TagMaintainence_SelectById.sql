-- ===========================================================================    
-- Author:      <Vibhuti>    
-- Create Date: <16.12.2021 >    
-- Description: <Select Tag by its Id>    
-- ===========================================================================    
CREATE PROCEDURE  [dbo].[sp_TagMaintainence_SelectById] 
	@Id int
AS    
BEGIN    
	SELECT t.Id,t.EntityId,te.EntityName,t.ParentTagId,pt.ParentTagName,t.TagDescription 
	FROM TagMaintainence as t  
	INNER JOIN TagEntity as te ON t.EntityId = te.Id
	LEFT JOIN ParentTag as pt ON  t.ParentTagId = pt.Id
	WHERE (t.IsDeleted=0 OR t.IsDeleted IS NULL ) AND t.Id =@Id
END
