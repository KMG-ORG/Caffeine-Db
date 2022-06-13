 
-- =============================================
CREATE PROCEDURE [dbo].[sp_Contact_SelectById]
 @ProspectId int
AS
BEGIN
	SELECT c.ProspectId,c.FirstName,c.LastName,c.IsPrimary,c.Office1Email,c.Office1PhoneNumber,c.Office1Email, 
	c.JobTitle from Contacts AS c

    WHERE c.ProspectId=@ProspectId AND c.IsDeleted IS NULL OR c.IsDeleted = 0
END