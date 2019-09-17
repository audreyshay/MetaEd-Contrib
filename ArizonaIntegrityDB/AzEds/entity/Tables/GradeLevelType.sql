CREATE TABLE [entity].[GradeLevelType] (
    [GradeLevelTypeId]       INT             NOT NULL,
    [CodeValue]              NVARCHAR (50)   NULL,
    [Description]            NVARCHAR (1024) NULL,
    [GradeLevelDescriptorId] INT             NULL,
	[GradeGroup]			 INT			 NULL,
    CONSTRAINT [PK_GradeLevelType] PRIMARY KEY CLUSTERED ([GradeLevelTypeId] ASC)
);

