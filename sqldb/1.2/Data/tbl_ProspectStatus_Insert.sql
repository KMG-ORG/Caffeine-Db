/****** Object:  Table [dbo].[ProspectStatus]    Script Date: 23-12-2021 17:06:39 ******/

-- =======================================================================
-- Author:      <Vibhuti>
-- Create Date: <12.2.2021 >
-- Description: < Insert values into ProspectStatus Table>
-- ========================================================================

SET IDENTITY_INSERT [dbo].[ProspectStatus] ON 

INSERT [dbo].[ProspectStatus] ([Id], [Status], [CreatedDateTime], [ModifiedDateTime], [CreatedBy], [ModifiedBy], [IsDeleted]) VALUES (1, N'ProspectiveInsured', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[ProspectStatus] ([Id], [Status], [CreatedDateTime], [ModifiedDateTime], [CreatedBy], [ModifiedBy], [IsDeleted]) VALUES (2, N'NewClient', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[ProspectStatus] ([Id], [Status], [CreatedDateTime], [ModifiedDateTime], [CreatedBy], [ModifiedBy], [IsDeleted]) VALUES (3, N'ExistingClient', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[ProspectStatus] ([Id], [Status], [CreatedDateTime], [ModifiedDateTime], [CreatedBy], [ModifiedBy], [IsDeleted]) VALUES (4, N'NewLineOfBusiness', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[ProspectStatus] ([Id], [Status], [CreatedDateTime], [ModifiedDateTime], [CreatedBy], [ModifiedBy], [IsDeleted]) VALUES (5, N'FormerClient', NULL, NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[ProspectStatus] OFF
GO
