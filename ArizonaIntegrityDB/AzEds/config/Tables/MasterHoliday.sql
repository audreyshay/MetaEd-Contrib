CREATE TABLE [config].[MasterHoliday]
(
	[FiscalYear] [int] NOT NULL,
	[HolidayDate] [date] NOT NULL,
	[TrackEventTypeId] [int] NOT NULL,
	[HolidayDescription] [nvarchar](255) NOT NULL,
	CONSTRAINT [PK_MasterHoliday] PRIMARY KEY CLUSTERED ([FiscalYear] ASC, [HolidayDate] ASC, [TrackEventTypeId] ASC, [HolidayDescription] ASC)
);
