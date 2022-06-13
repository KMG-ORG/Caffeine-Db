-- =============================================================
-- Author:      <SpectrailTech>
-- Create Date: <10.25.2021 >
-- Description: <Insert and update data into Prospect table>
-- Mods : Added 1.Email Address 
--              2.Phone Number
--              3.IsActive
--              4.Longitude &Latitude (16th feb 2022)
--              5.Info
--              6.Website
-- ===========================================================
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
 @PhoneNumber  bigint,      
 @PhoneExtension int,      
 @Latitude varchar(100),      
 @Longitude varchar(100),   
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
 Latitude,Longitude,Info,Website,CreatedDateTime,IsActive, CreatedBy)       
      
 VALUES (@ProspectName,@AddressLine1,@AddressLine2,@City,@State,@ZipCode,@Territory,@EmailAddress,@PhoneNumber,@PhoneExtension,      
   @Latitude,@Longitude,@Info,@Website,@CreatedDateTime,@IsActive,@CreatedBy)      
      
 SET @ProspectId=SCOPE_IDENTITY()      
 SELECT @ProspectId      
END 
