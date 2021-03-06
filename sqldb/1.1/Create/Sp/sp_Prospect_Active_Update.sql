/****** Object:  StoredProcedure [dbo].[sp_Prospect_Active_Update]    Script Date: 23-01-2022 11:22:59 ******/

-- ==================================================================
-- Author:      <Vibhuti>
-- Create Date: <12.06.2021 >
-- Description: <IsActive feild sets Prospect Activation status>
-- ================================================================== 
CREATE PROCEDURE [dbo].[sp_Prospect_Active_Update]  
(  
  @ProspectId int,  
  @InActiveReasonId int,
  @IsActive bit,  
  @LastModifiedDateTime datetime  
)  
AS  
BEGIN  
 Update Prospects  
 SET IsActive=@IsActive,  
 InActiveReasonId=@InActiveReasonId,
 ModifiedDateTime=@LastModifiedDateTime 
 WHERE Id=@ProspectId AND IsDeleted IS NULL  
END  