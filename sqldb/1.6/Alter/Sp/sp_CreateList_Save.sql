

 


ALTER PROCEDURE [dbo].[sp_CreateList_Save]    
(      
  @Id INT OUTPUT,    
  @TypeOfList varchar(20),  
  @SaveAsType VARCHAR(100),
  @ExpirationDate datetime,    
  @IsNewList [bit] ,   
  @TemplateListId INT,
  @ListName varchar(100),    
  @CreateListJSON   nvarchar(max), 
  @CreateListJSONGroup [nvarchar](max) ,     
  @CreatedDateTime datetime,       
  @CreatedBy varchar(100)    
)      
AS      
 BEGIN     
    DECLARE @SqlQuery varchar(Max)  
 Exec sp_CreateListFilterQuery_Select @CreateListJSON,@CreateListJSONGroup, @SqlQuery OUTPUT  
  
  --SELECT @SqlQuery as setq;  
  
  
 IF(@SaveAsType = 'draft' AND @ListName = '' )
 BEGIN
    CREATE TABLE #TEMPDraft  
	(  
	  Exits bit,
	  ListName VARCHAR(100) 
	)  

	INSERT INTO  #TEMPDraft    
	EXEC  [sp_CreateList_IsExits] '', @SaveAsType

	SELECT @ListName = ListName FROM #TEMPDraft;

--   SELECT * from #TEMPDraft;
  END

  IF(@TypeOfList ='Static' AND @ExpirationDate IS NULL)
  BEGIN
  -- Set By Default 60 Days Expiration Date 
  SET @ExpirationDate = GETDATE() + 60;
  END


   Insert Into CreateList(TypeOfList,SaveAsType,ExpirationDate,IsNewList,ListName,TemplateListId,CreateListJSON,CreateListJSONGroup,FilterQuery,CreatedBy,CreatedDateTime,ModifiedBy,ModifiedDateTime,IsDeleted)    
   Values (@TypeOfList,@SaveAsType,@ExpirationDate,@IsNewList,@ListName,@TemplateListId,@CreateListJSON,@CreateListJSONGroup, @SqlQuery,@CreatedBy,@CreatedDateTime,@CreatedBy,@CreatedDateTime,0)   
     
 SET @Id=SCOPE_IDENTITY()      
 SELECT @Id

  
     IF(@TypeOfList = 'Static')
	 BEGIN   
	 -- Call PROCEDURE for Static Prospect Add in Table
	  EXEC [sp_StaticProspects_Save] @SqlQuery,@Id,@CreatedDateTime,@CreatedBy
	 END
 END     
