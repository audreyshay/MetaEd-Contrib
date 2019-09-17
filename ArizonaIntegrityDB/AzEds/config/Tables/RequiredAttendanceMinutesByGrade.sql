CREATE TABLE [config].[RequiredAttendanceMinutesByGrade]
(
	[RequiredAttendanceMinutesByGradeId]	INT IDENTITY(1,1) NOT NULL,
	[FiscalYear]							INT NOT NULL,
	[GradeLevelTypeId]						INT NOT NULL,
	[AnnualRequiredHours]					Decimal(10,4) NOT NULL,
	[WeeklyRequiredMinutes]					Decimal(10,4) NOT NULL,
	[Is200DayCalendar]						BIT  CONSTRAINT [DF_RequiredAttendanceMinutesByGrade_Is200DayCalendar] DEFAULT (0) NOT NULL,
    [CreateDate]							DATETIME CONSTRAINT [DF_RequiredAttendanceMinutesByGrade_CreatedDate] DEFAULT (getdate()) NOT NULL,
    CONSTRAINT [PK_RequiredAttendanceMinutesByGrade] PRIMARY KEY CLUSTERED ([RequiredAttendanceMinutesByGradeId] ASC),
    CONSTRAINT [FK_RequiredAttendanceMinutesByGrade_GradeLevelType] FOREIGN KEY ([GradeLevelTypeId]) REFERENCES [entity].[GradeLevelType] ([GradeLevelTypeId])
)
