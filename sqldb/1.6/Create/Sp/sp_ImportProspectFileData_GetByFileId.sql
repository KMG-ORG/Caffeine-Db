/****** Object:  StoredProcedure [dbo].[sp_ImportProspectFileData_GetByFileId]    Script Date: 27-05-2022 11:12:20 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_ImportProspectFileData_GetByFileId]  
 @FileId varchar(500)
AS  
BEGIN 

select F.FileId AS FileId,F.FileDisplayName AS FileDisplayName,F.FilePath AS FilePath,F.FileExtension AS FileExtension,
F.Status AS Status,CAST(F.CreatedDate AS varchar(100)) CreatedDate,F.TotalRecord AS TotalRecord,
u.UserName as CreatedUserName,COUNT(*) OVER() AS TotalRecordsFromTable from ImportProspectFileData F inner join 
Users u on u.Id=F.Createdby where F.FileId=@FileId 


end
GO
