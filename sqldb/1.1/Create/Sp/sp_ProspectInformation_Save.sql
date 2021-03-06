/****** Object:  StoredProcedure [dbo].[sp_ProspectInformation_Save]    Script Date: 23-01-2022 11:55:05 ******/

-- ===================================================================
-- Author:      <Kamlesh>
-- Create Date: <10.29.2021 >
-- Description: <Insert data into ProspectInformation table>
-- ===================================================================
CREATE PROCEDURE [dbo].[sp_ProspectInformation_Save]
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
		INSERT INTO ProspectInformation(ProspectId,IndustryId,CreatedDateTime,ModifiedDateTime,CreatedBy)
		VALUES (@ProspectId,@IndustryId,@CreatedDateTime,@LastModifiedDateTime,@CreatedBy)
		SET @ProspectInformationId=SCOPE_IDENTITY()
		SELECT @ProspectInformationId
END
