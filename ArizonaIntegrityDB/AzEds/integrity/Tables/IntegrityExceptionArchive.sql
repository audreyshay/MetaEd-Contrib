-- Rchinta 9/13/2017 - Since IntegrityHistoryArchive is now a has natural key of executiond_FiscalYear_historyid ,you cannot have a Fk with historyArchive table just with historyid. Hence we are removing it 
CREATE TABLE [integrity].[IntegrityExceptionArchive] (
    [IntegrityExceptionId] BIGINT        NOT NULL,
    [IntegrityHistoryId]   BIGINT        NOT NULL,
    [ExceptionMessageCode] NVARCHAR (50) NOT NULL,
    [ExceptionSeverityId]  INT           NOT NULL,
    [CreatedDate]          DATETIME      CONSTRAINT [DF_IntegrityExceptionArchive_CreatedDate] DEFAULT (getdate()) NOT NULL,
	[ExceptionDetails]     NVARCHAR (Max)  NULL,
	[Actual]			   NVARCHAR (Max)  NULL,
	[Expected]			   NVARCHAR (Max)  NULL,
    CONSTRAINT [PK_IntegrityExceptionArchive] PRIMARY KEY CLUSTERED ([IntegrityExceptionId] ASC),
    CONSTRAINT [FK_IntegrityExceptionMessage_IntegrityExceptionArchive] FOREIGN KEY ([ExceptionMessageCode]) REFERENCES [integrity].[IntegrityExceptionMessage] ([ExceptionMessageCode]),
    CONSTRAINT [FK_IntegrityExceptionSeverity_IntegrityExceptionArchive] FOREIGN KEY ([ExceptionSeverityId]) REFERENCES [integrity].[ExceptionSeverity] ([ExceptionSeverityId]),
  
);
GO

CREATE NONCLUSTERED INDEX [IXNC_IntegrityExceptionArchive_IntegrityHistoryId] ON [integrity].[IntegrityExceptionArchive]
(
	[IntegrityHistoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
GO