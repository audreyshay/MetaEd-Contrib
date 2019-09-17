CREATE TABLE [Config].[CalendarType](
	[CalendarTypeId] [int] IDENTITY(1,1) NOT NULL,
	[CalendarType] [nchar](100) NOT NULL,
	[GradeLevelTypeId] [int] NOT NULL,
	[WarningThresholdInDays] [int] NOT NULL,
	[NumberOfSessionDaysInWeek] [int] NOT NULL,
	[NumberOfFullWeeksRequired] [int] NOT NULL,
	[ErrorThresholdInDays] [int] NOT NULL,
	[SchoolTypeId] [int] NULL,
 CONSTRAINT [PK_CalendarType] PRIMARY KEY CLUSTERED 
(
	[CalendarTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
