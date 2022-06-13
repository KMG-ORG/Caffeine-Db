-- =============================================
-- Author:      <Kamlesh>
-- Create Date: <22.03.2022 >
-- Description: Added IsActive field
-- =============================================
CREATE PROCEDURE [dbo].[sp_Contact_Active]
(
  @ContactId int,
  @IsActive bit,
  @LastModifiedDateTime datetime,
  @ModifiedBy varchar(100)
)
AS
BEGIN
	Update Contacts
	SET IsActive=@IsActive,
	ModifiedDateTime=@LastModifiedDateTime,
	ModifiedBy = @ModifiedBy
	WHERE Id=@ContactId
END