USE [CAFFEINE_DEV]
GO

/****** Object:  StoredProcedure [dbo].[sp_Prospect_Update]    Script Date: 31-12-2021 17:04:01 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:      <Vibhuti>
-- Create Date: <06.12.2021 >
-- Description: <Alter update data into Prospect table>
-- Mods : Added 1.Email Address 
--              2.Phone Number
-- =============================================
CREATE PROCEDURE [dbo].[sp_Prospect_Update]
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
	@ModifiedDateTime datetime
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
	ModifiedDateTime=@ModifiedDateTime
	WHERE Id=@ProspectId
END
GO


