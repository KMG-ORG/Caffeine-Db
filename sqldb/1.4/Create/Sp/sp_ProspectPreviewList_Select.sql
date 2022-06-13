 CREATE PROCEDURE sp_ProspectPreviewList_Select        
 @CreateListJSON [nvarchar](max)  ,      
 @Id Int      
 AS          
 BEGIN      
    DECLARE @SqlQuery varchar(Max)='',@Json varchar(Max)=''      
 IF (((SELECT Count(1) FROM CreateList Where Id=@Id)>0) And  @Id>0 )     
  BEGIN      
       SELECT @Json= CreateListJSON FROM [CreateList] Where Id=@Id      
    Exec sp_CreateListFilterQuery_Select @Json, @SqlQuery OUTPUT      
   -- Select @SqlQuery      
  END      
 Else      
  BEGIN      
   Exec sp_CreateListFilterQuery_Select @CreateListJSON, @SqlQuery OUTPUT      
  END      
   Exec sp_Prospect_SelectByFilter @SqlQuery      
 END