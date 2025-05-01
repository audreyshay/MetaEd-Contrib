IF NOT EXISTS (SELECT * FROM sys.schemas WHERE name = N'edfixfinance')
EXEC sys.sp_executesql N'CREATE SCHEMA [edfixfinance]'
GO
