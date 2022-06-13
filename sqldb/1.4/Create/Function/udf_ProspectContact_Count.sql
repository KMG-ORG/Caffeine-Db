-- ===========================================================================================      
-- Author:  <Spectraltech>      
-- Create date: <03.24.2022>      
-- Description: <fn_Get_CoutOfProspectInContcts>      
-- ============================================================================================      
  
CREATE FUNCTION [dbo].[udf_ProspectContact_Count](    
    @ProspectId Int   
)    
RETURNS int    
AS    
    
BEGIN;  
 Declare @Count Int  
    select @Count= count(1) from Contacts where ProspectId=@ProspectId AND (IsActive =1)
 RETURN @Count;  
END