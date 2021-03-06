-- ===========================================================================================
-- Author:		<Vibhuti>
-- Create date: <04.05.2021>
-- Description:	<Get Recalls>
-- ============================================================================================
CREATE PROCEDURE [dbo].[sp_Recall_Select] 
AS  
BEGIN
	SELECT 
	d.Id,d.ProspectId,d.RecallDate,d.RecallTime,d.PhoneNumber, d.ScheduledForProspect,
	d.ContactId,d.ToDate,d.ScheduledWithContact,d.ScheduledForProducer,d.ReminderId,
	r.Value as ReminderValue,d.PriorityId,pr.Value as PriorityValue,d.RecallStatusId,
	m.Status as RecallStatusValue,d.CreatedBy
	FROM Recall AS d  
	LEFT JOIN Contacts AS c ON d.ContactId =c.Id
	LEFT JOIN Priority AS pr ON d.PriorityId =pr.Id
	LEFT JOIN Reminder AS r ON d.ReminderId =r.Id
	LEFT JOIN MasterRecallStatus AS m ON d.RecallStatusId =m.Id
	where (d.IsDeleted=0 or d.IsDeleted IS NULL) 
	ORDER BY  d.Id DESC   
END



 