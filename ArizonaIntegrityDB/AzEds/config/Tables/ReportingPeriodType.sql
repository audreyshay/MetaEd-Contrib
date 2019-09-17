CREATE TABLE [config].[ReportingPeriodType] (
    [ReportingPeriodTypeId] INT             IDENTITY (1, 1) NOT NULL,
    [Description]           NVARCHAR (1024) NOT NULL,
    CONSTRAINT [PK_ReportingPeriodType] PRIMARY KEY CLUSTERED ([ReportingPeriodTypeId] ASC)
);



