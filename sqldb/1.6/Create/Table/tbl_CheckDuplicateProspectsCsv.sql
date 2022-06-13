/****** Object:  UserDefinedTableType [dbo].[CheckDuplicateProspectsCsv]    Script Date: 27-05-2022 10:43:39 ******/
-- ============================================================
-- Author:      <Chandrashekhar>    
-- Create Date: <27-05-2022 >    
-- Description: <Table Type For Duplicate Csv Data>    
-- ============================================================
CREATE TYPE [dbo].[CheckDuplicateProspectsCsv] AS TABLE(
	[ProspectName] [varchar](100) NULL,
	[City] [varchar](100) NULL,
	[State] [varchar](100) NULL,
	[ZipCode] [varchar](100) NULL,
	[PhoneNumber] [varchar](100) NULL,
	[Email] [varchar](100) NULL
)