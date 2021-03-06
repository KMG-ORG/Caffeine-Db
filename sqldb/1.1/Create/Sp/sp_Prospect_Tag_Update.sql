/****** Object:  StoredProcedure [dbo].[sp_Prospect_Tag_Update]    Script Date: 23-01-2022 11:52:09 ******/

-- ============================================================
-- Author:      <Chandmal>    
-- Create Date: <16.12.2021 >    
-- Description: <Update Tags>    
-- ============================================================
CREATE Procedure [dbo].[sp_Prospect_Tag_Update]   
@TagDescription varchar(100),    
@ProspectId int,    
@IsDeleted bit,     
@ModifiedDateTime datetime, 
@LastModifiedBy varchar(100)    
AS    
 BEGIN    
 DECLARE @LastUpdateID Table(Id INT NULL)    

   UPDATE Tags SET    
   TagDescription =@TagDescription,
   IsDeleted=@IsDeleted,    
   ModifiedDateTime =@ModifiedDateTime,
   ModifiedBy=@LastModifiedBy
   OUTPUT inserted.ID INTO @LastUpdateID    
   WHERE (ProspectId = @ProspectId And TagDescription =@TagDescription)     
   SELECT Id FROM @LastUpdateID;     

 END