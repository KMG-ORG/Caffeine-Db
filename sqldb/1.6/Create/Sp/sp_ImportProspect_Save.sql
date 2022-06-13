/****** Object:  StoredProcedure [dbo].[sp_ImportProspect_Save]    Script Date: 27-05-2022 12:01:33 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

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
 @Source varchar(100),   
 @Revenue bigint,  
 @EXPMOD decimal(3, 1),  
 @NoOfEmployees bigint,  
 @PackagePremium bigint,  
 @ContactName varchar (200),
 @ContactNumber bigint,
 @JobTitle varchar(200),
 @LastModifiedDateTime datetime,  
 @CreatedDateTime datetime,    
 @ModifiedBy varchar(100),  
 @IsActive bit,    
 @CreatedBy varchar(100)    
)    
AS    
BEGIN    
 INSERT INTO Prospects     
 (ProspectName,PhoneNumber,City,[State],ZipCode, EmailAddress, PhoneExtension,Source, 
  ModifiedDateTime,CreatedDateTime,ModifiedBy,IsActive, CreatedBy)     
    
 VALUES (@ProspectName,@PhoneNumber,@City,@State,@ZipCode, @EmailAddress,@PhoneExtension, @Source,
   @LastModifiedDateTime,@CreatedDateTime,@ModifiedBy,1,@CreatedBy)    
    
 SET @ProspectId=SCOPE_IDENTITY()    
  
  if(@ProspectId>0 and (@NoOfEmployees is not null OR @Revenue is not null))BEGIN
 INSERT INTO ProspectInformation(ProspectId,Revenue,EXPMOD,NoOfEmployees,  
 PackagePremium,ModifiedDateTime,CreatedDateTime,ModifiedBy,CreatedBy)  
VALUES(@ProspectId,@Revenue,@EXPMOD,@NoOfEmployees,  
 @PackagePremium,@LastModifiedDateTime,@CreatedDateTime,@ModifiedBy,@CreatedBy) 
 END
 IF(@ContactName IS NOT NULL OR @ContactNumber IS NOT NULL OR @JobTitle IS NOT NULL )BEGIN
 INSERT INTO Contacts(FirstName,Office1PhoneNumber,JobTitle,IsActive)
 VALUES (@ContactName,@ContactNumber,@JobTitle,1)
 END
  SELECT @ProspectId 
END