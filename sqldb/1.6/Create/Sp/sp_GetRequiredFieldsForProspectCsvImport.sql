
/****** Object:  StoredProcedure [dbo].[sp_GetRequiredFieldsForProspectCsvImport]    Script Date: 27-05-2022 12:00:04 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_GetRequiredFieldsForProspectCsvImport] 
AS
BEGIN
select distinct * from RequiredFieldsForProspectCsvImport where IsRequired=1 order by sortOrder asc
END