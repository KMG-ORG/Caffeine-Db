-- =============================================    
-- Author:      <Vibhuti>    
-- Create Date: <16.12.2021 >    
-- Description: <Select all TagDescription for a Prospect from Tags table>    
-- =============================================    
CREATE PROCEDURE  [dbo].[Sp_ProspectTags_SelectByProspectId]
@ProspectId int     
AS    
BEGIN    
 SELECT Id,ProspectId,TagDescription,IsDeleted FROM Tags WHERE ProspectId =@ProspectId AND(IsDeleted=0 OR IsDeleted IS NULL)    
END
GO


