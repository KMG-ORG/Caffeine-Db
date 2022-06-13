-- =========================================================================
-- Author:		<Vibhuti>
-- Create date: <1st June 2022>
-- Description:	<Save Tag from Tag maintainence screen >
-- =========================================================================
CREATE PROCEDURE [dbo].[sp_Tag_Save]     
	@Name varchar(100), 
	@AssociatedBusinessObjectName varchar (100),   
	@SelfReferenceParentId int,     
	@IsDeleted bit,    
	@CreatedDateTime datetime,    
	@ModifiedDateTime datetime,
	@CreatedBy varchar(100) 
AS         
BEGIN    
	INSERT INTO Tag(Name,AssociatedBusinessObjectName,SelfReferenceParentId,CreatedDateTime,ModifiedDateTime,IsDeleted,CreatedBy,ModifiedBy)     
	VALUES(@Name,@AssociatedBusinessObjectName,@SelfReferenceParentId,@CreatedDateTime,@ModifiedDateTime,@IsDeleted, @CreatedBy,@CreatedBy)    
	SELECT SCOPE_IDENTITY() as Id;            
END   




       
          

 
