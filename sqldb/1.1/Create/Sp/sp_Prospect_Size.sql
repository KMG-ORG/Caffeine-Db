/****** Object:  StoredProcedure [dbo].[sp_Prospect_Size]    Script Date: 31-12-2021 17:03:42 ******/

-- =============================================
-- Author:		<Kamlesh>
-- Create date: <10.25.2021>
-- Description:	<Get prospect size list>
-- =============================================
CREATE PROCEDURE [dbo].[sp_Prospect_Size]
AS
BEGIN
	SELECT Id, Size FROM ProspectSize 
	WHERE (IsDeleted=0 OR IsDeleted IS NULL)
END
GO


