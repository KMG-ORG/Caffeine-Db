
SET IDENTITY_INSERT [dbo].[ProspectTier] ON 
INSERT [dbo].[ProspectTier] ([Id], [Tier], [CreatedDateTime], [ModifiedDateTime], [CreatedBy], [ModifiedBy], [IsDeleted]) VALUES (1, N'Small', Getdate(), Getdate(), 'Mamta', 'Mamta', 0)
INSERT [dbo].[ProspectTier] ([Id], [Tier], [CreatedDateTime], [ModifiedDateTime], [CreatedBy], [ModifiedBy], [IsDeleted]) VALUES (2, N'Tier 3', Getdate(), Getdate(), 'Mamta', 'Mamta', 0)
INSERT [dbo].[ProspectTier] ([Id], [Tier], [CreatedDateTime], [ModifiedDateTime], [CreatedBy], [ModifiedBy], [IsDeleted]) VALUES (3, N'Tier 2', Getdate(), Getdate(), 'Mamta', 'Mamta', 0)
INSERT [dbo].[ProspectTier] ([Id], [Tier], [CreatedDateTime], [ModifiedDateTime], [CreatedBy], [ModifiedBy], [IsDeleted]) VALUES (4, N'Tier 1', Getdate(), Getdate(), 'Mamta', 'Mamta', 0)
SET IDENTITY_INSERT [dbo].[ProspectTier] OFF
GO