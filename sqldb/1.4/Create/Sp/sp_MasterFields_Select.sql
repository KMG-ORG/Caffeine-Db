

CREATE PROCEDURE [dbo].[sp_MasterFields_Select]
AS  
BEGIN  
SELECT Mf.Id,Mf.FieldName,Mf.FieldCode,Mf.FieldTableName,Mf.FieldCoumnName,Mf.FilterType,Mf.CriteriaType,Mf.ValueType,Mf.ValueTable
FROM MasterFields Mf   
where (Mf.IsDeleted=0 or Mf.IsDeleted IS NULL)  
ORDER BY  Mf.Id DESC     
END  