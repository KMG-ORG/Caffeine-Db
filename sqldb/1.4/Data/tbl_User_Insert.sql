truncate table UserRole 
Delete From  Users where id>1
Insert Into Users(UserName,CreatedBy,ModifiedBy,CreatedDateTime,ModifiedDateTime,IsDeleted)
Values('Elon Musk','Mamta','Mamta',Getdate(),Getdate(),0)
Declare @count int=1, @NoOfRecords int ,@UserId Int;
select @NoOfRecords= max(Id) from Users 
WHILE @count < =@NoOfRecords  
	BEGIN 
		set @UserId=(select Id from Users where Id=@count and (IsDeleted =0 Or IsDeleted Is NULL))
    if(@UserId IS Not NULL)
			BEGIN 
				Insert into UserRole (UserRoleName,UserId,CreatedBy,ModifiedBy,CreatedDateTime,ModifiedDateTime,IsDeleted)
				Values('Marketing',@UserId,'Mamta','Mamta',Getdate(),Getdate(),0)
			END
 Set @count=@count+1
	End
Insert Into Users(UserName,CreatedBy,ModifiedBy,CreatedDateTime,ModifiedDateTime,IsDeleted)
Values('Jeff Bezos','Mamta','Mamta',Getdate(),Getdate(),0),
  ('Bernard Arnault','Mamta','Mamta',Getdate(),Getdate(),0)
select @NoOfRecords= max(Id) from Users 
WHILE @count < =@NoOfRecords  
	BEGIN 
    set @UserId=(select Id from Users where Id=@count and (IsDeleted =0 Or IsDeleted Is NULL))
 if(@UserId IS Not NULL)
			BEGIN 
				Insert into UserRole (UserRoleName,UserId,CreatedBy,ModifiedBy,CreatedDateTime,ModifiedDateTime,IsDeleted)
				Values('AccountManager',@UserId	,'Mamta','Mamta',Getdate(),Getdate(),0)
			End
 Set @count=@count+1
	End
	Update Users set UserName='Chris Green' where Id=1