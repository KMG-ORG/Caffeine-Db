 -- ===========================================================================================
-- Author:		<Vibhuti>
-- Create date: <04.05.2021>
-- Description:	<Get all contact details with pagination>
-- MODS : Added TotalRecords (26th April 2022)
-- =========================================================================================
ALTER PROCEDURE [dbo].[sp_Contact_SelectWithPagination]
@PageNumber int,
@PageSize int
AS
BEGIN
  SELECT c.Id, c.ProspectId,p.ProspectName ,c.JobTitle,c.Office1Email,c.Office1AddressLine1,
	Office1AddressLine2,c.Office1City,c.Office1State,c.Office1ZipCode,c.Office1Extension,
	c.Office1PhoneNumber,c.IsPrimary,c.IsAddressSameAsProspect,c.IsNpsNominated,
	(c.FirstName +' '+c.LastName) AS FullName,c.FirstName, c.LastName,
	c.CreatedBy,c.CreatedDateTime,c.ModifiedBy,c.ModifiedDateTime,c.IsActive,
	(Select Count(Id) From Contacts where IsActive =1) AS TotalRecords
	FROM Contacts AS c  
	INNER JOIN Prospects as p on c.ProspectId = p.Id
	WHERE(c.IsDeleted=0 OR c.IsDeleted IS NULL) AND (c.IsActive =1)
	ORDER BY c.ModifiedDateTime Desc  
	OFFSET (@PageNumber -1)* @PageSize ROWS
	FETCH NEXT @PageSize ROWS ONLY 
END