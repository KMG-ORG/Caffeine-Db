CREATE PROCEDURE [dbo].[sp_Users_SelectByName] 
	@SearchName varchar(100),
	@RoleName varchar(50)
AS
BEGIN
	SELECT u.Id, u.UserName,r.UserRoleName as Title ,u.BusinessUnit,u.mobile,u.Position,u.email,
	COUNT(*) OVER() AS TotalRecords 
	FROM Users u
    LEFT JOIN UserRole r on r.UserId = u.Id
    WHERE u.UserName like '%'+@SearchName +'%' AND 
	(r.UserRoleName = @RoleName  OR @RoleName='System Administrator') 	
	AND (u.IsDeleted=0 OR u.IsDeleted IS NULL)
	ORDER BY  u.UserName
END

