


CREATE PROCEDURE [dbo].[sp_FinalDisposition_Update]
( 
    @Id int,	
	@NoOfAttempt int, 
	@ModifiedDateTime datetime,	
	@ModifiedBy varchar(2500)
)
AS
BEGIN
UPDATE FinalDisposition
SET
NoOfAttempt = @NoOfAttempt, 
ModifiedDateTime = @ModifiedDateTime , 
ModifiedBy  = @ModifiedBy 
WHERE Id= @Id  
END