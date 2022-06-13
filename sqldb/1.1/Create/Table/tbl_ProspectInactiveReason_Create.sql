CREATE TABLE [dbo].[ProspectInactivationReason](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ProspectInactivationReason] [varchar](100) NULL,
	[CreatedDateTime] [datetime] NULL,
	[ModifiedDateTime] [datetime] NULL,
	[CreatedBy] [varchar](30) NULL,
	[ModifiedBy] [varchar](30) NULL,
	[IsDeleted] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]