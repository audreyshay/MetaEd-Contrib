CREATE TABLE [edfiV3].[CourseOffering] (
	[ApiSchoolYear]	   SMALLINT NOT NULL, 
	[LocalCourseCode]          NVARCHAR (60)    NOT NULL,
    [SchoolId]                 INT              NOT NULL,
    [SchoolYear]               SMALLINT         NOT NULL,
    [SessionName]              NVARCHAR (60)    NOT NULL,
    [LocalCourseTitle]         NVARCHAR (60)    NULL,
    [InstructionalTimePlanned] INT              NULL,
    [CourseCode]               NVARCHAR (60)    NOT NULL,
    [EducationOrganizationId]  INT              NOT NULL,
    [CreateDate]               DATETIME2 (7)         NOT NULL,
    [LastModifiedDate]         DATETIME2 (7)         NOT NULL,
    [Id]                       UNIQUEIDENTIFIER NOT NULL,
	[IsActive] BIT CONSTRAINT [V3_CourseOffering_DF_IsActive] DEFAULT ((1)) NOT NULL,
    CONSTRAINT [V3_CourseOffering_PK] PRIMARY KEY CLUSTERED ([ApiSchoolYear] ASC,[SchoolId] ASC, [SchoolYear] ASC, [LocalCourseCode] ASC, [SessionName] ASC),
    CONSTRAINT [V3_FK_CourseOffering_Course] FOREIGN KEY ([ApiSchoolYear], [CourseCode], [EducationOrganizationId]) REFERENCES [edfiV3].[Course] ([ApiSchoolYear], [CourseCode], [EducationOrganizationId]),
    CONSTRAINT [V3_FK_CourseOffering_School] FOREIGN KEY ([ApiSchoolYear], [SchoolId]) REFERENCES [edfiV3].[School] ([ApiSchoolYear], [SchoolId]),
    CONSTRAINT [V3_FK_CourseOffering_Session] FOREIGN KEY ([ApiSchoolYear], [SchoolId], [SchoolYear], [SessionName]) REFERENCES [edfiV3].[Session] ([ApiSchoolYear], [SchoolId], [SchoolYear], [SessionName])
);
