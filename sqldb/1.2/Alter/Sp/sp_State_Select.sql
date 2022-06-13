

ALTER PROCEDURE [dbo].[sp_State_Select]  
AS  
BEGIN  
 SELECT StateCode,StateName FROM States WHERE IsDeleted=0 OR IsDeleted IS NULL  
 ORDER BY StateName
END