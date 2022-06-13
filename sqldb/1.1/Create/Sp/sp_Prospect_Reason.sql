 


CREATE PROCEDURE [dbo].[sp_Prospect_Reason]
As
BEGIN
SELECT Id,ProspectInactivationReason FROM ProspectInactivationReason WHERE IsDeleted=0 OR IsDeleted IS NULL
End
GO


