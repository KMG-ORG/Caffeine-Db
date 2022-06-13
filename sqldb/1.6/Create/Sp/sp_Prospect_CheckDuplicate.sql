/****** Object:  StoredProcedure [dbo].[sp_Prospect_CheckDuplicate]    Script Date: 27-05-2022 12:08:19 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO





CREATE PROCEDURE [dbo].[sp_Prospect_CheckDuplicate]    
@ImportProspects CheckDuplicateProspectsType READONLY,   
@SourseName nvarchar(100)    
AS    
BEGIN    
     
  Truncate table ImportProspectsInfo    
  Insert into ImportProspectsInfo(ProspectName,ProspectNameFullName,City,EmailAddress,State,ZipCode,PhoneNumber,EIN,ErrorMessage)    
    
   SELECT ProspectName,ProspectName as PFullName,City,Email,State,ZipCode,PhoneNumber,EIN,'' FROM @ImportProspects    
   
 IF (@SourseName='Excel')    
 BEGIN    
   Update ImportProspectsInfo set ErrorMessage = ErrorMessage+' Zip Code is required ' where  ZipCode Is Null OR ZipCode=''     
    
   Update ImportProspectsInfo set ErrorMessage =( Case When  ErrorMessage Is Not Null and ErrorMessage !=''
												   THEN ErrorMessage+' And ZipCode is invalid ' 
												   else  ' Zip code is invalid ' END )
   where  ZipCode Is Not Null And ZipCode !='' and LEN(ZipCode)>10 AND ZipCode NOT LIKE '[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]'   
  
  Update ImportProspectsInfo set ErrorMessage = ( Case When  ErrorMessage Is Not Null and ErrorMessage !=''
												   THEN ErrorMessage+' And Phone number is required ' 
												   else  ' Phone number is required ' END )
   where  PhoneNumber Is Null OR PhoneNumber=''     
   
   Update ImportProspectsInfo set ErrorMessage = ( Case When  ErrorMessage Is Not Null and ErrorMessage !=''
												   THEN ErrorMessage+' And  Phone number is invalid ' 
												   else  '  Phone number is invalid ' END )
  where  PhoneNumber Is Not Null And PhoneNumber !='' and LEN(PhoneNumber)!=10 AND PhoneNumber NOT LIKE '[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]'     
  
  Update ImportProspectsInfo set ErrorMessage =  ( Case When  ErrorMessage Is Not Null and ErrorMessage !=''
												   THEN ErrorMessage+' And  Prospect name is required' 
												   else  ' Prospect name is required' END )
  where  ProspectName Is Null OR ProspectName=''   
  
   Update ImportProspectsInfo set ErrorMessage = ( Case When  ErrorMessage Is Not Null and ErrorMessage !=''
												   THEN ErrorMessage+' And  Prospect name is invalid' 
												   else  '  Prospect name is invalid' END )
   where  ProspectName Is Not Null And ProspectName !='' and LEN(ProspectName)>60    
 
   Update ImportProspectsInfo set ErrorMessage =( Case When  ErrorMessage Is Not Null and ErrorMessage !=''
												   THEN ErrorMessage+' And  City is required' 
												   else  '  City is required' END )
    where  City Is Null OR City=''     
   
   Update ImportProspectsInfo set ErrorMessage =( Case When  ErrorMessage Is Not Null and ErrorMessage !=''
												   THEN ErrorMessage+' And  City is invalid' 
												   else  '  City is invalid' END )
   where  City Is Not Null And City !='' and LEN(City)>60  AND City LIKE '[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]'  
   

   update ImportProspectsInfo set ErrorMessage =( Case When  ErrorMessage Is Not Null and ErrorMessage !=''
												   THEN ErrorMessage+' And  State is required' 
												   else  '   State is required' END )
   where  State Is Null OR State=''     
   
   Update ImportProspectsInfo set ErrorMessage = ( Case When  ErrorMessage Is Not Null and ErrorMessage !=''
												   THEN ErrorMessage+' And Email is required' 
												   else  ' Email is required ' END )
   where  EmailAddress Is Null OR EmailAddress=''     

   Update ImportProspectsInfo set ErrorMessage =( Case When  ErrorMessage Is Not Null and ErrorMessage !=''
												   THEN ErrorMessage+' And Email is invalid' 
												   else  ' Email is invalid ' END )
  where  EmailAddress Is Not Null And EmailAddress !='' AND EmailAddress NOT LIKE '%_@__%.__%'  

END    
    
 UPDATE Imp    
 SET    ProspectId = Case when  (Imp.EIN != null  And Imp.EIN != '' And Imp.EIN!='0' ) Then Pi.ProspectId when 
((((SUBSTRING(Imp.ProspectName, 1,10)= SUBSTRING(p.ProspectName, 1,10) OR Imp.ProspectName in (select p.ProspectName+' '+SpecialCare from ProspectNameSpecialCare))    
  And SUBSTRING(Imp.City, 1,20)=p.City And Imp.ZipCode=p.ZipCode) OR (
  ((SUBSTRING(Imp.ProspectName, 1,10)= SUBSTRING(p.ProspectName, 1,10) OR Imp.ProspectName in (select p.ProspectName+' '+SpecialCare from ProspectNameSpecialCare))    
  And SUBSTRING(Imp.City, 1,20)=p.City And Imp.PhoneNumber=p.PhoneNumber)) )) THEN  p.Id ELSE 0 END, 
  ErrorMessage= Case when  (Imp.EIN != null  And Imp.EIN != '' And Imp.EIN!='0' ) AND (Imp.ErrorMessage IS NULL OR Imp.ErrorMessage='') and @SourseName='Excel' Then ErrorMessage+ ' ' +' Prospect Already exist'
  when  (Imp.EIN != null  And Imp.EIN != '' And Imp.EIN!='0' ) AND (Imp.ErrorMessage IS NULL OR Imp.ErrorMessage='') and @SourseName!='Excel' Then ErrorMessage+ ' ' +Imp.ProspectName+' Prospect Already exist'
  when ((((SUBSTRING(Imp.ProspectName, 1,10)= SUBSTRING(p.ProspectName, 1,10) OR Imp.ProspectName in (select p.ProspectName+' '+SpecialCare from ProspectNameSpecialCare))    
  And SUBSTRING(Imp.City, 1,20)=p.City And Imp.ZipCode=p.ZipCode) OR (
  ((SUBSTRING(Imp.ProspectName, 1,10)= SUBSTRING(p.ProspectName, 1,10) OR Imp.ProspectName in (select p.ProspectName+' '+SpecialCare from ProspectNameSpecialCare))    
  And SUBSTRING(Imp.City, 1,20)=p.City And Imp.PhoneNumber=p.PhoneNumber)) )) AND (Imp.ErrorMessage IS NULL OR Imp.ErrorMessage='') and @SourseName!='Excel' THEN  ErrorMessage+ ' ' +Imp.ProspectName+' Prospect Already Exist' 
  when ((((SUBSTRING(Imp.ProspectName, 1,10)= SUBSTRING(p.ProspectName, 1,10) OR Imp.ProspectName in (select p.ProspectName+' '+SpecialCare from ProspectNameSpecialCare))    
  And SUBSTRING(Imp.City, 1,20)=p.City And Imp.ZipCode=p.ZipCode) OR (
  ((SUBSTRING(Imp.ProspectName, 1,10)= SUBSTRING(p.ProspectName, 1,10) OR Imp.ProspectName in (select p.ProspectName+' '+SpecialCare from ProspectNameSpecialCare))    
  And SUBSTRING(Imp.City, 1,20)=p.City And Imp.PhoneNumber=p.PhoneNumber)) )) AND (Imp.ErrorMessage IS NULL OR Imp.ErrorMessage='') and @SourseName='Excel' THEN  ErrorMessage+ ' ' +' Prospect Already Exist'
  ELSE ErrorMessage END
   
 FROM   ImportProspectsInfo Imp    
 LEFT JOIN  ProspectInformation Pi On (Pi.EIN= Imp.EIN And Imp.EIN != null  And Imp.EIN != '' And Imp.EIN!='0' )   
 LEFT JOIN Prospects P On (Pi.ProspectId = P.Id)    
  OR     
  ( ((SUBSTRING(Imp.ProspectName, 1,10)= SUBSTRING(p.ProspectName, 1,10) OR Imp.ProspectName in (select cast(p.ProspectName as varchar(100))+' '+SpecialCare from ProspectNameSpecialCare))    
  And SUBSTRING(Imp.City, 1,20)=cast(p.City as varchar(50)) And Imp.ZipCode=cast(p.ZipCode as varchar(50)))     
  OR     
  ((SUBSTRING(Imp.ProspectName, 1,10)= SUBSTRING(p.ProspectName, 1,10) OR Imp.ProspectName in (select p.ProspectName+' '+SpecialCare from ProspectNameSpecialCare))    
  And SUBSTRING(Imp.City, 1,20)=cast(p.City as varchar(50)) And Imp.PhoneNumber=cast(p.PhoneNumber as varchar(50))))    
    
 -- Select Id,ProspectId,ErrorMessage From ImportProspectsInfo --Where ProspectId Is Not Null And ProspectId>0   
 Declare @ErrorMessage Varchar(MAX);   
 --Select @ErrorMessage = CASE WHEN ProspectId IS NOT NULL AND ProspectId!=0 THEN COALESCE(@ErrorMessage + ' ; Row No :- ' + case when  Id Is Null Then '' Else cast(Id as varchar(5)) end   
 --        +' , ProspectId :- '+ case when  (ProspectId Is Null OR ProspectId=0) Then  ' ' Else  cast(ProspectId as varchar(10)) end   
 --        +' , ErrorMessage :- '+ case when  (ErrorMessage Is Null OR ErrorMessage='') Then  ' ' Else ErrorMessage end   
 --        , ('Row No :- ' + case when  Id Is Null Then '' Else cast(Id as varchar(5)) end    
 --        +' , ProspectId :- '+ case when  (ProspectId Is Null OR ProspectId=0) Then  ' ' Else cast(ProspectId as varchar(10)) end  
 --        +' , ErrorMessage :- '+ case when  (ErrorMessage Is Null OR ErrorMessage='') Then  ' ' Else ErrorMessage end   
 --        ))  ELSE '' END
   
 --   From ImportProspectsInfo ;  
 --Select @ErrorMessage;  
 select * from ImportProspectsInfo
  
END
GO