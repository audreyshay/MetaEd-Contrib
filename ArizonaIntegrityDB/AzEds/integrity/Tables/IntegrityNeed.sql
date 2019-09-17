CREATE TABLE [integrity].[IntegrityNeed] (
    [IntegrityNeedId]				BIGINT        IDENTITY (1, 1) NOT NULL,
    [FiscalYear]					INT           NOT NULL,	
    [IntegrityRuleTypeId]			INT           NOT NULL,
    [IsIntegrityNeeded]				BIT           NOT NULL,
    [CreatedDate]					DATETIME      NOT NULL,
    [LastModifiedDate]				DATETIME      NOT NULL,
    [StudentUSI]					INT           NULL,
    [StudentUniqueId]				NVARCHAR (32) NULL,
    [SchoolId]						INT           NULL,
    [SchoolEntryDate]				DATE          NULL,
	[LocalCourseCode]				NVARCHAR (60) NULL, 
	[SchoolYear]					INT           NULL,
    [TermTypeId]					INT           NULL, 
	[SessionName]					NVARCHAR (60) NULL,
	[StaffUniqueId]					NVARCHAR (32) NULL,
    [StaffUSI]						INT           NULL,
    [SectionBeginDate]				DATE          NULL, 
	[TrackLocalEducationAgencyId]	INT			  NULL,
	[TrackNumber]					INT			  NULL,	
	[SubmittedByEducationOrganizationId] INT	  NULL,
	[CalendarCode]					NVARCHAR (60) NULL,
    CONSTRAINT [PK_IntegrityNeed] PRIMARY KEY CLUSTERED ([IntegrityNeedId] ASC),
    CONSTRAINT [FK_IntegrityNeed Student] FOREIGN KEY ([StudentUSI]) REFERENCES [leadata].[Student] ([StudentUSI]),
    CONSTRAINT [FK_IntegrityNeed_IntegrityRuleType] FOREIGN KEY ([IntegrityRuleTypeId]) REFERENCES [integrity].[IntegrityRuleType] ([IntegrityRuleTypeId])
);


GO

CREATE NONCLUSTERED INDEX [IXNC_IntegrityNeed] ON [integrity].[IntegrityNeed]
(
	[FiscalYear] ASC,
	[IntegrityRuleTypeId] ASC,
	[StudentUniqueId] ASC,
	[SchoolId] ASC
)
GO





CREATE NONCLUSTERED INDEX IX_IntegrityNeed_StudentUSI_StudentUniqueId_SchoolId
ON [integrity].[IntegrityNeed] ([StudentUSI],[StudentUniqueId],[SchoolId])
INCLUDE ([IntegrityNeedId],[FiscalYear],[SchoolEntryDate])


GO
CREATE NONCLUSTERED INDEX [IX_IntegrityNeed_RuleTypeId_Needed]
    ON [integrity].[IntegrityNeed]([IntegrityRuleTypeId] ASC, [IsIntegrityNeeded] ASC)
    INCLUDE([IntegrityNeedId], [FiscalYear], [StudentUniqueId], [StudentUSI], [SchoolId], [SchoolEntryDate]);

--Used for SPED72 Report
GO
CREATE NONCLUSTERED INDEX [IX_IntegrityNeed_FiscalYear_SchoolId]
ON [integrity].[IntegrityNeed] ([FiscalYear],[SchoolId])
INCLUDE ([IntegrityNeedId],[IntegrityRuleTypeId],[StudentUSI],[SchoolEntryDate],[LocalCourseCode],[SchoolYear],[TermTypeId],[StaffUSI],[SectionBeginDate])

