
-- ===========================================================================================    
-- Author:  <Spectraltech>    
-- Create date: <03.22.2022>    
-- Description: <Get Result List>    
-- ============================================================================================
CREATE PROCEDURE  [dbo].[sp_Result_Select]
AS
BEGIN
	SELECT Id, ResultName FROM Result WHERE IsDeleted=0 OR IsDeleted IS NULL 
END