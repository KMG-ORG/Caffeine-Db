
ALTER PROCEDURE [dbo].[sp_AllCreateList_Select]  
AS                
BEGIN  

SELECT Cl.Id,Cl.SaveAsType,Cl.TypeOfList, Cl.ExpirationDate,
CASE WHEN Cl.SaveAsType ='Draft' THEN  Cl.ListName + '-' + Cl.SaveAsType 
WHEN Cl.SaveAsType ='Template' THEN  Cl.ListName + '-' + Cl.SaveAsType
ELSE  Cl.ListName END AS ListName
FROM CreateList Cl     
where  Cl.SaveAsType ='Publish' AND (Cl.IsDeleted=0 or Cl.IsDeleted IS NULL)  AND 
(Cl.ExpirationDate IS NULL OR
Cl.ExpirationDate >= CAST(GETDATE() AS DATE))
ORDER BY  Cl.ModifiedDateTime DESC  

END
