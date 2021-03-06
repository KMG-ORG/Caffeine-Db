/****** Object:  StoredProcedure [dbo].[sp_Prospect_Tag_Delete]    Script Date: 23-01-2022 11:44:25 ******/

-- =============================================
-- Author:		<Chandmal>
-- Create date: <10.25.2021>
-- Description:	<Soft Delete Tag>
-- =============================================
CREATE PROCEDURE [dbo].[sp_Prospect_Tag_Delete]      
@ProspectId int    
AS    
 BEGIN  
 -- first we have to make all tag 'deleted' for each prospect  
   UPDATE Tags SET IsDeleted=1 WHERE ProspectId = @ProspectId;  
 END;