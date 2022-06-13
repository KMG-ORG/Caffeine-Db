

 
CREATE PROCEDURE [dbo].[sp_UserCallSetting_Save]    
(     
     @Id int OUTPUT,   
	 @UserId INT,
	 @IsCallOut bit, 
	 @DeviceId varchar(200),   
	 @CreatedDateTime datetime,     
	 @CreatedBy varchar(100)    
)    
AS    
	BEGIN     
		INSERT INTO UserCallSetting(  
		    UserId,    
			IsCallOut,  
			DeviceId,	      
	        CreatedDateTime,
	        ModifiedDateTime,
	        CreatedBy,
	        ModifiedBy,
	        IsDeleted
			)    
		VALUES (    
			@UserId,    
			@IsCallOut,    
			@DeviceId, 
			@CreatedDateTime,    
			@CreatedDateTime,    
			@CreatedBy,
			@CreatedBy,
			0
		)    
		SET @Id=SCOPE_IDENTITY()    
		SELECT @Id    
	END    
    