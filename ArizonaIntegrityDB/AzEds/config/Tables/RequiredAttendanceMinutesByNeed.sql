CREATE TABLE [config].[RequiredAttendanceMinutesByNeed]
(
	[RequiredAttendanceMinutesByNeedId]	INT IDENTITY(1,1) NOT NULL,
	[FiscalYear]						INT NOT NULL,
	[StudentNeedDescriptorId]			INT NOT NULL,
	[WeeklyRequiredMinutes]				Decimal(10,4) NOT NULL,
    [CreateDate]						DATETIME CONSTRAINT [DF_RequiredAttendanceMinutesByNeed_CreatedDate] DEFAULT (getdate()) NOT NULL,
    CONSTRAINT [PK_RequiredAttendanceMinutesByNeed] PRIMARY KEY CLUSTERED ([RequiredAttendanceMinutesByNeedId] ASC),
    CONSTRAINT [FK_RequiredAttendanceMinutesByNeed_StudentNeedDescriptorId] FOREIGN KEY ([StudentNeedDescriptorId]) REFERENCES [leadata].[StudentNeedDescriptor] ([StudentNeedDescriptorId])
)
