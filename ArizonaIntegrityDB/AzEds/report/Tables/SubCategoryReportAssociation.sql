CREATE TABLE [report].[SubCategoryReportAssociation]
(
	[SubCategoryId] INT NOT NULL , 
    [ReportId] INT NOT NULL, 
    PRIMARY KEY ([SubCategoryId], [ReportId]),
	CONSTRAINT [FK_SubCategoryReportAssociation_SubCategory] FOREIGN KEY ([SubCategoryId]) REFERENCES [report].[SubCategory]([Id]),
	CONSTRAINT [FK_SubCategoryReportAssociation_Report] FOREIGN KEY ([ReportId]) REFERENCES [report].[Report]([Id])
)