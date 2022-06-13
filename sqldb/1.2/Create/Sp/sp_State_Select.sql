/****** Object:  StoredProcedure [dbo].[sp_State_Select]    Script Date: 23-01-2022 12:30:31 ******/

-- =============================================
-- Author:		<Kamlesh>
-- Create date: <10.26.2021>
-- Description:	<Get prospect state list>
-- =============================================
CREATE PROCEDURE [dbo].[sp_State_Select]
AS
BEGIN
	SELECT StateCode,StateName FROM States 
	WHERE (IsDeleted=0 OR IsDeleted IS NULL)
END