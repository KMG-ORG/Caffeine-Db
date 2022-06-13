-- ================================================================
-- Author:      <Vibhuti>
-- Create Date: <05.12.2021 >
-- Description: <Select TagEntity values from TagEntity table>
-- ================================================================
CREATE PROCEDURE [dbo].[sp_TagEntity_Select]   
AS  
BEGIN  
	SELECT Id, EntityName FROM TagEntity	
	WHERE (IsDeleted=0 or IsDeleted IS NULL)
	ORDER BY EntityName ASC
END  

