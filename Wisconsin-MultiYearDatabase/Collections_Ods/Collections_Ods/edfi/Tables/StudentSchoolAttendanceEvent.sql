CREATE TABLE [edfi].[StudentSchoolAttendanceEvent] (
	[StudentUSI]                          INT              NOT NULL,
	[SchoolId]                            INT              NOT NULL,
	[SchoolYear]                          SMALLINT         NOT NULL,
	[EventDate]                           DATE             NOT NULL,
	[AttendanceEventCategoryDescriptorId] INT              NOT NULL,
	[AttendanceEventReason]               NVARCHAR (40)    NULL,
	[EducationalEnvironmentTypeId]        INT              NULL,
	[Id]                                  UNIQUEIDENTIFIER CONSTRAINT [StudentSchoolAttendanceEvent_DF_Id] DEFAULT (newid()) NOT NULL,
	[LastModifiedDate]                    DATETIME         CONSTRAINT [StudentSchoolAttendanceEvent_DF_LastModifiedDate] DEFAULT (getdate()) NOT NULL,
	[CreateDate]                          DATETIME         CONSTRAINT [StudentSchoolAttendanceEvent_DF_CreateDate] DEFAULT (getdate()) NOT NULL,
	[TermDescriptorId]                    INT              NOT NULL,
	CONSTRAINT [PK_StudentSchoolAttendanceEvent] PRIMARY KEY CLUSTERED 
		([SchoolYear] ASC, [StudentUSI] ASC, [SchoolId] ASC, [TermDescriptorId] ASC, [EventDate] ASC, [AttendanceEventCategoryDescriptorId] ASC),
	CONSTRAINT [FK_StudentSchoolAttendanceEvent_AttendanceEventCategoryDescriptorId] 
		FOREIGN KEY ([AttendanceEventCategoryDescriptorId]) 
		REFERENCES [edfi].[AttendanceEventCategoryDescriptor] ([AttendanceEventCategoryDescriptorId]),
	CONSTRAINT [FK_StudentSchoolAttendanceEvent_EducationalEnvironmentType_EducationalEnvironmentTypeId] 
		FOREIGN KEY ([EducationalEnvironmentTypeId]) 
		REFERENCES [edfi].[EducationalEnvironmentType] ([EducationalEnvironmentTypeId]),
	CONSTRAINT [FK_StudentSchoolAttendanceEvent_School_SchoolId] 
		FOREIGN KEY ([SchoolYear],[SchoolId]) 
		REFERENCES [edfi].[School] ([SchoolYear],[SchoolId]),
	CONSTRAINT [FK_StudentSchoolAttendanceEvent_Session_SchoolId] 
		FOREIGN KEY ([SchoolYear],[SchoolId], [TermDescriptorId]) 
		REFERENCES [edfi].[Session] ([SchoolYear],[SchoolId], [TermDescriptorId]),
	CONSTRAINT [FK_StudentSchoolAttendanceEvent_Student_StudentUSI_SchoolYear] 
		FOREIGN KEY ([SchoolYear],[StudentUSI]) 
		REFERENCES [edfi].[Student] ([SchoolYear],[StudentUSI])
);

GO
CREATE UNIQUE NONCLUSTERED INDEX [GUID_StudentSchoolAttendanceEvent]
	ON [edfi].[StudentSchoolAttendanceEvent]([Id] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_StudentSchoolAttendanceEvent_EventDate]
	ON [edfi].[StudentSchoolAttendanceEvent]([EventDate] ASC);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'This event entity represents the recording of whether a student is in attendance on a daily basis at their school.', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'StudentSchoolAttendanceEvent';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'A unique number or alphanumeric code assigned to a student by a state education agency.', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'StudentSchoolAttendanceEvent', @level2type = N'COLUMN', @level2name = N'StudentUSI';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'School Identity Column', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'StudentSchoolAttendanceEvent', @level2type = N'COLUMN', @level2name = N'SchoolId';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The identifier for the school year (e.g., 2010/11).
', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'StudentSchoolAttendanceEvent', @level2type = N'COLUMN', @level2name = N'SchoolYear';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Date for this attendance event.', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'StudentSchoolAttendanceEvent', @level2type = N'COLUMN', @level2name = N'EventDate';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Key for AttendanceEventCategoryType', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'StudentSchoolAttendanceEvent', @level2type = N'COLUMN', @level2name = N'AttendanceEventCategoryDescriptorId';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The reported reason for a student''s absence.', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'StudentSchoolAttendanceEvent', @level2type = N'COLUMN', @level2name = N'AttendanceEventReason';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Key for EducationalEnvironment', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'StudentSchoolAttendanceEvent', @level2type = N'COLUMN', @level2name = N'EducationalEnvironmentTypeId';

