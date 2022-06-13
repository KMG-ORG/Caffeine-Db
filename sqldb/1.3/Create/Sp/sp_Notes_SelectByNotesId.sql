--Notes Select By Notes Id

CREATE PROCEDURE [dbo].[sp_Notes_SelectByNotesId] 
@NotesId int
AS
BEGIN
     SELECT nt.Id,nt.ProspectId,nt.DispositionId,dis.Disposition,nt.[Description],
	 nt.RecordDate,nt.CreatedBy 
	 FROM Notes AS nt 
	 LEFT JOIN MasterDisposition AS dis ON  nt.DispositionId = dis.Id
	 WHERE nt.Id=@NotesId AND (nt.IsDeleted = 0 OR nt.IsDeleted IS NULL)
END