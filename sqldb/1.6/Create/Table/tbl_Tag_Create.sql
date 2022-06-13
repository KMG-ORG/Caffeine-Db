CREATE TABLE [dbo].[Tag](
	[Id] [int] IDENTITY(1,1) PRIMARY KEY NOT NULL,
	[Name] [varchar](100) NULL,
	[AssociatedBusinessObjectName] [varchar](100) NULL FOREIGN KEY([AssociatedBusinessObjectName])REFERENCES [dbo].[BusinessObject] ([BusinessObjectName]),
	[SelfReferenceParentId] [int] NULL,
	[CreatedBy] [varchar](100) NOT NULL,
	[CreatedDateTime] [datetime] NOT NULL,
	[ModifiedBy] [varchar](100) NOT NULL,
	[ModifiedDateTime] [datetime] NOT NULL,
	[IsDeleted] [bit] NULL
	)