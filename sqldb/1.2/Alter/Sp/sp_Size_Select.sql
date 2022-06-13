
ALTER PROCEDURE [dbo].[sp_Size_Select]
AS
BEGIN
	SELECT Id, Size FROM ProspectSize 
	WHERE (IsDeleted=0 OR IsDeleted IS NULL) ORDER BY Size
END