CREATE TABLE [edfi].[SchoolGradeLevel] (
    [SchoolId]               INT      NOT NULL,
    [GradeLevelDescriptorId] INT      NOT NULL,
    [CreateDate]             DATETIME CONSTRAINT [SchoolGradeLevel_DF_CreateDate] DEFAULT (getdate()) NOT NULL,
   [SchoolYear] SMALLINT NOT NULL DEFAULT (datepart(year,getdate())), 
	 CONSTRAINT [PK_SchoolGradeLevel] PRIMARY KEY CLUSTERED ([SchoolYear] ASC, [SchoolId] ASC, [GradeLevelDescriptorId] ASC),
    CONSTRAINT [FK_SchoolGradeLevel_GradeLevelDescriptorId] FOREIGN KEY ([GradeLevelDescriptorId]) REFERENCES [edfi].[GradeLevelDescriptor] ([GradeLevelDescriptorId]),
    CONSTRAINT [FK_SchoolGradeLevel_School_SchoolId] FOREIGN KEY ([SchoolYear], [SchoolId]) REFERENCES [edfi].[School] ([SchoolYear], [SchoolId]) ON DELETE CASCADE
);


GO
CREATE NONCLUSTERED INDEX [FK_SchoolGradeLevel_GradeLevelDescriptorId]
    ON [edfi].[SchoolGradeLevel]([GradeLevelDescriptorId] ASC);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The grade levels served at the school.', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'SchoolGradeLevel';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'School Identity Column', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'SchoolGradeLevel', @level2type = N'COLUMN', @level2name = N'SchoolId';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The grade levels served at the school.', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'SchoolGradeLevel', @level2type = N'COLUMN', @level2name = N'GradeLevelDescriptorId';

