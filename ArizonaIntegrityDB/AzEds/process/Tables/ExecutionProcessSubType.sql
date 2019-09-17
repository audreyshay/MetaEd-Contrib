CREATE TABLE [process].[ExecutionProcessSubType] (
    [ExecutionId]      INT NOT NULL,
    [ProcessSubTypeId] INT NOT NULL,
    CONSTRAINT [PK_ExecutionProcessSubType] PRIMARY KEY CLUSTERED ([ExecutionId] ASC, [ProcessSubTypeId] ASC),
    CONSTRAINT [FK_Execution_ExecutionProcessSubType] FOREIGN KEY ([ExecutionId]) REFERENCES [process].[Execution] ([ExecutionId]),
    CONSTRAINT [FK_ExecutionProcessSubType_ProcessSubType] FOREIGN KEY ([ProcessSubTypeId]) REFERENCES [process].[ProcessSubType] ([ProcessSubTypeId])
);




GO



GO


