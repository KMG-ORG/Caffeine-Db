
 CREATE PROCEDURE [dbo].[sp_Activity_Select]  
@ProspectId INT ,
@IsDisposition BIT ,
@IsFinalDisposition BIT ,
@IsNote BIT ,
@IsDials BIT
AS
BEGIN
  DECLARE @DispositionSQL NVARCHAR(MAX)='';
  DECLARE @FinalDispositionSQL NVARCHAR(MAX)='';
  DECLARE @NoteSQL NVARCHAR(MAX)='';
  DECLARE @DialSQL NVARCHAR(MAX)='';
  DECLARE @SQL_Final NVARCHAR(MAX)='';
  DECLARE @UNIONALL NVARCHAR(MAX)= ''+' UNION ALL '+'';
  
    SET @DispositionSQL ='  
	    SELECT d.Id, ''Disposition'' AS Tab, d.ProspectId,d.DispositionId,m.Disposition AS Disposition_Notes,
		d.DispositionStatus, NULL AS NoOfAttempt, NULL RecordDate,
	    NULL TimesDialed, NULL  DialedBy,NULL NumberDialed, NULL CallDuration,
	    d.CreatedDateTime,d.CreatedBy,d.ModifiedDateTime,d. ModifiedBy  FROM Disposition d      
	    LEFT JOIN MasterDisposition m on d.DispositionId = m.Id    
	    WHERE d.ProspectId = ('+Cast(@ProspectId as varchar(10))+')  AND  (d.IsDeleted Is NULL OR d.IsDeleted = 0) '
	 

   SET @FinalDispositionSQL ='    
        SELECT f.Id,''Final Disposition'' AS Tab, f.ProspectId,f.DispositionId,m.Disposition AS Disposition_Notes,
		NULL DispositionStatus , f.NoOfAttempt, NULL RecordDate,
        NULL TimesDialed, NULL DialedBy,NULL NumberDialed, NULL CallDuration,
        f.CreatedDateTime,f.CreatedBy,f.ModifiedDateTime,f.ModifiedBy FROM FinalDisposition f    
        LEFT JOIN MasterDisposition m on f.DispositionId = m.Id    
        WHERE f.ProspectId= ('+Cast(@ProspectId as varchar(10))+')   AND  (f.IsDeleted IS NULL OR f.IsDeleted = 0) '
     
  
   SET @NoteSQL =' 
	    SELECT n.Id, ''Note'' AS Tab,n.ProspectId,n.DispositionId,n.Description AS Disposition_Notes,
		NULL DispositionStatus, NULL AS NoOfAttempt, n.RecordDate,
	    NULL TimesDialed, NULL DialedBy,NULL NumberDialed, NULL CallDuration,
	    n.CreatedDateTime,n.CreatedBy,n.ModifiedDateTime,n.ModifiedBy 
	    FROM Notes AS n   
	    LEFT JOIN MasterDisposition AS dis ON  n.DispositionId = dis.Id  
	    WHERE n.ProspectId= ('+Cast(@ProspectId as varchar(10))+') AND (n.IsDeleted = 0 OR n.IsDeleted IS NULL) '
 
   SET @DialSQL='     
		SELECT d.Id, ''Dials'' AS Tab, d.ProspectId, d.DispositionId ,m.Disposition AS Disposition_Notes, 
		NULL DispositionStatus, NULL AS NoOfAttempt,NULL RecordDate,
		d.TimesDialed, d.DialedBy,d.NumberDialed,d.CallDuration,
		d.CreatedDateTime,d.CreatedBy,d.ModifiedDateTime,d.ModifiedBy  
		FROM Dials AS d      
		LEFT JOIN MasterDisposition AS m ON d.DispositionId = m.Id    
		WHERE  d.ProspectId = ('+Cast(@ProspectId as varchar(10))+')   AND (d.IsDeleted=0 or d.IsDeleted IS NULL)    '

	 SET @SQL_Final = '
		SELECT  Id, NULL AS Tab, d.ProspectId,d.DispositionId,'''' AS Disposition_Notes,
		d.DispositionStatus, NULL AS NoOfAttempt, NULL RecordDate,
	    NULL TimesDialed, NULL  DialedBy,NULL NumberDialed, NULL CallDuration,
	    d.CreatedDateTime,d.CreatedBy,d.ModifiedDateTime,d. ModifiedBy  FROM Disposition d WHERE  d.ProspectId = 0'  




IF(@IsDisposition=1 AND @IsFinalDisposition=1 AND @IsNote=1 AND @IsDials=1)
BEGIN 
-- SELECT 'IsDisposition IsFinalDisposition IsNote IsDials '
       SET  @SQL_Final =   'SELECT * FROM  ('+
            @DispositionSQL+  @UNIONALL +
			@FinalDispositionSQL +  @UNIONALL +
			@NoteSQL +  @UNIONALL +	@DialSQL +') AS T ORDER BY CreatedDateTime DESC'  
END			
 -- Start Dispositin Case

ELSE IF(@IsDisposition=1 AND @IsFinalDisposition=1 AND @IsNote=1)
BEGIN 
-- SELECT 'IsDisposition IsFinalDisposition IsNote '
   SET    @SQL_Final  = 'SELECT * FROM  ('+ @DispositionSQL+  @UNIONALL +	@FinalDispositionSQL + @UNIONALL + 	@NoteSQL +') AS T ORDER BY CreatedDateTime DESC' 
END  

ELSE IF(@IsDisposition=1 AND @IsFinalDisposition=1 AND @IsDials=1)
BEGIN 
-- SELECT 'IsDisposition IsFinalDisposition IsDial '
   SET    @SQL_Final  = 'SELECT * FROM  ('+ @DispositionSQL+  @UNIONALL +	@FinalDispositionSQL + @UNIONALL + 	@DialSQL +') AS T ORDER BY CreatedDateTime DESC' ; 
END 

ELSE IF(@IsDisposition=1 AND @IsNote=1 AND @IsDials=1)
BEGIN 
-- SELECT 'IsDisposition IsNote IsDial '
   SET    @SQL_Final  = 'SELECT * FROM  ('+ @DispositionSQL+  @UNIONALL +	@NoteSQL + @UNIONALL + 	@DialSQL +') AS T ORDER BY CreatedDateTime DESC' ; 
END 

ELSE IF(@IsDisposition=1 AND @IsFinalDisposition=1)
	BEGIN 
	-- SELECT 'IsDisposition IsFinalDisposition'
	   SET    @SQL_Final  = 'SELECT * FROM  ('+ @DispositionSQL+  @UNIONALL +	@FinalDispositionSQL +') AS T ORDER BY CreatedDateTime DESC'; 
END 

ELSE IF(@IsDisposition=1 AND @IsNote=1)
BEGIN 
-- SELECT 'IsDisposition IsNote'
   SET    @SQL_Final  = 'SELECT * FROM  ('+ @DispositionSQL+  @UNIONALL + 	@NoteSQL +') AS T ORDER BY CreatedDateTime DESC' 
END  

ELSE IF(@IsDisposition=1 AND @IsDials=1)
BEGIN 
-- SELECT 'IsDisposition IsDial'
   SET    @SQL_Final  = 'SELECT * FROM  ('+ @DispositionSQL+  @UNIONALL + 	@DialSQL +') AS T ORDER BY CreatedDateTime DESC' ; 
END  
 

 -- end Dispositin Case

 -- Start Final Disposition Case
 ELSE IF(@IsFinalDisposition=1 AND @IsNote=1 AND @IsDials =1)
BEGIN 
-- SELECT 'IsFinalDisposition  IsNote IsDial'
   SET  @SQL_Final  =  'SELECT * FROM  ('+ @FinalDispositionSQL + @UNIONALL + @NoteSQL + @UNIONALL + 	@DialSQL +') AS T ORDER BY CreatedDateTime DESC'; 

END  
ELSE IF(@IsFinalDisposition=1 AND @IsNote=1)
BEGIN 
-- SELECT 'IsFinalDisposition IsNote'
   SET  @SQL_Final  =  'SELECT * FROM  ('+@FinalDispositionSQL + @UNIONALL + 	@NoteSQL +') AS T ORDER BY CreatedDateTime DESC' 
END  
 
 ELSE IF(@IsFinalDisposition=1 AND @IsDials =1)
BEGIN 
-- SELECT 'IsFinalDisposition IsDial'
   SET  @SQL_Final  =  'SELECT * FROM  ('+ @FinalDispositionSQL + @UNIONALL + 	@DialSQL +') AS T ORDER BY CreatedDateTime DESC' ; 
END  

 -- end Final Dispositin Case

 
 -- Start Note/Dial Case
ELSE IF(@IsNote=1 AND @IsDials =1)
BEGIN  
  SET  @SQL_Final  = 'SELECT * FROM  ('+ @NoteSQL + @UNIONALL + 	@DialSQL +') AS T ORDER BY CreatedDateTime DESC' ; 
 
END  
 -- end Note Case





 
 --  ELSE IF(@IsDisposition=0 AND @IsFinalDisposition=0 AND @IsNote =1 AND @IsDials=0)
 -- BEGIN 
 --  SET  @SQL_Final =    @NoteSQL  
	      
 --     -- WHEN @IsFinalDisposition=1 THEN @FinalDispositionSQL + @UNIONALL +
	--	 --   WHEN @IsNote=1 THEN @NoteSQL  +'     UNION ALL '+		
	--		--WHEN @IsDials=1 THEN @DialSQL 
			
	--		--ELSE
	--		--@DispositionSQL+  @UNIONALL +
	--		--@FinalDispositionSQL +  @UNIONALL +
	--		--@NoteSQL +  @UNIONALL +	@DialSQL END
	
	
	---- SELECT @SQL_Final;
 --END 

  

-- Start Singe Tab Display 
 ELSE IF(@IsDisposition=1)
 BEGIN 
   SET  @SQL_Final =  'SELECT * FROM  ('+ @DispositionSQL +') AS T ORDER BY ModifiedDateTime DESC' ; 
 END 

 ELSE IF(@IsFinalDisposition=1)
 BEGIN 
   SET  @SQL_Final  =  'SELECT * FROM  ('+ @FinalDispositionSQL +') AS T ORDER BY ModifiedDateTime DESC';
 END 

  ELSE IF(@IsDials=1)
 BEGIN 
   SET    @SQL_Final  = 'SELECT * FROM  ('+ @DialSQL +') AS T ORDER BY ModifiedDateTime DESC';
 END 

  ELSE IF(@IsNote=1)
 BEGIN 
   SET      @SQL_Final  = 'SELECT * FROM ('+ @NoteSQL  +') AS T ORDER BY ModifiedDateTime DESC';
 END 
 -- End 
  
  -- Final Scrpit Execution 
    EXEC sp_executesql @SQL_Final;  

	END

