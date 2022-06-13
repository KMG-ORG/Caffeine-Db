-- =============================================
-- Author:      <Kamlesh>
-- Create Date: <11.12.2021 >
-- Description: <Delet Prospect based on Id>
-- =============================================
CREATE PROCEDURE [dbo].[sp_Prospect_Delete]
(
  @ProspectId int,
  @LastModifiedDateTime datetime
)
AS
BEGIN
	Update Prospects
	SET IsDeleted=1,
	ModifiedDateTime=@LastModifiedDateTime
	WHERE Id=@ProspectId
END

