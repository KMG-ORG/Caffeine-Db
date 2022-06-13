

ALTER PROCEDURE  [dbo].[sp_BusinessStatus_Select]
AS
BEGIN
	SELECT Id, Status FROM BusinessStatus WHERE IsDeleted=0 OR IsDeleted IS NULL
	ORDER BY Status 
END
