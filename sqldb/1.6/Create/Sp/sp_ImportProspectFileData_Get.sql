/****** Object:  StoredProcedure [dbo].[sp_ImportProspectFileData_Get]    Script Date: 27-05-2022 11:10:24 ******/
-- ===========================================================================    
-- Author:      <Chandrashekhar Rai>    
-- Create Date: <27-05-2022 >    
-- Description: <Select File Status Information List Using Pagination>    
-- =========================================================================== 

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_ImportProspectFileData_Get]  
 @PageNumber int,      
 @PageSize int
AS  
BEGIN 

select F.FileId AS FileId,F.FileDisplayName AS FileDisplayName,F.FilePath AS FilePath,F.FileExtension AS FileExtension,
F.Status AS Status,CAST(F.CreatedDate AS varchar(100)) CreatedDate,F.TotalRecord AS TotalRecord,
u.UserName as CreatedUserName,COUNT(*) OVER() AS TotalRecordsFromTable from ImportProspectFileData F inner join 
Users u on u.Id=F.Createdby where Status is not null 
ORDER BY F.Id DESC     
 OFFSET (@PageNumber -1)* @PageSize ROWS      
 FETCH NEXT @PageSize ROWS ONLY 

end
GO