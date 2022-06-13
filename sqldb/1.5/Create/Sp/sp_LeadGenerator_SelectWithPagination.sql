-- =================================================================
-- Author:  <Vibhuti>  
-- Create date: <04-20-2022>  
-- Description: <Get all LeadGenerator details with Pagination >  
-- ==================================================================  
CREATE PROCEDURE  [dbo].[sp_LeadGenerator_SelectWithPagination]
	@PageNumber int, 
	@PageSize int  
AS
BEGIN
	SELECT Id, Value,OwnerEmail ,
	(Select Count(Id) from LeadGenerator WHERE (IsDeleted=0 OR IsDeleted IS NULL)) as TotalRecords
	FROM LeadGenerator
	WHERE (IsDeleted=0 OR IsDeleted IS NULL) 
	ORDER BY Value 
	OFFSET (@PageNumber -1)* @PageSize ROWS
    FETCH NEXT @PageSize ROWS ONLY 
END