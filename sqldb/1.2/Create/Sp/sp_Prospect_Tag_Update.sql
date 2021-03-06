/****** Object:  StoredProcedure [dbo].[sp_Prospect_Tag_Update]    Script Date: 07-01-2022 09:50:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:      <Chandmal>
-- Create Date: <12.06.2021 >
-- Description: <Update Tags>
-- ============================================= 
   
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