CREATE TABLE [dbo].[CustomField](
	[Id] [int] IDENTITY(1,1) PRIMARY KEY NOT NULL,
	[DialId] [int] FOREIGN KEY REFERENCES [dbo].[Dials] ([Id]) NOT NULL,
	[Type] [varchar](100) NULL,
	[FieldName] [varchar](100) NULL,
	[FieldValue] [varchar](100) NULL,
	[CreatedDateTime] [datetime] NOT NULL,
	[ModifiedDateTime] [datetime] NOT NULL,
	[CreatedBy] [varchar](100) NOT NULL,
	[ModifiedBy] [varchar](100) NOT NULL,
	[IsDeleted] [bit] NOT NULL)


