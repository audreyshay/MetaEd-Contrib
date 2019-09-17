CREATE TABLE [entity].[SchoolGradeLevel] (
    [SchoolId]         INT NOT NULL,
    [FiscalYear]       INT NOT NULL,
    [GradeLevelTypeId] INT NOT NULL,
    CONSTRAINT [PK_SchoolGradeLevel] PRIMARY KEY CLUSTERED ([SchoolId] ASC, [FiscalYear] ASC, [GradeLevelTypeId] ASC),
    CONSTRAINT [FK_SchoolGradeLevel_GradeLevelType] FOREIGN KEY ([GradeLevelTypeId]) REFERENCES [entity].[GradeLevelType] ([GradeLevelTypeId]),
    CONSTRAINT [FK_SchoolGradeLevel_School] FOREIGN KEY ([SchoolId], [FiscalYear]) REFERENCES [entity].[School] ([SchoolId], [FiscalYear])
);




GO


