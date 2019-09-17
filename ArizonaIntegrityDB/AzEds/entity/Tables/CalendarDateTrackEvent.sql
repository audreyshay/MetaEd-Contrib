CREATE TABLE [entity].[CalendarDateTrackEvent] (
	[CalendarCode] NVARCHAR (60) CONSTRAINT [CalendarDateTrackEvent_DF_CalendarCode] DEFAULT 'Not Applicable' NOT NULL ,
    [EducationOrganizationId] INT            NOT NULL,
    [FiscalYear]              INT            NOT NULL,
    [Date]                    DATE           NOT NULL,
    [TrackEventTypeId]		  INT            NOT NULL,
    [TrackNumber]             INT           NOT NULL DEFAULT -2,
	[TrackLocalEducationAgencyId] INT		 NOT NULL DEFAULT(0),
	[CalendarType]			  NVARCHAR (50) NULL,
	[CalendarTypeDescriptorId]	  INT		NULL,
    [EventDuration]           DECIMAL (3, 2) CONSTRAINT [CalendarDateTrackEvent_DF_EventDuration] DEFAULT (1.00) NOT NULL ,
	[SourceId] [uniqueidentifier] NULL,
	[SourceCreateDate] [datetime] NULL,
	[SourceLastModifiedDate] [datetime] NULL,
	[LoadDate] [datetime] NULL,
    [HashValue] [binary](64) DEFAULT (00) NOT NULL,
	CONSTRAINT [PK_CalendarDateTrackEvent] PRIMARY KEY CLUSTERED ([CalendarCode] ASC,[EducationOrganizationId] ASC, [FiscalYear] ASC, [Date] ASC, [TrackEventTypeId] ASC, [TrackNumber] ASC,[TrackLocalEducationAgencyId] ASC),
    CONSTRAINT [FK_CalendarDateTrackEvent_CalendarDate] FOREIGN KEY ([TrackEventTypeId]) REFERENCES [entity].[TrackEventType] ([TrackEventTypeId]),
    CONSTRAINT [FK_CalendarDateTrackEvent_Track] FOREIGN KEY ([CalendarCode],[EducationOrganizationId], [FiscalYear], [TrackNumber],[TrackLocalEducationAgencyId]) REFERENCES [entity].[Track] ([CalendarCode],[EducationOrganizationId], [FiscalYear], [TrackNumber],[TrackLocalEducationAgencyId])
);




GO
CREATE NONCLUSTERED INDEX [IXNC_CalendarDateCalendarEvent_Edorg_FiscalYear_CalendarEventTypeID_TrackNumber]
    ON [entity].[CalendarDateTrackEvent]([EducationOrganizationId] ASC, [FiscalYear] ASC, [TrackEventTypeId] ASC, [TrackNumber] ASC)
    INCLUDE([Date]);


GO


