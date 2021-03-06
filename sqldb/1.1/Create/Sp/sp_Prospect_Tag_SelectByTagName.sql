/****** Object:  StoredProcedure [dbo].[sp_Prospect_Tag_SelectByTagName]    Script Date: 23-01-2022 11:50:43 ******/
  
-- =====================================================================================  
-- Author:      <Vibhuti>    
-- Create Date: <16.12.2021 >    
-- Description: <Select TagDescription Matching Text for a Prospect from Tags table>    
-- ======================================================================================   
CREATE PROCEDURE [dbo].[sp_Prospect_Tag_SelectByTagName]       
@TagDescription varchar(100)        
AS    
BEGIN  
SELECT t.Id,t.ProspectId,t.TagDescription from Tags as t    
WHERE  t.TagDescription like '%' + @TagDescription + '%'

END