IF NOT EXISTS (SELECT * FROM sys.schemas WHERE name = N'edfixlearningmodality')
EXEC sys.sp_executesql N'CREATE SCHEMA [edfixlearningmodality]'
GO
