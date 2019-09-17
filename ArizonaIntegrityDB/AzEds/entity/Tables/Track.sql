CREATE TABLE [entity].[Track] (
	[CalendarCode] NVARCHAR (60) CONSTRAINT [Track_DF_CalendarCode] DEFAULT 'Not Applicable' NOT NULL ,
    [EducationOrganizationId] INT           NOT NULL,
    [FiscalYear]              INT           NOT NULL,
    [TrackNumber]             INT           NOT NULL DEFAULT -2,
	[TrackLocalEducationAgencyId] INT		NOT NULL DEFAULT(0),
	[CalendarType]			  NVARCHAR (50) NULL,
	[CalendarTypeDescriptorId]	  INT		NULL,
    [TrackName]               NVARCHAR (60) NULL,
    [BeginDate]               DATE          NOT NULL,
    [EndDate]                 DATE          NOT NULL,
    [TotalInstructionalDays]  INT           NOT NULL,
	[NumberOfSessionDaysInWeek] INT			NOT NULL,
	[NumberOfSessionDaysInWeekDescriptorId] INT	NULL,
    [IsActive] BIT NOT NULL DEFAULT 0, 
	[SourceId] UNIQUEIDENTIFIER NULL,
	[SourceCreateDate] DATETIME NULL,
	[SourceLastModifiedDate] DATETIME NULL,
	[LoadDate] DATETIME NULL,
    [HashValue] [binary](64) DEFAULT (00) NOT NULL,
	CONSTRAINT [PK_Track] PRIMARY KEY CLUSTERED ([CalendarCode] ASC,[EducationOrganizationId] ASC, [FiscalYear] ASC, [TrackNumber] ASC, [TrackLocalEducationAgencyId] ASC),
    CONSTRAINT [FK_Track_EducationOrgnization] FOREIGN KEY ([EducationOrganizationId], [FiscalYear]) REFERENCES [entity].[EducationOrganization] ([EducationOrganizationId], [FiscalYear])
);


