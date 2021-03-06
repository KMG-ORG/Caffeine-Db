/****** Object:  StoredProcedure [dbo].[sp_Contact_Select]    Script Date: 23-01-2022 10:44:51 ******/

-- ===================================================================
-- Author:		<Vibhuti>
-- Create date: <12.08.2021>
-- Description:	<Get all contact details>
-- MODS : i)Added FirstName, LastName and full name
-- ====================================================================
ALTER PROCEDURE [dbo].[sp_Contact_Select]
AS
BEGIN
  SELECT c.Id, c.ProspectId,p.ProspectName ,c.JobTitle,c.Office1Email,c.Office1AddressLine1,
	Office1AddressLine2,c.Office1City,c.Office1State,c.Office1ZipCode,c.Office1Extension,
	c.Office1PhoneNumber,c.IsPrimary,c.IsAddressSameAsProspect,c.IsNpsNominated,
	(c.FirstName +' '+c.LastName) AS FullName,c.FirstName, c.LastName 
	FROM Contacts AS c   
	INNER JOIN Prospects AS p ON c.ProspectId = p.Id 
	AND  (c.IsDeleted=0 OR c.IsDeleted IS NULL)
END