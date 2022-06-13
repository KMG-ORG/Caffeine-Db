-- ============================================================
-- Author:      <Vibhuti>    
-- Create Date: <04.25.2022 >    
-- Description:	<Soft Delete Dials Custom field : Others>
-- ============================================================
CREATE PROCEDURE [dbo].[sp_CustomField_Delete]      
	@ProspectId int    
AS    
BEGIN  
	-- first we have to delete all Others for each prospect  
	UPDATE CustomField SET IsDeleted=1 WHERE ProspectId = @ProspectId;  
END;

