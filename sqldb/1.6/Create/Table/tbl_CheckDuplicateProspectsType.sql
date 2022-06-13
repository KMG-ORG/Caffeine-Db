/****** Object:  UserDefinedTableType [dbo].[CheckDuplicateProspectsType]    Script Date: 27-05-2022 10:46:38 ******/
-- ============================================================
-- Author:      <Chandrashekhar>    
-- Create Date: <27-05-2022 >    
-- Description: <Table Type For Duplicate Prospect Globaly Data>    
CREATE TYPE [dbo].[CheckDuplicateProspectsType] AS TABLE(
	[Id] [int] NOT NULL,
	[ProspectName] [varchar](100) NULL,
	[City] [varchar](100) NULL,
	[Email] [varchar](500) NULL,
	[State] [varchar](100) NULL,
	[ZipCode] [varchar](100) NULL,
	[PhoneNumber] [varchar](100) NULL,
	[EIN] [varchar](100) NULL
)