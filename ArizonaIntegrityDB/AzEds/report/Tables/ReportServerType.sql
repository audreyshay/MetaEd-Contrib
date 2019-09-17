CREATE TABLE [report].[ReportServerType]
(
	[ReportServerTypeId] INT NOT NULL PRIMARY KEY IDENTITY, 
    [ReportServer] NVARCHAR(50) NOT NULL, 
    [ReportPath] NVARCHAR(50) NOT NULL,
	[ReportServerService] NVARCHAR(500) NOT NULL 
)
