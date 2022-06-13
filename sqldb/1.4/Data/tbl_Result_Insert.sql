
INSERT INTO Result([ResultName],[CreatedDateTime],[ModifiedDateTime],[CreatedBy],[ModifiedBy] ,[IsDeleted])
VALUES ('Bound',getdate(),getdate(),'mamta','mamta',0),('Not Quoted,Not Bound',getdate(),getdate(),'mamta','mamta',0),
('Quoted,Not Bound',getdate(),getdate(),'mamta','mamta',0),('Not Renewed',getdate(),getdate(),'mamta','mamta',0);