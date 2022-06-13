-- =============================================
-- Author:		<Kamlesh>
-- Create date: <10.25.2021>
-- Description:	<Get prospect Status List>
-- =============================================
CREATE PROCEDURE [dbo].[sp_Prospect_Status]
AS
BEGIN
	SELECT Id, [Status] from ProspectStatus WHERE IsDeleted=0 OR IsDeleted IS NULL
END
GO


