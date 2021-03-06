 
-- =============================================
CREATE PROCEDURE [dbo].[sp_Contact_SelectNew]
 @Id int
AS
BEGIN
	SELECT c.Id, c.ProspectId,p.ProspectName ,c.JobTitle,c.Office1Email,c.Office1AddressLine1,
	Office1AddressLine2,c.Office1City,c.Office1State,c.Office1ZipCode,c.Office1Extension,
	c.Office1PhoneNumber,c.IsPrimary,c.IsAddressSameAsProspect,c.IsNpsNominated,
	(c.FirstName +' '+c.LastName) as FullName  
	From Contacts as c   
	LEFT JOIN Prospects as p on c.ProspectId = p.Id WHERE c.Id=@Id
END