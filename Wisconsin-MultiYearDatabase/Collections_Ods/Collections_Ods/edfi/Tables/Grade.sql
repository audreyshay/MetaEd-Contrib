CREATE TABLE [edfi].[Grade] (
    [GradingPeriodDescriptorId]       INT              NOT NULL,
    [GradingPeriodBeginDate]          DATE             NOT NULL,
    [GradeTypeId]                     INT              NOT NULL,
    [PerformanceBaseConversionTypeId] INT              NULL,
    [StudentUSI]                      INT              NOT NULL,
    [SchoolId]                        INT              NOT NULL,
    [ClassPeriodName]                 NVARCHAR (20)    NOT NULL,
    [ClassroomIdentificationCode]     NVARCHAR (20)    NOT NULL,
    [LocalCourseCode]                 NVARCHAR (60)    NOT NULL,
    [UniqueSectionCode]               NVARCHAR (255)   NOT NULL,
    [SequenceOfCourse]                INT              NOT NULL,
    [SchoolYear]                      SMALLINT         NOT NULL,
    [TermDescriptorId]                INT              NOT NULL,
    [BeginDate]                       DATE             NOT NULL,
    [LetterGradeEarned]               NVARCHAR (20)    NULL,
    [NumericGradeEarned]              DECIMAL (9, 2)   NULL,
    [DiagnosticStatement]             NVARCHAR (1024)  NULL,
    [Id]                              UNIQUEIDENTIFIER CONSTRAINT [Grade_DF_Id] DEFAULT (newid()) NOT NULL,
    [LastModifiedDate]                DATETIME         CONSTRAINT [Grade_DF_LastModifiedDate] DEFAULT (getdate()) NOT NULL,
    [CreateDate]                      DATETIME         CONSTRAINT [Grade_DF_CreateDate] DEFAULT (getdate()) NOT NULL,
	[IsActive]                        BIT            CONSTRAINT [DF_Grade_IsActive] DEFAULT ((1)) NOT NULL,
	CONSTRAINT [PK_Grade] PRIMARY KEY CLUSTERED ([SchoolYear] ASC, [GradingPeriodDescriptorId] ASC, [GradingPeriodBeginDate] ASC, [GradeTypeId] ASC, [StudentUSI] ASC, [SchoolId] ASC, [ClassPeriodName] ASC, [ClassroomIdentificationCode] ASC, [LocalCourseCode] ASC, [UniqueSectionCode] ASC, [SequenceOfCourse] ASC, [TermDescriptorId] ASC, [BeginDate] ASC),
    CONSTRAINT [FK_Grade_GradeType_GradeTypeId] FOREIGN KEY ([GradeTypeId]) REFERENCES [edfi].[GradeType] ([GradeTypeId]),
    CONSTRAINT [FK_Grade_GradingPeriod_BeginDate] FOREIGN KEY ([SchoolYear], [GradingPeriodDescriptorId], [SchoolId], [GradingPeriodBeginDate]) REFERENCES [edfi].[GradingPeriod] ([SchoolYear], [GradingPeriodDescriptorId], [SchoolId], [BeginDate]),
    CONSTRAINT [FK_Grade_PerformanceBaseType_PerformanceBaseConversionTypeId] FOREIGN KEY ([PerformanceBaseConversionTypeId]) REFERENCES [edfi].[PerformanceBaseConversionType] ([PerformanceBaseConversionTypeId]),
    CONSTRAINT [FK_Grade_StudentSectionAssociation] FOREIGN KEY ([SchoolYear], [SchoolId], [ClassPeriodName], [ClassroomIdentificationCode], [LocalCourseCode], [TermDescriptorId], [UniqueSectionCode], [SequenceOfCourse], [StudentUSI], [BeginDate]) REFERENCES [edfi].[StudentSectionAssociation] ([SchoolYear], [SchoolId], [ClassPeriodName], [ClassroomIdentificationCode], [LocalCourseCode], [TermDescriptorId], [UniqueSectionCode], [SequenceOfCourse], [StudentUSI], [BeginDate]) ON UPDATE CASCADE
);






GO
CREATE NONCLUSTERED INDEX [FK_Grade_GradeType_GradeTypeId]
    ON [edfi].[Grade]([GradeTypeId] ASC);


GO
CREATE NONCLUSTERED INDEX [FK_Grade_PerformanceBaseType_PerformanceBaseConversionTypeId]
    ON [edfi].[Grade]([PerformanceBaseConversionTypeId] ASC);


GO
CREATE NONCLUSTERED INDEX [FK_Grade_StudentSectionAssociation]
    ON [edfi].[Grade]([SchoolYear] ASC,[SchoolId] ASC,[StudentUSI] ASC,[LocalCourseCode] ASC, [TermDescriptorId] ASC, [UniqueSectionCode] ASC,[SequenceOfCourse] ASC, [BeginDate] ASC,  [ClassPeriodName] ASC, [ClassroomIdentificationCode] ASC);

GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'This educational entity represents an overall score or assessment tied to a course over a period of time (i.e., the grading period). Student grades are usually a compilation of marks and other scores.', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'Grade';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'The name of the grading period during the school year in which the grade is offered (e.g., 1st cycle, 1st semester)', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'Grade', @level2type = N'COLUMN', @level2name = N'GradingPeriodDescriptorId';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'Month, day, and year of the first day of the grading period.', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'Grade', @level2type = N'COLUMN', @level2name = N'GradingPeriodBeginDate';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'The type of grade (e.g., Exam, Final, Grading Period, Progress Report)', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'Grade', @level2type = N'COLUMN', @level2name = N'GradeTypeId';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'The performance base conversion assessed for the student.', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'Grade', @level2type = N'COLUMN', @level2name = N'PerformanceBaseConversionTypeId';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'A unique number or alphanumeric code assigned to a student by a state education agency.', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'Grade', @level2type = N'COLUMN', @level2name = N'StudentUSI';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'School Identity Column
', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'Grade', @level2type = N'COLUMN', @level2name = N'SchoolId';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'An indication of the portion of a typical daily session in which students receive instruction in a specified subject (e.g., morning, sixth period, block period or AB schedules).
=', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'Grade', @level2type = N'COLUMN', @level2name = N'ClassPeriodName';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'A unique number or alphanumeric code assigned to a room by a school, school system, state, or other agency or entity.', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'Grade', @level2type = N'COLUMN', @level2name = N'ClassroomIdentificationCode';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'The local code assigned by the LEA or Campus that identifies the organization of subject matter and related learning experiences provided for the instruction of students.', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'Grade', @level2type = N'COLUMN', @level2name = N'LocalCourseCode';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'A unique identifier for the section, that is defined for a campus by the classroom, the subjects taught, and the instructors that are assigned.  NEDM: Unique Course Code', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'Grade', @level2type = N'COLUMN', @level2name = N'UniqueSectionCode';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'When a section is part of a sequence of parts for a course, the number if the sequence.  If the course has only onle part, the value of this section attribute should be 1.', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'Grade', @level2type = N'COLUMN', @level2name = N'SequenceOfCourse';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'The identifier for the school year.', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'Grade', @level2type = N'COLUMN', @level2name = N'SchoolYear';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'A unique identifier used as Primary Key, not derived from business logic, when acting as Foreign Key, references the parent table.', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'Grade', @level2type = N'COLUMN', @level2name = N'TermDescriptorId';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'Month, day, and year of the Student''s entry or assignment to the Section.', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'Grade', @level2type = N'COLUMN', @level2name = N'BeginDate';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'A final or interim (grading period) indicator of student performance in a class as submitted by the instructor.', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'Grade', @level2type = N'COLUMN', @level2name = N'LetterGradeEarned';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'A final or interim (grading period) indicator of student performance in a class as submitted by the instructor.', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'Grade', @level2type = N'COLUMN', @level2name = N'NumericGradeEarned';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'A statement provided by the teacher that provides information in addition to the grade or assessment score.', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'Grade', @level2type = N'COLUMN', @level2name = N'DiagnosticStatement';


GO
CREATE UNIQUE NONCLUSTERED INDEX [INDEX IX_Grade]
    ON [edfi].[Grade]([Id] ASC) WITH (STATISTICS_NORECOMPUTE = ON);


GO
CREATE NONCLUSTERED INDEX [FK_Grade_GradingPeriod_BeginDate]
    ON [edfi].[Grade]([GradingPeriodBeginDate] ASC, [GradingPeriodDescriptorId] ASC, [SchoolId] ASC);


GO
CREATE UNIQUE NONCLUSTERED INDEX [UX_Grade_Id]
    ON [edfi].[Grade]([Id] ASC) WITH (FILLFACTOR = 75, PAD_INDEX = ON);

GO
