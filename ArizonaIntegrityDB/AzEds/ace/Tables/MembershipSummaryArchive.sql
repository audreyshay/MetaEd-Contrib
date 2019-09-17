CREATE TABLE [ace].[MembershipSummaryArchive] (
    [MembershipSummaryId]					  BIGINT          NOT NULL,
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
    CONSTRAINT [PK_MembershipSummaryArchive] PRIMARY KEY CLUSTERED ([MembershipSummaryId] ASC)
);



