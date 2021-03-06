ALTER PROCEDURE  [dbo].[sp_LeadGenerator_Select]    
AS    
BEGIN    
 SELECT l.Id, l.Value ,u.email as OwnerEmail, u.UserName as Owner ,  
 COUNT(*) OVER() AS TotalRecords    
 FROM LeadGenerator as l 
 LEFT JOIN Users as u on u.Id=l.OwnerId 
 WHERE (l.IsDeleted=0 OR l.IsDeleted IS NULL)     
 ORDER BY Value     
END