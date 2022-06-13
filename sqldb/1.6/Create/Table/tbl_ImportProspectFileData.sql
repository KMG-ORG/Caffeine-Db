/****** Object:  Table [dbo].[ImportProspectFileData]    Script Date: 27-05-2022 10:57:34 ******/

-- ============================================================
-- Author:      <Chandrashekhar>    
-- Create Date: <27-05-2022 >    
-- Description: <Table For Insert Import Prospect File Status>  

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[ImportProspectFileData](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FileId] [varchar](50) NOT NULL,
	[FileDisplayName] [varchar](100) NULL,
	[FilePath] [varchar](500) NULL,
	[FileExtension] [varchar](50) NULL,
	[Status] [varchar](50) NULL,
	[Createdby] [int] NULL,
	[CreatedDate] [date] NULL,
	[TotalRecord] [int] NULL,
 CONSTRAINT [PK_ImportProspectFileData] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[ImportProspectFileData] ADD  DEFAULT (getdate()) FOR [CreatedDate]