CREATE TABLE [report].[Permission]
(
	[Id] INT NOT NULL PRIMARY KEY IDENTITY, 
    [ReportPermission] NVARCHAR(50) NULL, 
    [Description] NVARCHAR(50) NULL
)