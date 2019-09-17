CREATE TABLE [report].[Report]
(
	[Id] INT NOT NULL PRIMARY KEY IDENTITY, 
    [ReportId] NVARCHAR(64) NOT NULL, 
    [IsActive] BIT NOT NULL, 
    [Name] NVARCHAR(64) NOT NULL, 
    [DisplayName] NVARCHAR(256) NOT NULL, 
    [Description] NVARCHAR(1024) NOT NULL, 
    [CanExportToPdf] BIT NOT NULL, 
    [CanExportToExcel] BIT NOT NULL, 
    [CanExportToWord] BIT NOT NULL, 
    [CanExportToCsv] BIT NOT NULL, 
    [PermittedEdOrgIdParameterName] NVARCHAR(50) NULL, 
    [IsReportPathFiscalYearDependent] BIT NOT NULL DEFAULT 1, 
    [EffectiveFromFiscalYear] INT NOT NULL DEFAULT 2016, 
    [EffectiveToFiscalYear] INT NOT NULL DEFAULT 2099, 
    [QRGLink] NVARCHAR(255) NULL
)