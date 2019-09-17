CREATE TABLE [ace].[MaxLimitedAverageDailyMembershipByGrade]
(
	[MaxLimitedAverageDailyMembershipByGradeId]	INT				IDENTITY (1, 1) NOT NULL,
	[MaxLimitedAverageDailyMembership]				DECIMAL(10,4)	NOT NULL,
	[GradeLevelTypeId]				INT				NULL,
	[FiscalYear]					INT				NOT NULL,
    CONSTRAINT [PK_MaxLimitedAverageDailyMembershipByGrade] PRIMARY KEY CLUSTERED ([MaxLimitedAverageDailyMembershipByGradeId] ASC),
    CONSTRAINT [FK_MaxLimitedAverageDailyMembershipByGrade_GradeLevelType] FOREIGN KEY ([GradeLevelTypeId]) REFERENCES [entity].[GradeLevelType] ([GradeLevelTypeId])
)
