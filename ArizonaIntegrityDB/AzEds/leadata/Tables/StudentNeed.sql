CREATE TABLE [leadata].[StudentNeed] (
    [FiscalYear]                       INT              NOT NULL,
    [StudentUSI]                       INT              NOT NULL,
    [ReportingEducationOrganizationID] INT              NOT NULL,
    [StudentNeedDescriptorId]          INT              NOT NULL,
    [StudentNeedEntryDate]             DATE             NOT NULL,
    [StudentNeedExitDate]              DATE             NULL,
    [PrimaryStudentNeedIndicator]      BIT              NULL,
	[PrimaryNightTimeResidenceDescriptorId]     INT     NULL,
    [SourceId]						   UNIQUEIDENTIFIER	NULL,
	[SourceCreateDate]				   DATETIME			NOT NULL CONSTRAINT [StudentNeed_DF_SourceCreateDate]  DEFAULT (getutcdate()),
	[SourceLastModifiedDate]		   DATETIME			NOT NULL CONSTRAINT [StudentNeed_DF_SourceLastModifiedDate]  DEFAULT (getutcdate()),
	[LoadDate]						   DATETIME			NOT NULL CONSTRAINT [StudentNeed_DF_Loaddate]  DEFAULT (getutcdate()),
	[HashValue]	[binary](64)		   CONSTRAINT [StudentNeed_DF_HashValue] DEFAULT (00) NOT NULL,
	CONSTRAINT [PK_StudentNeed] PRIMARY KEY CLUSTERED ([FiscalYear] ASC, [StudentUSI] ASC, [ReportingEducationOrganizationID] ASC, [StudentNeedDescriptorId] ASC, [StudentNeedEntryDate] ASC),
    CONSTRAINT [FK_StudentNeed_EducationOrganization_EducationOrganizationId] FOREIGN KEY ([ReportingEducationOrganizationID], [FiscalYear]) REFERENCES [entity].[EducationOrganization] ([EducationOrganizationId], [FiscalYear]) ON DELETE CASCADE,
    CONSTRAINT [FK_StudentNeed_Student_StudentUSI] FOREIGN KEY ([StudentUSI]) REFERENCES [leadata].[Student] ([StudentUSI]) ON DELETE CASCADE,
	CONSTRAINT [FK_StudentNeed_StudentDescriptor] FOREIGN KEY ([StudentNeedDescriptorId]) REFERENCES [leadata].[StudentNeedDescriptor] ([StudentNeedDescriptorId]) ON DELETE CASCADE,
	CONSTRAINT [FK_StudentNeed_PrimaryNightTimeResidenceDescriptor] FOREIGN KEY ([PrimaryNightTimeResidenceDescriptorId]) REFERENCES [leadata].[PrimaryNightTimeResidenceDescriptor] ([PrimaryNightTimeResidenceDescriptorId])
);

