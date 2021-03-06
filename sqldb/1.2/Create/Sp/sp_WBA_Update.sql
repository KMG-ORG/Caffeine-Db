/****** Object:  StoredProcedure [dbo].[sp_WBA_Update]    Script Date: 23-01-2022 12:45:39 ******/

-- =============================================
-- Author:      <Vibhuti>
-- Create Date: <01.06.2022>
-- Description: <Update data into WBA table>
-- =============================================
CREATE PROCEDURE [dbo].[sp_WBA_Update]
(
    @WBAId int,
    @ProspectId int,
	@EIN int,
	@BusinessStatusId int,
	@BusinessLineId int,
	@UserId int,
	@EffectiveDate datetime,
	@BoundRevenue bigint,
	@ModifiedDateTime datetime,
	@LastModifiedBy varchar(100)
)
AS
BEGIN
	Update WBA
	SET 
	EIN = @EIN,
	BusinessStatusId = @BusinessStatusId,
	BusinessLineId = @BusinessLineId,
	UserId = @UserId,
	EffectiveDate = @EffectiveDate,
	BoundRevenue = @BoundRevenue,
	ModifiedDateTime = @ModifiedDateTime,
	ModifiedBy = @LastModifiedBy
	WHERE (Id=@WBAId and ProspectId = @ProspectId)
END
