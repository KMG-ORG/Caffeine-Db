﻿CREATE TABLE [dbo].[ParentTag](
	[Id] [int] IDENTITY(1,1) PRIMARY KEY NOT NULL,
	[ParentTagName] [varchar](100) NOT NULL,
	[CreatedDateTime] [datetime] NOT NULL,
	[ModifiedDateTime] [datetime] NOT NULL,
	[CreatedBy] [varchar](100) NOT NULL,
	[ModifiedBy] [varchar](100) NOT NULL,
	[IsDeleted] [bit] NULL
	)



