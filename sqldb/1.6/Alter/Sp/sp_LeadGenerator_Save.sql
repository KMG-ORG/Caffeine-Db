-- =============================================      
-- Author:  <Bhavya>      
-- Create date: <10.26.2021>      
-- Description: <Save LeadGenerator>      
-- =============================================      
ALTER PROCEDURE [dbo].[sp_LeadGenerator_Save]      
(    
 @Id int OUTPUT,      
 @Value varchar(100),       
 @OwnerId int,    
 @CreatedDateTime datetime,      
 @CreatedBy varchar(100)    
)      
AS      
BEGIN       
 SET IDENTITY_INSERT LeadGenerator OFF    
 INSERT INTO LeadGenerator (Value,OwnerId,CreatedDateTime,ModifiedDateTime,CreatedBy,ModifiedBy,IsDeleted)     
 VALUES (@Value,@OwnerId,@CreatedDateTime,@CreatedDateTime,@CreatedBy,@CreatedBy,0)       
 SET @Id=SCOPE_IDENTITY()     
 SELECT @Id      
END