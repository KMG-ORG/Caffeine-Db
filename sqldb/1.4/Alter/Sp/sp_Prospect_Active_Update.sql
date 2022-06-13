-- =====================================================================
-- Author:      <Vibhuti>
-- Create Date: <12.06.2021 >
-- Description: <IsActive feild sets Prospect Activation status>
-- MODS: i) Removed inactiavtion reason
-- ===================================================================== 
ALTER PROCEDURE [dbo].[sp_Prospect_Active_Update]  
(  
  @ProspectId int,  
  @IsActive bit,  
  @LastModifiedDateTime datetime  
)  
AS  
BEGIN  
	Update Prospects  
	SET IsActive=@IsActive,  
	ModifiedDateTime=@LastModifiedDateTime 
	WHERE Id=@ProspectId AND IsDeleted IS NULL  
END  