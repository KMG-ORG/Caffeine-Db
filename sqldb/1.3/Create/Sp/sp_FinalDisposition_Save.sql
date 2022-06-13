 

CREATE PROCEDURE [dbo].[sp_FinalDisposition_Save]
( 
    @Id int OUTPUT,
	@DispositionId int,
	@ProspectId int,	
	@NoOfAttempt int,
    @CreatedDateTime datetime,
	@CreatedBy varchar(100),
	@ModifiedDateTime datetime,	
	@ModifiedBy varchar(2500)
)
AS
BEGIN
INSERT INTO FinalDisposition
(DispositionId,ProspectId,NoOfAttempt,CreatedDateTime,CreatedBy,ModifiedDateTime, ModifiedBy,IsDeleted)
VALUES
(@DispositionId,@ProspectId, @NoOfAttempt,@CreatedDateTime, @CreatedBy, @ModifiedDateTime,  @ModifiedBy, 0)
SET @Id=SCOPE_IDENTITY()
SELECT @Id
END