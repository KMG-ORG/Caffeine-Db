/****** Object:  Table [dbo].[ProspectStatus]    Script Date: 23-12-2021 17:06:39 ******/

-- =======================================================================
-- Author:      <Vibhuti>
-- Create Date: <12.2.2021 >
-- Description: < Update Insert values into ProspectStatus Table>
-- ========================================================================

DROP TABLE [dbo].[ProspectStatus]

CREATE TABLE [dbo].[ProspectStatus](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Status] [varchar](100) NOT NULL,
	[CreatedDateTime] [datetime] NULL,
	[ModifiedDateTime] [datetime] NULL,
	[CreatedBy] [varchar](100) NULL,
	[ModifiedBy] [varchar](100) NULL,
	[IsDeleted] [bit] NULL,
PRIMARY KEY CLUSTERED 
([Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

INSERT INTO [ProspectStatus]([Status],[CreatedDateTime],[ModifiedDateTime])
VALUES ('No', getdate(),getdate()),('Current Client',getdate(),getdate()),
('Existing Client',getdate(),getdate())








