CREATE TABLE [report].[ReportPermissionAssociation]
(
	[ReportId] INT NOT NULL , 
    [PermissionId] INT NOT NULL, 
    PRIMARY KEY ([PermissionId], [ReportId]), 
    CONSTRAINT [FK_ReportPermissionAssociation_Report] FOREIGN KEY ([ReportId]) REFERENCES [report].[Report]([Id]), 
    CONSTRAINT [FK_ReportPermissionAssociation_Permission] FOREIGN KEY ([PermissionId]) REFERENCES [report].[Permission]([Id])
)