 
CREATE PROCEDURE [dbo].[sp_Contact_Select]
AS
BEGIN
SELECT 
	c.Id, c.ProspectId,c.FirstName,c.LastName,c.JobTitle,c.Office1Email,c.Office1AddressLine1,
	Office1AddressLine2,c.Office1City,c.Office1State,c.Office1ZipCode,c.Office1Extension,
	c.Office1PhoneNumber,c.IsPrimary,c.IsAddressSameAsProspect,c.IsNpsNominated 
	from Contacts AS c
	WHERE c.IsDeleted IS NULL OR c.IsDeleted = 0
	
END