CREATE PROCEDURE [dbo].[sp_Users_SelectByRole_AndWithoutRole] 
@UserRole varchar(100),
@SearchName varchar(100)
AS
BEGIN
if @UserRole is not null AND @UserRole!='' begin
	SELECT u.Id, u.UserName,r.UserRoleName FROM Users u
    LEFT JOIN UserRole r on r.UserId = u.Id
    WHERE r.UserRoleName = @UserRole AND (u.IsDeleted=0 OR u.IsDeleted IS NULL)
	and lower(UserName) like '%'+lower(@SearchName)+'%'
	ORDER BY  u.UserName
	end

	else begin
		SELECT u.Id, u.UserName,r.UserRoleName FROM Users u
    LEFT JOIN UserRole r on r.UserId = u.Id
    WHERE 
	(u.IsDeleted=0 OR u.IsDeleted IS NULL)
	and lower(UserName) like '%'+lower(@SearchName)+'%'
	ORDER BY  u.UserName
	end


END