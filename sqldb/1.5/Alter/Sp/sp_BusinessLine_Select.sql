ALTER PROCEDURE  [dbo].[sp_BusinessLine_Select]
AS
BEGIN
	SELECT Id, Line,BusinessLineValue FROM BusinessLine WHERE IsDeleted=0 OR IsDeleted IS NULL
	ORDER BY Line
END