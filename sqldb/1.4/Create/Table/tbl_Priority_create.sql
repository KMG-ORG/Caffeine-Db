CREATE TABLE [dbo].[Priority](
	[Id] [int] IDENTITY(1,1) Primary Key NOT NULL,
	[Value] [varchar](100) NOT NULL,
	[CreatedDateTime] [datetime] NULL,
	[CreatedBy] [varchar](100) NULL,
	[ModifiedDateTime] [datetime] NULL,
	[ModifiedBy] [varchar](100) NULL,
	[IsDeleted] [bit] NULL
)

