/****** Object:  StoredProcedure [dbo].[sp_WBA_Save]    Script Date: 23-01-2022 12:42:56 ******/

-- =============================================
-- Author:      <Vibhuti>
-- Create Date: <3.01.2022>
-- Description: <Insert data into WBA table>
-- =============================================
CREATE PROCEDURE [dbo].[sp_WBA_Save]
( 
    @WBAId int OUTPUT, 
	@ProspectId varchar(100),
	@EIN INT,
	@BusinessStatusId int,
	@BusinessLineId int,
	@UserId int,
	@EffectiveDate datetime,
	@CreatedDateTime datetime,
	@CreatedBy varchar(100)  
)
AS
BEGIN
		Insert into WBA(
		ProspectId,
		EIN,
		BusinessStatusId,
		BusinessLineId,
		UserId,
		EffectiveDate, 
		CreatedDateTime ,
		CreatedBy
		)
		VALUES
		(
		@ProspectId,
		@EIN,
		@BusinessStatusId,
		@BusinessLineId,
		@UserId,
		@EffectiveDate, 
		@CreatedDateTime,
		@CreatedBy
		)
		SET @WBAId=SCOPE_IDENTITY()
	    SELECT @WBAId
END

