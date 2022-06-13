/****** Object:  StoredProcedure [dbo].[sp_Size_Select]    Script Date: 23-01-2022 12:27:33 ******/

-- =============================================
-- Author:		<Kamlesh>
-- Create date: <10.25.2021>
-- Description:	<Get prospect size list>
-- =============================================
CREATE PROCEDURE [dbo].[sp_Size_Select]
AS
BEGIN
	SELECT Id, Size FROM ProspectSize 
	WHERE (IsDeleted=0 OR IsDeleted IS NULL)
END
