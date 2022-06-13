


ALTER PROCEDURE [dbo].[sp_Disposition_Save]  
(   
    @Id int OUTPUT,  
 @DispositionId int,  
 @ProspectId int,  
    @CreatedDateTime datetime,  
 @CreatedBy varchar(100),  
 @ModifiedDateTime datetime,   
 @ModifiedBy varchar(2500)  
)  
AS  
BEGIN  
     -- CREATE some local variable's for the use of few condition   
  DECLARE @dispositionStatus AS varchar(20)= 'COMPLETED';  
  DECLARE @dispositionCount AS INT = 1;  
  DECLARE @final AS INT = 0;   
  
  -- create new temprary table for the nonfinal record's  
  -- FOR ('No Pitch Made - Talked to Non Decision Maker'),('Left Voice Message'), ('Did Not Leave Message')  
  DECLARE @TempNonFinalFieldTbl TABLE (dispositionFieldId INT,dispositionField VARCHAR(200))  
  INSERT INTO @TempNonFinalFieldTbl (dispositionField)  
  values  
  ('No Pitch Made - Talked to Non Decision Maker'),  
  ('Left Voice Message'),('Did Not Leave Message')  
      
   UPDATE @TempNonFinalFieldTbl SET dispositionFieldId =(SELECT Id FROM MasterDisposition WHERE Disposition=dispositionField)  
  
   -- SELECT * FROM @TempNonFinalFieldTbl  
  
   --SELECT COUNT(Id) FROM  Disposition WHERE ProspectId=750 AND DispositionStatus = 'NEW' AND   
   --    DispositionId IN (select dispositionFieldId from @TempNonFinalFieldTbl)  
   --    GROUP BY Id HAVING COUNT(*)< 2      
  
   -- SELECT  DispositionId  
   -- FROM Disposition WHERE (ProspectId=750 AND DispositionStatus = 'NEW' AND   
   -- DispositionId IN (select dispositionFieldId from @TempNonFinalFieldTbl))   
   --    GROUP BY DispositionId  
  
      -- check NoOfAttempt count with last record in Final disposition table   
   IF EXISTS (SELECT COUNT(*)dispositionCount FROM Disposition WHERE ProspectId=@ProspectId)   
   BEGIN  
   --SET @dispositionCount = (SELECT TOP 1 ISNULL(NoOfAttempt,0)dispositionCount   FROM  FinalDisposition WHERE  
   --           ProspectId= 750 ORDER BY Id DESC  
    SET @dispositionCount = (SELECT COUNT(*)dispositionCount FROM Disposition WHERE ProspectId= @ProspectId)   
    SET @dispositionCount =  @dispositionCount + 1   
   END  
    -- otherwise dispositionCount =1;   
   ELSE    
   BEGIN  
    SET @dispositionCount = @dispositionCount;  
   END   
      
 -- Check given record is nonfinal or not  (like: 6,7,8)   
  
 IF((SELECT COUNT(*)NonFinal FROM  @TempNonFinalFieldTbl WHERE dispositionFieldId = @DispositionId) > 0)  
   
 BEGIN   
  SET @final = (SELECT COUNT(*) FROM  Disposition WHERE ProspectId=@ProspectId AND DispositionStatus = 'NEW' AND   
       DispositionId IN (select dispositionFieldId from @TempNonFinalFieldTbl))  
     
  -- SELECT @dispositionCount as existCount;   
  -- SELECT @final as finalCount;      
    
   IF((SELECT COUNT(*)-1 FROM  @TempNonFinalFieldTbl) = @final)     
   BEGIN    
   -- SET @dispositionCount = @dispositionCount + 2;  
  
     -- Update DispositionStatus in Disposition for all nonfinal disposition record in given prospect  
     UPDATE Disposition SET DispositionStatus = @dispositionStatus   
            WHERE ProspectId =@ProspectId AND DispositionStatus = 'NEW';  
       
   -- CALL SP FOR Insert Record in Final Disposition Table   
       EXEC sp_FinalDisposition_Save 0,@DispositionId,@ProspectId, @dispositionCount,@CreatedDateTime, @CreatedBy, @ModifiedDateTime,  @ModifiedBy  
   -- EXEC [sp_FinalDisposition_Select] @ProspectId -- Temparary used  
   END  
   ELSE  
   BEGIN  
      SET @dispositionStatus = 'NEW';  
         
       UPDATE FinalDisposition SET NoOfAttempt =@dispositionCount WHERE Id =(SELECT MAX(ID) FROM    
       FinalDisposition WHERE ProspectId =@ProspectId)  
  
   END        
   END  
  
 ELSE   
 BEGIN    
 -- CALL SP FOR Insert Record in Final Disposition Table   
       EXEC sp_FinalDisposition_Save 0,@DispositionId,@ProspectId, @dispositionCount,@CreatedDateTime, @CreatedBy, @ModifiedDateTime, @ModifiedBy  
 -- EXEC [sp_FinalDisposition_Select] @ProspectId -- Temparary  
 END  
  
  
  
 -- Final Statement --> Insert Record in Disposition Table for every time if these sp's called  
 INSERT INTO Disposition  
 (DispositionId,ProspectId,DispositionStatus,CreatedDateTime,CreatedBy,ModifiedDateTime, ModifiedBy,IsDeleted)  
 VALUES  
 (@DispositionId,@ProspectId, @dispositionStatus,@CreatedDateTime, @CreatedBy, @ModifiedDateTime,  @ModifiedBy, 0)  
   SET @Id=SCOPE_IDENTITY()  
   SELECT @Id  

    IF(@DispositionId=2)
	  BEGIN
	     Update Prospects   SET IsActive=0,   ModifiedDateTime=@ModifiedDateTime  WHERE Id=@ProspectId AND IsDeleted IS NULL   
	  END
END  
   
  
  