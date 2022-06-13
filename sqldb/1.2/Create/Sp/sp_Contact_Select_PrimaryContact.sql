/****** Object:  StoredProcedure [dbo].[sp_Contact_Select_PrimaryContact]    Script Date: 28-01-2022 13:29:28 ******/

-- ===================================================================
-- Author:		<Vibhuti>
-- Create date: <12.08.2021>
-- Description:	<Get Prospects Primary Contact>
-- ====================================================================
CREATE PROCEDURE [dbo].[sp_Contact_Select_PrimaryContact] 
 @ProspectId int
AS
BEGIN
  SELECT c.Id, c.ProspectId,p.ProspectName ,c.JobTitle,c.Office1Email,c.Office1AddressLine1,
	Office1AddressLine2,c.Office1City,c.Office1State,c.Office1ZipCode,c.Office1Extension,
	c.Office1PhoneNumber,c.IsPrimary,c.IsAddressSameAsProspect,c.IsNpsNominated,
	c.FirstName, c.LastName , CONCAT(FIRSTNAME, ' ', LASTNAME) AS FullName
	FROM Contacts AS c   
	INNER JOIN Prospects AS p ON c.ProspectId = p.Id WHERE c.ProspectId = @ProspectId
	AND  (c.IsDeleted=0 OR c.IsDeleted IS NULL) AND (c.IsPrimary =1)
END