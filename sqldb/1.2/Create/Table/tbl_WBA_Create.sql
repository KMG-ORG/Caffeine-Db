/****** Object:  Table [dbo].[WBA]    Script Date: 23-01-2022 12:56:53 ******/

-- =============================================
-- Author:      <Vibhuti>
-- Create Date: <3.01.2022>
-- Description: <Create WBA table>
-- =============================================

CREATE TABLE [dbo].[WBA](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ProspectId] [int] NOT NULL,
	[EIN] [int] NULL,
	[BusinessStatusId] [int] NOT NULL,
	[BusinessLineId] [int] NOT NULL,
	[UserId] [int] NOT NULL,
	[EffectiveDate] [datetime] NULL,
	[BoundRevenue] [bigint] NULL,
	[CreatedDateTime] [datetime] NULL,
	[ModifiedDateTime] [datetime] NULL,
	[CreatedBy] [varchar](100) NULL,
	[ModifiedBy] [varchar](100) NULL,
	[IsDeleted] [bit] NULL)


