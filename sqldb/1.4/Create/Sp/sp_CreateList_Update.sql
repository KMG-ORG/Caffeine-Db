CREATE PROCEDURE [dbo].[sp_CreateList_Update]
(  
    @TypeOfList [varchar](20),  
    @ExpirationDate [datetime],
	@IsNewList [bit] ,
	@ListName [varchar](20),
	@CreateListJSON [nvarchar](max),  	
    @ModifiedDateTime DateTime,  
    @LastModifiedBy varchar(100)
)  
AS  
	BEGIN 
		Declare @SelectQuery nvarchar(max);
	    Exec  @SelectQuery =  sp_CreateListFilterQuery_Select @CreateListJSON
		
		Update CreateList set  
				TypeOfList= @TypeOfList,
				ExpirationDate=@ExpirationDate,
				IsNewList=@IsNewList,
				ListName =@ListName,
				CreateListJSON=@CreateListJSON,
				FilterQuery=@SelectQuery,
				ModifiedDateTime=@ModifiedDateTime,
				ModifiedBy=@LastModifiedBy,
				IsDeleted=0
	END 