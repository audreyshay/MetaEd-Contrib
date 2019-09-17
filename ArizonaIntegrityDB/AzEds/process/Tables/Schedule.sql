CREATE TABLE [process].[Schedule]
(
	[FiscalYear] INT NOT NULL, 
	[ProcessTypeId] INT NOT NULL,
    [ExecutionOrder] INT NOT NULL, 
    [ExecutionTypeId] INT NOT NULL, 
    [DataLoadTypeId] INT NULL, 
    [IsActive] BIT NOT NULL, 
    [StopFurtherProcessingUponFailure] BIT NOT NULL, 
    CONSTRAINT [PK_Schedule] PRIMARY KEY CLUSTERED ([FiscalYear], [ProcessTypeId],[ExecutionTypeId]),
	CONSTRAINT [FK_Schedule_DataLoadType] FOREIGN KEY ([DataLoadTypeId]) REFERENCES [process].[DataLoadType] ([DataLoadTypeId]),
	CONSTRAINT [FK_Schedule_ExecutionType] FOREIGN KEY ([ExecutionTypeId]) REFERENCES [process].[ExecutionType] ([ExecutionTypeId]),
	CONSTRAINT [FK_Schedule_FiscalYear] FOREIGN KEY ([FiscalYear]) REFERENCES [config].[FiscalYear] ([FiscalYear]),
	CONSTRAINT [FK_Schedule_ProcessType] FOREIGN KEY ([ProcessTypeId]) REFERENCES [process].[ProcessType] ([ProcessTypeId])
)
