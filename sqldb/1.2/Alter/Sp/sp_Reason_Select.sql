ALTER PROCEDURE [dbo].[sp_Reason_Select]
AS
BEGIN
SELECT Id,ProspectInactivationReason FROM ProspectInactivationReason 
WHERE (IsDeleted=0 OR IsDeleted IS NULL) ORDER BY ProspectInactivationReason
END