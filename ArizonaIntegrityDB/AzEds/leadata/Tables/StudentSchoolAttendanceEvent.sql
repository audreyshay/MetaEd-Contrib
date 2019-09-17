CREATE TABLE [leadata].[StudentSchoolAttendanceEvent] (
    [FiscalYear]                          INT           NOT NULL,
    [StudentUSI]                          INT           NOT NULL,
    [SchoolId]                            INT           NOT NULL,
	[TermTypeId]						  INT           NOT NULL,
	[SchoolYear]						  SMALLINT		NOT NULL,
	[SessionName]              NVARCHAR (60) CONSTRAINT [StudentSchoolAttendanceEvent_DF_SessionName] DEFAULT 'Not Applicable' NOT NULL ,
    [EventDate]                           DATE          NOT NULL,
    [AttendanceEventCategoryDescriptorId] INT           NOT NULL,
    [AbsenceAmountDescriptorId]           INT           NULL,
    [InstructionalMinutes]                INT           NULL,
    [SourceId]                            UNIQUEIDENTIFIER NULL,
	[SourceCreateDate]					  DATETIME		NOT NULL CONSTRAINT [StudentSchoolAttendanceEvent_DF_SourceCreateDate]  DEFAULT (getutcdate()),
	[SourceLastModifiedDate]			  DATETIME		NOT NULL CONSTRAINT [StudentSchoolAttendanceEvent_DF_SourceLastModifiedDate]  DEFAULT (getutcdate()),
	[LoadDate]							  DATETIME		NOT NULL CONSTRAINT [StudentSchoolAttendanceEvent_DF_Loaddate]  DEFAULT (getutcdate()),
	[HashValue]				[binary](64)	  CONSTRAINT [StudentSchoolAttendanceEvent_DF_HashValue] DEFAULT (00) NOT NULL,
    CONSTRAINT [PK_StudentSchoolAttendanceEvent] PRIMARY KEY CLUSTERED ([FiscalYear] ASC, [StudentUSI] ASC, [SchoolId] ASC, [TermTypeId] ASC, [SchoolYear] ASC, [EventDate] ASC, [AttendanceEventCategoryDescriptorId] ASC, [SessionName] ASC),
    CONSTRAINT [FK_StudentSchoolAttendanceEvent_School_SchoolId] FOREIGN KEY ([SchoolId], [FiscalYear]) REFERENCES [entity].[School] ([SchoolId], [FiscalYear]) ON DELETE CASCADE,
    CONSTRAINT [FK_StudentSchoolAttendanceEvent_Student_StudentUSI] FOREIGN KEY ([StudentUSI]) REFERENCES [leadata].[Student] ([StudentUSI]) ON DELETE CASCADE,
   ---- CONSTRAINT [FK_StudentSchoolAttendanceEvent_Session] FOREIGN KEY ([FiscalYear], [SchoolId], [TermTypeId], [SchoolYear], [SessionName]) REFERENCES [leadata].[Session] ([FiscalYear], [SchoolId], [TermTypeId], [SchoolYear], [SessionName])
);




GO
CREATE NONCLUSTERED INDEX [IX_StudentSchoolAttendanceEvent_AttendanceEventCategoryDescriptorId]
    ON [leadata].[StudentSchoolAttendanceEvent]([AttendanceEventCategoryDescriptorId] ASC)
    INCLUDE([FiscalYear], [StudentUSI], [SchoolId], [EventDate]);

