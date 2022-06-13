/****** Object:  StoredProcedure [dbo].[sp_User_Save]    Script Date: 23-01-2022 12:32:54 ******/

-- =============================================
-- Author:		<Chandmal>
-- Create date: <10.12.2021>
-- Description:	<Save User>
-- =============================================
CREATE PROCEDURE [dbo].[sp_User_Save]
(@Id int OUTPUT,
@UserName varchar(100), 
@CreatedDateTime datetime,
@ModifiedDateTime datetime,
@CreatedBy varchar(100))
AS
BEGIN 
INSERT INTO Users (UserName ,IsDeleted,CreatedBy,CreatedDateTime,ModifiedDateTime) VALUES 
(@UserName,0,@CreatedBy,@CreatedDateTime,@ModifiedDateTime) 
SET @Id=SCOPE_IDENTITY()
SELECT @Id
END