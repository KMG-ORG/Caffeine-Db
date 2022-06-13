-- =================================================================
-- Author:  <Vibhuti>  
-- Create date: <04-20-2022>  
-- Description: <Get all ExpiringCarrier details with Pagination > 
-- ==================================================================  
CREATE PROCEDURE  [dbo].[sp_ExpiringCarrier_SelectWithPagination] 
	@PageNumber int, 
	@PageSize int  
AS
BEGIN
	SELECT Id, Value,Email,
	(Select Count(Id) from ExpiringCarrier WHERE (IsDeleted=0 OR IsDeleted IS NULL)) as TotalRecords
	FROM ExpiringCarrier 
	WHERE (IsDeleted=0 OR IsDeleted IS NULL) 
	ORDER BY Value 
	OFFSET (@PageNumber -1)* @PageSize ROWS
    FETCH NEXT @PageSize ROWS ONLY 
END