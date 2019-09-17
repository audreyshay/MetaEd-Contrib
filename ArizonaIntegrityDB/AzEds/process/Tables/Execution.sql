CREATE TABLE [process].[Execution] (
    [ExecutionId]         INT            IDENTITY (1, 1) NOT NULL,
    [ProcessTypeId]       INT            NOT NULL,
    [ExecutionTypeId]     INT            NOT NULL,
    [InitiatedDateTime]   DATETIME       NOT NULL,
	[StartDateTime]       DATETIME       NULL,
    [EndDateTime]         DATETIME       NULL,
    [CancelledDateTime]   DATETIME       NULL,
    [InitiatedByUserName] NVARCHAR (100) NOT NULL,
    [CancelledByUserName] NVARCHAR (100) NULL,
    [FiscalYear]          INT            NOT NULL,
    [StatusTypeId]        INT            NOT NULL,
    [Comment]             NVARCHAR (MAX) NULL,
    [ReferenceExecutionId] INT NULL, 
    [DataLoadTypeId] INT NULL, 
    CONSTRAINT [PK_Execution] PRIMARY KEY CLUSTERED ([ExecutionId] ASC),
    CONSTRAINT [FK_Execution_ExecutionType] FOREIGN KEY ([ExecutionTypeId]) REFERENCES [process].[ExecutionType] ([ExecutionTypeId]),
    CONSTRAINT [FK_Execution_ProcessType] FOREIGN KEY ([ProcessTypeId]) REFERENCES [process].[ProcessType] ([ProcessTypeId]),
    CONSTRAINT [FK_Execution_StatusType] FOREIGN KEY ([StatusTypeId]) REFERENCES [process].[StatusType] ([StatusTypeId]),
	CONSTRAINT [FK_Execution_ReferenceExecution] FOREIGN KEY ([ReferenceExecutionId]) REFERENCES [process].[Execution] ([ExecutionId]),
	CONSTRAINT [FK_Execution_DataLoadType] FOREIGN KEY ([DataLoadTypeId]) REFERENCES [process].[DataLoadType] ([DataLoadTypeId])
);




GO



GO



GO


