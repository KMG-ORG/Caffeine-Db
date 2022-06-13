-- =============================================
-- Author:      <SpectralTech>
-- Create Date: <02.03.2021 >
-- Description: <Create Recall>
-- MODS : Removed ToDate (2nd May 2022)
-- =============================================
ALTER PROCEDURE [dbo].[sp_Recall_Save]
( 
    @Id int OUTPUT,
	@ProspectId int,
	@ContactId int,
	@ScheduledWithContact varchar(100),
	@RecallDate datetime,
	@RecallStatusId int,
	@RecallTime time(7),
	@PhoneNumber Bigint,
	@ScheduledForProducer varchar(100),
	@PriorityId int,
	@ScheduledForProspect varchar(100),
	@ReminderId int,
	@CreatedDateTime datetime,
	@CreatedBy varchar(100)
)
AS
BEGIN
	INSERT INTO Recall(
		
		ProspectId,
		ContactId ,
		ScheduledWithContact,
		RecallDate,
		RecallTime,
		RecallStatusId,
		PhoneNumber,
		ScheduledForProducer,
		PriorityId,
		ScheduledForProspect,
		ReminderId,
		CreatedDateTime,
		CreatedBy,
		ModifiedDateTime,
		ModifiedBy,
		IsDeleted
	)
	VALUES(
		
		@ProspectId,
		@ContactId ,
		@ScheduledWithContact,
		@RecallDate,
		@RecallTime,
		@RecallStatusId,
		@PhoneNumber,
		@ScheduledForProducer,
		@PriorityId,
	    @ScheduledForProspect,
		@ReminderId,
		@CreatedDateTime,
		@CreatedBy,
		@CreatedDateTime,
		@CreatedBy,
		0
	)
SET @Id=SCOPE_IDENTITY()
SELECT @Id
END

