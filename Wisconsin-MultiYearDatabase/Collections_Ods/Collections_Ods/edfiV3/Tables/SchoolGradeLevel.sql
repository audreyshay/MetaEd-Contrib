CREATE TABLE [edfiV3].[SchoolGradeLevel] (
	[ApiSchoolYear]	   SMALLINT NOT NULL, 
    [GradeLevelDescriptorId] INT      NOT NULL,
    [SchoolId]               INT      NOT NULL,
    [CreateDate]             DATETIME2 (7) NOT NULL,
    CONSTRAINT [V3_SchoolGradeLevel_PK] PRIMARY KEY CLUSTERED ([ApiSchoolYear] ASC, [GradeLevelDescriptorId] ASC, [SchoolId] ASC),
    CONSTRAINT [V3_FK_SchoolGradeLevel_GradeLevelDescriptor] FOREIGN KEY ([GradeLevelDescriptorId]) REFERENCES [edfiV3].[GradeLevelDescriptor] ([GradeLevelDescriptorId]),
    CONSTRAINT [V3_FK_SchoolGradeLevel_School] FOREIGN KEY ([ApiSchoolYear], [SchoolId]) REFERENCES [edfiV3].[School] ([ApiSchoolYear], [SchoolId]) ON DELETE CASCADE
);

