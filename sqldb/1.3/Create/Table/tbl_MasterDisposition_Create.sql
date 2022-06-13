
CREATE TABLE [dbo].[MasterDisposition](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Disposition] [varchar](500) NOT NULL,
	[CreatedDateTime] [datetime] NULL,
	[CreatedBy] [varchar](100) NULL,
	[ModifiedDateTime] [datetime] NULL,
	[ModifiedBy] [varchar](100) NULL,
	[IsDeleted] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO