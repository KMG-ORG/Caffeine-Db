Alter table LeadGenerator Add  Owner varchar(100) Null

Alter table LeadGenerator Add OwnerId [int] NULL
GO
ALTER TABLE [dbo].[LeadGenerator]  WITH CHECK ADD FOREIGN KEY([OwnerId])
REFERENCES [dbo].[Users] ([Id])
GO
Update LeadGenerator set OwnerId=UserId 
GO

Declare @CONSTRAINT_NAME varchar(200)
select @CONSTRAINT_NAME= 'ALTER TABLE LeadGenerator
drop CONSTRAINT ' +CONSTRAINT_NAME from INFORMATION_SCHEMA.TABLE_CONSTRAINTS
where TABLE_NAME ='LeadGenerator' and CONSTRAINT_TYPE='FOREIGN KEY' and CONSTRAINT_NAME like '%User%'
  EXEC sp_executesql @CONSTRAINT_NAME
  GO
Alter table LeadGenerator drop column UserId 
GO
Alter table LeadGenerator drop column Owner 
GO
Alter table LeadGenerator drop column OwerEmail