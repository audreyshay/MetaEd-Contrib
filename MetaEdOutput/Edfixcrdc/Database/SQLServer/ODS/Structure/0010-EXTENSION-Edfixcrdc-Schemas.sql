IF NOT EXISTS (SELECT * FROM sys.schemas WHERE name = N'edfixcrdc')
EXEC sys.sp_executesql N'CREATE SCHEMA [edfixcrdc]'
GO
