CREATE TABLE [integrity].[IntegrityHistoryArchive] (
    [IntegrityHistoryId]    BIGINT        NOT NULL,
    [FiscalYear]            INT           NOT NULL,
    [ExecutionId]           INT           NOT NULL,
    [MessageId]             NVARCHAR (36) NOT NULL,
    [IntegrityNeedId]       BIGINT        NOT NULL,
    [IntegrityResultTypeId] INT           CONSTRAINT [DF_IntegrityHistoryArchive_IntegrityResultTypeId] DEFAULT ((0)) NOT NULL,
    [IntegrityRunDateTime]  DATETIME      NOT NULL,
    [IntegrityData]         VARCHAR (MAX) NULL,
    [CreatedDate]           DATETIME      CONSTRAINT [DF_IntegrityHistoryArchive_CreatedDate] DEFAULT (getdate()) NOT NULL,
    CONSTRAINT [PK_IntegrityHistoryArchive] PRIMARY KEY CLUSTERED ([ExecutionID] ASC, [FiscalYear] ASC,[IntegrityHistoryId] ASC),
    CONSTRAINT [FK_IntegrityHistoryArchive_Execution] FOREIGN KEY ([ExecutionId]) REFERENCES [process].[Execution] ([ExecutionId]),
    --CONSTRAINT [FK_IntegrityHistoryArchive_IntegrityNeed] FOREIGN KEY ([IntegrityNeedId]) REFERENCES [integrity].[IntegrityNeed] ([IntegrityNeedId]),
    CONSTRAINT [FK_IntegrityHistoryArchive_IntegrityResultType] FOREIGN KEY ([IntegrityResultTypeId]) REFERENCES [integrity].[IntegrityResultType] ([IntegrityResultTypeId])
);
GO

