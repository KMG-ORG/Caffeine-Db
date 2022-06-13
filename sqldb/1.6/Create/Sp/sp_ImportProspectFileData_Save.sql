/****** Object:  StoredProcedure [dbo].[sp_ImportProspectFileData_Save]    Script Date: 27-05-2022 11:01:49 ******/
-- ============================================================
-- Author:      <CHANDRASHEKHAR>    
-- Create Date: <27-05-2022 >    
-- Description: <Save Import Prospect File Status>    
-- ============================================================

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[sp_ImportProspectFileData_Save]  
(  
    @FileId varchar(50),  
    @FileDisplayName varchar(100),  
	@FilePath varchar(500),  
    @FileExtension varchar(50),
	@Status varchar(50),
	@TotalRecord int,
    @Createdby int  
    
)  
AS  
BEGIN  
IF((select count(*) from ImportProspectFileData where FileId=@FileId)=0)begin
 INSERT INTO [dbo].[ImportProspectFileData]
 (
 FileId,
 FileDisplayName,
 FilePath,
 FileExtension,
 Status,
 Createdby,
 TotalRecord
 )
 VALUES(
 @FileId,
 @FileDisplayName,
 @FilePath,
 @FileExtension,
 @Status,
 @Createdby,
 @TotalRecord
 )
 
  select SCOPE_IDENTITY();
 END
 ELSE BEGIN
 update ImportProspectFileData set Status=@Status,TotalRecord=@TotalRecord where FileId=@FileId;
  select 1;
 END
 
 END