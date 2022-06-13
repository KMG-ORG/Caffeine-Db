-- =============================================
-- Author:      <Vibhuti>
-- Create Date: <05.15.2022>
-- Description: <Delete Tag based on Id>
-- =============================================
CREATE PROCEDURE [dbo].[sp_TagMaintainence_Delete]
(
  @Id int,
  @LastModifiedDateTime datetime
)
AS
BEGIN
	Update TagMaintainence
	SET IsDeleted=1,
	ModifiedDateTime=@LastModifiedDateTime
	WHERE Id=@Id
END

