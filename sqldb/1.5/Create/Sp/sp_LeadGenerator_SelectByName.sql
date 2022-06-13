CREATE PROCEDURE  [dbo].[sp_LeadGenerator_SelectByName]  
@SearchName varchar(100)  
AS  
BEGIN  
 SELECT Id, Value, OwnerEmail FROM LeadGenerator WHERE (IsDeleted=0 OR IsDeleted IS NULL)   
 AND (Value LIKE '%' + @SearchName + '%')  
 ORDER BY Value   
END