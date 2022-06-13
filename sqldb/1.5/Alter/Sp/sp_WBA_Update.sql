ALTER PROCEDURE [dbo].[sp_WBA_Update]
(
    @WBAId int,
    @ProspectId int,
	@TargetPremium bigint,
	@ContactId int,
	@PriorityId int,
	@ResultId int,
	@LeadGenerateId int,
	@AccountManagerUserId int,
	@ProgressId int,
	@BusinessStatusId int,
	@BusinessLineId int,
	@ExpiringCarrierId int,
	@ExpiringPremium int,
	@UserId int,
	@EffectiveDate datetime,
	@ExpiringRevenue bigint,
	@ModifiedDateTime datetime,
	@LastModifiedBy varchar(100),
	@ContactFirstName varchar(100),
	@ContactLastName varchar(100),
	@ContactJobTitle varchar(100),
	@ContactEmailAddress varchar(100),
	@ContactPhoneNumber varchar(10),
	@ContactExtension varchar(10),
	@EIN BIGINT,
	@OwnerUserId int
)
AS
BEGIN

declare @varcontactid integer;
if @ContactId=0 begin
IF((SELECT COUNT(ID) FROM Contacts WHERE ProspectId=@ProspectId and IsActive=1)>0)
		begin
		INSERT INTO Contacts(FirstName,LastName,ProspectId,Office1PhoneNumber,Office1Email,Office1Extension,JobTitle,IsPrimary,IsActive,CreatedDateTime)
		VALUES(@ContactFirstName,@ContactLastName,@ProspectId,@ContactPhoneNumber,@ContactEmailAddress,@ContactExtension,@ContactJobTitle,0,1,GETDATE())
       end
	   else begin
	   update Contacts set IsPrimary=0 where ProspectId=@ProspectId;
	   INSERT INTO Contacts(FirstName,LastName,ProspectId,Office1PhoneNumber,Office1Email,Office1Extension,JobTitle,IsPrimary,IsActive,CreatedDateTime)
	   VALUES(@ContactFirstName,@ContactLastName,@ProspectId,@ContactPhoneNumber,@ContactEmailAddress,@ContactExtension,@ContactJobTitle,1,1,GETDATE());
		
		end;
		set @varcontactid=SCOPE_IDENTITY()
end
else begin
set @varcontactid=@ContactId
end;



	Update WBA
	SET 
	ProspectId=@ProspectId,
	TargetPremium=@TargetPremium,
	ContactId=@varcontactid,
	PriorityId=@PriorityId,
	ResultId=@ResultId,
	UserId=@UserId,
	LeadGenerateId=@LeadGenerateId,
	AccountManagerUserId=@AccountManagerUserId,
	ProgressId=@ProgressId,
	BusinessStatusId=@BusinessStatusId ,
	BusinessLineId=@BusinessLineId,
	ExpiringCarrierId=@ExpiringCarrierId,
	ExpiringPremium=@ExpiringPremium,
	EffectiveDate=@EffectiveDate,	
	ExpiringRevenue=@ExpiringRevenue,
	ModifiedDateTime =@ModifiedDateTime,
	ModifiedBy = @LastModifiedBy,
	OwnerUserId=@OwnerUserId,
	EIN=@EIN
	WHERE (Id=@WBAId and ProspectId = @ProspectId)
END