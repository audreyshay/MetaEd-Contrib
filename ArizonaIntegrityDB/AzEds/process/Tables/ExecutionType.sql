CREATE TABLE [process].[ExecutionType] (
    [ExecutionTypeId] INT             IDENTITY (1, 1) NOT NULL,
    [Description]     NVARCHAR (1024) NOT NULL,
    CONSTRAINT [PK_ExecutionType] PRIMARY KEY CLUSTERED ([ExecutionTypeId] ASC)
);



