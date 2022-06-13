CREATE TABLE [dbo].[MappingFieldCriteria](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FieldId] [int] NOT NULL,
	[CriteriaId] [int] NOT NULL,
	[CreatedDateTime] [datetime] NOT NULL,
	[CreatedBy] [varchar](200) NOT NULL,
	[ModifiedDateTime] [datetime] NOT NULL,
	[ModifiedBy] [varchar](200) NOT NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_MappingFieldCriteria] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[MappingFieldCriteria]  WITH CHECK ADD  CONSTRAINT [FK_MappingFieldCriteria_MappingFieldCriteria] FOREIGN KEY([FieldId])
REFERENCES [dbo].[MasterFields] ([Id])
GO

ALTER TABLE [dbo].[MappingFieldCriteria] CHECK CONSTRAINT [FK_MappingFieldCriteria_MappingFieldCriteria]
GO

ALTER TABLE [dbo].[MappingFieldCriteria]  WITH CHECK ADD  CONSTRAINT [FK_MappingFieldCriteria_MasterCriteria] FOREIGN KEY([CriteriaId])
REFERENCES [dbo].[MasterCriteria] ([Id])
GO

ALTER TABLE [dbo].[MappingFieldCriteria] CHECK CONSTRAINT [FK_MappingFieldCriteria_MasterCriteria]
GO

