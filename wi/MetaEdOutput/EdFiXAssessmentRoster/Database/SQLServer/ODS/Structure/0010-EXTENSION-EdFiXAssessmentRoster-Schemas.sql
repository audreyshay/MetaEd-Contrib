IF NOT EXISTS (SELECT * FROM sys.schemas WHERE name = N'edfixassessmentroster')
EXEC sys.sp_executesql N'CREATE SCHEMA [edfixassessmentroster]'
GO
