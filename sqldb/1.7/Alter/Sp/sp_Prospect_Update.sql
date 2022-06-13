

 
ALTER PROCEDURE [dbo].[sp_Prospect_Update]  
(  
    @ProspectId int,  
    @ProspectName varchar(200),  
	@AddressLine1 varchar(100),  
	@AddressLine2 varchar(100),  
	@City varchar (100),  
	@State varchar (100),  
	@ZipCode varchar (100),  
	@PhoneNumber bigint,  
	@PhoneExtension int,  
	@EmailAddress varchar(100),  
	@Latitude varchar(100),  
	@Longitude varchar(100), 
	@Info  varchar(500),  
	@Website  varchar(500),   
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
 PhoneExtension=@PhoneExtension,  
 Latitude=@Latitude,  
 Longitude=@Longitude,  
 EmailAddress=@EmailAddress, 
 Info=@Info,
 Website=@Website,  
 ModifiedDateTime=@ModifiedDateTime,  
 ModifiedBy=@LastModifiedBy  
 WHERE Id=@ProspectId 
END
 
