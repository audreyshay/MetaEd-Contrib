CREATE TABLE [oct1].[IntegrityException] (
    [IntegrityExceptionId] BIGINT        NOT NULL,
    [IntegrityHistoryId]   BIGINT        NOT NULL,
    [ExceptionMessageCode] NVARCHAR (50) NOT NULL,
    [ExceptionSeverityId]  INT           NOT NULL,
    [CreatedDate]          DATETIME      CONSTRAINT [DF_IntegrityException_CreatedDate] DEFAULT (getdate()) NOT NULL,
    CONSTRAINT [PK_IntegrityException] PRIMARY KEY CLUSTERED ([IntegrityExceptionId] ASC),
);

GO

CREATE NONCLUSTERED INDEX [IX_oct1IntegrityException_IntegrityHistoryId]
    ON [oct1].[IntegrityException]([IntegrityHistoryId] ASC);