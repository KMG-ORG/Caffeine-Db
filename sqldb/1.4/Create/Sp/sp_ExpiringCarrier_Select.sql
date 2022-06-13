CREATE PROCEDURE  [dbo].[sp_ExpiringCarrier_Select]
AS
BEGIN
	SELECT Id, Value FROM ExpiringCarrier WHERE IsDeleted=0 OR IsDeleted IS NULL
	ORDER BY Value 
END
