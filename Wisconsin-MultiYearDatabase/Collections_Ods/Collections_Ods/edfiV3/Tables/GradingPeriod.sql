CREATE TABLE [edfiV3].[GradingPeriod] (
    [ApiSchoolYear]	   SMALLINT NOT NULL,
	[GradingPeriodDescriptorId] INT              NOT NULL,
    [PeriodSequence]            INT              NOT NULL,
    [SchoolId]                  INT              NOT NULL,
    [SchoolYear]                SMALLINT         NOT NULL,
    [BeginDate]                 DATE             NOT NULL,
    [EndDate]                   DATE             NOT NULL,
    [TotalInstructionalDays]    INT              NOT NULL,
    [CreateDate]                DATETIME2 (7)         NOT NULL,
    [LastModifiedDate]          DATETIME2 (7)         NOT NULL,
    [Id]                        UNIQUEIDENTIFIER NOT NULL,
	[IsActive] BIT CONSTRAINT [V3_GradingPeriod_DF_IsActive] DEFAULT ((1)) NOT NULL,
    CONSTRAINT [V3_GradingPeriod_PK] PRIMARY KEY CLUSTERED ([ApiSchoolYear] ASC, [SchoolId] ASC, [SchoolYear] ASC, [GradingPeriodDescriptorId] ASC, [PeriodSequence] ASC),
    CONSTRAINT [V3_FK_GradingPeriod_GradingPeriodDescriptor] FOREIGN KEY ([GradingPeriodDescriptorId]) REFERENCES [edfiV3].[GradingPeriodDescriptor] ([GradingPeriodDescriptorId]),
    CONSTRAINT [V3_FK_GradingPeriod_School] FOREIGN KEY ([ApiSchoolYear], [SchoolId]) REFERENCES [edfiV3].[School] ([ApiSchoolYear], [SchoolId]),
    CONSTRAINT [V3_FK_GradingPeriod_SchoolYearType] FOREIGN KEY ([SchoolYear]) REFERENCES [edfiV3].[SchoolYearType] ([SchoolYear])
);

