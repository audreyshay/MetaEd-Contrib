CREATE TABLE [leadata].[StudentProgramAttendanceEvent](
	[FiscalYear] [int] NOT NULL,
	[StudentUSI] [int] NOT NULL,
	[ProgramEducationOrganizationId] [int] NOT NULL,
	[ProgramTypeId] [int] NOT NULL,
	[EventDate] [date] NOT NULL,
	[AttendanceEventReason] [nvarchar](40) NULL,
	[AttendanceEventCategoryDescriptorId] [int] NOT NULL,
	[EducationalEnvironmentTypeId] [int] NULL,
	[ProgramName] [nvarchar](60) NOT NULL,
	[EducationOrganizationId] [int] NOT NULL,
	[SourceId] [uniqueidentifier] NOT NULL,
	[SourceLastModifiedDate] [datetime] NOT NULL,
	[SourceCreateDate] [datetime] NOT NULL,
	[LoadDate] [datetime] NOT NULL,
	[HashValue] [binary](64) NOT NULL,
 CONSTRAINT [PK_StudentProgramAttendanceEvent] PRIMARY KEY CLUSTERED 
(
	[FiscalYear] ASC,
	[StudentUSI] ASC,
	[ProgramEducationOrganizationId] ASC,
	[ProgramTypeId] ASC,
	[EventDate] ASC,
	[AttendanceEventCategoryDescriptorId] ASC,
	[ProgramName] ASC,
	[EducationOrganizationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [leadata].[StudentProgramAttendanceEvent] ADD  CONSTRAINT [PK_StudentProgramAttendanceEvent_DF_SourceLastModifiedDate]  DEFAULT (getutcdate()) FOR [SourceLastModifiedDate]
GO

ALTER TABLE [leadata].[StudentProgramAttendanceEvent] ADD  CONSTRAINT [PK_StudentProgramAttendanceEvent_DF_SourceCreateDate]  DEFAULT (getutcdate()) FOR [SourceCreateDate]
GO

ALTER TABLE [leadata].[StudentProgramAttendanceEvent] ADD  CONSTRAINT [PK_StudentProgramAttendanceEvent_DF_LoadDate]  DEFAULT (getutcdate()) FOR [LoadDate]
GO

ALTER TABLE [leadata].[StudentProgramAttendanceEvent] ADD  DEFAULT ((0)) FOR [HashValue]
GO

ALTER TABLE [leadata].[StudentProgramAttendanceEvent]  WITH CHECK ADD  CONSTRAINT [FK_StudentProgramAttendanceEvent_AttendanceEventCategoryDescriptorId] FOREIGN KEY([FiscalYear],[AttendanceEventCategoryDescriptorId])
REFERENCES [entity].[AttendanceEventCategoryDescriptor] ([FiscalYear],[AttendanceEventCategoryDescriptorId])
GO

ALTER TABLE [leadata].[StudentProgramAttendanceEvent] CHECK CONSTRAINT [FK_StudentProgramAttendanceEvent_AttendanceEventCategoryDescriptorId]
GO

ALTER TABLE [leadata].[StudentProgramAttendanceEvent]  WITH NOCHECK ADD  CONSTRAINT [FK_StudentProgramAttendanceEvent_EducationalEnvironmentType_EducationalEnvironmentTypeId] FOREIGN KEY([EducationalEnvironmentTypeId])
REFERENCES [entity].[EducationalEnvironmentType] ([EducationalEnvironmentTypeId])
GO

ALTER TABLE [leadata].[StudentProgramAttendanceEvent] CHECK CONSTRAINT [FK_StudentProgramAttendanceEvent_EducationalEnvironmentType_EducationalEnvironmentTypeId]
GO

ALTER TABLE [leadata].[StudentProgramAttendanceEvent]  WITH CHECK ADD  CONSTRAINT [FK_StudentProgramAttendanceEvent_EducationOrganization] FOREIGN KEY([EducationOrganizationId], [FiscalYear])
REFERENCES [entity].[EducationOrganization] ([EducationOrganizationId], [FiscalYear])
GO

ALTER TABLE [leadata].[StudentProgramAttendanceEvent] CHECK CONSTRAINT [FK_StudentProgramAttendanceEvent_EducationOrganization]
GO

ALTER TABLE [leadata].[StudentProgramAttendanceEvent]  WITH CHECK ADD  CONSTRAINT [FK_StudentProgramAttendanceEvent_Program_ProgramTypeId] FOREIGN KEY([FiscalYear], [ProgramEducationOrganizationId], [ProgramTypeId], [ProgramName])
REFERENCES [entity].[Program] ([FiscalYear], [EducationOrganizationId], [ProgramTypeId], [ProgramName])
GO

ALTER TABLE [leadata].[StudentProgramAttendanceEvent] CHECK CONSTRAINT [FK_StudentProgramAttendanceEvent_Program_ProgramTypeId]
GO

ALTER TABLE [leadata].[StudentProgramAttendanceEvent]  WITH NOCHECK ADD  CONSTRAINT [FK_StudentProgramAttendanceEvent_Student_StudentUSI] FOREIGN KEY([StudentUSI])
REFERENCES [leadata].[Student] ([StudentUSI])
GO

ALTER TABLE [leadata].[StudentProgramAttendanceEvent] CHECK CONSTRAINT [FK_StudentProgramAttendanceEvent_Student_StudentUSI]
GO

