/****** Object:  StoredProcedure [dbo].[sp_Prospect_Tag_Save]    Script Date: 23-01-2022 11:47:30 ******/

-- =============================================
-- Author:		<Chandmal>
-- Create date: <10.25.2021>
-- Description:	<Save Tag for a prospect>
-- =============================================
CREATE PROCEDURE [dbo].[sp_Prospect_Tag_Save]     
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
 
END   

          

 