-- ===========================================================================================  
-- Author:  <KMG>  
-- Create date: <14.02.2022>  
-- Description: <Get all prospect details with Quick Search >  
-- ============================================================================================  
CREATE PROCEDURE [dbo].[sp_Prospect_Select_QuickSearch]  
@RowCount int , 
@SearchProspect nvarchar(100)
AS  
BEGIN  
	Set @SearchProspect= '%'+@SearchProspect+'%';
	EXEC sp_Prospect_Search @RowCount,@SearchProspect;
END  
  
  
  