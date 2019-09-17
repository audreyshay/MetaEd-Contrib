CREATE TABLE [leadata].[StudentProgramAssociation] (
    [FiscalYear]                     INT           NOT NULL,
    [StudentUSI]                     INT           NOT NULL,
    [ProgramTypeId]                  INT           NOT NULL,
    [ProgramName]                    NVARCHAR (60) NOT NULL,
    [ProgramEducationOrganizationId] INT           NOT NULL,
    [BeginDate]                      DATE          NOT NULL,
    [EndDate]                        DATE          NULL,
    [ReasonExitedDescriptorId]       INT           NULL,
    [EducationOrganizationId]        INT           NOT NULL,
    [SourceId]                       UNIQUEIDENTIFIER NULL,
	[SourceCreateDate]				 DATETIME	   NOT NULL CONSTRAINT [StudentProgramAssociation_DF_SourceCreateDate]  DEFAULT (getutcdate()),
	[SourceLastModifiedDate]		 DATETIME      NOT NULL CONSTRAINT [StudentProgramAssociation_DF_SourceLastModifiedDate]  DEFAULT (getutcdate()),
	[LoadDate]						 DATETIME	   NOT NULL CONSTRAINT [StudentProgramAssociation_DF_Loaddate]  DEFAULT (getutcdate()),  
	[HashValue] [binary](64) DEFAULT (00) NOT NULL, 
	CONSTRAINT [PK_StudentProgramAssociation] PRIMARY KEY CLUSTERED ([FiscalYear] ASC, [StudentUSI] ASC, [ProgramTypeId] ASC, [ProgramName] ASC, [ProgramEducationOrganizationId] ASC, [BeginDate] ASC, [EducationOrganizationId] ASC),
    CONSTRAINT [FK_StudentProgramAssociation_EducationOrganization] FOREIGN KEY ([EducationOrganizationId], [FiscalYear]) REFERENCES [entity].[EducationOrganization] ([EducationOrganizationId], [FiscalYear]) ON DELETE CASCADE,
    CONSTRAINT [FK_StudentProgramAssociation_Program] FOREIGN KEY ([FiscalYear], [ProgramEducationOrganizationId], [ProgramTypeId], [ProgramName]) REFERENCES [entity].[Program] ([FiscalYear], [EducationOrganizationId], [ProgramTypeId], [ProgramName]) ON DELETE CASCADE,
    CONSTRAINT [FK_StudentProgramAssociation_Student_StudentUSI] FOREIGN KEY ([StudentUSI]) REFERENCES [leadata].[Student] ([StudentUSI]) ON DELETE CASCADE
);



GO
CREATE NONCLUSTERED INDEX [IX_StudentProgramAssociation_Student_ProgramType_Edorg_EndDate]
    ON [leadata].[StudentProgramAssociation]([StudentUSI] ASC, [ProgramTypeId] ASC, [EducationOrganizationId] ASC, [EndDate] ASC)
    INCLUDE([FiscalYear], [BeginDate]);


GO

CREATE NONCLUSTERED INDEX [IX_StudentProgramAssociation_EdORG_StudentUSI_Fiscalyear_ProgramType] 
ON [leadata].[StudentProgramAssociation]([EducationOrganizationId] ASC, [StudentUSI] ASC,[FiscalYear] ASC,	[ProgramTypeId] ASC)
INCLUDE ([ProgramName],	[BeginDate],	[EndDate],	[ReasonExitedDescriptorId]);

--Used for SPED72 Report
GO
CREATE NONCLUSTERED INDEX [IX_StudentProgramAssociation_FY_ProgramTypeId_StudUSI_ProgName_ProgramEdOrg_BeginDate_EdOrg_SourceId]
ON [leadata].[StudentProgramAssociation] ([FiscalYear],[ProgramTypeId])
INCLUDE ([StudentUSI],[ProgramName],[ProgramEducationOrganizationId],[BeginDate],[EducationOrganizationId],[SourceId])