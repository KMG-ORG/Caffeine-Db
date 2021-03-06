USE [CAFFEINE_DEV]
GO
/****** Object:  StoredProcedure [dbo].[sp_Prospect_Active_Update]    Script Date: 07-01-2022 09:47:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:      <Vibhuti>
-- Create Date: <12.06.2021 >
-- Description: <IsActive feild sets Prospect Activation status>
-- ============================================= 
ALTER PROCEDURE [dbo].[sp_Prospect_Active_Update]  
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