-- =================================================================
-- Author:  <Vibhuti>  
-- Create date: <04-20-2022>  
-- Description: <Get all User details with Pagination >  
-- ==================================================================  
ALTER PROCEDURE [dbo].[sp_Users_SelectByRoleWithPagination] 
	@UserRole varchar(100),
	@PageNumber int, 
	@PageSize int 
AS
BEGIN
	SELECT u.Id, u.UserName, r.UserRoleName as Title ,u.BusinessUnit,u.mobile,u.Position,u.email,
	COUNT(*) OVER() AS TotalRecords  
	FROM Users u
    LEFT JOIN UserRole r on r.UserId = u.Id
    WHERE (r.UserRoleName = @UserRole  OR @UserRole='System Administrator') 
	AND (u.IsDeleted=0 OR u.IsDeleted IS NULL)
	ORDER BY  u.UserName
	OFFSET (@PageNumber -1)* @PageSize ROWS
    FETCH NEXT @PageSize ROWS ONLY 
END

