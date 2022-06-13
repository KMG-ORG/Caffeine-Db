ALTER PROCEDURE  [dbo].[sp_ExpiringCarrier_Select] 
AS
BEGIN
	SELECT Id, Value,Email,
	(Select Count(Id) from ExpiringCarrier WHERE (IsDeleted=0 OR IsDeleted IS NULL)) as TotalRecords
	FROM ExpiringCarrier 
	WHERE (IsDeleted=0 OR IsDeleted IS NULL) 
	ORDER BY Value 
END