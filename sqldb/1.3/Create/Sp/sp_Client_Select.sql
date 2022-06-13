-- ===========================================================================================
-- Author:		<KMG>
-- Create date: <02.15.2021>
-- Description:	<Get all Clients details >
-- ============================================================================================
CREATE PROCEDURE [dbo].[sp_Client_Select] 
@RowCount int
AS 
BEGIN
SELECT TOP(@RowCount)
p.Id AS ProspectId ,p.ProspectName, p.City,p.[State],p.ZipCode,p.EmailAddress,p.PhoneNumber,p.AddressLine1,    
p.AddressLine2,p.IsActive,p.InActiveReasonId,p.Latitude,p.Longitude
FROM Prospects AS p    
LEFT JOIN  ProspectInformation AS pi ON p.Id =pi.ProspectId     
LEFT JOIN  ProspectStatus AS ps ON pi.ProspectStatusId =  ps.Id  
where (p.IsDeleted=0 or p.IsDeleted IS NULL) AND (ps.Status in ('Current Client','Existing Client'))
AND (p.IsActive = 1)
ORDER BY  p.Id DESC   
END



