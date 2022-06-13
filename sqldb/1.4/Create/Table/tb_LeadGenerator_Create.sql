CREATE TABLE [dbo].[LeadGenerator](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Value] [varchar](100) NULL,
	[CreatedDateTime] [datetime]Not NULL,
	[ModifiedDateTime] [datetime] Not NULL,
	[CreatedBy] [varchar](100) Not NULL,
	[ModifiedBy] [varchar](100) Not NULL,
	[IsDeleted] [bit] Not NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) 
ON [PRIMARY]
GO