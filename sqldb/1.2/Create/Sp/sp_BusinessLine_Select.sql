/****** Object:  StoredProcedure [dbo].[sp_BusinessLine_Select]    Script Date: 23-01-2022 10:23:32 ******/

-- ===========================================================================================
-- Author:		<Chandmal>
-- Create date: <11.12.2021>
-- Description:	<Selects BusinessLine details >
-- ============================================================================================
CREATE PROCEDURE  [dbo].[sp_BusinessLine_Select]
AS
BEGIN
	SELECT Id, Line FROM BusinessLine WHERE IsDeleted=0 OR IsDeleted IS NULL
END