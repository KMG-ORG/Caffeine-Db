/****** Object:  StoredProcedure [dbo].[sp_Prospect_SelectByName]    Script Date: 31-12-2021 17:03:39 ******/

-- ===============================================================================================
-- Author:		<Vibhuti>
-- Create date: <12.6.2021>
-- Description:	<Select Prospect By Name>
-- ==========================================================================================
CREATE procedure [dbo].[sp_Prospect_SelectByName]
(
@ProspectName varchar(100)
)
AS
SELECT p.Id, p.ProspectName,p.City,p.[State], p.ZipCode , p.AddressLine1,p.AddressLine2 
FROM  Prospects AS p 
WHERE  p.ProspectName LIKE '%' + @ProspectName + '%'
GO


