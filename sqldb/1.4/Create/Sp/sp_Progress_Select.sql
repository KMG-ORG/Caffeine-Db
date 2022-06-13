
-- ===========================================================================================    
-- Author:  <Spectraltech>    
-- Create date: <03.23.2022>    
-- Description: <Get Progress List>    
-- ============================================================================================
CREATE PROCEDURE  [dbo].[sp_Progress_Select]
AS
BEGIN
	SELECT Id, ProgressName As ProgressName FROM Progress WHERE IsDeleted=0 OR IsDeleted IS NULL
END
---------------------------------------------------------------------------------------------------------------------------------
 