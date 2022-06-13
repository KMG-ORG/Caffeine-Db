ALTER PROCEDURE [dbo].[sp_Users_Select]  
AS
BEGIN
	SELECT u.Id, u.UserName,r.UserRoleName,u.IsDeleted FROM Users u
     LEFT JOIN UserRole r on r.UserId = u.Id  AND (u.IsDeleted=0 OR u.IsDeleted IS NULL)
	  ORDER BY  u.UserName
END
 