

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
 WHERE Id=@ProspectId AND (IsDeleted IS NULL OR IsDeleted=0)     
END 
      