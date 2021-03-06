-- ===========================================================================================
-- Author:		<SpectralTech>
-- Create date: <03.08.2021>
-- Description:	<Get Recall Details by Id >
-- ============================================================================================
CREATE PROCEDURE [dbo].[sp_Recall_SelectById] 
@Id int
AS 
BEGIN
	SELECT 
	d.Id,d.ProspectId,d.RecallDate,d.RecallTime,d.PhoneNumber, d.ScheduledForProspect,d.ContactId,d.ToDate,
	d.ScheduledWithContact,d.ScheduledForProducer,d.ReminderId,r.Value,d.PriorityId,pr.Value as PriorityValue,d.RecallStatusId,m.Status
	FROM Recall AS d  
	LEFT JOIN Contacts AS c ON d.ContactId =c.Id
	LEFT JOIN Priority AS pr ON d.PriorityId =pr.Id
	LEFT JOIN Reminder AS r ON d.ReminderId =r.Id
	LEFT JOIN MasterRecallStatus AS m ON d.RecallStatusId =m.Id
	where (d.IsDeleted=0 or d.IsDeleted IS NULL) AND d.Id =@Id
	ORDER BY  d.Id DESC   
END



 