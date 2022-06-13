/****** Object:  StoredProcedure [dbo].[sp_BusinessStatus_Select]    Script Date: 23-01-2022 10:31:57 ******/

-- ===========================================================================================
-- Author:		<Chandmal>
-- Create date: <11.12.2021>
-- Description:	<Selects BusinessStatus details >
-- ============================================================================================
CREATE PROCEDURE  [dbo].[sp_BusinessStatus_Select]
AS
BEGIN
	SELECT Id, Status FROM BusinessStatus WHERE IsDeleted=0 OR IsDeleted IS NULL
END
