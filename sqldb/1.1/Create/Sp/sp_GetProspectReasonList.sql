 

CREATE proc [dbo].[sp_GetProspectReasonList]
As
Begin

select Id,ProspectInactivationReason from ProspectInactivationReason where IsDeleted=0
End