/****** Object:  StoredProcedure [dbo].[sp_Industry_Select]    Script Date: 23-01-2022 11:22:10 ******/

-- =============================================
-- Author:		<Kamlesh>
-- Create date: <10.25.2021>
-- Description:	<Get prospect Industry list>
-- =============================================
CREATE PROCEDURE [dbo].[sp_Industry_Select]
AS
BEGIN
	SELECT Id, IndustryName from ProspectIndustry where IsDeleted=0 OR IsDeleted IS NULL
END
