
/****** Object:  StoredProcedure [dbo].[sp_Client_SelectByIndustry]    Script Date: 04-04-2022 14:22:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[sp_Client_SelectByIndustry] 
@IndustryId int,
@RowCount int
AS
BEGIN
SELECT  TOP (@RowCount)
p.Id AS ProspectId ,p.ProspectName, pi.ProspectStatusId,pi.IndustryId,ins.IndustryName FROM Prospects AS p    
LEFT JOIN  ProspectInformation AS pi ON p.Id =pi.ProspectId     
LEFT JOIN  ProspectStatus AS ps ON pi.ProspectStatusId =  ps.Id   
LEFT JOIN  ProspectIndustry AS ins ON pi.IndustryId = ins.Id  
where pi.IndustryId  != @IndustryId  AND (p.IsDeleted=0 or p.IsDeleted IS NULL) AND ps.Id IN(2,3)
ORDER BY NEWID()  
END