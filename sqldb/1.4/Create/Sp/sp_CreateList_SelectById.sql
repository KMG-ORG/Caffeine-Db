CREATE PROCEDURE [dbo].[sp_CreateList_SelectById]
@Id int
AS  
BEGIN  
SELECT Cl.Id,Cl.TypeOfList,Cl.ExpirationDate,Cl.IsNewList,Cl.ListName,Cl.CreateListJSON,Cl.FilterQuery
FROM CreateList Cl   
where (Cl.IsDeleted=0 or Cl.IsDeleted IS NULL) And Cl.Id=@id
ORDER BY  Cl.Id DESC     
END 
