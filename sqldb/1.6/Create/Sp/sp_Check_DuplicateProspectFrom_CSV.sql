/****** Object:  StoredProcedure [dbo].[sp_Check_DuplicateProspectFrom_CSV]    Script Date: 27-05-2022 11:07:17 ******/
-- ============================================================
-- Author:      <Chandrashekhar Rai>    
-- Create Date: <27-05-2022 >    
-- Description: <To Check Duplicate Prospect From Csv>    
-- ============================================================

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



CREATE PROCEDURE [dbo].[sp_Check_DuplicateProspectFrom_CSV]
(
@ImportProspects CheckDuplicateProspectsCsv READONLY  

 )AS  
BEGIN 
   Declare @Tbl as CheckDuplicateProspectsType;
	insert into @Tbl
	SELECT cast(ROW_NUMBER()over(ORDER BY(SELECT NULL)) as int),Cast(ProspectName as varchar(100)),Cast(City as varchar(100)),Cast(Email as varchar(500)),Cast(State as varchar(100)),Cast(ZipCode as varchar(100)),Cast(PhoneNumber as varchar(100)),'0' FROM @ImportProspects;
	execute [dbo].[sp_Prospect_CheckDuplicate] @Tbl,'Excel';

END
GO