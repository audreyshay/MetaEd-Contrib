CREATE TABLE [dashboard].[RecordCountType] (
    [RecordCountTypeId] INT             NOT NULL,
    [Description]       NVARCHAR (1024) NOT NULL,
    [DisplayName] NVARCHAR(1024) NULL, 
    CONSTRAINT [PK_dashboardRecordCountType] PRIMARY KEY CLUSTERED ([RecordCountTypeId] ASC)
);

