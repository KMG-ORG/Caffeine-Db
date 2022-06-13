-- ============================================================
-- Author:      <Vibhuti>    
-- Create Date: <05.16.2021 >    
-- Description: <Update Tags>    
-- ============================================================
CREATE PROCEDURE [dbo].[sp_TagMaintainence_Update] 
	@Id int, 
	@ParentTagId int,  
	@TagDescription varchar(100),            
	@ModifiedDateTime datetime, 
	@LastModifiedBy varchar(100)    
AS    
 BEGIN    
   UPDATE TagMaintainence SET  
   ParentTagId = @ParentTagId,
   TagDescription =@TagDescription,   
   ModifiedDateTime =@ModifiedDateTime,
   ModifiedBy=@LastModifiedBy
   WHERE Id = @Id     
 END

 
