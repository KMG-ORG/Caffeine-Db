/****** Object:  StoredProcedure [dbo].[sp_WBA_Delete]    Script Date: 23-01-2022 12:42:01 ******/

-- =============================================
-- Author:      <Vipin>
-- Create Date: <10.01.2022 >
-- Description: <Delete WBA based on Id>
-- =============================================
CREATE PROCEDURE [dbo].[sp_WBA_Delete]
(
  @WBAId int, 
  @ModifiedDateTime datetime,
  @ModifiedBy varchar(100)
)
AS
BEGIN
	Update WBA
	SET IsDeleted=1,
	ModifiedDateTime=@ModifiedDateTime,
	ModifiedBy = @ModifiedBy
	WHERE Id=@WBAId
END