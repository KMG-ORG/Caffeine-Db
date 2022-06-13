
-- ===========================================================    
-- Author:      <Chandrashekhar>    
-- Create Date: <17-05-2022 >    
-- Description: <Get Duplicate Data From Prospect>    
-- MODS : 1. Duplicate Prospect getting by useing sp_Prospect_CheckDuplicate sp     

-- ===========================================================    

CREATE PROCEDURE [dbo].[sp_Check_DuplicateProspectFrom_CaffieneAndLamb]
(

 @ProspectName varchar(100),  
 @City varchar (100),  
 @State varchar (100),  
 @ZipCode varchar (100),  
 @PhoneNumber  bigint,
 @Email varchar(500),
 @EIN bigint NULL
 )AS  
BEGIN 
   Declare @Tbl as CheckDuplicateProspectsType;
	insert into @Tbl
	SELECT 1,@ProspectName,@City,@Email,@State,@ZipCode,@PhoneNumber,@EIN;
	execute [dbo].[sp_Prospect_CheckDuplicate] @Tbl,'';

END