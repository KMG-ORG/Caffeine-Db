CREATE PROCEDURE [dbo].[sp_Prospect_SelectByFilter]    
 @SelectQuery [nvarchar](max)    
AS      
 BEGIN   
  DECLARE @SQL NVARCHAR(Max) = 'SELECT         
   p.Id AS ProspectId ,p.ProspectName, p.City,p.[State],p.ZipCode,p.EmailAddress,p.PhoneNumber,p.PhoneExtension,p.AddressLine1,            
   p.AddressLine2,p.IsActive,p.InActiveReasonId,          
   pi.Id AS ProspectInformationId, pi.EIN,pi.YearsInBusiness,pi.NoOfEmployees,pi.Revenue,pi.NonProfit,        
   pi.ProspectStatusId,ps.[Status],            
   pi.IndustryId,pid.IndustryName,        
   pi.ProspectSizeId,psz.Size,        
   pi.IsInsuranceInformationAdded,pi.EXPMOD,pi.PackageExpirationDate,            
   pi.PackageCarrier,pi.PackagePremium,pi.WorkersCompensationExpiration,pi.WorkersCompensationCarrier,            
   pi.WorkersCompensationPremium           
   FROM Prospects AS p            
   LEFT JOIN  ProspectInformation AS pi ON p.Id =pi.ProspectId             
   LEFT JOIN  ProspectStatus AS ps ON pi.ProspectStatusId =  ps.Id          
   LEFT JOIN  ProspectSize AS psz  ON pi.ProspectSizeId = psz.Id        
   LEFT JOIN  ProspectIndustry AS pid ON pi.IndustryId = pid.Id Where'+ @SelectQuery  
   EXEC sp_executesql @SQL  
END  
-----------------------------------------------------------------------------------------------------------------------------