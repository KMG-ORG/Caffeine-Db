
 -- =============================================    
-- Author:      <Vibhuti>    
-- Create Date: <16.12.2021 >    
-- Description: <Insert Distinct TagDescription per Prospect into Tags table>    
  
   
-- =============================================    
CREATE Procedure [dbo].[sp_ProspectTag_Save]    
 -- @Id int OUTPUT,    
@TagDescription varchar(100),    
@ProspectId int,    
@IsDeleted bit,    
@CreatedDateTime datetime,    
@ModifiedDateTime datetime    
AS    
IF Not Exists(SELECT * FROM Tags WHERE (ProspectId = @ProspectId And TagDescription =@TagDescription))    
  BEGIN    
    INSERT INTO Tags(ProspectId,TagDescription,CreatedDateTime,ModifiedDateTime,IsDeleted)     
 VALUES(@ProspectId,@TagDescription,@CreatedDateTime,@ModifiedDateTime,@IsDeleted)    
 SELECT SCOPE_IDENTITY() as Id;            
  End    
ELSE    
 BEGIN    
      DECLARE @LastUpdateID Table(Id INT NULL)    
   UPDATE Tags    
   SET TagDescription =@TagDescription,IsDeleted=@IsDeleted,    
        ModifiedDateTime =@ModifiedDateTime    
    OUTPUT inserted.ID INTO @LastUpdateID    
    WHERE (ProspectId = @ProspectId And TagDescription =@TagDescription)     
      SELECT Id FROM @LastUpdateID;     
 END
GO


