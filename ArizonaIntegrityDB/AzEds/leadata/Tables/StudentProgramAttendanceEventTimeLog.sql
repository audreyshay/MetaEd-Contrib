CREATE TABLE [leadata].[StudentProgramAttendanceEventTimeLog](
    [FiscalYear] int NOT NULL,
	[StudentUSI] [int] NOT NULL,
	[EducationOrganizationId] [int] NOT NULL,
	[AttendanceBeginTime] [time](7) NOT NULL,
	[AttendanceEventCategoryDescriptorId] [int] NOT NULL,
	[EventDate] [date] NOT NULL,
	[ProgramEducationOrganizationId] [int] NOT NULL,
	[ProgramName] [nvarchar](60) NOT NULL,
	[ProgramTypeId] [int] NOT NULL,	
	[AttendanceEndTime] [time](7) NULL,
	[SourceCreateDate] [datetime] NOT NULL,
	[SourceLastModifiedDate] [datetime] NOT NULL DEFAULT (getdate()),
	[LoadDate] [datetime] NOT NULL,
	[HashValue] [binary](64) NOT NULL,
 CONSTRAINT [StudentProgramAttendanceEventTimeLog_PK] PRIMARY KEY CLUSTERED 
(
    [FiscalYear] ASC,
	[AttendanceBeginTime] ASC,
	[AttendanceEventCategoryDescriptorId] ASC,
	[EducationOrganizationId] ASC,
	[EventDate] ASC,
	[ProgramEducationOrganizationId] ASC,
	[ProgramName] ASC,
	[ProgramTypeId] ASC,
	[StudentUSI] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [leadata].[StudentProgramAttendanceEventTimeLog] ADD  CONSTRAINT [StudentProgramAttendanceEventTimeLog_DF_CreateDate]  DEFAULT (getdate()) FOR [SourceCreateDate]
GO

ALTER TABLE [leadata].[StudentProgramAttendanceEventTimeLog]  WITH CHECK ADD  CONSTRAINT [FK_StudentProgramAttendanceEventTimeLog_StudentProgramAttendanceEvent] FOREIGN KEY([FiscalYear], [StudentUSI], [ProgramEducationOrganizationId], [ProgramTypeId], [EventDate], [AttendanceEventCategoryDescriptorId], [ProgramName], [EducationOrganizationId])
REFERENCES [leadata].[StudentProgramAttendanceEvent] ([FiscalYear], [StudentUSI], [ProgramEducationOrganizationId], [ProgramTypeId], [EventDate], [AttendanceEventCategoryDescriptorId], [ProgramName], [EducationOrganizationId])
ON DELETE CASCADE
GO

ALTER TABLE [leadata].[StudentProgramAttendanceEventTimeLog] CHECK CONSTRAINT [FK_StudentProgramAttendanceEventTimeLog_StudentProgramAttendanceEvent]
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The time the student began attending this program service.' , @level0type=N'SCHEMA',@level0name=N'leadata', @level1type=N'TABLE',@level1name=N'StudentProgramAttendanceEventTimeLog', @level2type=N'COLUMN',@level2name=N'AttendanceBeginTime'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A code describing the attendance event, for example:
        Present
        Unexcused absence
        Excused absence
        Tardy.' , @level0type=N'SCHEMA',@level0name=N'leadata', @level1type=N'TABLE',@level1name=N'StudentProgramAttendanceEventTimeLog', @level2type=N'COLUMN',@level2name=N'AttendanceEventCategoryDescriptorId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The identifier assigned to an education agency by the State Education Agency (SEA).  Also known as the State LEA ID.' , @level0type=N'SCHEMA',@level0name=N'leadata', @level1type=N'TABLE',@level1name=N'StudentProgramAttendanceEventTimeLog', @level2type=N'COLUMN',@level2name=N'EducationOrganizationId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Date for this attendance event.' , @level0type=N'SCHEMA',@level0name=N'leadata', @level1type=N'TABLE',@level1name=N'StudentProgramAttendanceEventTimeLog', @level2type=N'COLUMN',@level2name=N'EventDate'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The identifier assigned to an education agency by the State Education Agency (SEA).  Also known as the State LEA ID.' , @level0type=N'SCHEMA',@level0name=N'leadata', @level1type=N'TABLE',@level1name=N'StudentProgramAttendanceEventTimeLog', @level2type=N'COLUMN',@level2name=N'ProgramEducationOrganizationId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The formal name of the Program of instruction, training, services, or benefits available through federal, state, or local agencies.' , @level0type=N'SCHEMA',@level0name=N'leadata', @level1type=N'TABLE',@level1name=N'StudentProgramAttendanceEventTimeLog', @level2type=N'COLUMN',@level2name=N'ProgramName'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The type of program.' , @level0type=N'SCHEMA',@level0name=N'leadata', @level1type=N'TABLE',@level1name=N'StudentProgramAttendanceEventTimeLog', @level2type=N'COLUMN',@level2name=N'ProgramTypeId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A unique alphanumeric code assigned to a student.' , @level0type=N'SCHEMA',@level0name=N'leadata', @level1type=N'TABLE',@level1name=N'StudentProgramAttendanceEventTimeLog', @level2type=N'COLUMN',@level2name=N'StudentUSI'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The time the student stopped attending this program service.' , @level0type=N'SCHEMA',@level0name=N'leadata', @level1type=N'TABLE',@level1name=N'StudentProgramAttendanceEventTimeLog', @level2type=N'COLUMN',@level2name=N'AttendanceEndTime'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'This event entity adds the time component to a student program attendance participating' , @level0type=N'SCHEMA',@level0name=N'leadata', @level1type=N'TABLE',@level1name=N'StudentProgramAttendanceEventTimeLog'
GO

