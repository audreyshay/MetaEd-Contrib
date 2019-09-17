CREATE TABLE [ace].[MembershipInterval] (
    [MembershipIntervalId]               BIGINT          IDENTITY (1, 1) NOT NULL,
    [ExecutionId]                        INT             NOT NULL,
    [FiscalYear]                         INT             NOT NULL,
    [ADMTypeId]                          INT             NOT NULL,
    [AggregationTypeId]                  INT             NOT NULL,
    [ReportingPeriodTypeId]              INT             NOT NULL,
    [ReportingPeriodId]                  INT             NOT NULL,
    [StudentUSI]                         INT             NOT NULL,
    [SchoolId]                           INT             NOT NULL,
    [GradeLevelTypeId]                   INT             NOT NULL,
    [AttendingLocalEducationAgencyId]    INT             NOT NULL,
    [ResidentEducationOrganizationId]    INT             NOT NULL,
    [IsConcurrentForLimiting]            SMALLINT        CONSTRAINT [DF_MembershipInterval_IsConcurrentForLimiting] DEFAULT ((-1)) NOT NULL,
    [MembershipFTEDescriptorId]          INT             NOT NULL,
    [TuitionPayerDescriptorId]           INT             NOT NULL,
    [ProgramServiceDescriptorId]         INT             NULL,
    [TrackNumber]                        INT             NULL,
    [IsHomeBound]                        BIT             NOT NULL,
    [FundingTypeId]                      INT             NOT NULL,
    [MembershipIntervalStartDate]        DATE            NOT NULL,
    [MembershipIntervalEndDate]          DATE            NOT NULL,
    [UnadjustedMembershipDays]           DECIMAL (10, 6) NOT NULL,
    [UnadjustedAbsenceDays]              DECIMAL (10, 6) NULL,
    [UnadjustedAverageDailyMembership]   DECIMAL (10, 4) NOT NULL,
    [UnadjustedAverageDailyAttendance]   DECIMAL (10, 4) NULL,
    [CreateDate]                         DATETIME        NOT NULL,
    [SPEDSupportLevelWeight]             DECIMAL (10, 4) NULL,
    [SpecialEnrollmentDescriptorId]      INT             NULL,
    [ServiceCodeDescriptorId]            INT             NULL,
    [StudentSchoolAssociationEntryDate]  DATE            NOT NULL,
    [UnadjustedDaysEnrolled]             DECIMAL (10, 6) NOT NULL,
    [YearEndUnadjustedADM]               DECIMAL (10, 4) NOT NULL,
    [YearEndAdjustedADM]                 DECIMAL (10, 4) NOT NULL,
    [YearEndAdjustedADA]                 DECIMAL (10, 4) CONSTRAINT [DF_MembershipInterval_YearEndAdjustedADA] DEFAULT ((0)) NOT NULL,
    [LimitedAverageDailyMembership]      DECIMAL (10, 4) CONSTRAINT [DF_MembershipInterval_LimitedAverageDailyMembership] DEFAULT ((0)) NOT NULL,
    [LimitedAverageDailyAttendance]      DECIMAL (10, 4) CONSTRAINT [DF_MembershipInterval_LimitedAverageDailyAttendance] DEFAULT ((0)) NOT NULL,
    [LimitedMembershipDays]              DECIMAL (10, 6) CONSTRAINT [DF_MembershipInterval_LimitedMembershipDays] DEFAULT ((0)) NOT NULL,
    [LimitedAbsenceDays]                 DECIMAL (10, 6) CONSTRAINT [DF_MembershipInterval_LimitedAbsenceDays] DEFAULT ((0)) NOT NULL,
    [AttendanceMinutes]                  DECIMAL (10, 4) NULL,
    [SubmittedByEducationOrganizationId] INT             NULL,
	[CalendarCode] Nvarchar(60) NULL,
    [IsChronicallyIll] bit NULL,
    CONSTRAINT [PK_MembershipInterval] PRIMARY KEY NONCLUSTERED ([MembershipIntervalId] ASC) ON [PRIMARY],
    CONSTRAINT [FK_MembershipInterval IsConcurrentForLimiting] FOREIGN KEY ([IsConcurrentForLimiting]) REFERENCES [config].[MultistateBitValue] ([Id]),
    CONSTRAINT [FK_MembershipInterval Student] FOREIGN KEY ([StudentUSI]) REFERENCES [leadata].[Student] ([StudentUSI]),
    CONSTRAINT [FK_MembershipInterval_ADMType] FOREIGN KEY ([ADMTypeId]) REFERENCES [ace].[ADMType] ([ADMTypeId]),
    CONSTRAINT [FK_MembershipInterval_AggregationType] FOREIGN KEY ([AggregationTypeId]) REFERENCES [ace].[AggregationType] ([AggregationTypeId]),
    CONSTRAINT [FK_MembershipInterval_EducationOrganization_ResidentEducationOrganization] FOREIGN KEY ([ResidentEducationOrganizationId], [FiscalYear]) REFERENCES [entity].[EducationOrganization] ([EducationOrganizationId], [FiscalYear]),
    CONSTRAINT [FK_MembershipInterval_Execution] FOREIGN KEY ([ExecutionId]) REFERENCES [process].[Execution] ([ExecutionId]),
    CONSTRAINT [FK_MembershipInterval_FundingType] FOREIGN KEY ([FundingTypeId]) REFERENCES [ace].[FundingType] ([FundingTypeId]),
    CONSTRAINT [FK_MembershipInterval_GradeLevelTypeId] FOREIGN KEY ([GradeLevelTypeId]) REFERENCES [entity].[GradeLevelType] ([GradeLevelTypeId]),
    CONSTRAINT [FK_MembershipInterval_LocalEducationAgency] FOREIGN KEY ([AttendingLocalEducationAgencyId], [FiscalYear]) REFERENCES [entity].[LocalEducationAgency] ([LocalEducationAgencyId], [FiscalYear]),
    CONSTRAINT [FK_MembershipInterval_ReportingPeriod] FOREIGN KEY ([FiscalYear], [ReportingPeriodId]) REFERENCES [config].[ReportingPeriod] ([FiscalYear], [ReportingPeriodId]),
    CONSTRAINT [FK_MembershipInterval_ReportingPeriodType] FOREIGN KEY ([ReportingPeriodTypeId]) REFERENCES [config].[ReportingPeriodType] ([ReportingPeriodTypeId]),
    CONSTRAINT [FK_MembershipInterval_School] FOREIGN KEY ([SchoolId], [FiscalYear]) REFERENCES [entity].[School] ([SchoolId], [FiscalYear])
) ON [ps_ace_MembershipInterval_FiscalYear] ([FiscalYear]);
GO
CREATE PARTITION SCHEME [ps_ace_MembershipInterval_FiscalYear] AS PARTITION [pf_ace_MembershipInterval_FiscalYear] TO ([PRIMARY])
GO

CREATE PARTITION FUNCTION [pf_ace_MembershipInterval_FiscalYear](int) AS RANGE RIGHT FOR VALUES (2016, 2017, 2018, 2019)
GO

CREATE NONCLUSTERED INDEX [IX_MembershipInterval_ExecutionId_StudentUSI_ResidentEducationOrganizationId]
    ON [ace].[MembershipInterval]([ExecutionId] ASC, [StudentUSI] ASC, [ResidentEducationOrganizationId] ASC)
    INCLUDE([FiscalYear], [ADMTypeId], [AggregationTypeId], [ReportingPeriodId], [SchoolId], [MembershipIntervalStartDate])
    ON [PRIMARY];
GO

CREATE UNIQUE CLUSTERED INDEX [IXC_FiscalYear_MembershipInterval_PartitioningKey]
    ON [ace].[MembershipInterval]([FiscalYear] ASC, [MembershipIntervalId] ASC)
    ON [ps_ace_MembershipInterval_FiscalYear] ([FiscalYear]);
GO

