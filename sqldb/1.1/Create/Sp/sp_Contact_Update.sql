 
CREATE PROCEDURE [dbo].[sp_Contact_Update]
(
    @ContactId int,
    @ProspectId int,
	@FirstName varchar(100),
	@LastName varchar(100),
	@JobTitle varchar(100),
	@IsPrimary bit,
	@Office1Email varchar(100),
	@Office1PhoneNumber varchar(100),
	@Office1Extension varchar(100),
    @ModifiedDateTime DateTime
)
AS
BEGIN
	IF(@IsPrimary=1)
		BEGIN
				UPDATE Contacts
				SET IsPrimary =0
				WHERE ProspectId=@ProspectId
	    END
	UPDATE Contacts
	SET
	FirstName = @FirstName,
	LastName= @LastName,
	IsPrimary=@IsPrimary,
	JobTitle=@JobTitle,
	Office1Email=@Office1Email,
	Office1PhoneNumber= @Office1PhoneNumber,
	Office1Extension = @Office1Extension,
	ModifiedDateTime=@ModifiedDateTime
	WHERE ProspectId = @ProspectId AND Id = @ContactId		   
END
