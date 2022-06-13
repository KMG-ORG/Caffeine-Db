ALTER PROCEDURE [dbo].[sp_FinalDisposition_Select]   
@ProspectId int   
AS  
BEGIN  
  SELECT f.Id,f.DispositionId,f.ProspectId,m.Disposition,f.NoOfAttempt,f.CreatedDateTime,f.CreatedBy,f.ModifiedDateTime,f.ModifiedBy   
  FROM FinalDisposition f  
  LEFT JOIN MasterDisposition m on f.DispositionId = m.Id  
  WHERE f.ProspectId= @ProspectId AND  (f.IsDeleted IS NULL OR f.IsDeleted = 0)  
  order by f.Id asc
END  