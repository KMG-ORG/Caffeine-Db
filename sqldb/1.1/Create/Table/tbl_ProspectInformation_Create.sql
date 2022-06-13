

CREATE TABLE [dbo].[ProspectInformation](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ProspectId] [int] NULL,
	[EIN] [int] NULL,
	[YearsInBusiness] [bigint] NULL,
	[NoOfEmployees] [bigint] NULL,
	[Revenue] [bigint] NULL,
	[NonProfit] [bit] NULL,
	[ProspectStatusId] [int] NULL,
	[IndustryId] [int] NULL,
	[ProspectSizeId] [int] NULL,
	[IsInsuranceInformationAdded] [bit] NULL,
	[EXPMOD] [decimal](18, 0) NULL,
	[PackageExpirationDate] [date] NULL,
	[PackageCarrier] [varchar](100) NULL,
	[PackagePremium] [bigint] NULL,
	[WorkersCompensationExpiration] [date] NULL,
	[WorkersCompensationCarrier] [varchar](100) NULL,
	[WorkersCompensationPremium] [bigint] NULL,
	[CreatedDateTime] [datetime] NULL,
	[ModifiedDateTime] [datetime] NULL,
	[CreatedBy] [varchar](100) NULL,
	[ModifiedBy] [varchar](100) NULL,
	[IsDeleted] [bit] NULL,
 CONSTRAINT [PK__Prospect__3214EC073AE3E919] PRIMARY KEY CLUSTERED 
(


	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[ProspectInformation]  WITH CHECK ADD  CONSTRAINT [FK__ProspectI__Prosp__01142BA1] FOREIGN KEY([ProspectId])
REFERENCES [dbo].[Prospects] ([Id])
GO

ALTER TABLE [dbo].[ProspectInformation] CHECK CONSTRAINT [FK__ProspectI__Prosp__01142BA1]
GO
