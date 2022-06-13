/****** Object: Table [dbo].[ProspectSize]    Script Date: 23-12-2021 17:06:39 ******/

-- =======================================================================
-- Author:      <Vibhuti>
-- Create Date: <12.2.2021 >
-- Description: < Insert values into ProspectSize Table>
-- ========================================================================

SET IDENTITY_INSERT [dbo].[ProspectSize] ON 

INSERT [dbo].[ProspectSize] ([Id], [Size], [CreatedDateTime], [ModifiedDateTime], [CreatedBy], [ModifiedBy], [IsDeleted]) VALUES (1, N'Small', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[ProspectSize] ([Id], [Size], [CreatedDateTime], [ModifiedDateTime], [CreatedBy], [ModifiedBy], [IsDeleted]) VALUES (2, N'Medium', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[ProspectSize] ([Id], [Size], [CreatedDateTime], [ModifiedDateTime], [CreatedBy], [ModifiedBy], [IsDeleted]) VALUES (3, N'Large', NULL, NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[ProspectSize] OFF
GO
