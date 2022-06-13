


CREATE PROCEDURE [dbo].[sp_StaticProspects_Save]             
  @SelectQuery [nvarchar](max),      
  @ListId INT,  
  @CreatedDateTime datetime,         
  @CreatedBy varchar(100)         
AS                
 BEGIN        
   
   CREATE TABLE #TEMPStatic  
(  
  ProspectIds VARCHAR(MAX)  
)  
  
  DECLARE @SQL1 NVARCHAR(Max) = 'SELECT         
   Prospects.Id AS ProspectId  FROM Prospects AS Prospects   
   LEFT JOIN  Contacts ON Prospects.Id =Contacts.ProspectId     
   LEFT JOIN  ProspectInformation AS ProspectInformation ON Prospects.Id =ProspectInformation.ProspectId                       
   LEFT JOIN  ProspectStatus AS ProspectStatus ON ProspectInformation.ProspectStatusId =  ProspectStatus.Id                    
   LEFT JOIN  ProspectSize AS ProspectSize  ON ProspectInformation.ProspectSizeId = ProspectSize.Id                  
   LEFT JOIN  ProspectIndustry AS ProspectIndustry ON ProspectInformation.IndustryId = ProspectIndustry.Id Where'+ @SelectQuery   
     
  
INSERT INTO #TEMPStatic    
EXEC sp_executesql @SQL1   
 
    DECLARE @num INT
SELECT @num = count(1) from #TEMPStatic   
	    
IF(@num > 0)
BEGIN
Declare @val Varchar(MAX);   


Select @val = COALESCE(@val + ', ' + ProspectIds, ProspectIds)   
        From #TEMPStatic   


  -- select @val,@ListId,@CreatedDateTime,@CreatedBy,@CreatedDateTime,@CreatedBy,0
-- INSERT Command for Static Prospect Id in StaticProspects Table  
 INSERT INTO StaticProspects  (ProspectIds,	ListId,	CreatedDateTime,	CreatedBy,	ModifiedDateTime,	ModifiedBy,IsDeleted)
 VALUES (@val,@ListId,@CreatedDateTime,@CreatedBy,@CreatedDateTime,@CreatedBy,0)  
   
 END 
    
  
END    