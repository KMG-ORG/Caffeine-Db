 -- ===========================================================================================
-- Author:		<Vibhuti>
-- Create date: <12.08.2021>
-- Description:	<Get all contact details for a prospect by its Id>
-- MODS : 1) Added Feilds : i)Office1AddressLine1             vi)Office1ZipCode
--                          ii)Office1AddressLine2            vii)Office1Extension
--                          iii)Office1City                   viii)IsAddressSameAsProspect
--                          iv)Office1State                   ix)IsNpsNominated
--                          v)FullName
--        2) Renamed Id as ContactId
--        3) Added Feilds : i) Created by          iii)Modified by
--                          ii)Created on          iv) Modified On
--        4) Added IsActive field(17th March 2022)
-- =========================================================================================
ALTER PROCEDURE [dbo].[sp_Contact_SelectByProspectId]
 @ProspectId int
AS
BEGIN
  SELECT c.Id, c.ProspectId,p.ProspectName ,c.JobTitle,c.Office1Email,c.Office1AddressLine1,
	Office1AddressLine2,c.Office1City,c.Office1State,c.Office1ZipCode,c.Office1Extension,
	c.Office1PhoneNumber,c.IsPrimary,c.IsAddressSameAsProspect,c.IsNpsNominated,
	(c.FirstName +' '+c.LastName) AS FullName,c.FirstName, c.LastName,
	c.CreatedBy,c.CreatedDateTime,c.ModifiedBy,c.ModifiedDateTime,c.IsActive 
	FROM Contacts AS c   
	INNER JOIN Prospects AS p ON c.ProspectId = p.Id WHERE c.ProspectId = @ProspectId
	AND  (c.IsDeleted=0 OR c.IsDeleted IS NULL) AND (c.IsActive =1)
	ORDER BY c.ModifiedDateTime Desc  
END