

CREATE TABLE [extension].[WiDpiGrade](
	[GradingPeriodDescriptorId] [int] NOT NULL,
	[GradingPeriodBeginDate] [date] NOT NULL,
	[GradeTypeId] [int] NOT NULL,
	[StudentUSI] [int] NOT NULL,
	[SchoolId] [int] NOT NULL,
	[ClassPeriodName] [nvarchar](20) NOT NULL,
	[ClassroomIdentificationCode] [nvarchar](20) NOT NULL,
	[LocalCourseCode] [nvarchar](60) NOT NULL,
	[UniqueSectionCode] [nvarchar](255) NOT NULL,
	[SequenceOfCourse] [int] NOT NULL,
	[SchoolYear] [smallint] NOT NULL,
	[TermDescriptorId] [int] NOT NULL,
	[BeginDate] [date] NOT NULL,
	[CertificatedProgramStatusTypeId] [int] NULL,
	[CreateDate] [datetime] NOT NULL,
 CONSTRAINT [PK_GradeExtension] PRIMARY KEY CLUSTERED 
(
	[SchoolYear] ASC, 
	[GradingPeriodDescriptorId] ASC,
	[GradingPeriodBeginDate] ASC,
	[GradeTypeId] ASC,
	[StudentUSI] ASC,
	[SchoolId] ASC,
	[ClassPeriodName] ASC,
	[ClassroomIdentificationCode] ASC,
	[LocalCourseCode] ASC,
	[UniqueSectionCode] ASC,
	[SequenceOfCourse] ASC,
	[TermDescriptorId] ASC,
	[BeginDate] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO


ALTER TABLE [extension].[WiDpiGrade]  ADD  CONSTRAINT [FK_WiDpiGrade_CertificatedProgramStatusType] FOREIGN KEY([CertificatedProgramStatusTypeId])
REFERENCES [extension].[CertificatedProgramStatusType] ([CertificatedProgramStatusTypeId])
GO


ALTER TABLE [extension].[WiDpiGrade]  ADD  CONSTRAINT [FK_WiDpiGrade_Grade] FOREIGN KEY([SchoolYear], [GradingPeriodDescriptorId], [GradingPeriodBeginDate], [GradeTypeId], [StudentUSI], [SchoolId], [ClassPeriodName],
[ClassroomIdentificationCode], [LocalCourseCode], [UniqueSectionCode], [SequenceOfCourse], 
[TermDescriptorId], [BeginDate])
REFERENCES [edfi].[Grade] ([SchoolYear],[GradingPeriodDescriptorId], [GradingPeriodBeginDate], [GradeTypeId], [StudentUSI], [SchoolId], [ClassPeriodName],
[ClassroomIdentificationCode], [LocalCourseCode], [UniqueSectionCode], [SequenceOfCourse], 
[TermDescriptorId], [BeginDate])
ON UPDATE CASCADE 
ON DELETE CASCADE
GO


EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Status in a certificated program', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'WiDpiGrade'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Key for Certificated Program Status Type' , @level0type=N'SCHEMA',@level0name=N'extension', @level1type=N'TABLE',@level1name=N'WiDpiGrade', @level2type=N'COLUMN',@level2name=N'CertificatedProgramStatusTypeId'
GO
