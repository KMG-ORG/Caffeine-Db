/****** Object:  StoredProcedure [dbo].[sp_Users_SelectByRole]    Script Date: 23-01-2022 12:40:48 ******/

-- =============================================
-- Author:		<Chandmal>
-- Create date: <10.12.2021>
-- Description:	<Select User by its role>
-- =============================================  
CREATE PROCEDURE [dbo].[sp_Users_SelectByRole] 
@UserRole varchar(100)
AS
BEGIN
	SELECT u.Id, u.UserName,r.UserRoleName FROM Users u
    LEFT JOIN UserRole r on r.UserId = u.Id
    WHERE r.UserRoleName = @UserRole AND (u.IsDeleted=0 OR u.IsDeleted IS NULL)
     ORDER BY  u.UserName
END
