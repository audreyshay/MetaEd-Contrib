IF NOT EXISTS (SELECT * FROM sys.schemas WHERE name = N'wi')
EXEC sys.sp_executesql N'CREATE SCHEMA [wi]'
GO
