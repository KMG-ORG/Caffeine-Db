CREATE PROCEDURE [dbo].[sp_Users_SelectByRole]    
	@UserRole varchar(100)    
AS    
BEGIN    
	SELECT u.Id, u.UserName,r.UserRoleName as Title ,u.BusinessUnit,u.mobile,u.Position,u.email,
	COUNT(*) OVER() AS TotalRecords   
	FROM Users u    
	LEFT JOIN UserRole r on r.UserId = u.Id    
	WHERE ( r.UserRoleName = @UserRole  OR @UserRole='System Administrator' )   
	AND (u.IsDeleted=0 OR u.IsDeleted IS NULL)    
	ORDER BY  u.UserName    
END    
  
  