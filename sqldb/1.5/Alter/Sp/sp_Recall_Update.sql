-- =============================================
-- Author:      <SpectralTech>
-- Create Date: <02.03.2021 >
-- Description: <Update Recall>
-- MODS : Removed ToDate (2nd May 2022)
-- =============================================
ALTER PROCEDURE [dbo].[sp_Recall_Update]
( 
    @Id int,
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
	@ModifiedDateTime datetime,
	@LastModifiedBy varchar(100)
)
AS
BEGIN
Update Recall
	SET 
	ProspectId= @ProspectId,
	ContactId= @ContactId,
	ScheduledWithContact =@ScheduledWithContact,
	RecallDate=@RecallDate,
	RecallStatusId=@RecallStatusId,
	RecallTime=@RecallTime,
	PhoneNumber=@PhoneNumber,
	ScheduledForProducer=@ScheduledForProducer,
	PriorityId=@PriorityId,
	ScheduledForProspect=@ScheduledForProspect,
	ReminderId=@ReminderId,
	ModifiedDateTime=@ModifiedDateTime,
	ModifiedBy=@LastModifiedBy
	WHERE Id=@Id	
END


