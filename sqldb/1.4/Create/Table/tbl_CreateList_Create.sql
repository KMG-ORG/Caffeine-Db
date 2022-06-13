

CREATE TABLE [dbo].[CreateList](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[TypeOfList] [varchar](20) NOT NULL,
	[ExpirationDate] [datetime] NULL,
	[IsNewList] [bit] NOT NULL,
	[ListName] [varchar](100) NOT NULL,
	[CreateListJSON] [nvarchar](max) NOT NULL,
	[FilterQuery] [nvarchar](max) NULL,
	[CreatedDateTime] [datetime] NOT NULL,
	[CreatedBy] [varchar](100) NOT NULL,
	[ModifiedDateTime] [datetime] NOT NULL,
	[ModifiedBy] [varchar](100) NOT NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK__CreateList__3214EC075E280706] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
