/****** Object:  StoredProcedure [dbo].[sp_Contact_Delete]    Script Date: 23-01-2022 10:34:08 ******/

-- =============================================
-- Author:      <Vipin>
-- Create Date: <05.01.2022 >
-- Description: <Delete Contact based on Id>
-- =============================================
CREATE PROCEDURE [dbo].[sp_Contact_Delete]
(
  @ContactId int,
  @LastModifiedDateTime datetime,
  @ModifiedBy varchar(100)
)
AS
BEGIN
	Update Contacts
	SET IsDeleted=1,
	ModifiedDateTime=@LastModifiedDateTime,
	ModifiedBy = @ModifiedBy
	WHERE Id=@ContactId
END