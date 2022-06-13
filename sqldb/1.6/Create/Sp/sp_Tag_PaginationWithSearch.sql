CREATE PROCEDURE  [dbo].[sp_Tag_PaginationWithSearch]
	@PageNumber int,        
	@PageSize int,    
	@SearchName varchar(500)    
AS        
BEGIN    
	SELECT t.Id,t.AssociatedBusinessObjectName,t.Name,t.SelfReferenceParentId,
	(Select Name From Tag where Id = t.SelfReferenceParentId ) as ParentTag,
	COUNT(*) OVER() AS TotalRecords 
	FROM Tag as t    
	WHERE (t.IsDeleted=0 OR t.IsDeleted IS NULL )     
	AND (t.Name LIKE '%' + @SearchName + '%' or @SearchName IS NULL or @SearchName='') AND (t.Id > 3)   
	ORDER BY t.ModifiedDateTime ASC   
	OFFSET (@PageNumber -1)* @PageSize ROWS        
	FETCH NEXT @PageSize ROWS ONLY         
END
