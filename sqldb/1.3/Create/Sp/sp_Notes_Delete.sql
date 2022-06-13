CREATE PROCEDURE [dbo].[sp_Notes_Delete]
(
  @NotesId int,
  @ModifiedDateTime datetime,
  @ModifiedBy varchar(100)
)
AS
BEGIN
	Update Notes
	SET IsDeleted=1,
	ModifiedDateTime=@ModifiedDateTime,
	ModifiedBy=@ModifiedBy
	WHERE Id=@NotesId
END

