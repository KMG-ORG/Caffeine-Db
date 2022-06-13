-- ===========================================================================    
-- Author:      <Vibhuti>    
-- Create Date: <16.12.2021 >    
-- Description: <Select all Tags from TagMaintainence table>    
-- ===========================================================================    
CREATE PROCEDURE  [dbo].[sp_Prospect_Tag_SelectFromMaintainence] 
	@Entity varchar(100)
AS    
BEGIN    
	SELECT Id,Entity,ParentTag,TagDescription , ModifiedDateTime
	FROM TagMaintainence WHERE (IsDeleted=0 OR IsDeleted IS NULL ) AND Entity =@Entity
	ORDER BY ModifiedDateTime DESC
END

