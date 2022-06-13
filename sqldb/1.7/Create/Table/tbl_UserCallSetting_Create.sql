




CREATE TABLE [dbo].[UserCallSetting](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[IsCallOut] [bit] NULL,
	[DeviceId] [varchar](200) NULL,
	[UserId] [int] NULL,
	[CreatedDateTime] [datetime] NOT NULL,
	[ModifiedDateTime] [datetime] NOT NULL,
	[CreatedBy] [varchar](30) NOT NULL,
	[ModifiedBy] [varchar](30) NOT NULL,
	[IsDeleted] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[UserCallSetting]  WITH CHECK ADD  CONSTRAINT [FK_Users] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([Id])
GO

ALTER TABLE [dbo].[UserCallSetting] CHECK CONSTRAINT [FK_Users]
GO

