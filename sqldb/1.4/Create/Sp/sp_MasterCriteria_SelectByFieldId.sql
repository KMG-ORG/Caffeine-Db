
CREATE PROCEDURE [dbo].[sp_MasterCriteria_SelectByFieldId]
@FieldId int
AS  
BEGIN  
SELECT Mc.Id,Mc.Name,Mc.Value,Mc.Operand
FROM MasterCriteria Mc  
Inner Join MappingFieldCriteria Mfc on Mfc.CriteriaId = Mc.Id
where (Mc.IsDeleted=0 or Mc.IsDeleted IS NULL)  And Mfc.FieldId=@FieldId
ORDER BY  Mc.Id DESC     
END  