/****** Object:  StoredProcedure [dbo].[sp_Prospect_Tag_Delete]    Script Date: 22-01-2022 19:45:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
  
ALTER Procedure [dbo].[sp_Prospect_Tag_Delete]      
@ProspectId int    
AS    
 BEGIN  
 -- first we have to make all tag deleted for each prospect  
   UPDATE Tags set IsDeleted=1 where ProspectId = @ProspectId;  
 END