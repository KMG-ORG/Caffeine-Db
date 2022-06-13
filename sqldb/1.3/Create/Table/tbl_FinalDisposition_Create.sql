/****** Object:  Table [dbo].[FinalDisposition]    Script Date: 23-02-2022 20:34:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FinalDisposition](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[DispositionId] [int] NOT NULL,
	[ProspectId] [int] NOT NULL,
	[NoOfAttempt] [int] NULL,
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
