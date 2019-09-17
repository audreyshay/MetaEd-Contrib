CREATE TABLE [config].[ReportingPeriod] (
	[FiscalYear]				INT  NOT NULL,
    [ReportingPeriodId]			INT    NOT NULL,
    [Description]				NVARCHAR (1024) NOT NULL,
    [ReportingPeriodDays] AS    (([EndDayNumber]-[StartDayNumber])+(1)) PERSISTED NOT NULL,
    [StartDayNumber]			INT       NOT NULL,
    [EndDayNumber]				INT      NOT NULL,
	[IsOnlyFor200DayCalendar]	BIT  CONSTRAINT [DF_ReportingPeriod_IsOnlyFor200DayCalendar] DEFAULT((0)) NOT NULL,
	[IsAnnual]					BIT  CONSTRAINT [DF_ReportingPeriod_IsAnnual] DEFAULT((0)) NOT NULL,
	[IncludeInCummulative]		BIT	 CONSTRAINT [DF_ReportingPeriod_Cummulative] DEFAULT((0)) NOT NULL,
	[SortOrder]					INT	 CONSTRAINT [DF_ReportingPeriod_SortOrder] DEFAULT((-1)) NOT NULL,
    [UseInACE] BIT NULL,
    CONSTRAINT [PK_ReportingPeriod] PRIMARY KEY CLUSTERED ([FiscalYear], [ReportingPeriodId] ASC), 
);







