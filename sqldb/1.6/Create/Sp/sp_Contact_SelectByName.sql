-- ===========================================================================================
-- Author:		<Vibhuti>
-- Create date: <05.01.2021>
-- Description:	<Get all contact details for a prospect by FullName>
-- =========================================================================================
CREATE procedure [dbo].[sp_Contact_SelectByName]
	@Name varchar(100),
	@ProspectId int
AS    
BEGIN    
    SELECT c.Id, c.ProspectId,c.JobTitle,c.Office1Email,c.Office1AddressLine1,
	Office1AddressLine2,c.Office1City,c.Office1State,c.Office1ZipCode,c.Office1Extension,
	c.Office1PhoneNumber,c.IsPrimary,c.IsAddressSameAsProspect,c.IsNpsNominated,
	(c.FirstName +' '+c.LastName) AS FullName,c.FirstName, c.LastName,
	c.CreatedBy,c.CreatedDateTime,c.ModifiedBy,c.ModifiedDateTime,c.IsActive, p.ProspectName
	FROM Contacts AS c   
	INNER JOIN Prospects AS p ON c.ProspectId= p.Id
	WHERE (c.IsDeleted=0 OR c.IsDeleted IS NULL) AND (c.IsActive =1) AND (c.ProspectId = @ProspectId) AND
	(c.FirstName  LIKE '%' + @Name + '%'  )
	ORDER BY c.ModifiedDateTime Desc 
END  
    

