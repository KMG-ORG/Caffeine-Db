﻿
Truncate table  [dbo].[MasterCriteria] 
GO
SET IDENTITY_INSERT [dbo].[MasterCriteria] ON 

INSERT [dbo].[MasterCriteria] ([Id], [Name], [Value], [Operand], [CreatedDateTime], [CreatedBy], [ModifiedDateTime], [ModifiedBy], [IsDeleted]) VALUES (1, N'Equals', N'eq', N'=', CAST(N'2022-03-09T16:27:26.897' AS DateTime), N'mamta', CAST(N'2022-03-09T16:27:26.897' AS DateTime), N'mamta', 0)
INSERT [dbo].[MasterCriteria] ([Id], [Name], [Value], [Operand], [CreatedDateTime], [CreatedBy], [ModifiedDateTime], [ModifiedBy], [IsDeleted]) VALUES (132, N'Begins With', N'BW', N'LIKE ''x%''', CAST(N'2022-03-14T15:51:04.673' AS DateTime), N'mamta', CAST(N'2022-03-14T15:51:04.673' AS DateTime), N'mamta', 0)
INSERT [dbo].[MasterCriteria] ([Id], [Name], [Value], [Operand], [CreatedDateTime], [CreatedBy], [ModifiedDateTime], [ModifiedBy], [IsDeleted]) VALUES (133, N'Contains', N'Contains', N'CONTAINS ()', CAST(N'2022-03-14T15:51:04.673' AS DateTime), N'mamta', CAST(N'2022-03-14T15:51:04.673' AS DateTime), N'mamta', 0)
INSERT [dbo].[MasterCriteria] ([Id], [Name], [Value], [Operand], [CreatedDateTime], [CreatedBy], [ModifiedDateTime], [ModifiedBy], [IsDeleted]) VALUES (134, N'Contains Data IS NOT NULL', N'ContainsD', N'IS NOT NULL', CAST(N'2022-03-14T15:51:04.673' AS DateTime), N'mamta', CAST(N'2022-03-14T15:51:04.673' AS DateTime), N'mamta', 0)
INSERT [dbo].[MasterCriteria] ([Id], [Name], [Value], [Operand], [CreatedDateTime], [CreatedBy], [ModifiedDateTime], [ModifiedBy], [IsDeleted]) VALUES (135, N'Contains Data IS NULL', N'ContainsDN', N'IS NULL', CAST(N'2022-03-14T15:51:04.673' AS DateTime), N'mamta', CAST(N'2022-03-14T15:51:04.673' AS DateTime), N'mamta', 0)
INSERT [dbo].[MasterCriteria] ([Id], [Name], [Value], [Operand], [CreatedDateTime], [CreatedBy], [ModifiedDateTime], [ModifiedBy], [IsDeleted]) VALUES (136, N'Does Not Begin With', N'DBW', N'NOT LIKE''x%''', CAST(N'2022-03-14T15:51:04.673' AS DateTime), N'mamta', CAST(N'2022-03-14T15:51:04.673' AS DateTime), N'mamta', 0)
INSERT [dbo].[MasterCriteria] ([Id], [Name], [Value], [Operand], [CreatedDateTime], [CreatedBy], [ModifiedDateTime], [ModifiedBy], [IsDeleted]) VALUES (137, N'Does Not Contain', N'NotContains', N'NOT CONTAINS ()', CAST(N'2022-03-14T15:51:04.673' AS DateTime), N'mamta', CAST(N'2022-03-14T15:51:04.673' AS DateTime), N'mamta', 0)
INSERT [dbo].[MasterCriteria] ([Id], [Name], [Value], [Operand], [CreatedDateTime], [CreatedBy], [ModifiedDateTime], [ModifiedBy], [IsDeleted]) VALUES (138, N'Does Not Contain Data', N'NContainsDN', N'IS NULL', CAST(N'2022-03-14T15:51:04.673' AS DateTime), N'mamta', CAST(N'2022-03-14T15:51:04.673' AS DateTime), N'mamta', 0)
INSERT [dbo].[MasterCriteria] ([Id], [Name], [Value], [Operand], [CreatedDateTime], [CreatedBy], [ModifiedDateTime], [ModifiedBy], [IsDeleted]) VALUES (139, N'Does Not Contain Data IS NOT NULL', N'NContainsD', N'IS NOT NULL', CAST(N'2022-03-14T15:51:04.673' AS DateTime), N'mamta', CAST(N'2022-03-14T15:51:04.673' AS DateTime), N'mamta', 0)
INSERT [dbo].[MasterCriteria] ([Id], [Name], [Value], [Operand], [CreatedDateTime], [CreatedBy], [ModifiedDateTime], [ModifiedBy], [IsDeleted]) VALUES (140, N'Does Not End With', N'DEW', N'NOT LIKE ''%x''', CAST(N'2022-03-14T15:51:04.673' AS DateTime), N'mamta', CAST(N'2022-03-14T15:51:04.673' AS DateTime), N'mamta', 0)
INSERT [dbo].[MasterCriteria] ([Id], [Name], [Value], [Operand], [CreatedDateTime], [CreatedBy], [ModifiedDateTime], [ModifiedBy], [IsDeleted]) VALUES (141, N'Does Not Equal', N'NEQ', N'!=', CAST(N'2022-03-14T15:51:04.673' AS DateTime), N'mamta', CAST(N'2022-03-14T15:51:04.673' AS DateTime), N'mamta', 0)
INSERT [dbo].[MasterCriteria] ([Id], [Name], [Value], [Operand], [CreatedDateTime], [CreatedBy], [ModifiedDateTime], [ModifiedBy], [IsDeleted]) VALUES (142, N'Ends With', N'EW', N'LIKE %x''', CAST(N'2022-03-14T15:51:04.673' AS DateTime), N'mamta', CAST(N'2022-03-14T15:51:04.673' AS DateTime), N'mamta', 0)
INSERT [dbo].[MasterCriteria] ([Id], [Name], [Value], [Operand], [CreatedDateTime], [CreatedBy], [ModifiedDateTime], [ModifiedBy], [IsDeleted]) VALUES (143, N'Is Greater Than', N'GR', N'>', CAST(N'2022-03-14T15:51:04.673' AS DateTime), N'mamta', CAST(N'2022-03-14T15:51:04.673' AS DateTime), N'mamta', 0)
INSERT [dbo].[MasterCriteria] ([Id], [Name], [Value], [Operand], [CreatedDateTime], [CreatedBy], [ModifiedDateTime], [ModifiedBy], [IsDeleted]) VALUES (144, N'Is Greater Than or Equal to', N'GEQ', N'>=', CAST(N'2022-03-14T15:51:04.673' AS DateTime), N'mamta', CAST(N'2022-03-14T15:51:04.673' AS DateTime), N'mamta', 0)
INSERT [dbo].[MasterCriteria] ([Id], [Name], [Value], [Operand], [CreatedDateTime], [CreatedBy], [ModifiedDateTime], [ModifiedBy], [IsDeleted]) VALUES (145, N'Is Lesser Than or Equal to', N'LEQ', N'<=', CAST(N'2022-03-14T15:51:04.673' AS DateTime), N'mamta', CAST(N'2022-03-14T15:51:04.673' AS DateTime), N'mamta', 0)
INSERT [dbo].[MasterCriteria] ([Id], [Name], [Value], [Operand], [CreatedDateTime], [CreatedBy], [ModifiedDateTime], [ModifiedBy], [IsDeleted]) VALUES (146, N'On', N'ON', N'= MM/DD/YYYY', CAST(N'2022-03-14T15:51:04.673' AS DateTime), N'mamta', CAST(N'2022-03-14T15:51:04.673' AS DateTime), N'mamta', 0)
INSERT [dbo].[MasterCriteria] ([Id], [Name], [Value], [Operand], [CreatedDateTime], [CreatedBy], [ModifiedDateTime], [ModifiedBy], [IsDeleted]) VALUES (147, N'On-Or-After', N'ONA', N'>= MM/DD/YYYY', CAST(N'2022-03-14T15:51:04.673' AS DateTime), N'mamta', CAST(N'2022-03-14T15:51:04.673' AS DateTime), N'mamta', 0)
INSERT [dbo].[MasterCriteria] ([Id], [Name], [Value], [Operand], [CreatedDateTime], [CreatedBy], [ModifiedDateTime], [ModifiedBy], [IsDeleted]) VALUES (148, N'On-Or-Before', N'ONB', N'<= MM/DD/YYYY', CAST(N'2022-03-14T15:51:04.673' AS DateTime), N'mamta', CAST(N'2022-03-14T15:51:04.673' AS DateTime), N'mamta', 0)
INSERT [dbo].[MasterCriteria] ([Id], [Name], [Value], [Operand], [CreatedDateTime], [CreatedBy], [ModifiedDateTime], [ModifiedBy], [IsDeleted]) VALUES (149, N'Under', N'IN', N'IN()', CAST(N'2022-03-14T15:51:04.673' AS DateTime), N'mamta', CAST(N'2022-03-14T15:51:04.673' AS DateTime), N'mamta', 0)
INSERT [dbo].[MasterCriteria] ([Id], [Name], [Value], [Operand], [CreatedDateTime], [CreatedBy], [ModifiedDateTime], [ModifiedBy], [IsDeleted]) VALUES (150, N'Less Than', N'LS', N'<', CAST(N'2022-04-12T11:04:23.993' AS DateTime), N'Mamta', CAST(N'2022-04-12T11:04:23.993' AS DateTime), N'Mamta', 0)
SET IDENTITY_INSERT [dbo].[MasterCriteria] OFF
GO