data.xml

<?xml version='1.0' encoding='UTF-8'?>
<persons>
    <person>
         <id> 1 </id>
         <personsname> AjsonDev </personsname>
         <country> United Kingdom </country>
         <languages>
             <language> C# </language>
             <language> JavaScript </language>
             <language> Python </language>
             <language> Objective-C </language>
             <language> Pascal </language>
             <language> F# </language>
             <language> R </language>
         </languages>
    </person>
    <person>
         <id> 2 </id>
         <personsname> Mahabir </personsname>
         <country> India </country>
         <languages>
              <language> C# </language>
              <language> JavaScript </language>
              <language> C++ </language>
              <langauge> VB 
              <language> SQL </language>
         </langauge></languages> 
    </person>
    <person>
         <id> 3 </id>
         <personsname> Joanna </personsname>
         <country> Netherlands </country>
         <languages>
              <language> Dutch </language>
         <languages>
    </languages></languages></person>
</persons>

 

 

SQL:

USE [aaa]
GO

-- setup a variable to take the file data
Declare @fileData  XML

-- import the file contents into the variable
Select @fileData = BulkColumn from OpenRowSet(Bulk'C:\data.xml',Single_blob) x;


-- insert the xml data into our test table (ID, PersonsName, Country)
insert into [dbo].[test]
           ([ID]
           ,[PersonsName]
           ,[Country])
Select
   xData.value('id[1]','int') ID,        -- 'xData' is our xml content alias
   xData.value('personsname[1]','varChar(50)') PersonsName,
   xData.value('country[1]','varChar(100)') Country
from @fileData.nodes('/persons/person') as x(xData)-- this is the xpath to the individual records we want to extract