-- ===================================================================
-- Author:		<Spectraltech>
-- Create date: <16.03.2022>
-- Description:	<Save audit Log Of Contacts>
-- ====================================================================
Create TRIGGER tr_AuditLog_Contacts on Contacts 
FOR INSERT, UPDATE  
AS  
BEGIN  
SET NOCOUNT ON;  
 IF NOT EXISTS(SELECT 1 FROM deleted) AND NOT EXISTS(SELECT 1 FROM inserted)   
    RETURN;  
  
	declare @tablename varchar(100)  
	SELECT @tablename = OBJECT_NAME(parent_object_id)   
    FROM sys.objects   
    WHERE sys.objects.name = OBJECT_NAME(@@PROCID)  
  
/*Action*/  
	DECLARE @ActionType char(1)  
	IF EXISTS (SELECT * FROM inserted)  
       IF EXISTS (SELECT * FROM deleted)  
               SELECT @ActionType = 'U'  
       ELSE  
               SELECT @ActionType = 'I'  
	ELSE  
       SELECT @ActionType = 'D'  
  
	declare @inserted xml, @deleted xml ,@Json nvarchar(max)  
	SET @inserted = (SELECT * FROM inserted FOR XML PATH)  
	SET @deleted = (SELECT * FROM deleted FOR XML PATH) 
	
	INSERT INTO AuditLog(TableName, ActionType, Username, AuditJson,NewValue,Oldvalue)  
	SELECT @tablename, @ActionType, SUSER_SNAME(), '"row" ['+
			  Case When Old.ProspectId!=New.ProspectId then '{"FieldName": "ProspectId" , "oldValue": ' +CAST(Old.ProspectId as varchar(100))+  '", "NewValue": ' +CAST(New.ProspectId as varchar(100))+'}' else '' end+ 
			   + Case When Old.FirstName!=New.FirstName then '{"FieldName": "FirstName" , "oldValue": "' +Old.FirstName  +  '" "NewValue":  "' +New.FirstName+'" }' else '' end
			  /*+ Case When Old.FirstName!=New.MiddleName then '{"FieldName": "MiddleName" , "oldValue": "' +Old.MiddleName  +  '" "NewValue":  "' +New.MiddleName+'" }' else '' end
			  */+ Case When Old.LastName!=New.LastName then '{"FieldName": "LastName" , "oldValue": "' +Old.LastName  +  '" "NewValue":  "' +New.LastName+'" }' else '' end
			   + Case When   Old.IsAddressSameAsProspect!=New.IsAddressSameAsProspect then '{"FieldName": "IsAddressSameAsProspect" , "oldValue": "'  +CAST(Old.IsAddressSameAsProspect as varchar(100))   +  '" "NewValue":  "' +CAST(New.IsAddressSameAsProspect as varchar(100))+'" }' else '' end
			  + Case When   Old.IsNpsNominated!=New.IsNpsNominated then '{"FieldName": "CreatedDateTime" , "oldValue": "'  +CAST(Old.IsNpsNominated as varchar(100))   +  '" "NewValue":  "' +CAST(New.IsNpsNominated as varchar(100))+'" }' else '' end
			 + Case When Old.FirstName!=New.MiddleName then '{"FieldName": "JobTitle" , "oldValue": "' +Old.JobTitle  +  '" "NewValue":  "' +New.JobTitle+'" }' else '' end
			  +  Case When Old.Office1AddressLine1!=New.Office1AddressLine1 then '{"FieldName": "Office1AddressLine1" , "oldValue": "' +Old.Office1AddressLine1   +  '" "NewValue":  "' +New.Office1AddressLine1+'" }' else '' end
			  +  Case When Old.Office1AddressLine2!=New.Office1AddressLine2 then '{"FieldName": "Office1AddressLine2" , "oldValue": "' +Old.Office1AddressLine2   +  '" "NewValue":  "' +New.Office1AddressLine2+'" }' else '' end
			  +  Case When Old.Office1City!=New.Office1City then '{"FieldName": "Office1City" , "oldValue": "' +Old.Office1City   +  '" "NewValue":  "' +New.Office1City+'" }' else '' end
			  + Case When Old.Office1State!=New.Office1State then '{"FieldName": "Office1State" , "oldValue": "' +Old.Office1State   +  '" "NewValue":  "'+New.Office1State+'" }'  else '' end
			  + Case When Old.Office1ZipCode!=New.Office1ZipCode then '{"FieldName": "Office1ZipCode", "oldValue": "'  +Old.Office1ZipCode  +  '" "NewValue":  "' +New.Office1ZipCode+'" }' else '' end
			  + Case When Old.Office1PhoneNumber!=New.Office1PhoneNumber then '{"FieldName": "Office1PhoneNumber" , "oldValue": "'+CAST(Old.Office1PhoneNumber as varchar(100))   +  '" "NewValue":  "' +CAST(New.Office1PhoneNumber as varchar(100))+'" }' else '' end
			  + Case When Old.Office1Email!=New.Office1Email then '{"FieldName": "Office1Email" , "oldValue": "'  +Old.Office1Email   +  '" "NewValue":  "'+New.Office1Email+'}' else '' end
			  + Case When Old.Office1Extension!=New.Office1Extension then '{"FieldName": "Office1Extension" , "oldValue": "'+CAST(Old.Office1Extension as varchar(100))   +  '" "NewValue":  "' +CAST(New.Office1Extension as varchar(100))+'" }' else '' end
			  + Case When Old.Office1Fax!=New.Office1Fax then '{"FieldName": "Office1Fax" , "oldValue": "'  +CAST(Old.Office1Fax as varchar(100))  +  '" "NewValue":  "'+CAST(New.Office1Fax as varchar(100))+'}' else '' end
			  + Case When   Old.CreatedDateTime!=New.CreatedDateTime then '{"FieldName": "CreatedDateTime" , "oldValue": "'  +CAST(Old.CreatedDateTime as varchar(100))   +  '" "NewValue":  "' +CAST(New.CreatedDateTime as varchar(100))+'" }' else '' end
			 + Case When  Old.ModifiedDateTime!=New.ModifiedDateTime then '{"FieldName": "ModifiedDateTime", "oldValue": "' +CAST(Old.ModifiedDateTime as varchar(100))  +  '" "NewValue":  "' +CAST(New.ModifiedDateTime as varchar(100))+'" }' else '' end  
			  + Case When  Old.CreatedBy!=New.CreatedBy then '{"FieldName": "CreatedBy", "oldValue": "' +CAST(Old.CreatedBy as varchar(100))  +  '" "NewValue":  "' +CAST(New.CreatedBy as varchar(100))+'" }' else '' end  
			+ Case When   Old.ModifiedBy!=New.ModifiedBy then '{"FieldName": "ModifiedBy" , "oldValue": "'  +CAST(Old.ModifiedBy as varchar(100))   +  '" "NewValue":  "' +CAST(New.ModifiedBy as varchar(100))+'" }' else '' end
			+ Case When  Old.IsDeleted!=New.IsDeleted then '{"FieldName": "IsDeleted" , "oldValue": "' +CAST(Old.IsDeleted as varchar(100))  +  '", "NewValue": ' +CAST(New.IsDeleted as varchar(100)) +'}' else '' end
			+']',@inserted , @deleted			
    FROM inserted AS New
	Left Join deleted Old on Old.Id=New.Id;
END
