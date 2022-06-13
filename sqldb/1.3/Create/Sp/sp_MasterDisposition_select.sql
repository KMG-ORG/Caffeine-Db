 

CREATE PROCEDURE [dbo].[sp_MasterDisposition_Select] 
AS
BEGIN
     SELECT Id,Disposition  FROM MasterDisposition WHERE (IsDeleted Is NULL OR IsDeleted = 0)
	 ORDER BY Disposition
END 