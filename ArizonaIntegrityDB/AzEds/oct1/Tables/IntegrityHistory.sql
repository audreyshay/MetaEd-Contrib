CREATE TABLE [oct1].[IntegrityHistory] (
    [IntegrityHistoryId]    BIGINT        NOT NULL,
    [FiscalYear]            INT           NOT NULL,
    [ExecutionId]           INT           NOT NULL,
    [MessageId]             NVARCHAR (36) NOT NULL,
    [IntegrityNeedId]       BIGINT        NOT NULL,
	[StudentUSI]			INT			  NULL,
	[SchoolId]				INT			  NULL,
    [IntegrityResultTypeId] INT           CONSTRAINT [DF_IntegrityHistory_IntegrityResultTypeId] DEFAULT ((0)) NOT NULL,
    [IntegrityRunDateTime]  DATETIME      NOT NULL,
    [IntegrityData]         VARCHAR (MAX) NULL,
    [CreatedDate]           DATETIME      CONSTRAINT [DF_IntegrityHistory_CreatedDate] DEFAULT (getdate()) NOT NULL,
    CONSTRAINT [PK_IntegrityHistory] PRIMARY KEY CLUSTERED ([IntegrityHistoryId] ASC),
);
