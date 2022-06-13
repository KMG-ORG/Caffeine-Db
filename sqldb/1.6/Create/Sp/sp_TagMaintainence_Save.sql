-- =========================================================================
-- Author:		<Vibhuti>
-- Create date: <05.06.2022>
-- Description:	<Save Tag from Tag Maintainence screen >
-- =========================================================================
CREATE PROCEDURE [dbo].[sp_TagMaintainence_Save]     
	@EntityId int, 
	@ParentTagId int,     
	@TagDescription varchar(100),     
	@IsDeleted bit,    
	@CreatedDateTime datetime,    
	@ModifiedDateTime datetime,
	@CreatedBy varchar(30) 
AS         
BEGIN    
	INSERT INTO TagMaintainence(EntityId,ParentTagId,TagDescription,CreatedDateTime,ModifiedDateTime,IsDeleted,CreatedBy,ModifiedBy)     
	VALUES(@EntityId,@ParentTagId,@TagDescription,@CreatedDateTime,@ModifiedDateTime,@IsDeleted, @CreatedBy,@CreatedBy)    
	SELECT SCOPE_IDENTITY() as Id;            
END   


       
          

 