

CREATE TABLE [dbo].[RingoutLogActivity](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[DialNumber] [varchar](20) NULL,
	[LogStatus] [varchar](500) NULL,
	[Action] [varchar](100) NULL,
	[Result] [varchar](100) NULL,
	[CallDuration] [time](7) NULL,
	[CreatedDateTime] [datetime] NOT NULL,
	[ModifiedDateTime] [datetime] NOT NULL,
	[CreatedBy] [varchar](100) NOT NULL,
	[ModifiedBy] [varchar](100) NOT NULL,
	[IsDeleted] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
