CREATE TABLE [edfiV3].[SectionClassPeriod]
(
	[ApiSchoolYear]	   SMALLINT NOT NULL,
	[ClassPeriodName]         NVARCHAR (60)  NOT NULL,
    [LocalCourseCode]         NVARCHAR (60)  NOT NULL,
    [SchoolId]                INT            NOT NULL,
    [SchoolYear]              SMALLINT       NOT NULL,
    [SectionIdentifier]       NVARCHAR (255) NOT NULL,
    [SessionName]             NVARCHAR (60)  NOT NULL,
    [CreateDate]              DATETIME2 (7)       NOT NULL,
    CONSTRAINT [V3_SectionClassPeriod_PK] PRIMARY KEY CLUSTERED ([ApiSchoolYear] Asc, [SchoolId] ASC, [SchoolYear] ASC, [ClassPeriodName] ASC, [LocalCourseCode] ASC, [SectionIdentifier] ASC, [SessionName] ASC),
    CONSTRAINT [V3_FK_SectionClassPeriod_ClassPeriod] FOREIGN KEY ([ApiSchoolYear], [SchoolId], [ClassPeriodName]) REFERENCES [edfiV3].[ClassPeriod] ([ApiSchoolYear], [SchoolId], [ClassPeriodName]),
    CONSTRAINT [V3_FK_SectionClassPeriod_Section] FOREIGN KEY ([ApiSchoolYear], [SchoolId], [SchoolYear], [LocalCourseCode], [SectionIdentifier], [SessionName]) REFERENCES [edfiV3].[Section] ([ApiSchoolYear], [SchoolId],[SchoolYear], [LocalCourseCode], [SectionIdentifier], [SessionName]) ON DELETE CASCADE ON UPDATE CASCADE

)
