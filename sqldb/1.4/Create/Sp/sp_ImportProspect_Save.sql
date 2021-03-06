-- ===============================================================================================     
-- Author:  <Spectraltech>      
-- Create date: <21.03.2022>      
-- Description: <Import Prospect>      
-- ========================================================================================    

CREATE PROCEDURE [dbo].[sp_ImportProspect_Save]  
(  
 @ProspectId int OUTPUT,  
 @ProspectName varchar(100), 
 @PhoneNumber  bigint,  
 @PhoneExtension int,
 @EmailAddress varchar (100), 
 @City varchar (100),  
 @State varchar (100),  
 @ZipCode varchar (100), 
 @NonProfit bit,
 @Revenue bigint,
 @EXPMOD decimal(3, 1),
 @NoOfEmployees bigint,
 @WorkersCompensationExpiration date,
 @WorkersCompensationPremium bigint,
 @PackageExpirationDate date,
 @PackagePremium bigint,
 @IsDeleted bit,
 @LastModifiedDateTime datetime,
 @CreatedDateTime datetime,  
 @ModifiedBy varchar(100),
 @IsActive bit,  
 @CreatedBy varchar(100)  
)  
AS  
BEGIN  
 INSERT INTO Prospects   
 (ProspectName,PhoneNumber,PhoneExtension,EmailAddress,City,[State],ZipCode, 
  IsDeleted,ModifiedDateTime,CreatedDateTime,ModifiedBy,IsActive, CreatedBy)   
  
 VALUES (@ProspectName,@PhoneNumber,@PhoneExtension,@EmailAddress,@City,@State,@ZipCode,
   @IsDeleted,@LastModifiedDateTime,@CreatedDateTime,@ModifiedBy,@IsActive,@CreatedBy)  
  
 SET @ProspectId=SCOPE_IDENTITY()  
 SELECT @ProspectId 

 INSERT INTO ProspectInformation(ProspectId,NonProfit,Revenue,EXPMOD,NoOfEmployees,WorkersCompensationExpiration,WorkersCompensationPremium,
 PackageExpirationDate,PackagePremium,ModifiedDateTime,CreatedDateTime,ModifiedBy,CreatedBy)
 VALUES(@ProspectId,@NonProfit,@Revenue,@EXPMOD,@NoOfEmployees,@WorkersCompensationExpiration,@WorkersCompensationPremium,
 @PackageExpirationDate,@PackagePremium,@LastModifiedDateTime,@CreatedDateTime,@ModifiedBy,@CreatedBy) 
END  