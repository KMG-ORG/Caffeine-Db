
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

INSERT [dbo].[UserRole] ([UserRoleName], [UserId], [CreatedDateTime], [ModifiedDateTime], [CreatedBy], [ModifiedBy], [IsDeleted]) VALUES 
( N'Marketing', 1, CAST(N'2022-01-13T10:23:37.567' AS DateTime), CAST(N'2022-01-13T10:23:37.567' AS DateTime),N'Chris.Green@caffeine09.onmicrosoft.com', NULL, 0)

INSERT [dbo].[UserRole] ([UserRoleName], [UserId], [CreatedDateTime], [ModifiedDateTime], [CreatedBy], [ModifiedBy], [IsDeleted]) VALUES 
(N'Marketing', 1, CAST(N'2022-01-13T10:23:37.567' AS DateTime), CAST(N'2022-01-13T10:23:37.567' AS DateTime), N'Chris.Green@caffeine09.onmicrosoft.com', NULL, 0)

