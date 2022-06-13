
CREATE PROCEDURE [dbo].[sp_CreateListFilterQuery_Select]                       
 @CreateListJSON [nvarchar](max)  ,                      
 @SqlQuery VARCHAR(Max) OUTPUT                      
AS                          
 BEGIN                       
  SET NOCOUNT ON;                      
   /*----- Convert Json to XML ------*/                      
  declare @Xml as xml;                       
  SET @Xml = [dbo].[udf_JsonToXml_Parse](LOWER(@CreateListJSON));                        
                        
     /* Read XML Node to a table*/                      
  Create table TempXmltable                        
  (                        
  Id [int] IDENTITY(1,1) NOT NULL,                        
  [Type] nvarchar(10),                        
  [Json] xml                        
  )                        
  Insert into TempXmltable([Type],Json)                        
                        
  SELECT 'primary',T.c.query('.') as Json                          
  FROM   @Xml.nodes('/primary') T(c)                 
              
  /*Check Total No Of recorder in table*/                      
  Declare @TotalNoofRecors int                      
  Select @TotalNoofRecors= max(id) from TempXmltable                       
                        
  DECLARE @count INT = 1,@SubXml Xml;                        
  Declare @FilterOperator nvarchar(10)='OR',@SelectQuery nvarchar(Max)                       
  Set @SelectQuery=''                      
                         
     /* Apply Loop on Node table */                        
  WHILE @count < =@TotalNoofRecors                        
  BEGIN                        
   Select @SubXml=[Json]  from TempXmltable where id=@count               
   if((SELECT t.x.value('(isselected)[1]','varchar(10)')  FROM @SubXml.nodes('primary') t(x)  )='true')                      
    BEGIN                        
     Declare @SubNodeXML nvarchar                      
     /* Get Criteria Selected From Sub Node*/                      
     Create table TempCriteriaSelected                        
     (                        
     Id [int] IDENTITY(1,1) NOT NULL,                        
     [Json] xml                        
     )                        
     Insert into TempCriteriaSelected(Json)                        
     SELECT T.c.query('.') as Json                         
     FROM   @SubXml.nodes('/primary/criteriaselectedvalue') T(c)                
     /* Check how much NoOfcriteriaSelected*/                      
     Declare @nodeCount int, @NoOfcriteriaSelected int                        
     select @nodeCount=1, @NoOfcriteriaSelected=Count(1) from TempCriteriaSelected                        
                               
     /* Apply Loop on CriteriaSelected*/                      
     WHILE @nodeCount < =@NoOfcriteriaSelected                        
       BEGIN                       
       /* Read Inner Xml from criteriaSelected*/                      
       Declare @inerXml xml                        
       select  @inerXml= Json From TempCriteriaSelected where Id=@nodeCount                      
                           
       Declare @SelectedValue nvarchar(max)                      
       /* Get sql query */       
      
        SELECT @SelectedValue=( Case When  Mc.Value='BW' Then ('CoulmnName like '''+t.x.value('(value)[1]',        'varchar(100)') +'%'' ')  
   When  Mc.Value='Contains' Then ('CoulmnName like ''%'+t.x.value('(value)[1]',        'varchar(100)') +'%'' ')  
   When  Mc.Value='ContainsD' Then ('(CoulmnName like ''%'+t.x.value('(value)[1]',        'varchar(100)') +'%'' And CoulmnName IS NOT NULL) ')  
   When  Mc.Value='ContainsDN' Then ('(CoulmnName like ''%'+t.x.value('(value)[1]',        'varchar(100)') +'%'' OR CoulmnName IS NULL) ')  
   When  Mc.Value='DBW' Then ('CoulmnName NOT like '''+t.x.value('(value)[1]',        'varchar(100)') +'%'' ')  
   When  Mc.Value='NotContains' Then ('CoulmnName NOT like ''%'+t.x.value('(value)[1]',        'varchar(100)') +'%'' ')  
   When  Mc.Value='NContainsDN' Then ('(CoulmnName NOT like ''%'+t.x.value('(value)[1]',        'varchar(100)') +'%'' OR CoulmnName IS NULL) ')  
   When  Mc.Value='NContainsD' Then ('(CoulmnName NOT like ''%'+t.x.value('(value)[1]',        'varchar(100)') +'%'' And CoulmnName IS NOT NULL) ')  
   When  Mc.Value='DEW' Then ('CoulmnName NOT like ''%'+t.x.value('(value)[1]',        'varchar(100)') +''' ')  
   When  Mc.Value='EW' Then ('CoulmnName like ''%'+t.x.value('(value)[1]',        'varchar(100)') +''' ')  
   When  Mc.Value='ON' Then ('CoulmnName = Cast( '''+t.x.value('(value)[1]',        'varchar(100)') +''' as datetime) ')  
   When  Mc.Value='ONA' Then ('CoulmnName >= Cast( '''+t.x.value('(value)[1]',        'varchar(100)') +''' as datetime) ')  
   When  Mc.Value='ONB' Then ('CoulmnName <= Cast( '''+t.x.value('(value)[1]',        'varchar(100)') +''' as datetime) ')  
   When  Mc.Value='IN' Then ('CoulmnName IN ( '''+t.x.value('(value)[1]',        'varchar(100)') +''') ')  
   Else ('CoulmnName  ' + Mc.Operand +' '''+t.x.value('(value)[1]',        'varchar(100)') +''' ') END   )                   
       FROM @inerXml.nodes('criteriaselectedvalue') t(x)                       
       Inner Join MasterCriteria Mc on Mc.Value =t.x.value('(selectedoperatorvalue)[1]',        'varchar(100)')    
      
    
       SELECT @FilterOperator =t.x.value('(operatortype)[1]',        'varchar(100)')                        
       FROM @inerXml.nodes('criteriaselectedvalue') t(x)                
                  
   if(@FilterOperator ='' or @FilterOperator Is Null)              
   Set @FilterOperator ='OR'              
   if(@selectedvalue!='' And @selectedvalue Is Not Null)                        
       BEGIN                        
        SELECT @SelectQuery= @SelectQuery+ ' '+Replace(Replace(@SelectedValue,'CoulmnName',(   Case when FieldTableName='Prospect' Then 'p.' when FieldTableName='ProspectInformation' Then 'pi.' when FieldTableName='ProspectStatus'                       
         Then 'ps.' when FieldTableName='ProspectSize'Then 'psz'  when FieldTableName='ProspectIndustry' Then 'pid' end                      
         + Mf.FieldCoumnName )), ',' ,''',''')+ ' '+@FilterOperator                        
        FROM @SubXml.nodes('primary') t(x)                        
        Inner join MasterFields mf on mf.id =t.x.value('(fieldid)[1]',        'int')                       
       END                      
       Else                       
       BEGIN                        
        SELECT @SelectQuery= @SelectQuery+' '+Replace(Replace(@SelectedValue,'CoulmnName',(   Case when FieldTableName='Prospect' Then 'p.' when FieldTableName='ProspectInformation' Then 'pi.' when FieldTableName='ProspectStatus'                       
         Then 'ps.' when FieldTableName='ProspectSize'Then 'psz'  when FieldTableName='ProspectIndustry' Then 'pid' end                      
         + Mf.FieldCoumnName )), ',' ,''',''')                         
        FROM @SubXml.nodes('primary') t(x)                        
        Inner join MasterFields mf on mf.id =t.x.value('(fieldid)[1]',        'int')                       
       END                      
      SET @nodeCount = @nodeCount + 1;                      
      END                       
     drop table TempCriteriaSelected                        
    End                      
   SET @count = @count + 1;                       
  END                        
   if(@SelectQuery!='' and @SelectQuery IS Not Null)                      
    BEGIN                      
     Declare @query nvarchar(max) =left(@SelectQuery, len(@SelectQuery)-len(@FilterOperator))                         
     set @SelectQuery= @query                       
    END                               
   Drop table TempXmltable                  
                             
   SELECT @SqlQuery =   @SelectQuery                      
END                        
--------------------------------------------------------------------------------------------------------------------------------------- 