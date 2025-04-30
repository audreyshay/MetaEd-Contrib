CREATE TABLE [wiV3].[GradeExtension](
    [ApiSchoolYear]	SMALLINT NOT NULL,
	[BeginDate] [date] NOT NULL,
	[GradeTypeDescriptorId] [int] NOT NULL,
	[GradingPeriodDescriptorId] [int] NOT NULL,
	[GradingPeriodSchoolYear] [smallint] NOT NULL,
	[GradingPeriodSequence] [int] NOT NULL,
	[LocalCourseCode] [nvarchar](60) NOT NULL,
	[SchoolId] [int] NOT NULL,
	[SchoolYear] [smallint] NOT NULL,
	[SectionIdentifier] [nvarchar](255) NOT NULL,
	[SessionName] [nvarchar](60) NOT NULL,
	[StudentUSI] [int] NOT NULL,
	[CertificatedProgramStatusDescriptorId] [int] NULL,
	[CreateDate] DATETIME2 (7) NOT NULL,
	CONSTRAINT [V3_PK_GradeExtension] PRIMARY KEY CLUSTERED ([ApiSchoolYear] ASC,[BeginDate] ASC,[GradeTypeDescriptorId] ASC,[GradingPeriodDescriptorId] ASC,[GradingPeriodSchoolYear] ASC,[GradingPeriodSequence] ASC,[LocalCourseCode] ASC,[SchoolId] ASC,[SchoolYear] ASC,[SectionIdentifier] ASC,[SessionName] ASC,[StudentUSI] ASC),
	CONSTRAINT [V3_FK_GradeExtension_CertificatedProgramStatusDescriptor] FOREIGN KEY([CertificatedProgramStatusDescriptorId]) REFERENCES [wiV3].[CertificatedProgramStatusDescriptor] ([CertificatedProgramStatusDescriptorId]),
	CONSTRAINT [V3_FK_GradeExtension_Grade] FOREIGN KEY([ApiSchoolYear], [SchoolId], [StudentUSI], [BeginDate], [GradeTypeDescriptorId], [GradingPeriodDescriptorId], [GradingPeriodSchoolYear], [GradingPeriodSequence], [LocalCourseCode], [SchoolYear],[SectionIdentifier], [SessionName]) REFERENCES [edfiV3].[Grade] ([ApiSchoolYear], [SchoolId], [StudentUSI], [BeginDate], [GradeTypeDescriptorId], [GradingPeriodDescriptorId], [GradingPeriodSchoolYear], [GradingPeriodSequence], [LocalCourseCode], [SchoolYear],[SectionIdentifier], [SessionName]) ON UPDATE CASCADE ON DELETE CASCADE
)
GO
