

CREATE TABLE [dbo].[MasterFields](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FieldName] [varchar](100) NULL,
	[FieldCode] [varchar](50) NULL,
	[FieldCoumnName] [varchar](100) NULL,
	[FieldTableName] [varchar](100) NOT NULL,
	[FilterType] [varchar](50) NOT NULL,
	[CriteriaType] [varchar](25) NOT NULL,
	[ValueType] [varchar](50) NOT NULL,
	[ValueTable] [varchar](100) NOT NULL,
	[CreatedDateTime] [datetime] NOT NULL,
	[CreatedBy] [varchar](100) NOT NULL,
	[ModifiedDateTime] [datetime] NOT NULL,
	[ModifiedBy] [varchar](100) NOT NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK____MasterFields___3214EC075E280706] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO