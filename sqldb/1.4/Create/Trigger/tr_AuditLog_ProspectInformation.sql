-- ===================================================================
-- Author:		<Spectraltech>
-- Create date: <16.03.2022>
-- Description:	<Save audit Log Of ProspectInformation>
-- ====================================================================
Alter TRIGGER tr_AuditLog_ProspectInformation on ProspectInformation 
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
			+ Case When Old.EIN!=New.EIN then '{"FieldName": "EIN" , "oldValue": "' +Cast(Old.EIN  as varchar(100))  +  '" "NewValue":  "' +Cast(New.EIN as varchar(100))+'" }' else '' end
			+ Case When Old.YearsInBusiness!=New.YearsInBusiness then '{"FieldName": "YearsInBusiness" , "oldValue": "' +Cast(Old.YearsInBusiness as varchar(100))  +  '" "NewValue":  "' +Cast(New.YearsInBusiness as varchar(100))+'" }' else '' end
			+ Case When Old.NoOfEmployees!=New.NoOfEmployees then '{"FieldName": "NoOfEmployees" , "oldValue": "'  +CAST(Old.NoOfEmployees as varchar(100))   +  '" "NewValue":  "' +CAST(New.NoOfEmployees as varchar(100))+'" }' else '' end
			+ Case When   Old.Revenue!=New.Revenue then '{"FieldName": "Revenue" , "oldValue": "'  +CAST(Old.Revenue as varchar(100))   +  '" "NewValue":  "' +CAST(New.Revenue as varchar(100))+'" }' else '' end
			+ Case When Old.NonProfit!=New.NonProfit then '{"FieldName": "NonProfit" , "oldValue": "' +Cast(Old.NonProfit as varchar(100))   +  '" "NewValue":  "' +Cast(New.NonProfit as varchar(100))+'" }' else '' end
			+ Case When Old.ProspectSizeId!=New.ProspectSizeId then '{"FieldName": "ProspectSizeId" , "oldValue": "' +Cast(Old.ProspectSizeId as varchar(100))  +  '" "NewValue":  "' +Cast(New.ProspectSizeId as varchar(100))+'" }' else '' end
			+ Case When Old.IndustryId!=New.IndustryId then '{"FieldName": "IndustryId" , "oldValue": "' +Cast(Old.IndustryId as varchar(100))  +  '" "NewValue":  "' +Cast(New.IndustryId as varchar(100))+'" }' else '' end
			+ Case When Old.ProspectStatusId!=New.ProspectStatusId then '{"FieldName": "ProspectStatusId" , "oldValue": "' +Cast(Old.ProspectStatusId as varchar(100))  +  '" "NewValue":  "'+Cast(New.ProspectStatusId as varchar(100))+'" }'  else '' end
			+ Case When Old.IsInsuranceInformationAdded!=New.IsInsuranceInformationAdded then '{"FieldName": "IsInsuranceInformationAdded", "oldValue": "'  ++Cast(Old.IsInsuranceInformationAdded as varchar(100)) +  '" "NewValue":  "' +Cast(New.IsInsuranceInformationAdded as varchar(100))+'" }' else '' end
			+ Case When Old.EXPMOD!=New.EXPMOD then '{"FieldName": "EXPMOD" , "oldValue": "'+CAST(Old.EXPMOD as varchar(100))   +  '" "NewValue":  "' +CAST(New.EXPMOD as varchar(100))+'" }' else '' end
			+ Case When Old.PackageCarrier!=New.PackageCarrier then '{"FieldName": "PackageCarrier" , "oldValue": "'  +Old.PackageCarrier   +  '" "NewValue":  "'+New.PackageCarrier+'}' else '' end
			+ Case When Old.PackageExpirationDate!=New.PackageExpirationDate then '{"FieldName": "PackageExpirationDate" , "oldValue": "'+CAST(Old.PackageExpirationDate as varchar(100))   +  '" "NewValue":  "' +CAST(New.PackageExpirationDate as varchar(100))+'" }' else '' end
			+ Case When Old.PackagePremium!=New.PackagePremium then '{"FieldName": "PackagePremium" , "oldValue": "'  +CAST(Old.PackagePremium as varchar(100))  +  '" "NewValue":  "'+CAST(New.PackagePremium as varchar(100))+'}' else '' end
			+ Case When Old.WorkersCompensationCarrier!=New.WorkersCompensationCarrier then '{"FieldName": "WorkersCompensationCarrier" , "oldValue": "'  +Old.WorkersCompensationCarrier   +  '" "NewValue":  "'+New.WorkersCompensationCarrier+'}' else '' end
			+ Case When Old.WorkersCompensationExpiration!=New.WorkersCompensationExpiration then '{"FieldName": "WorkersCompensationExpiration" , "oldValue": "'+CAST(Old.WorkersCompensationExpiration as varchar(100))   +  '" "NewValue":  "' +CAST(New.WorkersCompensationExpiration as varchar(100))+'" }' else '' end
			+ Case When Old.WorkersCompensationPremium!=New.WorkersCompensationPremium then '{"FieldName": "WorkersCompensationPremium" , "oldValue": "'+CAST(Old.WorkersCompensationPremium as varchar(100))   +  '" "NewValue":  "' +CAST(New.WorkersCompensationPremium as varchar(100))+'" }' else '' end
			+ Case When Old.CreatedDateTime!=New.CreatedDateTime then '{"FieldName": "CreatedDateTime" , "oldValue": "'  +CAST(Old.CreatedDateTime as varchar(100))   +  '" "NewValue":  "' +CAST(New.CreatedDateTime as varchar(100))+'" }' else '' end
			+ Case When Old.ModifiedDateTime!=New.ModifiedDateTime then '{"FieldName": "ModifiedDateTime", "oldValue": "' +CAST(Old.ModifiedDateTime as varchar(100))  +  '" "NewValue":  "' +CAST(New.ModifiedDateTime as varchar(100))+'" }' else '' end  
			+ Case When Old.CreatedBy!=New.CreatedBy then '{"FieldName": "CreatedBy", "oldValue": "' +CAST(Old.CreatedBy as varchar(100))  +  '" "NewValue":  "' +CAST(New.CreatedBy as varchar(100))+'" }' else '' end  
			+ Case When Old.ModifiedBy!=New.ModifiedBy then '{"FieldName": "ModifiedBy" , "oldValue": "'  +CAST(Old.ModifiedBy as varchar(100))   +  '" "NewValue":  "' +CAST(New.ModifiedBy as varchar(100))+'" }' else '' end
			+ Case When Old.IsDeleted!=New.IsDeleted then '{"FieldName": "IsDeleted" , "oldValue": "' +CAST(Old.IsDeleted as varchar(100))  +  '", "NewValue": ' +CAST(New.IsDeleted as varchar(100)) +'}' else '' end
			+']',@inserted , @deleted			
		FROM inserted AS New
		Left Join deleted Old on Old.Id=New.Id;
END
