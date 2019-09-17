CREATE TABLE [report].[ReportReportServerTypeAssociation]
(
    [ReportId] INT NOT NULL, 
	[ReportServerTypeId] INT NOT NULL,
    PRIMARY KEY ([ReportServerTypeId], [ReportId]),
	CONSTRAINT [FK_ReportReportServerTypeAssociation_ReportServerType] FOREIGN KEY ([ReportServerTypeId]) REFERENCES [report].ReportServerType([ReportServerTypeId]),
	CONSTRAINT [FK_ReportReportServerTypeAssociation_Report] FOREIGN KEY ([ReportId]) REFERENCES [report].[Report]([Id])
)