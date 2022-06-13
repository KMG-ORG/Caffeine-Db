Drop table AuditLog
GO
CREATE TABLE [dbo].[AuditLog](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[TableName] [varchar](100) NULL,
	[Username] [varchar](100) NULL,
	[ActionType] [char](1) NULL,
	[AuditJson] [varchar](max) NULL,
	[NewValue] [xml] NULL,
	[Oldvalue] [xml] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO