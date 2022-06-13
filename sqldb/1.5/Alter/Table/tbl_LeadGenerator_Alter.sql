Alter Table LeadGenerator Add OwnerEmail Varchar(50)
GO
Update LG Set LG.OwnerEmail=LG.[Value] +'@lamb.com'
FROM   LeadGenerator LG