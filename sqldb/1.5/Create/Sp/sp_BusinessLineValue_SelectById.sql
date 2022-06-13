create PROCEDURE  [dbo].[sp_BusinessLineValue_SelectById]
@BusinessLineId INTEGER
AS
BEGIN
	SELECT ISNULL(BusinessLineValue,0) FROM BusinessLine WHERE (IsDeleted=0 OR IsDeleted IS NULL) and id=@BusinessLineId
	
END
