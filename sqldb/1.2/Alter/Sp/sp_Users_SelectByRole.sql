ALTER PROCEDURE [dbo].[sp_Users_SelectByRole] 
@UserRole varchar(100)
AS
BEGIN
	SELECT u.Id, u.UserName,r.UserRoleName FROM Users u
    LEFT JOIN UserRole r on r.UserId = u.Id
    WHERE r.UserRoleName = @UserRole AND (u.IsDeleted=0 OR u.IsDeleted IS NULL)
     ORDER BY  u.UserName
END
