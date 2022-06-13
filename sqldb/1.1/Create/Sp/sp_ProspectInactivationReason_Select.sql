/****** Object:  StoredProcedure [dbo].[sp_ProspectInactivationReason_Select]    Script Date: 31-12-2021 17:04:04 ******/

-- =====================================================
-- Author:		<Chandmal>
-- Create date: <10.25.2021>
-- Description:	<Get prospect Status List>
-- ======================================================
CREATE PROCEDURE [dbo].[sp_ProspectInactivationReason_Select]
AS
SELECT Id,ProspectInactivationReason FROM ProspectInactivationReason 
WHERE (IsDeleted=0 OR IsDeleted IS NULL)
GO


