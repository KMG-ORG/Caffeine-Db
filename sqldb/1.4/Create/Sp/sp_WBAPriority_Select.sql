
-- ===========================================================================================    
-- Author:  <Spectraltech>    
-- Create date: <03.23.2022>    
-- Description: <Get WBAPriority List>    
-- ============================================================================================
CREATE PROCEDURE  [dbo].[sp_WBAPriority_Select]
AS
BEGIN
	SELECT Id, [Value] FROM WBAPriority WHERE IsDeleted=0 OR IsDeleted IS NULL 
END
