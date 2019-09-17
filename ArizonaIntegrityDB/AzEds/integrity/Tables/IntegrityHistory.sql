CREATE TABLE [integrity].[IntegrityHistory] (
    [IntegrityHistoryId]    BIGINT        IDENTITY (1, 1) NOT NULL,
    [FiscalYear]            INT           NOT NULL,
    [ExecutionId]           INT           NOT NULL,
    [MessageId]             NVARCHAR (36) NOT NULL,
    [IntegrityNeedId]       BIGINT        NOT NULL,
    [IntegrityResultTypeId] INT           CONSTRAINT [DF_IntegrityHistory_IntegrityResultTypeId] DEFAULT ((0)) NOT NULL,
    [IntegrityRunDateTime]  DATETIME      NOT NULL,
    [IntegrityData]         VARCHAR (MAX) NULL,
    [CreatedDate]           DATETIME      CONSTRAINT [DF_IntegrityHistory_CreatedDate] DEFAULT (getdate()) NOT NULL,
    CONSTRAINT [PK_IntegrityHistory] PRIMARY KEY CLUSTERED ([IntegrityHistoryId] ASC),
    CONSTRAINT [FK_IntegrityHistory_Execution] FOREIGN KEY ([ExecutionId]) REFERENCES [process].[Execution] ([ExecutionId]),
    CONSTRAINT [FK_IntegrityHistory_IntegrityNeed] FOREIGN KEY ([IntegrityNeedId]) REFERENCES [integrity].[IntegrityNeed] ([IntegrityNeedId]),
    CONSTRAINT [FK_IntegrityHistory_IntegrityResultType] FOREIGN KEY ([IntegrityResultTypeId]) REFERENCES [integrity].[IntegrityResultType] ([IntegrityResultTypeId])
);
GO
/****** Object:  Index [IX_IntegrityHistory_IntegrityNeed]    Script Date: 5/29/2018 1:38:46 PM ******/
CREATE NONCLUSTERED INDEX [IX_IntegrityHistory_IntegrityNeed] ON [integrity].[IntegrityHistory]
(
	[IntegrityNeedId] ASC
);
GO
 -- Used for Getting by Execution 
CREATE NONCLUSTERED INDEX [IX_IntegrityHistory_ExecutionId_Messageid_FiscalYear_IntegrityNeedId]
    ON [integrity].[IntegrityHistory]([ExecutionId] ASC,MessageID ASC, [FiscalYear] ASC, [IntegrityNeedId] ASC)
    INCLUDE([IntegrityHistoryId]);

 GO
-- Used for Integrity reports
CREATE NONCLUSTERED INDEX [IX_IntegrityHistory_FiscalYear]
	ON [integrity].[IntegrityHistory] ([FiscalYear],[IntegrityNeedId])
	INCLUDE ([IntegrityHistoryId],[IntegrityResultTypeId])
GO

--Used for SPED72 Report

CREATE NONCLUSTERED INDEX [IX_IntegrityHistory_FiscalYear_IntegrityNeedId_IntegrityResultTypeId]
ON [integrity].[IntegrityHistory] ([FiscalYear],[IntegrityNeedId],[IntegrityResultTypeId])
INCLUDE ([IntegrityHistoryId],[IntegrityRunDateTime])