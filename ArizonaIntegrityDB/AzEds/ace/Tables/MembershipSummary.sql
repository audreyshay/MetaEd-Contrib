CREATE TABLE [ace].[MembershipSummary] (
    [MembershipSummaryId]					BIGINT          IDENTITY (1, 1) NOT NULL,
    [ExecutionId]                     	      INT             NOT NULL,
	[FiscalYear]							  INT			  NOT NULL,
	[ADMTypeId]								  INT			  NOT NULL,
	[AggregationTypeId]						  INT			  NOT NULL,
    [ReportingPeriodTypeId]                   INT             NOT NULL,
    [ReportingPeriodId]                       INT             NOT NULL,
    [SchoolId]                                INT             NOT NULL,
    [GradeLevelTypeId]                        INT             NOT NULL,
    [AttendingLocalEducationAgencyId]         INT             NOT NULL,
    [ResidentEducationOrganizationId]         INT             NOT NULL,
	[FundingTypeId]							  INT			  NOT NULL,
	[SpecialEnrollmentDescriptorId]			  INT			  NULL,
	[ServiceCodeDescriptorId]				  INT			  NULL,
	[ProgramServiceDescriptorId]			  INT			  NULL,
	[FTFStatus]								  BIT			  NOT NULL,
    [LimitedMembershipDays]                   DECIMAL (20, 6) NOT NULL,
    [LimitedAbsenceDays]                      DECIMAL (20, 6) NOT NULL,
	[LimitedAverageDailyAttendance]		      DECIMAL (20, 4) NOT NULL,
    [LimitedAverageDailyMembership]           DECIMAL (20, 4) NOT NULL,
	[YearEndAdjustedADM]					  DECIMAL (20, 4) NOT NULL, 
    [YearEndAdjustedADA]					  DECIMAL (20, 4) NOT NULL, 
	[CreateDate]                              DATETIME        NOT NULL,
	SubmittedByEducationOrganizationId        INT             NULL,
    CONSTRAINT [PK_MembershipSummary] PRIMARY KEY CLUSTERED ([MembershipSummaryId] ASC),
    CONSTRAINT [FK_MembershipSummary_EducationOrganization_ResidentEducationOrganizationId] FOREIGN KEY ([ResidentEducationOrganizationId], [FiscalYear]) REFERENCES [entity].[EducationOrganization] ([EducationOrganizationId], [FiscalYear]),
    CONSTRAINT [FK_MembershipSummary_LocalEducationAgency] FOREIGN KEY ([AttendingLocalEducationAgencyId], [FiscalYear]) REFERENCES [entity].[LocalEducationAgency] ([LocalEducationAgencyId], [FiscalYear]),
    CONSTRAINT [FK_MembershipSummary_ReportingPeriod] FOREIGN KEY ([FiscalYear], [ReportingPeriodId]) REFERENCES [config].[ReportingPeriod] ([FiscalYear], [ReportingPeriodId]),
	CONSTRAINT [FK_MembershipSummary_ReportingPeriodType] FOREIGN KEY ([ReportingPeriodTypeId]) REFERENCES [config].[ReportingPeriodType] ([ReportingPeriodTypeId]),
    CONSTRAINT [FK_MembershipSummary_FundingType] FOREIGN KEY ([FundingTypeId]) REFERENCES [ace].[FundingType]([FundingTypeId]),
    CONSTRAINT [FK_MembershipSummary_School] FOREIGN KEY ([SchoolId], [FiscalYear]) REFERENCES [entity].[School] ([SchoolId], [FiscalYear]),
    CONSTRAINT [FK_MembershipSummary_Execution] FOREIGN KEY ([ExecutionId]) REFERENCES [process].[Execution]([ExecutionId]),
    CONSTRAINT [FK_MembershipSummary_ADMType] FOREIGN KEY ([ADMTypeId]) REFERENCES [ace].[ADMType]([ADMTypeId]),
    CONSTRAINT [FK_MembershipSummary_AggregationType] FOREIGN KEY ([AggregationTypeId]) REFERENCES [ace].[AggregationType]([AggregationTypeId]),
    CONSTRAINT [FK_MembershipSummary_GradeLevelType] FOREIGN KEY ([GradeLevelTypeId]) REFERENCES [entity].[GradeLevelType]([GradeLevelTypeId])
);

	GO
	CREATE NONCLUSTERED INDEX [IX_MembershipSummary_ExecutionId] ON [ace].[MembershipSummary]
(
	[ExecutionId] ASC
)

GO

CREATE INDEX IX_MembershipSummary_DOR 
ON [ace].[MembershipSummary] ([ExecutionId],[FiscalYear],[ResidentEducationOrganizationId])

GO
CREATE NONCLUSTERED INDEX [IXNC_MembershipSummary_FiscalYear] ON [ace].[MembershipSummary]
(
	[FiscalYear] ASC
)
INCLUDE ( 	[ExecutionId],
	[AttendingLocalEducationAgencyId],
	[ResidentEducationOrganizationId],
	[SubmittedByEducationOrganizationId]) 



