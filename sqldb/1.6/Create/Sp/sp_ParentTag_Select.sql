-- ================================================================
-- Author:      <Vibhuti>
-- Create Date: <05.12.2021 >
-- Description: <Select ParentTag values from ParentTag table>
-- ================================================================
CREATE PROCEDURE [dbo].[sp_ParentTag_Select]   
AS  
BEGIN  
	SELECT Id, ParentTagName FROM ParentTag	
	WHERE (IsDeleted=0 or IsDeleted IS NULL)
	ORDER BY ParentTagName ASC
END  
