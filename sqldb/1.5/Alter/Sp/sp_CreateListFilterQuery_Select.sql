 
GO
ALTER PROCEDURE [dbo].[sp_CreateListFilterQuery_Select]                                           
 @CreateListJSON [nvarchar](max)  ,                                              
 @CreateListJSONGroup [nvarchar](max)  ,                                                             
 @SqlQuery VARCHAR(Max) OUTPUT                                            
AS                                                
 BEGIN                                             
  SET NOCOUNT ON;                                            
   /*----- Convert Json to XML ------*/                                            
  declare @Xml as xml;                                             
  SET @Xml = [dbo].[udf_JsonToXml_Parse](LOWER(@CreateListJSON));                                              
                        
                                           
     /* Read XML Node to a table*/       
 IF EXISTS(SELECT * FROM sys.tables WHERE SCHEMA_NAME(schema_id) LIKE 'dbo' AND name like 'TempXmltable')    
   DROP TABLE [dbo].[TempXmltable];   
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
  Select @TotalNoofRecors= max(id) from TempXmltable   where [Type] ='primary'                                          
                                              
  DECLARE @count INT = 1,@SubXml Xml;                                              
  Declare @FilterOperator nvarchar(10)='OR',@SelectQuery nvarchar(Max)                                             
  Set @SelectQuery=''                                            
                                             
     /* Apply Loop on Node table for primary*/                                              
  WHILE @count < =@TotalNoofRecors                                              
  BEGIN                                              
   Select @SubXml=[Json]  from TempXmltable where id=@count AND [Type] ='primary'                                    
   if((SELECT t.x.value('(isselected)[1]','varchar(10)')  FROM @SubXml.nodes('primary') t(x)  )='true')                                            
    BEGIN                                              
     Declare @SubNodeXML nvarchar                                            
     /* Get Criteria Selected From Sub Node*/        
  IF EXISTS(SELECT * FROM sys.tables WHERE SCHEMA_NAME(schema_id) LIKE 'dbo' AND name like 'TempCriteriaSelected')    
   DROP TABLE [dbo].[TempCriteriaSelected];     
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
        SELECT @SelectQuery= @SelectQuery+ ' '+Replace(Replace(@SelectedValue,'CoulmnName',(FieldTableName+'.'+ Mf.FieldCoumnName )), ',' ,''',''')+ ' '+@FilterOperator                                              
        FROM @SubXml.nodes('primary') t(x)                                              
        Inner join MasterFields mf on mf.id =t.x.value('(fieldid)[1]',        'int')                                             
      END                                            
       Else                                             
       BEGIN                                              
        SELECT @SelectQuery= @SelectQuery+' '+Replace(Replace(@SelectedValue,'CoulmnName',(  FieldTableName                                         
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
 /* Apply Loop on Node table for group*/    
 IF EXISTS(SELECT * FROM sys.tables WHERE SCHEMA_NAME(schema_id) LIKE 'dbo' AND name like 'TempSubXmltable')    
   DROP TABLE [dbo].[TempSubXmltable];   
 Create table TempSubXmltable                                              
 (                                              
 Id [int] IDENTITY(1,1) NOT NULL,                                              
 [fieldid] varchar(20),                                              
 [Json] xml                                              
 )         
     
    
 declare @XmlGroup as xml;                                             
 SET @XmlGroup = [dbo].[udf_JsonToXml_Parse](LOWER(@CreateListJSONGroup));                       
 if(cast(@XmlGroup as nvarchar(max))  !='' AND @XmlGroup IS NOT NULL)                      
 BEGIN                        
    Truncate table TempXmltable                    
    Insert into TempXmltable([Type],Json)                        
    SELECT 'group',T.c.query('.') as Json                                                
    FROM   @XmlGroup.nodes('/group') T(c)                      
    Set @count=1                    
                       
    Select @TotalNoofRecors= max(id) from TempXmltable   where [Type] ='group'                 
               
    WHILE @count < =@TotalNoofRecors                                              
    BEGIN                         
     Select @SubXml=[Json]  from TempXmltable where id=@count AND [Type] ='group'                          
     SELECT @FilterOperator =  t.x.value('(grouptype)[1]','varchar(20)')  FROM @SubXml.nodes('group') t(x)                       
              
  Declare @SubNXMLGroup nvarchar                     
                    
    if(@FilterOperator in('OR','AND'))                      
    BEGIN                      
 /* Get Criteria Selected From Sub Node  */      
 IF EXISTS(SELECT * FROM sys.tables WHERE SCHEMA_NAME(schema_id) LIKE 'dbo' AND name like 'TempCriteriaSelected')    
   DROP TABLE [dbo].[TempCriteriaSelected];  
     Create table TempCriteriaSelected                                              
     (                                              
     Id [int] IDENTITY(1,1) NOT NULL,                       
  [fieldid] varchar(20),                       
     [fieldname] varchar(20),                      
     [isselected] varchar(20),                      
     [Json] xml                                              
     )                        
     Insert into TempCriteriaSelected([fieldid],[fieldname],[isselected],Json)                                              
     SELECT T.c.value('(fieldid)[1]','varchar(20)'),                      
     T.c.value('(fieldname)[1]','varchar(20)'),T.c.value('(isselected)[1]','varchar(20)'),                      
     T.c.query('(criteriaselectedvalue)')                                         
     FROM   @SubXml.nodes('/group/criteria') T(c)                        
    Declare @nCount int, @NoOfcriteria int                                              
    select @nCount=1, @NoOfcriteria=Count(1) from TempCriteriaSelected          
 /* Apply Loop on CriteriaSelected*/                                            
    WHILE @nCount < =@NoOfcriteria                                              
      BEGIN                          
       Declare @groupSelectedValue nvarchar(max)       
       /* Read Inner Xml from criteriaSelected*/                                            
       Declare @groupInerXml xml                      
      if(@FilterOperator ='' or @FilterOperator Is Null)                                    
       Set @FilterOperator ='OR'                     
       DECLARE @fieldId varchar(20)='',@NoofRecors Int, @CCount Int ;         
       Select  @groupInerXml= Json ,@fieldId=  fieldid From TempCriteriaSelected where Id=@nCount         
                
  Truncate table TempSubXmltable        
     Insert into TempSubXmltable([fieldid],Json)           
  SELECT @fieldId,T.c.query('.') as Json          
  FROM   @groupInerXml.nodes('/criteriaselectedvalue') T(c)           
          
    Select @NoofRecors= Max(Id), @CCount=Min(Id) from TempSubXmltable        
 WHILE @CCount < =@NoofRecors                                              
      BEGIN        
    SELECT @groupInerXml=Json from TempSubXmltable where Id =@CCount        
    DECLARE @OperatorType Varchar(20)=' ';        
    If(@groupSelectedValue ='' OR @groupSelectedValue Is Null)             
    BEGIN                     
    SET @groupSelectedValue= ' ( ' ;            
    END              
    BEGIN             
     SELECT @OperatorType= t.x.value('(operatortype)[1]',        'varchar(100)') +' ',        
      @groupSelectedValue= ' ' +@groupSelectedValue+' '+ ( Case When  Mc.Value='BW' Then ('CoulmnName like '''+t.x.value('(value)[1]',        'varchar(100)') +'%'' ')                        
      When  Mc.Value='Contains' Then ('CoulmnName like ''%'+t.x.value('(value)[1]',        'varchar(100)') +'%'' ')                        
      When  Mc.Value='ContainsD' Then ('(CoulmnName like ''%'+t.x.value('(value)[1]',        'varchar(100)') +'%'' And CoulmnName IS NOT NULL) ')                        
      When Mc.Value='ContainsDN' Then ('(CoulmnName like ''%'+t.x.value('(value)[1]',        'varchar(100)') +'%'' OR CoulmnName IS NULL) ')                        
      When  Mc.Value='DBW' Then ('CoulmnName NOT like '''+t.x.value('(value)[1]',        'varchar(100)') +'%'' ')                        
      When  Mc.Value='NotContains' Then ('CoulmnName NOT like ''%'+t.x.value('(value)[1]', 'varchar(100)') +'%'' ')                        
      When  Mc.Value='NContainsDN' Then ('(CoulmnName NOT like ''%'+t.x.value('(value)[1]',        'varchar(100)') +'%'' OR CoulmnName IS NULL) ')                        
      When  Mc.Value='NContainsD' Then ('(CoulmnName NOT like ''%'+t.x.value('(value)[1]',     'varchar(100)') +'%'' And CoulmnName IS NOT NULL) ')                        
      When  Mc.Value='DEW' Then ('CoulmnName NOT like ''%'+t.x.value('(value)[1]',        'varchar(100)') +''' ')                        
      When  Mc.Value='EW' Then ('CoulmnName like ''%'+t.x.value('(value)[1]',        'varchar(100)') +''' ')                        
      When  Mc.Value='ON' Then ('CoulmnName = Cast( '''+t.x.value('(value)[1]',        'varchar(100)') +''' as datetime) ')                        
      When  Mc.Value='ONA' Then ('CoulmnName >= Cast( '''+t.x.value('(value)[1]',        'varchar(100)') +''' as datetime) ')                        
      When  Mc.Value='ONB' Then ('CoulmnName <= Cast( '''+t.x.value('(value)[1]',        'varchar(100)') +''' as datetime) ')                        
      When  Mc.Value='IN' Then ('CoulmnName IN ( '''+t.x.value('(value)[1]',        'varchar(100)') +''') ')                        
      Else ('CoulmnName  ' + Mc.Operand +' '''+t.x.value('(value)[1]',        'varchar(100)') +''' ') END   )                
     FROM @groupInerXml.nodes('criteriaselectedvalue') t(x)                                             
     Inner Join MasterCriteria Mc on Mc.Value =t.x.value('(selectedoperatorvalue)[1]',        'varchar(100)')            END            
         SELECT @groupSelectedValue= ' '+Replace(Replace(@groupSelectedValue,'CoulmnName',(  FieldTableName+'.'                                          
   + Mf.FieldCoumnName )), ',' ,''',''')                                           
  FROM   TempSubXmltable t                                              
  Inner join MasterFields mf on mf.id =t.fieldid        
  WHERE  t.Id =@CCount       
        
    if(@CCount = @NoofRecors)        
     BEGIN        
    Set @groupSelectedValue =@groupSelectedValue+ ' ) '        
    If(@nCount< @NoOfcriteria)        
      Set @groupSelectedValue =@groupSelectedValue+ ' ' +@FilterOperator+' ( ';        
    END        
    if (@CCount < @NoofRecors)        
      BEGIN        
     Set @groupSelectedValue =@groupSelectedValue+' '+ @OperatorType        
   END        
    SET @CCount=@CCount+1;        
   END        
     set @nCount=@nCount+1;                         
      END                   
    if(@groupSelectedValue!='' and @groupSelectedValue IS Not Null)                                            
  BEGIN                         
    if(@groupSelectedValue like ('%'+@FilterOperator+' ) ') )                                           
   BEGIN           
    set @query =left(@groupSelectedValue, len(@groupSelectedValue)-len(@FilterOperator+' ) '))                                               
    set @groupSelectedValue= @query +' ) '                     
  END                
   IF(@count < @TotalNoofRecors )                     
    Set @groupSelectedValue =@groupSelectedValue+ ' OR (';              
  END                                  
  END                      
  Set @count= @count+1             
          
    END               
  Drop table TempCriteriaSelected              
    if(@groupSelectedValue!='' and @groupSelectedValue IS Not Null)                                            
    BEGIN                    
    if(@groupSelectedValue like '% OR (')                                            
  BEGIN                          
   Set @query =left(@groupSelectedValue, len(@groupSelectedValue)-len(' OR ('))                                               
   Set @groupSelectedValue= @query                      
  END                
    END                       
                  
 END               
 if(@groupSelectedValue!='' AND @groupSelectedValue IS NOT NULL)          
  SET @SelectQuery= '( '+@SelectQuery+  ') AND ( '+ @groupSelectedValue+' )'               
   Drop table TempXmltable           
   DROP Table TempSubXmltable             
 Select @SqlQuery= @SelectQuery         
     
       
END                                              
--------------------------------------------------------------------------------------------------------------------------------------- 
   


---------------------------------------------------------------------- 