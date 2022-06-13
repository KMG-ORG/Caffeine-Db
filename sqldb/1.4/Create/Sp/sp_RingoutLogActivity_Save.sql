

CREATE PROCEDURE [dbo].[sp_RingoutLogActivity_Save]
( 
    @Id int OUTPUT,
	@DialNumber varchar (20),
	@LogStatus varchar (500),
	@Action varchar (100),
	@Result varchar (100),
	@CallDuration varchar(100),
	@CreatedDateTime datetime,
	@CreatedBy varchar(100)
)
AS
BEGIN
	INSERT INTO RingoutLogActivity(		
		DialNumber ,
		LogStatus ,
		Action,
		Result ,
		CallDuration,
		IsDeleted,
		CreatedDateTime,
		CreatedBy,
		ModifiedDateTime,
		ModifiedBy
	)
	VALUES(		  
		@DialNumber ,
		@LogStatus ,
		@Action,
		@Result ,
		@CallDuration,
		0,
		@CreatedDateTime,
		@CreatedBy,
		@CreatedDateTime,
		@CreatedBy
	)
SET @Id=SCOPE_IDENTITY()
SELECT @Id
END