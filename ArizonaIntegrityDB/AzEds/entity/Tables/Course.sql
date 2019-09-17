CREATE TABLE [entity].[Course] (	
    [EducationOrganizationId]          INT              NOT NULL,
	[FiscalYear]					   INT				NOT NULL,
    [CourseCode]                       NVARCHAR (60)    NOT NULL,
    [CourseTitle]                      NVARCHAR (100)   NOT NULL,
    [NumberOfParts]                    INT              NOT NULL,  
	[AcademicSubjectDescriptorId]	   INT				NULL,
    [CourseDescription]                NVARCHAR (3000)  NULL,
    [DateCourseAdopted]                DATE             NULL,
    [HighSchoolCourseRequirement]      BIT              NULL,    
    [MinimumAvailableCreditTypeId]     INT              NULL,
    [MinimumAvailableCreditConversion] DECIMAL (9, 2)   NULL,
    [MinimumAvailableCredit]           DECIMAL (9, 2)   NULL,
    [MaximumAvailableCreditTypeId]     INT              NULL,
    [MaximumAvailableCreditConversion] DECIMAL (9, 2)   NULL,
    [MaximumAvailableCredit]           DECIMAL (9, 2)   NULL,
    [CareerPathwayTypeId]              INT              NULL,
    [TimeRequiredForCompletion]        INT              NULL,
    [SourceId]                               UNIQUEIDENTIFIER CONSTRAINT [Course_DF_Id] DEFAULT (newid()) NOT NULL,
    [LastModifiedDate]                 DATETIME   NOT NULL,
    [CreateDate]                       DATETIME   NOT NULL,
	[LoadDate]    DATETIME    CONSTRAINT [Course_DF_LoadDate] DEFAULT (GETUTCDATE()) NOT NULL
    CONSTRAINT [PK_Course] PRIMARY KEY CLUSTERED ([FiscalYear] ASC,[EducationOrganizationId] ASC, [CourseCode] ASC),
    CONSTRAINT [FK_Course_EducationOrganization_EducationOrganizationId_FiscalYear] FOREIGN KEY ([EducationOrganizationId],[FiscalYear]) REFERENCES [entity].[EducationOrganization] ([EducationOrganizationId],[FiscalYear]),
	CONSTRAINT [FK_Course_AcademicSubjectDescriptorId] FOREIGN KEY ([AcademicSubjectDescriptorId]) REFERENCES [entity].[AcademicSubjectDescriptor] ([AcademicSubjectDescriptorId])
);

GO

CREATE NONCLUSTERED INDEX [IX_Course_EducationOrganizationId_CourseCode] ON [entity].[Course]
(
	[EducationOrganizationId] ASC,
	[CourseCode] ASC
)
INCLUDE ( 	[HighSchoolCourseRequirement]) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO