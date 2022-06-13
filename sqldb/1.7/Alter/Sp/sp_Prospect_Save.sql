 
         
ALTER PROCEDURE [dbo].[sp_Prospect_Save]          
(          
 @ProspectId int OUTPUT,          
 @ProspectName varchar(200),          
 @AddressLine1 varchar(100),          
 @AddressLine2 varchar(100),          
 @City varchar (100),          
 @State varchar (100),          
 @ZipCode varchar (100),          
 @Territory int,          
 @EmailAddress varchar (100),          
 @PhoneNumber  bigint,          
 @PhoneExtension int,          
 @Latitude varchar(100),     
 @Longitude varchar(100),   
 @Source varchar(100),  
 @Info  varchar(500),      
 @Website  varchar(500),    
 @CreatedDateTime datetime,          
 @LastModifiedDateTime datetime,          
 @IsActive bit,          
 @CreatedBy varchar(100)          
)          
AS          
BEGIN          
 INSERT INTO Prospects           
 (ProspectName,AddressLine1,AddressLine2,City,[State],ZipCode,Territory,EmailAddress,PhoneNumber,PhoneExtension,          
 Latitude,Longitude,Info,Source,Website,CreatedDateTime,IsActive, CreatedBy,ModifiedBy,ModifiedDateTime)           
          
 VALUES (@ProspectName,@AddressLine1,@AddressLine2,@City,@State,@ZipCode,@Territory,@EmailAddress,@PhoneNumber,@PhoneExtension,          
   @Latitude,@Longitude,@Info,@Source,@Website,@CreatedDateTime,@IsActive,@CreatedBy,@CreatedBy,@CreatedDateTime)          
          
 SET @ProspectId=SCOPE_IDENTITY()          
 SELECT @ProspectId             
END 

