-- =============================================================================
-- Author:      <SPECTRALTECH>
-- Create Date: <03-03-2021 >
-- Description: <Add ProspectInformation's Insurnace Info From Dials Screen>
-- =============================================================================
CREATE PROCEDURE [dbo].[sp_ProspectInformation_Save_InsuranceInformation]
(
    @ProspectInformationId int Output,
	@ProspectId int,
	@PackageExpirationDate date,
	@PackageCarrier varchar(100),
	@PackagePremium bigint,
	@WorkersCompensationExpiration date,
	@WorkersCompensationCarrier varchar(100),
	@WorkersCompensationPremium bigint,
	@CreatedDateTime datetime,
	@CreatedBy varchar(100)
)
AS
	BEGIN

	INSERT INTO ProspectInformation(ProspectId,PackageExpirationDate,PackageCarrier,PackagePremium ,
	WorkersCompensationExpiration, WorkersCompensationCarrier,WorkersCompensationPremium,CreatedDateTime,CreatedBy,
	ModifiedDateTime,ModifiedBy)

	VALUES (@ProspectId,@PackageExpirationDate, @PackageCarrier,@PackagePremium,@WorkersCompensationExpiration,
	@WorkersCompensationCarrier,@WorkersCompensationPremium,@CreatedDateTime,@CreatedBy,@CreatedDateTime,@CreatedBy)
	SET @ProspectInformationId=SCOPE_IDENTITY()
	SELECT @ProspectInformationId

END

GO


