Alter PROCEDURE  [dbo].[sp_BusinessStatus_Select]  
AS  
BEGIN  
 SELECT Id, Case when Status ='New Client' Then  Status+ ' '+ Cast(YEAR(Getdate()) as Varchar(10))  ELSE Status END AS Status  FROM BusinessStatus WHERE IsDeleted=0 OR IsDeleted IS NULL  
 ORDER BY Status   
END