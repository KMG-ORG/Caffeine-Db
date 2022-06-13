-- =============================================================================  
-- Author:      <SPECTRALTECH>  
-- Create Date: <03-03-2021 >  
-- Description: <Update ProspectInformation table From Dials Screen>  
-- =============================================================================  
CREATE PROCEDURE [dbo].[sp_ProspectInformation_Update_Dials]  
(  
 @ProspectId int,  
 @PackageExpirationDate date,  
 @PackageCarrier varchar(100),  
 @PackagePremium bigint,  
 @WorkersCompensationExpiration date,  
 @WorkersCompensationCarrier varchar(100),  
 @WorkersCompensationPremium bigint,  
 @LastModifiedDateTime datetime,  
 @ModifiedBy varchar(100)  
)  
AS  
 BEGIN  
  Update ProspectInformation  
  Set   
   ProspectId =@ProspectId,  
   PackageExpirationDate =@PackageExpirationDate ,  
   PackageCarrier =@PackageCarrier,  
   PackagePremium =@PackagePremium ,  
   WorkersCompensationExpiration =@WorkersCompensationExpiration,  
   WorkersCompensationCarrier =@WorkersCompensationCarrier ,  
   WorkersCompensationPremium = @WorkersCompensationPremium ,  
   ModifiedDateTime =@LastModifiedDateTime,  
   ModifiedBy =@ModifiedBy  
  WHERE ProspectId = @ProspectId  
END  
  