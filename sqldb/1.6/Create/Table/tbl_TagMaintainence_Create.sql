CREATE TABLE [dbo].[TagMaintainence](
	[Id] [int] PRIMARY KEY IDENTITY (1,1) NOT NULL,
	[EntityId] [int] FOREIGN KEY REFERENCES TagEntity([Id]) NOT NULL,
	[ParentTagId] [int] NULL,
	[TagDescription] [varchar](100) NULL,
	[CreatedDateTime] [datetime] NULL,
	[ModifiedDateTime] [datetime] NULL,
	[CreatedBy] [varchar](30) NULL,
	[ModifiedBy] [varchar](30) NULL,
	[IsDeleted] [bit] NULL
	)