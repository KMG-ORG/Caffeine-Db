-- ===========================================================
-- Author:  <Vibhuti>  
-- Create date: <04.25.2022>  
-- Description: <Save CustomFields>  
-- MODS : i) Added ProspectId
--       ii) Removed Id from input
-- ===========================================================
ALTER PROCEDURE [dbo].[sp_CustomField_Save] 
     @DialId int , 
	 @ProspectId int,
	 @Type varchar(100),
	 @FieldName varchar(100),
	 @FieldValue varchar(100), 
	 @CreatedDateTime DateTime,
	 @CreatedBy varchar (100)
AS  
BEGIN  

	INSERT INTO CustomField(DialId,ProspectId,[Type],FieldName,FieldValue,
	CreatedDateTime,CreatedBy,ModifiedDateTime,ModifiedBy,IsDeleted)  
  
	VALUES(@DialId,@ProspectId,@Type,@FieldName,@FieldValue,@CreatedDateTime,@CreatedBy,@CreatedDateTime,@CreatedBy,0)  
           
    SELECT SCOPE_IDENTITY() as Id;  

END  