 
-- =============================================
CREATE PROCEDURE [dbo].[sp_Contact_SelectByContactId]
 @Id int,
 @ProspectId int
AS
BEGIN
	SELECT c.Id,c.Office1PhoneNumber,c.Office1Email,c.JobTitle,c.IsPrimary,c.FirstName,c.LastName,c.ProspectId 
	From Contacts as c WHERE c.Id=@Id AND c.ProspectId = @ProspectId
END