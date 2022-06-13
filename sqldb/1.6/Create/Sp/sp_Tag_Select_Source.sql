CREATE PROCEDURE  [dbo].[sp_Tag_Select_Source] 
AS    
BEGIN  
	SELECT t.Id,t.Name
	FROM Tag as t
	WHERE (t.IsDeleted=0 OR t.IsDeleted IS NULL ) AND t.Id IN(1,2,3)
	ORDER BY t.Name DESC	
END
