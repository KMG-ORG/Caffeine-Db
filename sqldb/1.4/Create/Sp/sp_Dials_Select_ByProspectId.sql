-- ===========================================================================================  
-- Author:  <SpectralTech>  
-- Create date: <03.08.2021>  
-- Description: <Get Dials Details by Prospect Id >  
-- ============================================================================================  
CREATE PROCEDURE [dbo].[sp_Dials_Select_ByProspectId]  
   @ProspectId int  
AS   
BEGIN  
	SELECT   
	d.Id,d.DialedBy,d.NumberDialed,d.CallDuration,m.Id AS DispositionId ,m.Disposition AS DispositionName,
	d.CreatedDateTime ,d.TimesDialed
	FROM Dials AS d    
	LEFT JOIN MasterDisposition AS m ON d.DispositionId = m.Id  
	WHERE (d.IsDeleted=0 or d.IsDeleted IS NULL) AND d.ProspectId = @ProspectId  
	ORDER BY  d.Id DESC     
END  

  