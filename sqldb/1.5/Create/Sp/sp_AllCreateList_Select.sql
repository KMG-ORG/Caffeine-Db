

CREATE PROCEDURE [dbo].[sp_AllCreateList_Select]    
AS                  
BEGIN    
  
SELECT Cl.Id,Cl.SaveAsType,Cl.TypeOfList,  
CASE WHEN Cl.SaveAsType ='Draft' THEN  Cl.ListName + '-' + Cl.SaveAsType   
WHEN Cl.SaveAsType ='Template' THEN  Cl.ListName + '-' + Cl.SaveAsType  
ELSE  Cl.ListName END AS ListName  
FROM CreateList Cl       
where (Cl.IsDeleted=0 or Cl.IsDeleted IS NULL)   -- and TypeOfList ='Dynamic'  
ORDER BY  Cl.ModifiedDateTime DESC    
  
END