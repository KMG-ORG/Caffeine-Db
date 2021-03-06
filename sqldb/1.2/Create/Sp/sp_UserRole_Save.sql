/****** Object:  StoredProcedure [dbo].[sp_UserRole_Save]    Script Date: 23-01-2022 12:37:58 ******/

-- =============================================
-- Author:		<Chandmal>
-- Create date: <10.12.2021>
-- Description:	<Save User Role>
-- =============================================  
CREATE PROCEDURE [dbo].[sp_UserRole_Save]
(@Id int OUTPUT,
@UserRoleName varchar(100),
@UserId int,
@CreatedDateTime datetime,
@ModifiedDateTime datetime,
@CreatedBy varchar(100))
AS
BEGIN 
INSERT INTO UserRole (UserRoleName, UserId ,IsDeleted,CreatedBy,CreatedDateTime,ModifiedDateTime) VALUES 
(@UserRoleName, @UserId,0,@CreatedBy,@CreatedDateTime,@ModifiedDateTime) 
SET @Id=SCOPE_IDENTITY()
SELECT @Id
END