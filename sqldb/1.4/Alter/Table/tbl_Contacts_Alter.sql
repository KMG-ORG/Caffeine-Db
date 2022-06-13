IF EXISTS(SELECT * FROM  INFORMATION_SCHEMA.COLUMNS WHERE  TABLE_NAME = 'Contacts' AND COLUMN_NAME = 'IsActive') 
   Alter table Contacts drop column  IsActive

--Add IsActive in Contact table
Alter table Contacts add IsActive bit NULL
Update  Contacts Set IsActive=1 
Alter table Contacts Alter Column IsActive bit Not NULL