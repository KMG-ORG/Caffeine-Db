/****** Object:  Table [dbo].[ProspectInformation]    Script Date: 18-01-2022 10:30:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ===========================================================================
-- Author:      <Vibhuti>
-- Create Date: <18.12.2021 >
-- Description: <Alter Datatype of EXPMOD in ProspectInformation Table>
-- Mods : Altered 1.Changed EXPMOD range from (18,0) to (3,1)
-- ============================================================================

ALTER TABLE ProspectInformation
ALTER COLUMN [EXPMOD] [decimal](2,1) NULL;