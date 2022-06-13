-- ============================================================
-- Author:      <Vibhuti>    
-- Create Date: <1st June 2022>    
-- Description: <Select Tag by TagId>    
-- ============================================================
CREATE PROCEDURE  [dbo].[sp_Tag_SelectById] 
	@Id int
AS    
BEGIN  
	SELECT t.Id,t.AssociatedBusinessObjectName,t.Name,t.SelfReferenceParentId
	FROM Tag as t
	WHERE (t.IsDeleted=0 OR t.IsDeleted IS NULL ) AND t.Id = @Id
	ORDER BY t.ModifiedDateTime DESC	
END
