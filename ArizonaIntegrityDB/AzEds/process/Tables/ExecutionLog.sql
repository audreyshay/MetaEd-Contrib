CREATE TABLE [process].[ExecutionLog] (
    [ExecutionLogId] INT             IDENTITY (1, 1) NOT NULL,
    [ExecutionId]    INT             NOT NULL,
    [LogDateTime]    DATETIME        NOT NULL,
    [Message]        NVARCHAR (1000) NOT NULL,
    CONSTRAINT [PK_ExecutionLog] PRIMARY KEY CLUSTERED ([ExecutionLogId] ASC),
    CONSTRAINT [FK_ExecutionLog_Execution] FOREIGN KEY ([ExecutionId]) REFERENCES [process].[Execution] ([ExecutionId])
);




GO


