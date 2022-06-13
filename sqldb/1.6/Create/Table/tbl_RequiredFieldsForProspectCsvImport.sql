/****** Object:  Table [dbo].[RequiredFieldsForProspectCsvImport]    Script Date: 27-05-2022 10:53:08 ******/
-- ============================================================
-- Author:      <Chandrashekhar>    
-- Create Date: <27-05-2022 >    
-- Description: <Table For Required Fields For Import Prospect>   

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[RequiredFieldsForProspectCsvImport](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[DisplayName] [varchar](50) NOT NULL,
	[ColumnDataType] [varchar](50) NULL,
	[SortOrder] [int] NULL,
	[IsRequired] [int] NULL,
	[Pattern] [varchar](100) NULL,
	[ColumnName] [varchar](50) NULL,
 CONSTRAINT [PK_prospectFields] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]