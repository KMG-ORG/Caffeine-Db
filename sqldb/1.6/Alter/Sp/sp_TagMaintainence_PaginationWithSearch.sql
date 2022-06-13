ALTER PROCEDURE  [dbo].[sp_TagMaintainence_PaginationWithSearch]     
 @PageNumber int,        
 @PageSize int,    
 @SearchName varchar(500)    
AS        
BEGIN    
 SELECT t.Id,t.EntityId,te.EntityName,t.ParentTagId,
 pt.ParentTagName,t.TagDescription,COUNT(*) OVER() AS TotalRecords 
 FROM TagMaintainence as t    
 INNER JOIN TagEntity as te ON t.EntityId = te.Id  
 LEFT JOIN ParentTag as pt ON  t.ParentTagId = pt.Id  
 WHERE (t.IsDeleted=0 OR t.IsDeleted IS NULL )     
 AND (t.TagDescription LIKE '%' + @SearchName + '%' or @SearchName IS NULL or @SearchName='')    
 ORDER BY t.ModifiedDateTime DESC    
 OFFSET (@PageNumber -1)* @PageSize ROWS        
 FETCH NEXT @PageSize ROWS ONLY         
END