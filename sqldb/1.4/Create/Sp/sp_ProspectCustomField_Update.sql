-- ==================================================================================
-- Author:      <SpectralTech>
-- Create Date: <03.24.202 >
-- Description: <Update data into Prospect & Prospect Information table from Dials 
--                custom field Screen>
-- ==================================================================================
CREATE PROCEDURE [dbo].[sp_ProspectCustomField_Update]
(
    @ProspectId int,
    @ProspectName varchar(100),
	@AddressLine1 varchar(100),
	@AddressLine2 varchar(100),
	@City varchar (100),
	@State varchar (100),
	@ZipCode varchar (100),
	@PhoneNumber bigint,
	@NonProfit bit,
	@EXPMOD decimal(3, 1),
	@EIN int,
	@ModifiedDateTime datetime,
	@LastModifiedBy varchar(100)
)
AS
BEGIN
    --Update Prospect's CustomFields
	BEGIN
		Update Prospects
		SET ProspectName = @ProspectName,
		AddressLine1=@AddressLine1,
		AddressLine2= @AddressLine2,
		City=@City,
		[State]=@State,
		ZipCode=@ZipCode,
		PhoneNumber=@PhoneNumber,
		ModifiedDateTime=@ModifiedDateTime,
		ModifiedBy=@LastModifiedBy
		WHERE Id=@ProspectId
	END

	--Update ProspectInformation's CustomFields
	BEGIN
		Update ProspectInformation
		Set ProspectId =@ProspectId,
		EIN = @EIN ,
		NonProfit = @NonProfit,
		EXPMOD =@EXPMOD,
		ModifiedDateTime =@ModifiedDateTime,
		ModifiedBy =@LastModifiedBy
		WHERE ProspectId = @ProspectId
	END
END

