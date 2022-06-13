-- =============================================
-- Author:      <Vibhuti>
-- Create Date: <01.06.2022>
-- Description: <Update data into WBA table>
-- =============================================
ALTER PROCEDURE [dbo].[sp_WBA_Update]
(
    @WBAId int,
    @ProspectId int,
	@TargetPremium bigint,
	@ContactId int,
	@PriorityId int,
	@ResultId int,
	@LeadGenerateId int,
	@AccountManagerUserId int,
	@ProgressId int,
	@BusinessStatusId int,
	@BusinessLineId int,
	@ExpiringCarrierId int,
	@ExpiringPremium int,
	@UserId int,
	@EffectiveDate datetime,
	@ExpiringRevenue bigint,
	@ModifiedDateTime datetime,
	@LastModifiedBy varchar(100)
)
AS
BEGIN
	Update WBA
	SET 
	ProspectId=@ProspectId,
	TargetPremium=@TargetPremium,
	ContactId=@ContactId,
	PriorityId=@PriorityId,
	ResultId=@ResultId,
	UserId=@UserId,
	LeadGenerateId=@LeadGenerateId,
	AccountManagerUserId=@AccountManagerUserId,
	ProgressId=@ProgressId,
	BusinessStatusId=@BusinessStatusId ,
	BusinessLineId=@BusinessLineId,
	ExpiringCarrierId=@ExpiringCarrierId,
	ExpiringPremium=@ExpiringPremium,
	EffectiveDate=@EffectiveDate,	
	ExpiringRevenue=@ExpiringRevenue,
	ModifiedDateTime =@ModifiedDateTime,
	ModifiedBy = @LastModifiedBy
	WHERE (Id=@WBAId and ProspectId = @ProspectId)
END