 

CREATE PROCEDURE [dbo].[sp_Disposition_Select] 
@ProspectId int
AS
BEGIN
     SELECT d.Id,d.DispositionId,d.ProspectId,m.Disposition,d.DispositionStatus,d.CreatedDateTime,d.CreatedBy,d.ModifiedDateTime,d. ModifiedBy 
	 FROM Disposition d  
	 LEFT JOIN MasterDisposition m on d.DispositionId = m.Id
	 WHERE d.ProspectId= @ProspectId AND  (d.IsDeleted Is NULL OR d.IsDeleted = 0)
END