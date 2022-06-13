-- ===================================================================
-- Author:      <Kamlesh>
-- Create Date: <10.29.2021 >
-- Description: <Insert data into ProspectInformation table>
-- Mods : 1. By Default ProspectStatus = 'No'
-- ===================================================================
ALTER PROCEDURE [dbo].[sp_ProspectInformation_Save]
(
    @ProspectInformationId int Output,
	@ProspectId int,
	@IndustryId int,
	@CreatedDateTime DateTime,
	@LastModifiedDateTime DateTime,    
    @CreatedBy varchar(100) 
)
AS
BEGIN
	Declare @StatusId int 
	SELECT  @StatusId=Id FROM ProspectStatus WHERE Status ='No'

	INSERT INTO ProspectInformation(ProspectId,IndustryId,ProspectStatusId,CreatedDateTime,ModifiedDateTime,CreatedBy)
	VALUES (@ProspectId,@IndustryId,@StatusId,@CreatedDateTime,@LastModifiedDateTime,@CreatedBy)
	SET @ProspectInformationId=SCOPE_IDENTITY()
	SELECT @ProspectInformationId
END
