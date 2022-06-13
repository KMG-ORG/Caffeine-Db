-- =======================================================
-- Author:      <KMG>
-- Create Date: <02.04.2022 >
-- Description: <Select Offering Guide by Prospect Id>
-- ======================================================
CREATE PROCEDURE [dbo].[sp_OfferingGuide_SelectByProspectId] 
    @ProspectId int
AS
BEGIN 
	SELECT og.OfferingGuideName 
	FROM  OfferingGuide AS og
	INNER JOIN IndustryOfferingGuide AS io ON io.OfferingGuideId = og.Id 
	INNER JOIN  ProspectInformation AS pi ON io.IndustryId =pi.IndustryId  
	WHERE (pi.ProspectId =@ProspectId)
END
 

