

CREATE PROCEDURE [dbo].[sp_ProspectList_SelectById]     
@ProspectId INT,     
@RowsCount INT             
AS                        
 BEGIN
   
SELECT   * FROM (
		SELECT Id AS ProspectId ,ProspectName , ModifiedDateTime
		FROM Prospects WHERE  Id = @ProspectId AND (IsDeleted=0 or  IsDeleted IS NULL) 
		UNION ALL 
		SELECT TOP (@RowsCount-1)
		Id AS ProspectId , ProspectName ,  ModifiedDateTime
		FROM Prospects 
		WHERE  Id != 5496 AND (IsDeleted=0 or  IsDeleted IS NULL)  order BY ModifiedDateTime DESC   

) as p

END 