-- =====================================================================================
-- Author:		<Vibhuti>
-- Create date: <12.09.2021>
-- Description:	<Get Contact Details For a Prospect by its ProspectId and ContactId>
-- MODS : 1) Added Feilds : i)Office1AddressLine1             vi)Office1ZipCode
--                          ii)Office1AddressLine2            vii)Office1Extension
--                          iii)Office1City                   viii)IsAddressSameAsProspect
--                          iv)Office1State                   ix)IsNpsNominated
--                          v)FullName
--        2) Renamed Id as ContactId
--        3) Added IsActive field (17th March 2022)
-- ====================================================================================
ALTER PROCEDURE [dbo].[sp_Contact_SelectByContactId] 
 @ContactId int,
 @ProspectId int
AS
BEGIN
   SELECT c.Id, c.ProspectId,p.ProspectName ,c.JobTitle,c.Office1Email,c.Office1AddressLine1,
	c.Office1AddressLine2,c.Office1City,c.Office1State,c.Office1ZipCode,c.Office1Extension,
	c.Office1PhoneNumber,c.IsPrimary,c.IsAddressSameAsProspect,c.IsNpsNominated,
	(c.FirstName +' '+c.LastName) AS FullName, c.FirstName, c.LastName, c.IsActive
	FROM Contacts AS c   
	INNER JOIN Prospects AS p ON c.ProspectId = p.Id WHERE c.Id=@ContactId AND c.ProspectId = @ProspectId 
	AND (c.IsDeleted=0 OR c.IsDeleted IS NULL) AND (c.IsActive =1)
END