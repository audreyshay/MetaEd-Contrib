CREATE TABLE [edfiV3].[CourseIdentificationCode] (
    [ApiSchoolYear]	   SMALLINT NOT NULL, 
	[CourseCode]                              NVARCHAR (60) NOT NULL,
    [CourseIdentificationSystemDescriptorId]  INT           NOT NULL,
    [EducationOrganizationId]                 INT           NOT NULL,
    [IdentificationCode]                      NVARCHAR (60) NOT NULL,
    [AssigningOrganizationIdentificationCode] NVARCHAR (60) NULL,
    [CreateDate]                              DATETIME2 (7)      NOT NULL,
	CONSTRAINT [V3_CourseIdentificationCode_PK] PRIMARY KEY CLUSTERED ([ApiSchoolYear] ASC, [CourseCode] ASC, [CourseIdentificationSystemDescriptorId] ASC, [EducationOrganizationId] ASC),
    CONSTRAINT [V3_FK_CourseIdentificationCode_Course] FOREIGN KEY ([ApiSchoolYear], [CourseCode], [EducationOrganizationId]) REFERENCES [edfiV3].[Course] ([ApiSchoolYear], [CourseCode], [EducationOrganizationId]) ON DELETE CASCADE,
    CONSTRAINT [V3_FK_CourseIdentificationCode_CourseIdentificationSystemDescriptor] FOREIGN KEY ([CourseIdentificationSystemDescriptorId]) REFERENCES [edfiV3].[CourseIdentificationSystemDescriptor] ([CourseIdentificationSystemDescriptorId])
);