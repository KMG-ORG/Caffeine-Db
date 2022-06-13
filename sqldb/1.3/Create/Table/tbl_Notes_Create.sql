CREATE TABLE [dbo].[Notes](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ProspectId] [int] NOT NULL,
	[DispositionId] [int] NULL,
	[Description] [varchar](500) NULL,
	[RecordDate] [datetime] NULL,
	[CreatedDateTime] [datetime] NULL,
	[CreatedBy] [varchar](100) NULL,
	[ModifiedDateTime] [datetime] NULL,
	[ModifiedBy] [varchar](100) NULL,
	[IsDeleted] [bit] NULL,
 CONSTRAINT [PK__Notes__3214EC075E280706] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
