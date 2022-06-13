
ALTER PROCEDURE  [dbo].[sp_LeadGenerator_SelectWithPagination]  
 @PageNumber int,   
 @PageSize int    
AS  
BEGIN  
 SELECT l.Id, l.Value ,u.email as OwnerEmail, u.UserName as Owner ,  
 COUNT(*) OVER() AS TotalRecords    
 FROM LeadGenerator as l 
 LEFT JOIN Users as u on u.Id=l.OwnerId 
 WHERE (l.IsDeleted=0 OR l.IsDeleted IS NULL)     
 ORDER BY Value  
 OFFSET (@PageNumber -1)* @PageSize ROWS  
    FETCH NEXT @PageSize ROWS ONLY   
END