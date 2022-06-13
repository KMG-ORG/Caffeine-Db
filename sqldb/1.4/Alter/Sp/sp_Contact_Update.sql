
  -- =============================================  
-- Author:      <Vibhuti>  
-- Create Date: <12.06.2021 >  
-- Description: <Update data into Contact table>  
-- Mods : Added : 1.Office1Email  
--            2.Office1PhoneNumber  
--            3.Office1Extension  
--                4.IsNpsNominated  
--      5.IsAddressSameAsProspect  
--                6.ModifiedBy  
-- =============================================  
Alter PROCEDURE [dbo].[sp_Contact_Update]  
(  
    @ContactId int,  
    @ProspectId int,  
	@FirstName varchar(100),  
    @LastName varchar(100),  
    @JobTitle varchar(100),  
    @IsPrimary bit,  
    @Office1AddressLine1 varchar(100),  
    @Office1AddressLine2 varchar(100),  
    @Office1City varchar(100),  
    @Office1State varchar(100),  
    @Office1ZipCode varchar(100),  
    @Office1Email varchar(100),  
    @Office1PhoneNumber bigint,  
    @Office1Extension int,  
    @ModifiedDateTime DateTime,  
    @LastModifiedBy varchar(100),  
    @IsNpsNominated bit,  
    @IsAddressSameAsProspect bit  
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
 Office1AddressLine1=@Office1AddressLine1,  
 Office1AddressLine2=@Office1AddressLine2,  
 Office1City=@Office1City,  
 Office1State=@Office1State,  
 Office1ZipCode=@Office1ZipCode,  
 Office1Email=@Office1Email,  
 Office1PhoneNumber= @Office1PhoneNumber,  
 Office1Extension = @Office1Extension,  
 ModifiedDateTime = @ModifiedDateTime,  
 ModifiedBy=@LastModifiedBy,  
 IsNpsNominated = @IsNpsNominated,  
 IsAddressSameAsProspect = @IsAddressSameAsProspect  
 WHERE ProspectId = @ProspectId AND Id = @ContactId       
END  
    