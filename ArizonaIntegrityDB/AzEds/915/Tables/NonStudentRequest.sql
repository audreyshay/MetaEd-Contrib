CREATE TABLE [915].[NonStudentRequest] (
    [RequestId]      BIGINT   NOT NULL,
    [FiscalYear]     INT      NOT NULL,
    [ResourceTypeId] INT      NOT NULL,
    [CreateDate]     DATETIME CONSTRAINT [DF_NonStudentRequest_CreateDate] DEFAULT (getutcdate()) NOT NULL,
    CONSTRAINT [FK_NonStudentRequest_FiscalYear] FOREIGN KEY ([FiscalYear]) REFERENCES [config].[FiscalYear] ([FiscalYear]),
    CONSTRAINT [FK_NonStudentRequest_Request] FOREIGN KEY ([RequestId]) REFERENCES [915].[Request] ([RequestId]),
    CONSTRAINT [FK_NonStudentRequest_ResourceTypeId] FOREIGN KEY ([ResourceTypeId]) REFERENCES [config].[ResourceType] ([ResourceTypeId])
);

