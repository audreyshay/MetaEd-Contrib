CREATE TABLE [integrity].[IntegrityException] (
    [IntegrityExceptionId] BIGINT        IDENTITY (1, 1) NOT NULL,
    [IntegrityHistoryId]   BIGINT        NOT NULL,
    [ExceptionMessageCode] NVARCHAR (50) NOT NULL,
    [ExceptionSeverityId]  INT           NOT NULL,
    [CreatedDate]          DATETIME      CONSTRAINT [DF_Exception_CreatedDate] DEFAULT (getdate()) NOT NULL,
	[ExceptionDetails]     NVARCHAR (Max)  NULL,
	[Actual]			   NVARCHAR (Max)  NULL,
	[Expected]			   NVARCHAR (Max)  NULL,
    CONSTRAINT [PK_IntegrityException] PRIMARY KEY CLUSTERED ([IntegrityExceptionId] ASC),
    CONSTRAINT [FK_IntegrityExceptionMessage_IntegrityException] FOREIGN KEY ([ExceptionMessageCode]) REFERENCES [integrity].[IntegrityExceptionMessage] ([ExceptionMessageCode]),
    CONSTRAINT [FK_IntegrityExceptionSeverity_IntegrityException] FOREIGN KEY ([ExceptionSeverityId]) REFERENCES [integrity].[ExceptionSeverity] ([ExceptionSeverityId]),
    CONSTRAINT [FK_IntegrityHistory_IntegrityException] FOREIGN KEY ([IntegrityHistoryId]) REFERENCES [integrity].[IntegrityHistory] ([IntegrityHistoryId])
);




GO
CREATE NONCLUSTERED INDEX [IX_IntegrityException_IntegrityHistoryId]
    ON [integrity].[IntegrityException]([IntegrityHistoryId] ASC);

