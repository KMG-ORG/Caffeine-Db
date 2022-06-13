CREATE PROCEDURE [dbo].[sp_CreateList_Save]    
(      
  @Id INT OUTPUT,    
  @TypeOfList varchar(20),      
  @ExpirationDate datetime,    
  @IsNewList [bit] ,    
  @ListName varchar(100),    
  @CreateListJSON   nvarchar(max),      
  @CreatedDateTime datetime,       
  @CreatedBy varchar(100)    
)      
AS      
 BEGIN     
    DECLARE @SqlQuery varchar(Max)  
 Exec sp_CreateListFilterQuery_Select @CreateListJSON, @SqlQuery OUTPUT  
  
  --SELECT @SqlQuery as setq;  
  
  Insert Into CreateList(TypeOfList,ExpirationDate,IsNewList,ListName,CreateListJSON,FilterQuery,CreatedBy,CreatedDateTime,ModifiedBy,ModifiedDateTime,IsDeleted)    
  Values (@TypeOfList,@ExpirationDate,@IsNewList,@ListName,@CreateListJSON, @SqlQuery,@CreatedBy,@CreatedDateTime,@CreatedBy,@CreatedDateTime,0)   
     
 SET @Id=SCOPE_IDENTITY()      
 SELECT @Id      
     
 END  