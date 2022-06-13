



CREATE PROCEDURE [dbo].[sp_UserCallSetting_Update]    
(     
     @Id int,   
	-- @UserId INT,
	 @IsCallOut bit, 
	 @DeviceId varchar(200),   
	 @ModifiedDateTime datetime,     
	 @ModifiedBy varchar(100)    
)    
AS    
	BEGIN     
		UPDATE UserCallSetting  SET 
			IsCallOut = @IsCallOut,  
			DeviceId = @DeviceId,	 
	        ModifiedDateTime = @ModifiedDateTime,	         
	        ModifiedBy	= @ModifiedBy  WHERE Id = @Id; 
		 
		 
	END   