ALTER PROCEDURE  [dbo].[sp_ExpiringCarrier_SelectByName] 
   @SearchName varchar(100)  
AS  
BEGIN  
	SELECT Id, Value,Email,COUNT(*) OVER() AS TotalRecords   
	FROM ExpiringCarrier 
	WHERE (IsDeleted=0 OR IsDeleted IS NULL) AND (Value LIKE '%' + @SearchName + '%')  
	ORDER BY Value   
END