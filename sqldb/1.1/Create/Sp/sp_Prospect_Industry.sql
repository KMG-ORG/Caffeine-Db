 
-- =============================================
-- Author:		<Kamlesh>
-- Create date: <10.25.2021>
-- Description:	<Get prospect Industry list>
-- =============================================
CREATE PROCEDURE [dbo].[sp_Prospect_Industry]
AS
BEGIN
	SELECT Id, IndustryName from ProspectIndustry where IsDeleted=0 OR IsDeleted IS NULL
END
