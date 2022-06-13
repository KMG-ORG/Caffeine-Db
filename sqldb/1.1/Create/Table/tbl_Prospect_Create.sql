CREATE TABLE [dbo].[Prospects](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ProspectName] [varchar](100) NOT NULL,
	[AddressLine1] [varchar](100) NULL,
	[AddressLine2] [varchar](100) NULL,
	[City] [varchar](100) NOT NULL,
	[State] [varchar](100) NOT NULL,
	[ZipCode] [varchar](100) NOT NULL,
	[AddressType] [varchar](100) NULL,
	[Territory] [int] NULL,
	[CreatedDateTime] [datetime] NULL,
	[ModifiedDateTime] [datetime] NULL,
	[CreatedBy] [varchar](100) NULL,
	[ModifiedBy] [varchar](100) NULL,
	[IsDeleted] [bit] NULL,
	[PhoneNumber] [varchar](100) NULL,
	[EmailAddress] [varchar](100) NULL,
	[IsActive] [bit] NULL,
	[InActiveReasonId] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO