-- =============================================
-- Author:      <SpectralTech>
-- Create Date: <03.25.2021 >
-- Description: <Update Recall>
-- =============================================
CREATE PROCEDURE [dbo].[sp_Recall_Update]
( 
    @Id int,
	@ProspectId int,
	@ContactId int,
	@ScheduledWithContact varchar(100),
	@RecallDate datetime,
	@RecallStatusId int,
	@ToDate datetime,
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
	SET ProspectId= @ProspectId,
	ContactId= @ContactId,
	ScheduledWithContact =@ScheduledWithContact,
	RecallDate=@RecallDate,
	RecallStatusId=@RecallStatusId,
	ToDate=@ToDate,
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


