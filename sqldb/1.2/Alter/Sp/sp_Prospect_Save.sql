/****** Object:  StoredProcedure [dbo].[sp_Prospect_Save]    Script Date: 23-01-2022 11:24:43 ******/

-- ==============================================================
-- Author:      <Kamlesh>
-- Create Date: <10.25.2021 >
-- Description: <Insert and update data into Prospect table>
-- Mods : Added 1.Email Address 
--              2.Phone Number
--              3.IsActive
-- ==============================================================
ALTER PROCEDURE [dbo].[sp_Prospect_Save]
(
    @ProspectId int OUTPUT,
    @ProspectName varchar(100),
	@AddressLine1 varchar(100),
	@AddressLine2 varchar(100),
	@City varchar (100),
	@State varchar (100),
	@ZipCode varchar (100),
	@Territory int,
	@EmailAddress varchar (100),
	@PhoneNumber varchar (100),
	@CreatedDateTime datetime,
	@LastModifiedDateTime datetime,
	@IsActive bit,
	@CreatedBy varchar(100)
)
AS
BEGIN
	INSERT INTO Prospects 
	(ProspectName,AddressLine1,AddressLine2,City,[State],ZipCode,Territory,EmailAddress,PhoneNumber,
	CreatedDateTime,IsActive, CreatedBy) 

	VALUES (@ProspectName,@AddressLine1,@AddressLine2,@City,@State,@ZipCode,@Territory,@EmailAddress,
	@PhoneNumber,@CreatedDateTime,@IsActive,@CreatedBy)

	SET @ProspectId=SCOPE_IDENTITY()
	SELECT @ProspectId
END
