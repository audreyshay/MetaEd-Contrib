CREATE TABLE [edfiV3].[SectionProgram] (
    [ApiSchoolYear]	   SMALLINT NOT NULL,
	[EducationOrganizationId] INT            NOT NULL,
    [LocalCourseCode]         NVARCHAR (60)  NOT NULL,
    [ProgramName]             NVARCHAR (60)  NOT NULL,
    [ProgramTypeDescriptorId] INT            NOT NULL,
    [SchoolId]                INT            NOT NULL,
    [SchoolYear]              SMALLINT       NOT NULL,
    [SectionIdentifier]       NVARCHAR (255) NOT NULL,
    [SessionName]             NVARCHAR (60)  NOT NULL,
    [CreateDate]              DATETIME2 (7)       NOT NULL,
    CONSTRAINT [V3_SectionProgram_PK] PRIMARY KEY CLUSTERED ([ApiSchoolYear] Asc, [SchoolId] ASC, [SchoolYear] ASC, [EducationOrganizationId] ASC, [LocalCourseCode] ASC, [ProgramName] ASC, [ProgramTypeDescriptorId] ASC, [SectionIdentifier] ASC, [SessionName] ASC),
    CONSTRAINT [V3_FK_SectionProgram_Program] FOREIGN KEY ([ApiSchoolYear], [EducationOrganizationId], [ProgramName], [ProgramTypeDescriptorId]) REFERENCES [edfiV3].[Program] ([ApiSchoolYear], [EducationOrganizationId], [ProgramName], [ProgramTypeDescriptorId]),
    CONSTRAINT [V3_FK_SectionProgram_Section] FOREIGN KEY ([ApiSchoolYear], [SchoolId], [SchoolYear], [LocalCourseCode], [SectionIdentifier], [SessionName]) REFERENCES [edfiV3].[Section] ([ApiSchoolYear], [SchoolId],[SchoolYear], [LocalCourseCode], [SectionIdentifier], [SessionName]) ON DELETE CASCADE ON UPDATE CASCADE
);
