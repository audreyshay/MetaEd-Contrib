CREATE TABLE [entity].[ProgramType] (
    [ProgramTypeId] INT             IDENTITY (1, 1) NOT NULL,
    [CodeValue]     NVARCHAR (50)   NOT NULL,
    [Description]   NVARCHAR (1024) NOT NULL,
    CONSTRAINT [PK_ProgramType] PRIMARY KEY CLUSTERED ([ProgramTypeId] ASC)
);

