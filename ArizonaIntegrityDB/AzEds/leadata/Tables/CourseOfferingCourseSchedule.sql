CREATE TABLE [leadata].[CourseOfferingCourseSchedule](
	[FiscalYear] [int] NOT NULL,
	[LocalCourseCode] [nvarchar](60) NOT NULL,
	[ScheduleDate] [date] NOT NULL,
	[SchoolId] [int] NOT NULL,
	[SchoolYear] [smallint] NOT NULL,
	[TermTypeId] [int] NOT NULL,
	[InstructionalMinutesPlanned] [int] NOT NULL,
	[SessionName]              NVARCHAR (60) CONSTRAINT [CourseOfferingCourseSchedule_DF_SessionName] DEFAULT 'Not Applicable' NOT NULL ,
	[SourceCreateDate] [datetime] NOT NULL,
	[SourceLastModifiedDate] [datetime] NOT NULL,
	[LoadDate] [datetime] NOT NULL,
	[HashValue]				[binary](64)	  CONSTRAINT [CourseOfferingCourseSchedule_DF_HashValue] DEFAULT (00) NOT NULL,
 CONSTRAINT [CourseOfferingCourseSchedule_PK] PRIMARY KEY CLUSTERED 
(
	[FiscalYear] ASC,
	[LocalCourseCode] ASC,
	[ScheduleDate] ASC,
	[SchoolId] ASC,
	[SchoolYear] ASC,
	[TermTypeId] ASC,
	[SessionName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO



ALTER TABLE [leadata].[CourseOfferingCourseSchedule] ADD  CONSTRAINT [CourseOfferingCourseSchedule_DF_LoadDate]  DEFAULT (getutcdate()) FOR [LoadDate]
GO

ALTER TABLE [leadata].[CourseOfferingCourseSchedule]  WITH NOCHECK ADD  CONSTRAINT [FK_CourseOfferingCourseSchedule_CourseOffering] FOREIGN KEY([FiscalYear], [SchoolId], [TermTypeId], [LocalCourseCode], [SchoolYear], [SessionName])
REFERENCES [leadata].[CourseOffering] ([FiscalYear], [SchoolId], [TermTypeId], [LocalCourseCode], [SchoolYear], [SessionName])
ON UPDATE CASCADE
ON DELETE CASCADE
GO

ALTER TABLE [leadata].[CourseOfferingCourseSchedule] CHECK CONSTRAINT [FK_CourseOfferingCourseSchedule_CourseOffering]
GO
