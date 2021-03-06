/****** Object:  StoredProcedure [dbo].[sp_Prospect_Tag_Save]    Script Date: 22-01-2022 19:46:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
  
ALTER Procedure [dbo].[sp_Prospect_Tag_Save]     
@TagDescription varchar(100),    
@ProspectId int,    
@IsDeleted bit,    
@CreatedDateTime datetime,    
@ModifiedDateTime datetime,
@CreatedBy varchar(30) 
AS         
  BEGIN    
 
 INSERT INTO Tags(ProspectId,TagDescription,CreatedDateTime,ModifiedDateTime,IsDeleted,CreatedBy)     
    VALUES(@ProspectId,@TagDescription,@CreatedDateTime,@ModifiedDateTime,@IsDeleted, @CreatedBy)    
 SELECT SCOPE_IDENTITY() as Id;            
 
 End   

          

 