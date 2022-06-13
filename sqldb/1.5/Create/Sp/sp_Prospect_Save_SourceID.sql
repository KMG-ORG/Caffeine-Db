-- ===================================================================
-- Author:		<Spectraltech>
-- Create date: <05.05.2022>
-- Description:	<Save Prospect SourceID>
-- ====================================================================
CREATE PROCEDURE [dbo].[sp_Prospect_Save_SourceID]
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
 Latitude,Longitude,Source,Info,Website,CreatedDateTime,IsActive, CreatedBy)   
  
 VALUES (@ProspectName,@AddressLine1,@AddressLine2,@City,@State,@ZipCode,@Territory,@EmailAddress,@PhoneNumber,@PhoneExtension,  
   @Latitude,@Longitude,@Source,@Info,@Website ,@CreatedDateTime,@IsActive,@CreatedBy)  
  
 SET @ProspectId=SCOPE_IDENTITY()  
 SELECT @ProspectId  
END