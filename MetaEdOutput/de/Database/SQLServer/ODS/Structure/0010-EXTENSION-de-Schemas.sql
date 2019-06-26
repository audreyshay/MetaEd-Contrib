IF NOT EXISTS (SELECT * FROM sys.schemas WHERE name = N'de')
EXEC sys.sp_executesql N'CREATE SCHEMA [de]'
GO
