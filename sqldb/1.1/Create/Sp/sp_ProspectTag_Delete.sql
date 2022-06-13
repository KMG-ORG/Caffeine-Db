CREATE Procedure [dbo].[sp_ProspectTag_Delete]      
@ProspectId int    
AS    
 BEGIN  
 -- first we have to make all tag deleted for each prospect  
   UPDATE Tags set IsDeleted=1 where ProspectId = @ProspectId;  
 END;
GO


