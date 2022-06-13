-- ============================================================
-- Author:      <Vibhuti>    
-- Create Date: <04.25.2022 >    
-- Description: <Update Dials Custom Fields : Others>    
-- ============================================================
CREATE Procedure [dbo].[sp_CustomField_Update]   
     @DialId int , 
	 @ProspectId int,
	 @Type varchar(100),
	 @FieldName varchar(100),
	 @FieldValue varchar(100), 
	 @IsDeleted bit,     
	 @ModifiedDateTime datetime, 
	 @ModifiedBy varchar(100)  
AS    
BEGIN    
   DECLARE @LastUpdateID Table(Id INT NULL)    

   UPDATE CustomField SET    
		DialId=@DialId  , 
		ProspectId=@ProspectId ,
		Type=@Type ,
		FieldName= @FieldName ,
		FieldValue=  @FieldValue , 
		IsDeleted=@IsDeleted,    
		ModifiedDateTime =@ModifiedDateTime,
		ModifiedBy=@ModifiedBy


   OUTPUT inserted.ID INTO @LastUpdateID    
   WHERE (ProspectId = @ProspectId AND FieldName =@FieldName AND FieldValue = @FieldValue)     
   SELECT Id FROM @LastUpdateID;     

 END