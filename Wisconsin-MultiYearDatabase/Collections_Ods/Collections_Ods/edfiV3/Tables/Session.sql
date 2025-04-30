CREATE TABLE [edfiV3].[Session] (
    [ApiSchoolYear]	   SMALLINT NOT NULL,
	[SchoolId]               INT              NOT NULL,
    [SchoolYear]             SMALLINT         NOT NULL,
    [SessionName]            NVARCHAR (60)    NOT NULL,
    [BeginDate]              DATE             NOT NULL,
    [EndDate]                DATE             NOT NULL,
    [TermDescriptorId]       INT              NOT NULL,
    [TotalInstructionalDays] INT              NOT NULL,
    [CreateDate]             DATETIME2 (7)         NOT NULL,
    [LastModifiedDate]       DATETIME2 (7)         NOT NULL,
    [Id]                     UNIQUEIDENTIFIER NOT NULL,
	[IsActive] BIT CONSTRAINT [V3_Session_DF_IsActive] DEFAULT ((1)) NOT NULL,
    CONSTRAINT [V3_Session_PK] PRIMARY KEY CLUSTERED ([ApiSchoolYear] ASC, [SchoolId] ASC,[SchoolYear] ASC, [SessionName] ASC),
    CONSTRAINT [V3_FK_Session_School] FOREIGN KEY ([ApiSchoolYear], [SchoolId]) REFERENCES [edfiV3].[School] ([ApiSchoolYear], [SchoolId]),
    CONSTRAINT [V3_FK_Session_SchoolYearType] FOREIGN KEY ([SchoolYear]) REFERENCES [edfiV3].[SchoolYearType] ([SchoolYear]),
    CONSTRAINT [V3_FK_Session_TermDescriptor] FOREIGN KEY ([TermDescriptorId]) REFERENCES [edfiV3].[TermDescriptor] ([TermDescriptorId])
);
GO
CREATE NONCLUSTERED INDEX [IX_SessionV3_BeginDate]
    ON [edfiV3].[Session]([BeginDate] DESC) WITH (FILLFACTOR = 90, PAD_INDEX = ON);
GO