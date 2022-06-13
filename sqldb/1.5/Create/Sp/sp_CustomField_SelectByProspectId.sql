-- =========================================================    
-- Author:  <Vibhuti>        
-- Create date: <11.09.2021>        
-- Description: <Get Dials Custom Fields - Other >        
-- ==========================================================
CREATE PROCEDURE [dbo].[sp_CustomField_SelectByProspectId]        
	@ProspectId int        
AS        
	SELECT Id,FieldName,FieldValue
	FROM CustomField      
	WHERE ProspectId =@ProspectId AND(IsDeleted = 0 OR IsDeleted IS NULL)  
	ORDER BY Id DESC      