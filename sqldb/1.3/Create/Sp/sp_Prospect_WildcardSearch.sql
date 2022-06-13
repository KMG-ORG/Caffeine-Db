-- ===========================================================================================  
-- Author:  <KMG>  
-- Create date: <02.14.2022>  
-- Description: <Get all prospect details with Wildcard Search >  
-- ============================================================================================  
CREATE PROCEDURE [dbo].[sp_Prospect_WildcardSearch]  
@RowCount int , 
@SearchProspect Nvarchar(500)
AS  
BEGIN  
	Set @SearchProspect= (replace(@SearchProspect,'*','%'));
	EXEC sp_Prospect_Search @RowCount,@SearchProspect;     
END  
  