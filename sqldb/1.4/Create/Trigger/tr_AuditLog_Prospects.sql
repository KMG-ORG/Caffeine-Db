-- ===================================================================
-- Author:		<Spectraltech>
-- Create date: <16.03.2022>
-- Description:	<Save audit Log Of Prospects>
-- ====================================================================
Create TRIGGER tr_AuditLog_Prospects on Prospects
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
  
	declare @inserted xml, @deleted xml ,@json  nvarchar(Max)
	SET @inserted = (SELECT * FROM inserted FOR XML PATH)  
	SET @deleted = (SELECT * FROM deleted FOR XML PATH)  
	if(@ActionType = 'U' )
		BEGIN
			INSERT INTO AuditLog(TableName, ActionType, Username, AuditJson,NewValue,Oldvalue)  
		SELECT @tablename, @ActionType, SUSER_SNAME(),
			  '"row" ['+Case When Old.ProspectName!=New.ProspectName then '{"FieldName": "ProspectName" , "oldValue": "' +Old.ProspectName  +  '", "NewValue":  "' +New.ProspectName+'" }' else '' end
					 +  Case When Old.AddressLine1!=New.AddressLine1 then '{"FieldName": "AddressLine1" , "oldValue": "' +Old.AddressLine1   +  '", "NewValue":  "' +New.AddressLine1+'" }' else '' end
					 +  Case When Old.AddressLine2!=New.AddressLine2 then '{"FieldName": "AddressLine2" , "oldValue": "' +Old.AddressLine1   +  '", "NewValue":  "' +New.AddressLine2+'" }' else '' end
					 +  Case When Old.City!=New.City then '{"FieldName": "City" , "oldValue": "' +Old.City   +  '", "NewValue":  "' +New.City+'" }' else '' end
					 + Case When Old.State!=New.State then '{"FieldName": "State" , "oldValue": "' +Old.State   +  '", "NewValue":  "'+New.State+'" }'  else '' end
					 + Case When Old.ZipCode!=New.ZipCode then '{"FieldName": "ZipCode", "oldValue": "'  +Old.ZipCode  +  '", "NewValue":  "' +New.ZipCode+'" }' else '' end
					 + Case When Old.Territory!=New.Territory then '{"FieldName": "Territory" , "oldValue": "'  +CAST(Old.Territory as varchar(100))   +  '", "NewValue":  "' +CAST(New.Territory as varchar(100))+'" }' else '' end
					 + Case When Old.PhoneNumber!=New.PhoneNumber then '{"FieldName": "PhoneNumber" , "oldValue": "'  +CAST(Old.PhoneNumber as varchar(100))   +  '", "NewValue":  "' +CAST(New.PhoneNumber as varchar(100))+'" }' else '' end
					 + Case When Old.PhoneExtension!=New.PhoneExtension then '{"FieldName": "PhoneExtension" , "oldValue": "'  +CAST(Old.PhoneExtension as varchar(100))   +  '", "NewValue":  "' +CAST(New.PhoneExtension as varchar(100))+'" }' else '' end
					 + Case When Old.Longitude!=New.Longitude then '{"FieldName": "Longitude" , "oldValue": "'  +Old.Longitude   +  '", "NewValue":  "' +New.Longitude+'" }' else '' end
					 + Case When Old.Latitude!=New.Latitude then '{"FieldName": "Latitude" , "oldValue": "'  +Old.Latitude   +  '", "NewValue":  "' +New.Latitude+'" }' else '' end
					 + Case When Old.InActiveReasonId!=New.InActiveReasonId then '{"FieldName": "InActiveReasonId" , "oldValue": "'  +CAST(Old.InActiveReasonId as varchar(10)) +  '", "NewValue":  "' +CAST(New.InActiveReasonId as varchar(10))+'" }' else '' end
					 + Case When Old.EmailAddress!=New.EmailAddress then '{"FieldName": "EmailAddress" , "oldValue": "'  +Old.EmailAddress   +  '", "NewValue":  "' +New.EmailAddress+'" }' else '' end
					 + Case When Old.IsActive!=New.IsActive then '{"FieldName": "IsActive" , "oldValue": "'  +CAST(Old.IsActive as varchar(10))  +  '", "NewValue":  "' +CAST(New.IsActive as varchar(10))+'" }' else '' end
					 + Case When   Old.CreatedDateTime!=New.CreatedDateTime then '{"FieldName": "CreatedDateTime" , "oldValue": "'  +CAST(Old.CreatedDateTime as varchar(100))   +  '", "NewValue":  "' +CAST(New.CreatedDateTime as varchar(100))+'" }' else '' end
					 + Case When  Old.ModifiedDateTime!=New.ModifiedDateTime then '{"FieldName": "ModifiedDateTime", "oldValue": "' +CAST(Old.ModifiedDateTime as varchar(100))  +  '", "NewValue":  "' +CAST(New.ModifiedDateTime as varchar(100))+'" }' else '' end  
					 + Case When  Old.CreatedBy!=New.CreatedBy then '{"FieldName": "CreatedBy", "oldValue": "' +CAST(Old.CreatedBy as varchar(100))  +  '", "NewValue":  "' +CAST(New.CreatedBy as varchar(100))+'" }' else '' end  
					 + Case When  Old.ModifiedBy!=New.ModifiedBy then '{"FieldName": "CreatedBy", "oldValue": "' +CAST(Old.ModifiedBy as varchar(100))  +  '", "NewValue":  "' +CAST(New.ModifiedBy as varchar(100))+'" }' else '' end  
					 + Case When  Old.IsDeleted!=New.IsDeleted then '{"FieldName": "IsDeleted" , "oldValue": "' +CAST(Old.IsDeleted as varchar(100))  +  '", "NewValue": ' +CAST(New.IsDeleted as varchar(100)) +'}' else '' end
					 +']',@inserted , @deleted
		FROM inserted AS new
		Left Join deleted OLd on Old.Id=New.Id;
		END
	Else if(@ActionType = 'I' )
		BEGIN
			INSERT INTO AuditLog(TableName, ActionType, Username, AuditJson,NewValue,Oldvalue)  
		SELECT @tablename, @ActionType, SUSER_SNAME(),
			  '"row" ['+'{"FieldName": "ProspectName" , "oldValue": "", "NewValue":  "' +New.ProspectName+'" }' 
					 + '{"FieldName": "AddressLine1" , "oldValue": "", "NewValue":  "' +New.AddressLine1+'" }'
					 +  '{"FieldName": "AddressLine2" , "oldValue": "", "NewValue":  "' +New.AddressLine2+'" }'
					 + '{"FieldName": "City" , "oldValue": "", "NewValue":  "' +New.City+'" }' 
					 + '{"FieldName": "State" , "oldValue": "", "NewValue":  "'+New.State+'" }' 
					 + '{"FieldName": "ZipCode", "oldValue": "", "NewValue":  "' +New.ZipCode+'" }' 
					 + '{"FieldName": "Territory" , "oldValue": "", "NewValue":  "' +CAST(New.Territory as varchar(100))+'" }'
					 + '{"FieldName": "PhoneNumber" , "oldValue": "", "NewValue":  "' +CAST(New.PhoneNumber as varchar(100))+'" }'
					 + '{"FieldName": "PhoneExtension" , "oldValue": "", "NewValue":  "' +CAST(New.PhoneExtension as varchar(100))+'" }' 
					 + '{"FieldName": "Longitude" , "oldValue": "", "NewValue":  "' +New.Longitude+'" }' 
					 + '{"FieldName": "Latitude" , "oldValue": "", "NewValue":  "' +New.Latitude+'" }' 
					 + '{"FieldName": "InActiveReasonId" , "oldValue": "", "NewValue":  "' +CAST(New.InActiveReasonId as varchar(10))+'" }'
					 + '{"FieldName": "EmailAddress" , "oldValue": "", "NewValue":  "' +New.EmailAddress+'" }' 
					 + '{"FieldName": "IsActive" , "oldValue": "", "NewValue":  "" }' 
					 + '{"FieldName": "CreatedDateTime" , "oldValue": "", "NewValue":  "' +CAST(New.CreatedDateTime as varchar(100))+'" }' 
					 + '{"FieldName": "ModifiedDateTime", "oldValue": "", "NewValue":  "' +CAST(New.ModifiedDateTime as varchar(100))+'" }'  
					 + '{"FieldName": "CreatedBy", "oldValue": "", "NewValue":  "' +CAST(New.CreatedBy as varchar(100))+'" }'  
					 + '{"FieldName": "CreatedBy", "oldValue": "", "NewValue":  "' +CAST(New.ModifiedBy as varchar(100))+'" }' 
					 + '{"FieldName": "IsDeleted" , "oldValue": ""NewValue": ' +CAST(New.IsDeleted as varchar(100)) +'}' 
					 +']',@inserted , @deleted
		FROM inserted AS new
		END
END
