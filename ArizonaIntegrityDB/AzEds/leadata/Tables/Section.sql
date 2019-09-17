CREATE TABLE [leadata].[Section] (
	[FiscalYear]					  INT			   NOT NULL,
    [SchoolId]                        INT              NOT NULL,
    [ClassPeriodName]                 NVARCHAR (60)  CONSTRAINT [Section_DF_ClassPeriodName] DEFAULT 'Not Applicable' NOT NULL ,
    [ClassroomIdentificationCode]     NVARCHAR (20)  CONSTRAINT [Section_DF_ClassroomIdentificationCode] DEFAULT 'Not Applicable' NOT NULL ,
    [LocalCourseCode]                 NVARCHAR (60)    NOT NULL,
    [TermTypeId]                      INT              NOT NULL,
    [SchoolYear]                      SMALLINT         NOT NULL, 
	[UniqueSectionCode]               NVARCHAR (255)   NOT NULL DEFAULT '',
    [SequenceOfCourse]                INT           CONSTRAINT [Section_DF_SequenceOfCourse] DEFAULT -2  NOT NULL,
	[SessionName]					  NVARCHAR (60) CONSTRAINT [Section_DF_SessionName] DEFAULT 'Not Applicable' NOT NULL ,
    [EducationalEnvironmentTypeId]    INT              NULL,
	[EducationalEnvironmentTypeCodeValue]   NVarchar(50)  NULL,
	[EducationalEnvironmentTypeShortDescription] NVarchar(1024)  NULL,
    [MediumOfInstructionTypeId]       INT              NULL,
    [PopulationServedTypeId]          INT              NULL,
    [AvailableCreditTypeId]           INT              NULL,
	[AvailableCreditTypeCodeValue]     NVarchar(50)  NULL,
	[AvailableCreditTypeShortDescription]  NVarchar(1024)  NULL,
    [InstructionLanguageDescriptorId] INT              NULL,
    [AvailableCreditConversion]       DECIMAL(9, 2)    NULL,
    [AvailableCredit]                 DECIMAL(9, 2)    NULL,
	[LocationSchoolId]				  INT			   NULL,
	[LocationClassroomIdentificationCode] NVARCHAR(60) NULL,
    [MinutesPerWeek]                  INT              NULL,
    [Note]                            NVARCHAR (250)   NULL,
    [TimetableDayIdentifier]          NVARCHAR (250)   NULL,
    [SourceId]                        UNIQUEIDENTIFIER  NOT NULL,
    [SourceLastModifiedDate]          DATETIME    NOT NULL,
    [SourceCreateDate]                DATETIME    NOT NULL,
	[LoadDate]               DATETIME         CONSTRAINT [Section_DF_LoadDate] DEFAULT (GETUTCDATE()) NOT NULL,
	[HashValue]				[binary](64)	  CONSTRAINT [Section_DF_HashValue] DEFAULT (00) NOT NULL,
    [SiteLocationSchoolid] [int] NULL,
	CONSTRAINT [PK_Section] PRIMARY KEY CLUSTERED ([FiscalYear] ASC, [SchoolId] ASC, [ClassPeriodName] ASC, [ClassroomIdentificationCode] ASC, [LocalCourseCode] ASC, [TermTypeId] ASC, [SchoolYear] ASC, [UniqueSectionCode] ASC, [SequenceOfCourse] ASC,[SessionName] ASC ),
  --  CONSTRAINT [FK_Section_ClassPeriod_SchoolId] FOREIGN KEY ([SchoolId], [ClassPeriodName]) REFERENCES [edfi].[ClassPeriod] ([SchoolId], [ClassPeriodName]) ON UPDATE CASCADE,
    CONSTRAINT [FK_Section_CourseOffering_SchoolId] FOREIGN KEY ([FiscalYear],[SchoolId], [TermTypeId], [LocalCourseCode], [SchoolYear],[SessionName]) REFERENCES [leadata].[CourseOffering] ( [FiscalYear], [SchoolId],  [TermTypeId], [LocalCourseCode], [SchoolYear] , [SessionName])ON DELETE CASCADE ON UPDATE CASCADE,
   -- CONSTRAINT [FK_Section_CreditType_AvailableCreditTypeId] FOREIGN KEY ([AvailableCreditTypeId]) REFERENCES [edfi].[CreditType] ([CreditTypeId]),
  --  CONSTRAINT [FK_Section_EducationalEnvironmentType_EducationalEnvironmentTypeId] FOREIGN KEY ([EducationalEnvironmentTypeId]) REFERENCES [edfi].[EducationalEnvironmentType] ([EducationalEnvironmentTypeId]),
  --  CONSTRAINT [FK_Section_LanguageDescriptor_InstructionLanguageDescriptorId] FOREIGN KEY ([InstructionLanguageDescriptorId]) REFERENCES [edfi].[LanguageDescriptor] ([LanguageDescriptorId]),
  --  CONSTRAINT [FK_Section_Location_SchoolId] FOREIGN KEY ([SchoolId], [ClassroomIdentificationCode]) REFERENCES [edfi].[Location] ([SchoolId], [ClassroomIdentificationCode]) ON UPDATE CASCADE,
  --  CONSTRAINT [FK_Section_MediumOfInstructionType_MediumOfInstructionTypeId] FOREIGN KEY ([MediumOfInstructionTypeId]) REFERENCES [edfi].[MediumOfInstructionType] ([MediumOfInstructionTypeId]),
  --  CONSTRAINT [FK_Section_PopulationServedType_PopulationServedTypeId] FOREIGN KEY ([PopulationServedTypeId]) REFERENCES [edfi].[PopulationServedType] ([PopulationServedTypeId]),
    CONSTRAINT [FK_Section_School_SchoolId] FOREIGN KEY ([SchoolId], [FiscalYear]) REFERENCES [entity].[School] ([SchoolId], [FiscalYear]),
    CONSTRAINT [FK_Section_Session_SchoolId] FOREIGN KEY ([FiscalYear],[SchoolId], [TermTypeId], [SchoolYear] , [SessionName]) REFERENCES [leadata].[Session] ([FiscalYear],[SchoolId], [TermTypeId], [SchoolYear] , [SessionName]),
	CONSTRAINT [FK_Section_Location_SchoolId] FOREIGN KEY ([FiscalYear], [LocationSchoolId], [LocationClassroomIdentificationCode]) REFERENCES [leadata].[Location] ([FiscalYear], [SchoolId], [ClassroomIdentificationCode]),
	--CONSTRAINT [FK_Section_ClassPeriod_SchoolId] FOREIGN KEY ([FiscalYear], [SchoolId], [ClassPeriodName]) REFERENCES [leadata].[ClassPeriod] ([FiscalYear], [SchoolId], [ClassPeriodName])
	CONSTRAINT [FK_Section_School_SiteLocationSchoolid] FOREIGN KEY([SiteLocationSchoolid], [FiscalYear]) REFERENCES [entity].[School] ([SchoolId], [FiscalYear])

);











