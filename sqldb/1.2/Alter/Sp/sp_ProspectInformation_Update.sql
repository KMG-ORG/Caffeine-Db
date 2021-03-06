/****** Object:  StoredProcedure [dbo].[sp_ProspectInformation_Update]    Script Date: 23-01-2022 11:57:22 ******/

-- =============================================================================
-- Author:      <Kamlesh, Vibhuti>
-- Create Date: <2.12.2021 >
-- Description: <Update ProspectInformation table>
-- Mods : i)'InsuranceInformationAdded' data type changed from int to bool
--        ii)Removed Tags
--       iii)Changed EXPMOD range from (18,0) to (3,1)
-- =============================================================================
ALTER PROCEDURE [dbo].[sp_ProspectInformation_Update]
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
	@EXPMOD decimal(3, 1),
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
			IndustryId = @IndustryId , 
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

				
