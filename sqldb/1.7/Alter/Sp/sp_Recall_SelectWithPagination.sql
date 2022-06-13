-- ===========================================================================================  
-- Author:  <Vibhuti>  
-- Create date: <04.05.2021>  
-- Description: <Get Recalls>  
-- ============================================================================================  
ALTER PROCEDURE [dbo].[sp_Recall_SelectWithPagination]   
 @PageNumber int,        
 @PageSize int    
AS   
BEGIN  
 SELECT   
 d.Id,d.ProspectId,p.ProspectName,d.RecallDate,d.RecallTime,d.PhoneNumber, d.ScheduledForProspect,  
 d.ContactId,d.ToDate,d.ScheduledWithContact,d.ScheduledForProducer,d.ReminderId,  
 r.Value as ReminderValue,d.PriorityId,pr.Value as PriorityValue,d.RecallStatusId,  
 m.Status as RecallStatusValue,d.CreatedBy, COUNT(*) OVER() AS TotalRecords       
 FROM Recall AS d    
 LEFT JOIN Contacts AS c ON d.ContactId =c.Id  
 LEFT JOIN Priority AS pr ON d.PriorityId =pr.Id  
 LEFT JOIN Reminder AS r ON d.ReminderId =r.Id  
 LEFT JOIN MasterRecallStatus AS m ON d.RecallStatusId =m.Id  
 LEFT JOIN Prospects AS p ON d.ProspectId = p.Id
 where (d.IsDeleted=0 or d.IsDeleted IS NULL)   
 ORDER BY  d.Id DESC   
 OFFSET (@PageNumber -1)* @PageSize ROWS        
 FETCH NEXT @PageSize ROWS ONLY         
END  
  
  
  

