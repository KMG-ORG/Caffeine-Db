CREATE TABLE [dbo].[TodoItems](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ListId] [int] NULL,
	[Title] [nvarchar](200) NULL,
	[Note] [nvarchar](max) NULL,
	[Priority] [int] NULL,
	[Reminder] [datetime2](7) NULL,
	[Done] [bit] NOT NULL,
	[Created] [datetime2](7) NOT NULL,
	[CreatedBy] [nvarchar](max) NOT NULL,
	[LastModified] [datetime2](7) NULL,
	[LastModifiedBy] [nvarchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

ALTER TABLE [dbo].[TodoItems]  WITH CHECK ADD  CONSTRAINT [FK_TodoItems] FOREIGN KEY([ListId])
REFERENCES [dbo].[TodoLists] ([Id])
GO
