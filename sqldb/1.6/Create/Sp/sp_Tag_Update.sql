-- ============================================================
-- Author:      <Vibhuti>    
-- Create Date: <1st June 2022>    
-- Description: <Update Tags>    
-- ============================================================
CREATE PROCEDURE [dbo].[sp_Tag_Update] 
    @Id int,
	@Name varchar(100), 
	@SelfReferenceParentId int,         
	@ModifiedDateTime datetime, 
	@LastModifiedBy varchar(100) 	
AS    
 BEGIN    
   UPDATE Tag SET  
   Name = @Name,
   SelfReferenceParentId =@SelfReferenceParentId,   
   ModifiedDateTime =@ModifiedDateTime,
   ModifiedBy=@LastModifiedBy
   WHERE Id = @Id     
 END

 
