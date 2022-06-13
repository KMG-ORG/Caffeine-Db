CREATE PROCEDURE [dbo].[sp_Notes_Update] 
    @NotesId int ,
	@RecordDate datetime,
	@Description varchar(500),
	@ModifiedDateTime datetime,
	@ModifiedBy varchar(100)
AS
BEGIN
	UPDATE NOTES
	SET RecordDate = @RecordDate,
	[Description] = @Description,
	ModifiedDateTime=@ModifiedDateTime,
	ModifiedBy=@ModifiedBy
	WHERE Id=@NotesId
END