ALTER PROCEDURE [dbo].[sp_LeadGenerator_SelectById]  
@Id int  
AS    
BEGIN    
SELECT Cl.Id,Cl.Value,Cl.[Owner],Cl.UserId,Cl.CreatedBy  
FROM LeadGenerator Cl     
where (Cl.IsDeleted=0 or Cl.IsDeleted IS NULL) And Cl.Id=@id  
ORDER BY  Cl.Id DESC       
END 