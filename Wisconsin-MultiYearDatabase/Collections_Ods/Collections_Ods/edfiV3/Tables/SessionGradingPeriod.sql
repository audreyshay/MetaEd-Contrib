CREATE TABLE [edfiV3].[SessionGradingPeriod] (
    [ApiSchoolYear]	   SMALLINT NOT NULL,
	[GradingPeriodDescriptorId] INT           NOT NULL,
    [PeriodSequence]            INT           NOT NULL,
    [SchoolId]                  INT           NOT NULL,
    [SchoolYear]                SMALLINT      NOT NULL,
    [SessionName]               NVARCHAR (60) NOT NULL,
    [CreateDate]                DATETIME2 (7)      NOT NULL,
    CONSTRAINT [V3_SessionGradingPeriod_PK] PRIMARY KEY CLUSTERED ([ApiSchoolYear] ASC,[SchoolId] ASC, [SchoolYear] ASC, [GradingPeriodDescriptorId] ASC, [PeriodSequence] ASC, [SessionName] ASC),
    CONSTRAINT [V3_FK_SessionGradingPeriod_GradingPeriod] FOREIGN KEY ([ApiSchoolYear], [SchoolId], [SchoolYear], [GradingPeriodDescriptorId], [PeriodSequence]) REFERENCES [edfiV3].[GradingPeriod] ([ApiSchoolYear], [SchoolId], [SchoolYear], [GradingPeriodDescriptorId], [PeriodSequence]),
    CONSTRAINT [V3_FK_SessionGradingPeriod_Session] FOREIGN KEY ([ApiSchoolYear], [SchoolId],[SchoolYear], [SessionName]) REFERENCES [edfiV3].[Session] ([ApiSchoolYear], [SchoolId], [SchoolYear],[SessionName]) ON DELETE CASCADE
);