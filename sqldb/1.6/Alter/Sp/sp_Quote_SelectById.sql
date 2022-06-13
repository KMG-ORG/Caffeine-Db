-- ===============================================================================================     
-- Author:  <SpectralTech>      
-- Create date: <05.09.2022>      
-- Description: <Get Quote>      
-- ========================================================================================    
ALTER PROCEDURE [dbo].[sp_Quote_SelectById]      
@ProspectId int      
AS      
SELECT Top 1    
p.Id AS ProspectId ,p.ProspectName, p.City,p.[State],p.ZipCode,p.EmailAddress,p.PhoneNumber,p.Source,
(c.FirstName +' '+c.LastName) AS ContactName
FROM Prospects AS p    
LEFT JOIN  Contacts AS c ON p.Id =c.ProspectId     
WHERE p.Id =@ProspectId AND(p.IsDeleted = 0 OR p.IsDeleted IS NULL)
ORDER BY p.Id DESC  