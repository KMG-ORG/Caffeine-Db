


ALTER PROCEDURE [dbo].[sp_CreateList_Select]  
AS    
BEGIN    
SELECT Cl.Id,Cl.SaveAsType,Cl.TypeOfList,Cl.ExpirationDate,Cl.IsNewList,Cl.ListName,Cl.FilterQuery,
REPLACE(RIGHT(Cl.CreateListJSON, LEN(CreateListJSON) - 11),']}',']') CreateListJSON,
CASE WHEN Cl.CreateListJSONGroup IS NULL THEN '' 
WHEN Cl.CreateListJSONGroup ='' THEN '' 
WHEN Cl.CreateListJSONGroup ='{"group":null}' THEN '' ELSE
REPLACE(RIGHT(Cl.CreateListJSONGroup, LEN(Cl.CreateListJSONGroup) - 9),']}',']')end AS CreateListJSONGroup
FROM CreateList Cl     
where (Cl.IsDeleted=0 or Cl.IsDeleted IS NULL) AND Cl.SaveAsType='Template'  AND  
(Cl.ExpirationDate IS NULL OR Cl.ExpirationDate >= CAST(GETDATE() AS DATE))
ORDER BY  Cl.Id DESC       
END 