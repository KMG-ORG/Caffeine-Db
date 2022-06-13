/****** Object:  StoredProcedure [dbo].[sp_Reason_Select]    Script Date: 23-01-2022 12:23:23 ******/

-- =========================================================
-- Author:      <Chandmal>
-- Create Date: <12.12.2021 >
-- Description: <Selects Prospect Inactivation Reason>
-- =========================================================
CREATE PROCEDURE [dbo].[sp_Reason_Select]
AS
BEGIN
SELECT Id,ProspectInactivationReason FROM ProspectInactivationReason 
WHERE (IsDeleted=0 OR IsDeleted IS NULL)
END