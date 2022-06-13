/****** Object:  StoredProcedure [dbo].[sp_Prospect_SelectByName]    Script Date: 23-01-2022 11:30:56 ******/

-- ===========================================================================================
-- Author:		<Vibhuti>
-- Create date: <11.12.2021>
-- Description:	<Get a Prospect By its Name >
-- Mods  : i)Added EIN field
--         ii) Added Email And Phone Number
-- ============================================================================================
ALTER procedure [dbo].[sp_Prospect_SelectByName] 
@ProspectName varchar(100)
AS
BEGIN
SELECT p.Id, p.ProspectName,p.City,p.[State], p.ZipCode , p.AddressLine1,p.AddressLine2,pi.EIN,
p.PhoneNumber,p.EmailAddress
FROM  Prospects AS p 
LEFT JOIN ProspectInformation pi ON pi.ProspectId=p.Id
WHERE  p.ProspectName LIKE '%' + @ProspectName + '%'
END
