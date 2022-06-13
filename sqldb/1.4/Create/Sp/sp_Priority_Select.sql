/****** Object:  StoredProcedure [dbo].[sp_Priority_Select]    Script Date: 07-03-2022 10:23:53 ******/  
-- ===========================================================================================  
-- Author:  <SpectralTech>  
-- Create date: <03.07.2022>  
-- Description: <Select Priority>  
-- ============================================================================================  
CREATE PROCEDURE [dbo].[sp_Priority_Select] 
AS
BEGIN
     SELECT Id,Value  FROM Priority WHERE (IsDeleted Is NULL OR IsDeleted = 0)
END 