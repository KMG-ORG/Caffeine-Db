USE [CAFFEINE_DEV]
GO
 

ALTER PROCEDURE  [dbo].[sp_Prospect_Tag_SelectByProspectId]
@ProspectId int     
AS    
BEGIN    
 SELECT Id,ProspectId,TagDescription,IsDeleted FROM Tags WHERE ProspectId =@ProspectId AND (IsDeleted=0 OR IsDeleted IS NULL)    
END

