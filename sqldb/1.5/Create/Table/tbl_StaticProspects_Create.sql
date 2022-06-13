

CREATE TABLE [dbo].[StaticProspects](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ProspectIds] [varchar](max) NOT NULL,
	[ListId] [int] NULL,
	[CreatedDateTime] [datetime] NOT NULL,
	[CreatedBy] [varchar](100) NOT NULL,
	[ModifiedDateTime] [datetime] NOT NULL,
	[ModifiedBy] [varchar](100) NOT NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_StaticProspects] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
