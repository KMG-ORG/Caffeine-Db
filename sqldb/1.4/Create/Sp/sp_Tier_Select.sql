
CREATE PROCEDURE [dbo].[sp_Tier_Select]  
AS  
BEGIN  
 SELECT Id, Tier FROM ProspectTier   
 WHERE (IsDeleted=0 OR IsDeleted IS NULL)  ORDER BY Tier
END  