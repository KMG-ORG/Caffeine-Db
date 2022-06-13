CREATE TABLE Reminder(
	Id int Identity(1,1) Primary Key NOT NULL, 
	[Value] varchar(100)NOT NULL,
	CreatedDateTime datetime NOT NULL,
	ModifiedDateTime datetime NOT NULL,
	CreatedBy varchar(100) NOT NULL,
	ModifiedBy varchar(100) NOT NULL,
	IsDeleted bit NOT NULL
)