/****** Object:  StoredProcedure [dbo].[sp_Prospect_State]    Script Date: 31-12-2021 17:03:53 ******/

-- =============================================
-- Author:		<Kamlesh>
-- Create date: <10.26.2021>
-- Description:	<Get prospect state list>
-- =============================================
CREATE PROCEDURE [dbo].[sp_Prospect_State]
AS
BEGIN
	SELECT StateCode,StateName FROM States 
	WHERE (IsDeleted=0 OR IsDeleted IS NULL)
END
GO


