CREATE TABLE [leadata].[CourseOffering] (
	[FiscalYear]			   INT				NOT NULL,
    [SchoolId]                 INT              NOT NULL,
    [TermTypeId]               INT              NOT NULL,
    [SchoolYear]               SMALLINT         NOT NULL, 
    [EducationOrganizationId]  INT              NOT NULL,
    [LocalCourseCode]          NVARCHAR (60)    NOT NULL,
    [LocalCourseTitle]         NVARCHAR (100)   NULL,
    [CourseCode]               NVARCHAR (60)    NOT NULL,
	[SessionName]              NVARCHAR (60) CONSTRAINT [CourseOffering_DF_SessionName] DEFAULT 'Not Applicable' NOT NULL ,
    [InstructionalTimePlanned] INT              NULL,
	[EndOfCourseAssessmentCodeTypeId]	INT		NULL,
    [SourceId]                 UNIQUEIDENTIFIER NOT NULL,
    [SourceLastModifiedDate]         DATETIME        NOT NULL,
    [SourceCreateDate]               DATETIME        NOT NULL,
	[LoadDate]               DATETIME         CONSTRAINT [CourseOffering_DF_LoadDate] DEFAULT (GETUTCDATE()) NOT NULL,
	[HashValue]				[binary](64)	  CONSTRAINT [CourseOffering_DF_HashValue] DEFAULT (00) NOT NULL,
    CONSTRAINT [PK_CourseOffering] PRIMARY KEY CLUSTERED ([FiscalYear] ASC,[SchoolId] ASC, [TermTypeId] ASC, [LocalCourseCode] ASC, [SchoolYear] ASC, [SessionName] ASC ),
    CONSTRAINT [FK_CourseOffering_Course_FiscalYear_SchoolId_CourseCode] FOREIGN KEY ([FiscalYear],[EducationOrganizationId], [CourseCode]) REFERENCES [entity].[Course] ( [FiscalYear],[EducationOrganizationId],[CourseCode]),
    CONSTRAINT [FK_CourseOffering_School_SchoolId] FOREIGN KEY ([SchoolId],[FiscalYear]) REFERENCES [entity].[School] ([SchoolId], [FiscalYear]),
    CONSTRAINT [FK_CourseOffering_Session_SchoolId] FOREIGN KEY ([FiscalYear], [SchoolId], [TermTypeId], [SchoolYear], [SessionName]) REFERENCES [leadata].[Session] ([FiscalYear], [SchoolId], [TermTypeId], [SchoolYear], [SessionName]) ON DELETE CASCADE ON UPDATE CASCADE
);
















