

CREATE PROCEDURE [dbo].[sp_UserCallSetting_SelectByUser]    
(   
	 @UserId INT	 
)    
AS    
 BEGIN   
 SELECT  Id,UserId, IsCallOut, DeviceId,CreatedDateTime,ModifiedDateTime,
         CreatedBy, ModifiedBy FROM UserCallSetting WHERE UserId = @UserId;

 END 