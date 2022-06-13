/****** Object:  StoredProcedure [dbo].[sp_WBA_Save]    Script Date: 23-01-2022 12:42:56 ******/

-- =============================================
-- Author: Bhavya
-- Update Date: 28.03.2022
-- Mods: Added new WBA fields 
-- =============================================
ALTER PROCEDURE [dbo].[sp_WBA_Save]
( 
    @WBAId int OUTPUT, 
	@ProspectId int,
	@ContactId int,
	@BusinessStatusId int,
	@BusinessLineId int,
	@TargetPremium bigint,
	@EffectiveDate datetime,
	@CreatedDateTime datetime,
	@CreatedBy varchar(100)  
)
AS
BEGIN
		Insert into WBA(
		ProspectId,
		ContactId,
		BusinessStatusId,
		BusinessLineId,
		TargetPremium,
		EffectiveDate, 
		CreatedDateTime ,
		CreatedBy
		)
		VALUES
		(
		@ProspectId,
		@ContactId,
		@BusinessStatusId,
		@BusinessLineId,
		@TargetPremium,
		@EffectiveDate, 
		@CreatedDateTime,
		@CreatedBy
		)
		SET @WBAId=SCOPE_IDENTITY()
	    SELECT @WBAId
END

