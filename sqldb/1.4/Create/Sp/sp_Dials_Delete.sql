-- =============================================
-- Author:      <SpectralTech>
-- Create Date: <02.03.2022>
-- Description: <Delete Dials based on Id>
-- =============================================
CREATE PROCEDURE [dbo].[sp_Dials_Delete]
	@Id int,
	@LastModifiedDateTime datetime
AS
BEGIN
	Update Dials
	SET IsDeleted=1,
	ModifiedDateTime=@LastModifiedDateTime
	WHERE Id=@Id
END
