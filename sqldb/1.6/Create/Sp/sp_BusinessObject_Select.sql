CREATE PROCEDURE  [dbo].[sp_BusinessObject_Select] 
AS    
BEGIN  
	SELECT t.BusinessObjectDisplayName
	FROM BusinessObject as t
END