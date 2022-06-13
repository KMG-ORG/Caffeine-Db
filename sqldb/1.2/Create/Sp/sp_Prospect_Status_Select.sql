/****** Object:  StoredProcedure [dbo].[sp_Prospect_Status_Select]    Script Date: 23-01-2022 11:41:37 ******/

-- =============================================
-- Author:		<Kamlesh>
-- Create date: <10.25.2021>
-- Description:	<Get prospect Status List>
-- =============================================
CREATE PROCEDURE [dbo].[sp_Prospect_Status_Select]
AS
BEGIN
	SELECT Id, [Status] from ProspectStatus WHERE (IsDeleted=0 OR IsDeleted IS NULL)
END
