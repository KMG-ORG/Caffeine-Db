/****** Object:  StoredProcedure [dbo].[sp_Contact_Save]    Script Date: 23-01-2022 10:36:08 ******/

-- ===========================================================
-- Author:      <Vibhuti>
-- Create Date: <12.28.2021 >
-- Description: <Insert and update data into Contact table>
-- MODS : 1. Primary Contact is handled through IsPrimary
--        2. Added CreatedBy
-- ===========================================================
ALTER PROCEDURE [dbo].[sp_Contact_Save]
( 
    @ContactId int OUTPUT,
    @ProspectId int,
	@FirstName varchar(100),
	@LastName varchar(100),
	@IsPrimary bit,
	@JobTitle varchar(100),
	@Office1Email varchar(100),
	@Office1AddressLine1 varchar(100),
	@Office1AddressLine2 varchar(100),
	@Office1City varchar(100),
	@Office1State varchar(100),
	@Office1ZipCode varchar(100),
	@Office1Extension varchar(100),
	@Office1PhoneNumber varchar(100),
	@IsAddressSameAsProspect bit,
	@IsNPSNominated bit,
	@CreatedDateTime datetime,
    @LastModifiedDateTime DateTime,
	@CreatedBy varchar(100)
)
AS
BEGIN
IF(@IsPrimary=1)
		BEGIN
			Update Contacts
			Set IsPrimary =0
			WHERE ProspectId=@ProspectId
	    END

INSERT INTO Contacts(
ProspectId,
FirstName,
LastName,
IsPrimary,
JobTitle,
Office1Email,
Office1AddressLine1,
Office1AddressLine2,
Office1City,
Office1State,
Office1ZipCode,
Office1Extension,
Office1PhoneNumber,
IsAddressSameAsProspect,
IsNpsNominated,
CreatedDateTime,
ModifiedDateTime,
CreatedBy
)
VALUES
(@ProspectId,
@FirstName,
@LastName,
@IsPrimary,
@JobTitle,
@Office1Email,
@Office1AddressLine1,
@Office1AddressLine2,
@Office1City,
@Office1State,
@Office1ZipCode,
@Office1Extension,
@Office1PhoneNumber,
@IsAddressSameAsProspect,
@IsNpsNominated,
@CreatedDateTime,
@LastModifiedDateTime,
@CreatedBy
)
SET @ContactId=SCOPE_IDENTITY()
SELECT @ContactId
END



