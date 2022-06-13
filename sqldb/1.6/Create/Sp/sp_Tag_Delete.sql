-- ========================================================
-- Author:      <Vibhuti>
-- Create Date: <1st June 2022>
-- Description: <Delete multipleTag based on Id>
-- =====================================================
CREATE PROCEDURE [dbo].[sp_Tag_Delete]
(
  @Id int,
  @LastModifiedDateTime datetime,
  @LastModifiedBy varchar(100)
)
AS
BEGIN
	Update Tag
	SET IsDeleted=1,
	ModifiedDateTime=@LastModifiedDateTime,
	ModifiedBy =@LastModifiedBy
	WHERE Id=@Id
END
