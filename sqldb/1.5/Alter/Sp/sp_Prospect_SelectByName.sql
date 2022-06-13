ALTER procedure [dbo].[sp_Prospect_SelectByName]    
@ProspectName varchar(100)    
AS    
BEGIN    
SELECT p.Id, p.ProspectName,p.City,p.[State], p.ZipCode , p.AddressLine1,p.AddressLine2,pi.EIN,    
p.PhoneNumber,p.PhoneExtension,p.EmailAddress ,P.Info,P.Website   
FROM  Prospects AS p     
LEFT JOIN ProspectInformation pi ON pi.ProspectId=p.Id    
WHERE  p.ProspectName LIKE '%' + @ProspectName + '%'    
END