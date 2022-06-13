/****** Object:  Table [dbo].[ImportProspectsInfo]    Script Date: 27-05-2022 10:50:32 ******/
-- ============================================================
-- Author:      <Chandrashekhar>    
-- Create Date: <27-05-2022 >    
-- Description: <Temp Table For Duplicate Prospect Globaly Data>  


SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[ImportProspectsInfo](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ProspectId] [int] NULL,
	[ProspectName] [varchar](100) NULL,
	[ProspectNameFullName] [varchar](100) NOT NULL,
	[AddressLine1] [varchar](100) NULL,
	[AddressLine2] [varchar](100) NULL,
	[City] [varchar](100) NULL,
	[State] [varchar](100) NULL,
	[ZipCode] [varchar](100) NULL,
	[AddressType] [varchar](100) NULL,
	[Territory] [int] NULL,
	[PhoneNumber] [varchar](100) NULL,
	[EmailAddress] [varchar](100) NULL,
	[IsActive] [bit] NULL,
	[InActiveReasonId] [int] NULL,
	[Latitude] [varchar](100) NULL,
	[Longitude] [varchar](100) NULL,
	[PhoneExtension] [int] NULL,
	[Source] [varchar](100) NULL,
	[Info] [varchar](500) NULL,
	[Website] [varchar](500) NULL,
	[EIN] [varchar](100) NULL,
	[YearsInBusiness] [bigint] NULL,
	[NoOfEmployees] [bigint] NULL,
	[Revenue] [bigint] NULL,
	[NonProfit] [bit] NULL,
	[ProspectStatusId] [int] NULL,
	[IndustryId] [int] NULL,
	[ProspectSizeId] [int] NULL,
	[IsInsuranceInformationAdded] [bit] NULL,
	[EXPMOD] [decimal](3, 1) NULL,
	[PackageExpirationDate] [date] NULL,
	[PackageCarrier] [varchar](100) NULL,
	[PackagePremium] [bigint] NULL,
	[WorkersCompensationExpiration] [date] NULL,
	[WorkersCompensationCarrier] [varchar](100) NULL,
	[WorkersCompensationPremium] [bigint] NULL,
	[TagDescription] [varchar](100) NULL,
	[CreatedDateTime] [datetime] NULL,
	[ModifiedDateTime] [datetime] NULL,
	[CreatedBy] [varchar](100) NULL,
	[ModifiedBy] [varchar](100) NULL,
	[ErrorMessage] [varchar](max) NULL,
	[SourceFrom] [varchar](50) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO