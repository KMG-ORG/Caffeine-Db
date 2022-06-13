-- ============================================================  
-- Author:  <SpectralTech>  
-- Create date: <08.2.2022>  
-- Description: <Get Dials Details For a Dial by its Id>  
-- ===========================================================  
CREATE PROCEDURE [dbo].[sp_Dials_SelectById]
   @Id int  
AS  
BEGIN  
	SELECT d.Id,d.ProspectId,d.NumberDialed,d.DispositionId,d.CreatedBy,d.DialedBy,d.CreatedDateTime,d.ProspectId,
	d.CallDuration,d.TimesDialed
	FROM Dials AS d     
	WHERE d.Id=@Id AND (d.IsDeleted = 0 OR d.IsDeleted IS NULL)  
END
