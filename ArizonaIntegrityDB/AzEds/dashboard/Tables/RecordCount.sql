CREATE TABLE [dashboard].[RecordCount] (
    [RecordCountId]                     BIGINT  IDENTITY (1, 1) NOT NULL,
    [EventDateId]						INT  NOT NULL,
	[FiscalYear]						INT  NOT NULL,
    [AttendingLocalEducationAgencyId]	INT  NOT NULL,
    [ResidentLocalEducationAgencyId]	INT  NULL,
	[SchoolId]							INT  NULL,
    [RecordCountTypeId]                 INT  NOT NULL,
    [RecordCount]                       INT  NOT NULL,
    [CreateDate]						DATETIME NOT NULL default getdate(), 
    CONSTRAINT [PK_RecordCount] PRIMARY KEY CLUSTERED ([RecordCountId] ASC),
    CONSTRAINT [FK_RecordCount_RecordCountType] FOREIGN KEY ([RecordCountTypeId]) REFERENCES [dashboard].[RecordCountType] ([RecordCountTypeId]),
	CONSTRAINT [FK_RecordCount_EventDateId] FOREIGN KEY ([EventDateId]) REFERENCES [dashboard].[EventDate] ([EventDateId]),
	CONSTRAINT [FK_RecordCount_AttendingLocalEducationAgency] FOREIGN KEY ([AttendingLocalEducationAgencyId],[FiscalYear]) REFERENCES [entity].[LocalEducationAgency] ([LocalEducationAgencyId],[FiscalYear]),
	CONSTRAINT [FK_RecordCount_ResidentLocalEducationAgency] FOREIGN KEY ([ResidentLocalEducationAgencyId],[FiscalYear]) REFERENCES [entity].[LocalEducationAgency] ([LocalEducationAgencyId],[FiscalYear]),
	CONSTRAINT [FK_RecordCount_School] FOREIGN KEY ([SchoolId],[FiscalYear]) REFERENCES [entity].[School] ([SchoolId],[FiscalYear]),
);

GO

CREATE NONCLUSTERED INDEX [IX_RecordCount]
    ON [dashboard].[RecordCount]([EventDateId] ASC, [FiscalYear] ASC, [AttendingLocalEducationAgencyId] ASC, [ResidentLocalEducationAgencyId] ASC, [RecordCountTypeId] ASC);



