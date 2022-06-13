-- =============================================
-- Author:      <SpectralTech>
-- Create Date: <02.03.2022>
-- Description: <Delete Recall based on Id>
-- =============================================
CREATE PROCEDURE [dbo].[sp_Recall_Delete]
	@Id int,
	@LastModifiedDateTime datetime
AS
BEGIN
	Update Recall
	SET IsDeleted=1,
	ModifiedDateTime=@LastModifiedDateTime
	WHERE Id=@Id
END
