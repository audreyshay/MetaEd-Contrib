CREATE TABLE [edfiV3].[ClassPeriod] (
    [ApiSchoolYear]	   SMALLINT NOT NULL, 
	[ClassPeriodName]          NVARCHAR (60)    NOT NULL,
    [SchoolId]                 INT              NOT NULL,
    [OfficialAttendancePeriod] BIT              NULL,
    [CreateDate]               DATETIME2 (7)         NOT NULL,
    [LastModifiedDate]         DATETIME2 (7)         NOT NULL,
    [Id]                       UNIQUEIDENTIFIER NOT NULL,
	[IsActive] BIT CONSTRAINT [V3_ClassPeriod_DF_IsActive] DEFAULT ((1)) NOT NULL,
    CONSTRAINT [V3_ClassPeriod_PK] PRIMARY KEY CLUSTERED ([ApiSchoolYear] ASC, [SchoolId] ASC, [ClassPeriodName] ASC),
    CONSTRAINT [V3_FK_ClassPeriod_School] FOREIGN KEY ([ApiSchoolYear], [SchoolId]) REFERENCES [edfiV3].[School] ([ApiSchoolYear],[SchoolId])
);
