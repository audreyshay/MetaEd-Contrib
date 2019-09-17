CREATE TABLE [leadata].[StudentSchoolAssociation] (
    [FiscalYear]                     INT           NOT NULL,
    [StudentUSI]                     INT           NOT NULL,
    [SchoolId]                       INT           NOT NULL,
    [EntryDate]                      DATE          NOT NULL,
    [EntryGradeLevelDescriptorId]    INT           NOT NULL,
    [EntryTypeDescriptorId]          INT           NULL,
    [ExitWithdrawDate]               DATE          NULL,
    [ExitWithdrawTypeDescriptorId]   INT           NULL,
    [ClassOfSchoolYear]              SMALLINT      NULL,
    [ExitWithdrawReasonDescriptorId] INT           NULL,
    [MembershipTypeDescriptorId]     INT           NULL,
    [TrackEducationOrganizationId]   INT           NULL,
    [TrackNumber]                    INT           NULL,
	[CalendarCode]					 NVARCHAR(60)  NULL CONSTRAINT [StudentSchoolAssociation_DF_CalendarCode] DEFAULT ('Not Applicable'),
    [SourceId]                       UNIQUEIDENTIFIER NULL,
 	[SourceCreateDate]				 DATETIME	   NOT NULL CONSTRAINT [StudentSchoolAssociation_DF_SourceCreateDate]  DEFAULT (getutcdate()),
	[SourceLastModifiedDate]		 DATETIME	   NOT NULL CONSTRAINT [StudentSchoolAssociation_DF_SourceLastModifiedDate]  DEFAULT (getutcdate()),
	[LoadDate]						 DATETIME	   NOT NULL CONSTRAINT [StudentSchoolAssociation_DF_Loaddate]  DEFAULT (getutcdate()), 
	[HashValue] [binary](64) DEFAULT (00) NOT NULL, 
    CONSTRAINT [PK_StudentSchoolAssociation] PRIMARY KEY CLUSTERED ([FiscalYear] ASC, [StudentUSI] ASC, [SchoolId] ASC, [EntryDate] ASC),
    CONSTRAINT [FK_StudentSchoolAssociation_School] FOREIGN KEY ([SchoolId], [FiscalYear]) REFERENCES [entity].[School] ([SchoolId], [FiscalYear]) ON DELETE CASCADE,
    CONSTRAINT [FK_StudentSchoolAssociation_Student] FOREIGN KEY ([StudentUSI]) REFERENCES [leadata].[Student] ([StudentUSI]) ON DELETE CASCADE,
	--CONSTRAINT [FK_StudentSchoolAssociation_Track] FOREIGN KEY ( [CalendarCode], [FiscalYear]) REFERENCES [entity].[Track] ([CalendarCode], [FiscalYear])
);






GO
CREATE NONCLUSTERED INDEX [IX_StudentSchoolAssociation_FiscalYear_SchoolId_EntryDate_TrackNumber]
    ON [leadata].[StudentSchoolAssociation]([FiscalYear] ASC, [SchoolId] ASC, [EntryDate] ASC, [TrackNumber] ASC)
	INCLUDE([MembershipTypeDescriptorId]);

