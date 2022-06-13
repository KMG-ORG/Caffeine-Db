ALTER PROCEDURE [dbo].[sp_WBA_Save]  
(   
 @WBAId int OUTPUT,   
 @ProspectId int,  
 @ContactId int,  
 @BusinessStatusId int,  
 @BusinessLineId int,  
 @TargetPremium bigint,  
 @EffectiveDate datetime,  
 @CreatedDateTime datetime,  
 @CreatedBy varchar(100),  
 @OwnerUserId int,  
 @LeadGenerateId int,  
 @ExpireingCarrierId int,  
 @ExpiringPremium bigint,  
 @ExpireningRevenue bigint,  
 @PriorityId int,  
 @ContactFirstName varchar(100),  
 @ContactLastName varchar(100),  
 @ContactJobTitle varchar(100),  
 @ContactEmailAddress varchar(100),  
 @ContactPhoneNumber varchar(10),  
 @ContactExtension varchar(10),  
 @EIN BIGINT  
  
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
    
  END;  
  SET @varcontactid=SCOPE_IDENTITY()  
END  
else begin  
set @varcontactid=@ContactId  
end;  
  
  Insert into WBA(  
  ProspectId,  
  ContactId,  
  BusinessStatusId,  
  BusinessLineId,  
  TargetPremium,  
  EffectiveDate,   
  CreatedDateTime ,  
  CreatedBy,  
  OwnerUserId,  
  LeadGenerateId,  
  PriorityId,ExpiringCarrierId,ExpiringPremium,ExpiringRevenue,EIN  
  )  
  VALUES  
  (  
  @ProspectId,  
  @varcontactid,  
  @BusinessStatusId,  
  @BusinessLineId,  
  @TargetPremium,  
  @EffectiveDate,   
  @CreatedDateTime,  
  @CreatedBy,  
  @OwnerUserId,  
  @LeadGenerateId,@PriorityId,@ExpireingCarrierId, @ExpiringPremium,@ExpireningRevenue,@EIN  
  )  
  SET @WBAId=SCOPE_IDENTITY()  
  SELECT @WBAId;  
END