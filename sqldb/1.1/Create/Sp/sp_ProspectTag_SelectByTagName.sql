 
-- =============================================    
-- Author:      <Vibhuti>    
-- Create Date: <16.12.2021 >    
-- Description: <Select TagDescription Matching Text for a Prospect from Tags table>    
-- =============================================    
CREATE PROCEDURE [dbo].[sp_ProspectTag_SelectByTagName]    
(    
@TagDescription varchar(100)    
)    
AS    
SELECT t.Id,t.ProspectId,t.TagDescription from Tags as t    
WHERE  t.TagDescription like '%' + @TagDescription + '%'
GO


