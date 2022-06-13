 
CREATE PROCEDURE [dbo].[sp_ProspectInformation_Update]
(
	@ProspectId int,
	@EIN int,
	@YearsInBusiness bigint,
	@NoOfEmployees bigint,
	@Revenue bigint,
	@NonProfit bit,
	@ProspectStatusId int,
	@IndustryId int, 
	@ProspectSizeId int,
	@IsInsuranceInformationAdded bit,
	@EXPMOD decimal(18, 0),
	@PackageExpirationDate date,
	@PackageCarrier varchar(100),
	@PackagePremium bigint,
	@WorkersCompensationExpiration date,
	@WorkersCompensationCarrier varchar(100),
	@WorkersCompensationPremium bigint,
	@LastModifiedDateTime datetime,
	@ModifiedBy varchar(100),
	@IsDeleted bit
)
AS
	BEGIN
		Update ProspectInformation
		Set 
			ProspectId =@ProspectId,
			EIN = @EIN ,
			YearsInBusiness = @YearsInBusiness,
			NoOfEmployees = @NoOfEmployees,
			Revenue = @Revenue ,
			NonProfit = @NonProfit,
			ProspectStatusId = @ProspectStatusId ,
			IndustryId = @IndustryId , ----
			ProspectSizeId = @ProspectSizeId ,
			IsInsuranceInformationAdded = @IsInsuranceInformationAdded ,
			EXPMOD =@EXPMOD,
			PackageExpirationDate =@PackageExpirationDate ,
			PackageCarrier =@PackageCarrier,
			PackagePremium =@PackagePremium ,
			WorkersCompensationExpiration =@WorkersCompensationExpiration,
			WorkersCompensationCarrier =@WorkersCompensationCarrier ,
			WorkersCompensationPremium = @WorkersCompensationPremium ,
			ModifiedDateTime =@LastModifiedDateTime,
			ModifiedBy =@ModifiedBy,
			IsDeleted=@IsDeleted
		WHERE ProspectId = @ProspectId
END

				
GO


