-- ===========================================================================    
-- Author:      <Vibhuti>    
-- Create Date: <16.12.2021 >    
-- Description: <Select all Tags from Tags table for a given BusinessObject>    
-- ===========================================================================    
CREATE PROCEDURE  [dbo].[sp_Tag_SelectByBusinessObject] 
	@AssociatedBusinessObjectName varchar(100)
AS    
BEGIN    
	SELECT t.Id,t.AssociatedBusinessObjectName,t.Name,t.SelfReferenceParentId
	FROM Tag as t
	WHERE (t.IsDeleted=0 OR t.IsDeleted IS NULL ) AND t.AssociatedBusinessObjectName = @AssociatedBusinessObjectName
	ORDER BY t.ModifiedDateTime DESC
END

