
ALTER PROCEDURE [dbo].[sp_Industry_Select]
AS
BEGIN
	SELECT Id, IndustryName from ProspectIndustry where (IsDeleted=0 OR IsDeleted IS NULL)
	ORDER BY IndustryName 
END