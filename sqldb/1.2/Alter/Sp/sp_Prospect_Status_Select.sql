

ALTER PROCEDURE [dbo].[sp_Prospect_Status_Select]
AS
BEGIN
	SELECT Id, [Status] from ProspectStatus WHERE (IsDeleted=0 OR IsDeleted IS NULL)
	ORDER BY [Status]
END