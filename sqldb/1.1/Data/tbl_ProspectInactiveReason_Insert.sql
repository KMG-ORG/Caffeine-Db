SET IDENTITY_INSERT [dbo].[ProspectInactivationReason] ON  
INSERT [dbo].[ProspectInactivationReason] ([Id], [ProspectInactivationReason], [CreatedDateTime], [ModifiedDateTime], [CreatedBy], [ModifiedBy], [IsDeleted]) VALUES (1, N'Do not call, not viable', NULL, NULL, NULL, NULL, 0)
INSERT [dbo].[ProspectInactivationReason] ([Id], [ProspectInactivationReason], [CreatedDateTime], [ModifiedDateTime], [CreatedBy], [ModifiedBy], [IsDeleted]) VALUES (2, N'Do Not Email or Contact', NULL, NULL, NULL, NULL, 0)
INSERT [dbo].[ProspectInactivationReason] ([Id], [ProspectInactivationReason], [CreatedDateTime], [ModifiedDateTime], [CreatedBy], [ModifiedBy], [IsDeleted]) VALUES (3, N'Invalid Prospect', NULL, NULL, NULL, NULL, 0)
SET IDENTITY_INSERT [dbo].[ProspectInactivationReason] OFF
GO
 