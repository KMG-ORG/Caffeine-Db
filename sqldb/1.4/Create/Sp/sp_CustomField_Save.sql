-- ===========================================================================================  
-- Author:  <SpectralTech>  
-- Create date: <03.07.2022>  
-- Description: <Save CustomFields>  
-- ============================================================================================  
CREATE PROCEDURE [dbo].[sp_CustomField_Save] 
     @Id int OUTPUT,  
     @DialId int , 
	 @Type varchar(100),
	 @FieldName varchar(100),
	 @FieldValue varchar(100), 
	 @CreatedDateTime DateTime,
	 @CreatedBy varchar (100)
AS  
BEGIN  

	INSERT INTO CustomField(DialId,[Type],FieldName,FieldValue,
	CreatedDateTime,CreatedBy,ModifiedDateTime,ModifiedBy,IsDeleted)  
  
	VALUES(@DialId,@Type,@FieldName,@FieldValue,@CreatedDateTime,@CreatedBy,@CreatedDateTime,@CreatedBy,0)  
           
	SET @DialId=SCOPE_IDENTITY()  
	SELECT @DialId  

END  