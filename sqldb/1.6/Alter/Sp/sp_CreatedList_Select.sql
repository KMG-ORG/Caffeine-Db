

 
ALTER PROCEDURE [dbo].[sp_CreatedList_Select]
AS  
BEGIN  
SELECT Cl.Id,Cl.ListName
FROM CreateList Cl   
where (Cl.IsDeleted=0 or Cl.IsDeleted IS NULL)  
AND  (Cl.ExpirationDate IS NULL OR Cl.ExpirationDate >= CAST(GETDATE() AS DATE))
ORDER BY  Cl.Id DESC     
END 