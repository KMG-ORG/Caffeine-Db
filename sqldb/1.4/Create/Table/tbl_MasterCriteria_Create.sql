

CREATE TABLE [dbo].[MasterCriteria](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NULL,
	[Value] [varchar](25) NULL,
	[Operand] [nvarchar](500) NULL,
	[CreatedDateTime] [datetime] NULL,
	[CreatedBy] [varchar](100) NOT NULL,
	[ModifiedDateTime] [datetime] NOT NULL,
	[ModifiedBy] [varchar](100) NOT NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_MasterCriteria] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
