  
-- ===========================================================================================    
-- Author:  <Spectraltech>    
-- Create date: <03.22.2022>    
-- Description: <Get LeadGenerator List>    
-- ============================================================================================  
CREATE PROCEDURE  [dbo].[sp_LeadGenerator_Select]
AS
BEGIN
	SELECT Id, Value FROM LeadGenerator WHERE IsDeleted=0 OR IsDeleted IS NULL
	ORDER BY Value 
END