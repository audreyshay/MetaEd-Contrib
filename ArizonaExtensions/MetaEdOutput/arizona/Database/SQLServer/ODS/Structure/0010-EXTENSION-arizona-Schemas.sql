IF NOT EXISTS (SELECT * FROM sys.schemas WHERE name = N'arizona')
EXEC sys.sp_executesql N'CREATE SCHEMA [arizona]'
GO
