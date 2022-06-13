-- ===============================================================================================     
-- Author:  <Spectraltech>      
-- Create date: <11.09.2021>      
-- Description: <Get Quote>      
-- ========================================================================================    
CREATE PROCEDURE [dbo].[sp_Quote_SelectById]      
	@ProspectId int      
AS    
BEGIN
	SELECT Top 1    
	p.Id AS ProspectId ,p.ProspectName, p.City,p.[State],p.ZipCode,p.EmailAddress,p.PhoneNumber,
	(c.FirstName +' '+c.LastName) AS ContactName
	FROM Prospects AS p    
	LEFT JOIN  Contacts AS c ON p.Id =c.ProspectId     
	WHERE p.Id =@ProspectId AND(p.IsDeleted = 0 OR p.IsDeleted IS NULL)
	ORDER BY p.Id DESC  
END