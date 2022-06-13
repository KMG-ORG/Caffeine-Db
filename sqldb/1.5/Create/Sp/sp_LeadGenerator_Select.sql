CREATE PROCEDURE  [dbo].[sp_LeadGenerator_Select]
AS
BEGIN
	SELECT Id, Value ,OwnerEmail,
	(Select Count(Id) from LeadGenerator WHERE (IsDeleted=0 OR IsDeleted IS NULL)) as TotalRecords
	FROM LeadGenerator WHERE (IsDeleted=0 OR IsDeleted IS NULL) 
	ORDER BY Value 
END