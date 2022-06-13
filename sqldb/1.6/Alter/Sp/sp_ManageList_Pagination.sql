ALTER PROCEDURE [dbo].[sp_ManageList_Pagination]   
 @PageNumber int,        
 @PageSize int   ,  
 @SaveAsType VARCHAR(100),      
 @IsRecentDate bit  
   
AS        
 BEGIN    
   IF EXISTS(SELECT * FROM sys.tables WHERE SCHEMA_NAME(schema_id) LIKE 'dbo' AND name like 'tempCreateListData')        
  DROP TABLE tempCreateListData;       
       
   IF EXISTS(SELECT * FROM sys.tables WHERE SCHEMA_NAME(schema_id) LIKE 'dbo' AND name like 'tempDate')        
  DROP TABLE tempDate;       
   Create Table tempDate (Total Int)    
          
 SELECT 0 as Total,Cl.FilterQuery,Cl.Id,      
  Cl.ListName,        
  Cl.TypeOfList,      
  Cl.ExpirationDate,          
  CASE WHEN Cl.IsNewList = 1 THEN  'No' ELSE 'Yes' END AS IsTemplate,  
  Cl.TemplateListId AS CreatedTemplateId ,      
  C2.ListName as CreatedTemplateName,      
  0 SharedWithId,      
  '' As SharedWithName,       
  cl.SaveAsType AS CreationStatus,      
  cl.CreatedBy,      
  cl.CreatedDateTime,      
  cl.ModifiedBy,      
  cl.ModifiedDateTime     into tempCreateListData    
 FROM CreateList Cl      
 LEFT JOIN CreateList C2 ON C2.Id = Cl.TemplateListId 
 where (Cl.IsDeleted=0 or Cl.IsDeleted IS NULL)   And (@SaveAsType='All' OR @SaveAsType= Cl.SaveAsType)  
 AND (@IsRecentDate = 0 Or (DATEDIFF(day, cl.CreatedDateTime, GETDATE()) <=60))  
 AND (Cl.ExpirationDate IS NULL OR Cl.ExpirationDate >= CAST(GETDATE() AS DATE))  
 ORDER BY  Cl.ModifiedDateTime DESC      
    
 DECLARE @CurrentCout Int=0;    
 DECLARE @TotalCount  Int =0;    
    
 SELECT @CurrentCout=Min(Id), @TotalCount = Max(Id) from tempCreateListData    
     
 While(@CurrentCout<= @TotalCount)    
 BEGIN    
     If((SELECT count(Id) from tempCreateListData where id=@CurrentCout) >0)    
  BEGIN    
     DECLARE @NoOfRecords Int =0;    
     BEGIN TRY     
        DECLARE @SelectQuery NVARCHAR(Max)     
    SELECT Top 1 @SelectQuery=  FilterQuery from tempCreateListData where id=@CurrentCout;    
    Truncate Table tempDate    
     EXEC dbo.sp_ProspectPreviewList_NoOFCountSelect @SelectQuery   
  select Top 1  @NoOfRecords=Total From tempDate    
  Update tempCreateListData Set Total= @NoOfRecords where id=@CurrentCout  
  
     END TRY    
     BEGIN CATCH      
    Set @NoOfRecords=0;     
     END CATCH      
        
  END    
    
  set @CurrentCout=@CurrentCout+1;    
 END    
 SELECT Cl.Id,      
  Cl.ListName,      
  Cl.Total as NoOfProspects ,      
  Cl.TypeOfList,      
  Cl.ExpirationDate,     
  cl.IsTemplate,   
  Cl.CreatedTemplateId,
  Cl.CreatedTemplateName,      
  0 SharedWithId,      
  '' As SharedWithName,       
  cl.CreationStatus,      
  cl.CreatedBy,      
  cl.CreatedDateTime,      
  cl.ModifiedBy,      
  cl.ModifiedDateTime ,COUNT(*) OVER() AS TotalRecords   
  from tempCreateListData Cl     
  ORDER BY Cl.Id DESC     
 OFFSET (@PageNumber -1)* @PageSize ROWS      
 FETCH NEXT @PageSize ROWS ONLY       
END 