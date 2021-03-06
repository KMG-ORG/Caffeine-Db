/****** Object:  StoredProcedure [dbo].[sp_Prospect_Update]    Script Date: 23-01-2022 11:53:59 ******/

-- ========================================================
-- Author:      <Vibhuti>
-- Create Date: <06.12.2021 >
-- Description: <Alter update data into Prospect table>
-- Mods : Added 1.Email Address 
--              2.Phone Number
-- ======================================================
ALTER PROCEDURE [dbo].[sp_Prospect_Update]
(
    @ProspectId int,
    @ProspectName varchar(100),
	@AddressLine1 varchar(100),
	@AddressLine2 varchar(100),
	@City varchar (100),
	@State varchar (100),
	@ZipCode varchar (100),
	@PhoneNumber varchar (100),
	@EmailAddress varchar(100),
	@ModifiedDateTime datetime,
	@LastModifiedBy varchar(100)
)
AS
BEGIN
	Update Prospects
	SET ProspectName = @ProspectName,
	AddressLine1=@AddressLine1,
	AddressLine2= @AddressLine2,
	City=@City,
	[State]=@State,
	ZipCode=@ZipCode,
	PhoneNumber=@PhoneNumber,
	EmailAddress=@EmailAddress,
	ModifiedDateTime=@ModifiedDateTime,
	ModifiedBy=@LastModifiedBy
	WHERE Id=@ProspectId
END
