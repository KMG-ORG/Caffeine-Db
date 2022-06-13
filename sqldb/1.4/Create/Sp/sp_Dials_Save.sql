-- ===========================================================================================  
-- Author:  <SpectralTech>  
-- Create date: <03.07.2022>  
-- Description: <Save Dials>  
-- ============================================================================================  
CREATE PROCEDURE [dbo].[sp_Dials_Save] 
     @DialId int OUTPUT,  
	 @ProspectId int,    
	 @NumberDialed bigint,  
	 @CallDuration TIME,  
	 @DispositionId int,
	 @DialedBy varchar(100),
	 @CreatedDateTime DateTime,
	 @CreatedBy varchar (100)
AS  
BEGIN  
  
	DECLARE @TimesDialed int --Declare TimesDialed  
	SET @TimesDialed =0  
	SELECT TOP 1 @TimesDialed =TimesDialed FROM Dials WHERE ProspectId =@ProspectId   
	ORDER BY TimesDialed DESC -- Get current TimesDialed  
  
	IF(@TimesDialed>0)  -- Update TimesDialed =+1 for all dials of given ProspectId
		UPDATE Dials SET TimesDialed = @TimesDialed+1 WHERE ProspectId = @ProspectId  
   
   -- Insert into TimesDialed
	INSERT INTO Dials(ProspectId,TimesDialed,NumberDialed,CallDuration,  
		DispositionId,DialedBy,CreatedDateTime,CreatedBy,ModifiedDateTime,ModifiedBy,IsDeleted)  
  
	VALUES(@ProspectId,@TimesDialed +1,@NumberDialed,@CallDuration,  
		@DispositionId,@DialedBy,@CreatedDateTime,@CreatedBy,@CreatedDateTime,@CreatedBy,0)  
           
	SET @DialId=SCOPE_IDENTITY()  
	SELECT @DialId  

END  