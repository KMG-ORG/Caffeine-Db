 
USE [CAFFEINE_DEV] 
GO
SET IDENTITY_INSERT [dbo].[ProspectStatus] ON 

INSERT [dbo].[ProspectStatus] ([Id], [Status], [CreatedDateTime], [ModifiedDateTime], [CreatedBy], [ModifiedBy], [IsDeleted]) VALUES (1, N'Do not call, not viable', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[ProspectStatus] ([Id], [Status], [CreatedDateTime], [ModifiedDateTime], [CreatedBy], [ModifiedBy], [IsDeleted]) VALUES (2, N'Unknown', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[ProspectStatus] ([Id], [Status], [CreatedDateTime], [ModifiedDateTime], [CreatedBy], [ModifiedBy], [IsDeleted]) VALUES (3, N'Qualified, ok to pursue', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[ProspectStatus] ([Id], [Status], [CreatedDateTime], [ModifiedDateTime], [CreatedBy], [ModifiedBy], [IsDeleted]) VALUES (4, N'Got Appointment', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[ProspectStatus] ([Id], [Status], [CreatedDateTime], [ModifiedDateTime], [CreatedBy], [ModifiedBy], [IsDeleted]) VALUES (5, N'Requested Call Back', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[ProspectStatus] ([Id], [Status], [CreatedDateTime], [ModifiedDateTime], [CreatedBy], [ModifiedBy], [IsDeleted]) VALUES (6, N'Send Policy Information', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[ProspectStatus] ([Id], [Status], [CreatedDateTime], [ModifiedDateTime], [CreatedBy], [ModifiedBy], [IsDeleted]) VALUES (7, N'Prospect – Qualified and Lost', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[ProspectStatus] ([Id], [Status], [CreatedDateTime], [ModifiedDateTime], [CreatedBy], [ModifiedBy], [IsDeleted]) VALUES (8, N'Do Not Email or Contact', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[ProspectStatus] ([Id], [Status], [CreatedDateTime], [ModifiedDateTime], [CreatedBy], [ModifiedBy], [IsDeleted]) VALUES (9, N'Client', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[ProspectStatus] ([Id], [Status], [CreatedDateTime], [ModifiedDateTime], [CreatedBy], [ModifiedBy], [IsDeleted]) VALUES (10, N'Lost Client', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[ProspectStatus] ([Id], [Status], [CreatedDateTime], [ModifiedDateTime], [CreatedBy], [ModifiedBy], [IsDeleted]) VALUES (11, N'Invalid Prospect', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[ProspectStatus] ([Id], [Status], [CreatedDateTime], [ModifiedDateTime], [CreatedBy], [ModifiedBy], [IsDeleted]) VALUES (12, N'Incorrect Classification', NULL, NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[ProspectStatus] OFF
GO