IF NOT EXISTS (SELECT * FROM sys.schemas WHERE name = N'crisis')
EXEC sys.sp_executesql N'CREATE SCHEMA [crisis]'
GO
