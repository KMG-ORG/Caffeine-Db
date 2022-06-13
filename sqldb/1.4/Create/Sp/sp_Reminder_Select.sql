/****** Object:  StoredProcedure [dbo].[sp_Reminder_Select]    Script Date: 07-03-2022 10:23:53 ******/  
-- ===========================================================================================  
-- Author:  <SpectralTech>  
-- Create date: <03.07.2022>  
-- Description: <Select Reminder>  
-- ===============================================================================
CREATE PROCEDURE [dbo].[sp_Reminder_Select]  
AS  
BEGIN  
	SELECT Id, [Value] FROM Reminder WHERE (IsDeleted=0 OR IsDeleted IS NULL)
END