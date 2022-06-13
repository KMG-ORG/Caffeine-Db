-- ===================================================================
-- Author:		<Spectraltech>
-- Create date: <16.03.2022>
-- Description:	<Save audit Log Of Contacts>
-- ====================================================================
CREATE PROCEDURE  [dbo].[sp_MasterRecallStatus_Select]
AS
BEGIN
	SELECT Id, Status FROM MasterRecallStatus WHERE IsDeleted=0 OR IsDeleted IS NULL
	ORDER BY Status 
END
