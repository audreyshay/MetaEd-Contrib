CREATE TABLE [leadata].[StudentSpecialEducationProgramAssociation] (
    [FiscalYear]                          INT           NOT NULL,
    [StudentUSI]                          INT           NOT NULL,
    [ProgramTypeId]                       INT           NOT NULL,
    [ProgramName]                         NVARCHAR (60) NOT NULL,
    [ProgramEducationOrganizationId]      INT           NOT NULL,
    [BeginDate]                           DATE          NOT NULL,
    [SpecialEducationSettingDescriptorId] INT           NULL,
    [EducationOrganizationId]             INT           NOT NULL,
    [MainSPEDSchool]                      BIT           NULL,
	[SourceCreateDate]					  DATETIME		NOT NULL CONSTRAINT [StudentSpecialEducationProgramAssociation_DF_SourceCreateDate]  DEFAULT (getutcdate()),
	[SourceLastModifiedDate]			  DATETIME		NOT NULL CONSTRAINT [StudentSpecialEducationProgramAssociation_DF_SourceLastModifiedDate]  DEFAULT (getutcdate()),
	[LoadDate]							  DATETIME		NOT NULL CONSTRAINT [StudentSpecialEducationProgramAssociation_DF_Loaddate]  DEFAULT (getutcdate()),
    [HashValue] [binary](64) DEFAULT (00) NOT NULL,
	CONSTRAINT [PK_StudentSpecialEducationProgramAssociation] PRIMARY KEY CLUSTERED ([FiscalYear] ASC, [StudentUSI] ASC, [ProgramTypeId] ASC, [ProgramName] ASC, [ProgramEducationOrganizationId] ASC, [BeginDate] ASC, [EducationOrganizationId] ASC),
    CONSTRAINT [FK_StudentSpecialEducationProgramAssociation_StudentProgramAssociation] FOREIGN KEY ([FiscalYear], [StudentUSI], [ProgramTypeId], [ProgramName], [ProgramEducationOrganizationId], [BeginDate], [EducationOrganizationId]) REFERENCES [leadata].[StudentProgramAssociation] ([FiscalYear], [StudentUSI], [ProgramTypeId], [ProgramName], [ProgramEducationOrganizationId], [BeginDate], [EducationOrganizationId]) ON DELETE CASCADE
);

GO 
CREATE NONCLUSTERED INDEX [IXNC_StudentSpecialEducationProgramAssociation_StudentUSI_ProgramTypeID_ProgramName_ProgramEdORG_EdORG]
    ON [leadata].[StudentSpecialEducationProgramAssociation]([StudentUSI] ASC, [ProgramTypeId] ASC, [ProgramName] ASC, [ProgramEducationOrganizationId] ASC, [BeginDate] ASC, [EducationOrganizationId] ASC)
    INCLUDE([SpecialEducationSettingDescriptorId], [MainSPEDSchool]);
GO