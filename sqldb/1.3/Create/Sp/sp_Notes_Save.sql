CREATE PROCEDURE [dbo].[sp_Notes_Save]
( 
    @NotesId int OUTPUT,
	@ProspectId int,
	@Description varchar(500),
	@RecordDateTime datetime,
    @CreatedDate datetime,
	@CreatedBy varchar(60)
)
AS
BEGIN
INSERT INTO Notes(
ProspectId,
[Description],
RecordDate,
CreatedDateTime,
CreatedBy
)
VALUES(
@ProspectId,
@Description,
@RecordDateTime,
@CreatedDate,
@CreatedBy

)
SET @NotesId=SCOPE_IDENTITY()
SELECT @NotesId
END

