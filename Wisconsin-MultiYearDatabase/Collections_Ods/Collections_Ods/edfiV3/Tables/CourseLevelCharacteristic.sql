CREATE TABLE [edfiV3].[CourseLevelCharacteristic] (
    [ApiSchoolYear]	   SMALLINT NOT NULL, 
	[CourseCode]                            NVARCHAR (60) NOT NULL,
    [CourseLevelCharacteristicDescriptorId] INT           NOT NULL,
    [EducationOrganizationId]               INT           NOT NULL,
    [CreateDate]                            DATETIME2 (7)      NOT NULL,
	CONSTRAINT [V3_CourseLevelCharacteristic_PK] PRIMARY KEY CLUSTERED ([ApiSchoolYear] ASC, [CourseCode] ASC, [CourseLevelCharacteristicDescriptorId] ASC, [EducationOrganizationId] ASC),
    CONSTRAINT [V3_FK_CourseLevelCharacteristic_Course] FOREIGN KEY ([ApiSchoolYear], [CourseCode], [EducationOrganizationId]) REFERENCES [edfiV3].[Course] ([ApiSchoolYear], [CourseCode], [EducationOrganizationId]) ON DELETE CASCADE,
    CONSTRAINT [V3_FK_CourseLevelCharacteristic_CourseLevelCharacteristicDescriptor] FOREIGN KEY ([CourseLevelCharacteristicDescriptorId]) REFERENCES [edfiV3].[CourseLevelCharacteristicDescriptor] ([CourseLevelCharacteristicDescriptorId])
);