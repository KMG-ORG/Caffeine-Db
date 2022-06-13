-- ===================================================================  
-- Author:  <Vibhuti>  
-- Create date: <12.08.2021>  
-- Description: <Get all contact details>  
-- MODS : 1)Added FirstName, LastName and full name  
--        2) Added Feilds : i) Created by          iii)Modified by  
--                          ii)Created on          iv) Modified On  
--        3) Added Rows Count  
--        4) Added IsActive field (17th March 2022)  
--        5) Added ContactCountForAProspect Field (24th March 2022)
--        6) Added TotalRecords (26th April 2022)
--        7) Changed Total recoreds query (23rd May 2022)
-- ====================================================================  
ALTER PROCEDURE [dbo].[sp_Contact_Select]  
    @RowCount int  
AS  
BEGIN  
	SELECT TOP (@RowCount)  
	c.Id, c.ProspectId,p.ProspectName ,c.JobTitle,c.Office1Email,c.Office1AddressLine1,  
	Office1AddressLine2,c.Office1City,c.Office1State,c.Office1ZipCode,c.Office1Extension,  
	c.Office1PhoneNumber,c.IsPrimary,c.IsAddressSameAsProspect,c.IsNpsNominated,  
	(c.FirstName +' '+c.LastName) AS FullName,c.FirstName, c.LastName ,c.IsActive,  
	c.CreatedBy,c.CreatedDateTime,c.ModifiedBy,c.ModifiedDateTime,  
	([dbo].[udf_ProspectContact_Count](C.ProspectId))  AS ProspectContactCount,
	COUNT(*) OVER() AS TotalRecords
	FROM Contacts AS c     
	INNER JOIN Prospects AS p ON c.ProspectId = p.Id   
	AND  (c.IsDeleted=0 OR c.IsDeleted IS NULL) AND (c.IsActive =1)  
	ORDER BY  c.ModifiedDateTime Desc   
END