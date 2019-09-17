CREATE TABLE [dashboard].[EventDateExecution]
(
	[EventDateId] INT NOT NULL,	 
    [ExecutionId] INT NOT NULL, 
	[CreateDate] DATETIME NOT NULL default getdate(),
    CONSTRAINT [PK_EventDateExecution] PRIMARY KEY CLUSTERED ([EventDateId], [ExecutionId]), 
    CONSTRAINT [FK_EventDateExecution_Execution] FOREIGN KEY ([ExecutionId]) REFERENCES [process].[Execution] ([ExecutionId]),	 	
	CONSTRAINT [FK_EventDateExecution_EventDate] FOREIGN KEY ([EventDateId]) REFERENCES [dashboard].[EventDate] ([EventDateId]),	 	
)
