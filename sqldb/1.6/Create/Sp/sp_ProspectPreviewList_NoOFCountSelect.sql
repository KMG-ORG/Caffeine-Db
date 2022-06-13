CREATE PROCEDURE [dbo].[sp_ProspectPreviewList_NoOFCountSelect]     
 @SelectQuery NVARCHAR(Max)   
AS                            
 BEGIN                     
         
  DECLARE @SQL NVARCHAR(Max) = 'SELECT  Count(*) Total  FROM  Prospects AS Prospects         
   LEFT JOIN  Contacts ON Prospects.Id =Contacts.ProspectId           
   LEFT JOIN  ProspectInformation AS ProspectInformation ON Prospects.Id =ProspectInformation.ProspectId                             
   LEFT JOIN  ProspectStatus AS ProspectStatus ON ProspectInformation.ProspectStatusId =  ProspectStatus.Id                          
   LEFT JOIN  ProspectSize AS ProspectSize  ON ProspectInformation.ProspectSizeId = ProspectSize.Id           
   LEFT JOIN FinalDisposition AS final ON final.ProspectId = Prospects.Id       
   LEFT JOIN  ProspectIndustry AS ProspectIndustry ON ProspectInformation.IndustryId = ProspectIndustry.Id Where'+ @SelectQuery                  
           
   Insert into tempDate (Total )       
   EXEC sp_executesql @SQL   
 END