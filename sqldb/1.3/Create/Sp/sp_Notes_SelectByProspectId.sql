CREATE PROCEDURE [dbo].[sp_Notes_SelectByProspectId] 
@ProspectId int
AS
BEGIN
     SELECT nt.Id,nt.ProspectId,nt.DispositionId,dis.Disposition,nt.[Description],
	 nt.RecordDate,nt.CreatedBy,nt.CreatedDateTime
	 FROM Notes AS nt 
	 LEFT JOIN MasterDisposition AS dis ON  nt.DispositionId = dis.Id
	 WHERE nt.ProspectId=@ProspectId AND (nt.IsDeleted = 0 OR nt.IsDeleted IS NULL)
END
