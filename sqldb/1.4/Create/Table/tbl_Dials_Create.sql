CREATE TABLE Dials(  
	Id int IDENTITY(1,1) PRIMARY KEY NOT NULL,
	ProspectId int NOT NULL FOREIGN KEY REFERENCES Prospects(Id),
	DialedBy varchar (100) NOT NULL,
	NumberDialed bigint  NOT NULL,
	CallDuration TIME NULL,
	DispositionId int NOT NULL FOREIGN KEY REFERENCES MasterDisposition(Id),
	TimesDialed int NULL,
	CreatedDateTime DATETIME NOT NULL,
	ModifiedDateTime DATETIME NOT NULL,
	CreatedBy varchar(100) NOT NULL,
	ModifiedBy varchar(100) NOT NULL,
	IsDeleted bit NULL,
	Others  nvarchar(Max) 
)



