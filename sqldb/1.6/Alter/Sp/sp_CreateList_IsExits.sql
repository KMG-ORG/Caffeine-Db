


ALTER PROCEDURE [dbo].[sp_CreateList_IsExits]           
 @ListName  Nvarchar(500) ,    
 @SaveAs  Nvarchar(500)  
AS                  
 BEGIN      
   DECLARE @NoOfRecors int=0;    
   IF(@SaveAS='draft')  
   BEGIN  
     IF(@ListName='')  
    BEGIN  
      SET @ListName='Untitled';  
      DECLARE @NO INT =0;  
	   
      ;with ROWCTE as  
   (  SELECT CASE WHEN [ListName]  LIKE 'Untitled %'     
    THEN SUBSTRING([ListName] , CHARINDEX(' ', [ListName] ) + 1, LEN([ListName] ))     
     When ( [ListName]  = 'Untitled'  and  [ListName]  Not LIKE 'Untitled %') Then 1    
    ELSE 0 END as RowNO 
  FROM CreateList where  [ListName]  LIKE 'Untitled%' 
  )   
 
	SELECT @NO= Max(RowNO) FROM ROWCTE 

   IF(@NO>0)  
   SET @ListName=@ListName+' '+Cast(@NO+1 as varchar(10))  
    END  
   END   
  
   Select @NoOfRecors= Count(Id) from CreateList where ListName=@ListName       
   If(@NoOfRecors<=0)    
  BEGIN    
   Select 0 as IsExist , @ListName As ListName  
  END    
   ELSE    
  BEGIN    
   Select 1 as IsExist , @ListName As ListName   
  END    
 END