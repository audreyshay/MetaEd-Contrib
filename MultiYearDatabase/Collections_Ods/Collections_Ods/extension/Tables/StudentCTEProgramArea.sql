CREATE TABLE [extension].[StudentCTEProgramArea] (
    [SchoolYear] SMALLINT not null,
	[StudentUSI]                     INT            NOT NULL,
    [ProgramTypeId]                  INT            NOT NULL,
    [ProgramEducationOrganizationId] INT            NOT NULL,
    [BeginDate]                      DATE           NOT NULL,
    [CareerPathwayTypeId]            INT            NOT NULL,
    [ProgramName]                    NVARCHAR (60)  NOT NULL,
    [EducationOrganizationId]        INT            NOT NULL,
	  [CteProgramAreaTypeId]			 INT			NOT NULL,
	[CreateDate] [datetime] NOT NULL,
    CONSTRAINT [PK_StudentCTEProgramArea] PRIMARY KEY CLUSTERED ([SchoolYear] ASC, [StudentUSI] ASC, [ProgramTypeId] ASC, [ProgramEducationOrganizationId] ASC, [BeginDate] ASC, [CareerPathwayTypeId] ASC, [ProgramName] ASC, [EducationOrganizationId] ASC, [CteProgramAreaTypeId] ASC),
    CONSTRAINT [FK_StudentCTEProgramArea_WiDpiStudentCTEProgramAssociationCTEProgram] FOREIGN KEY ([SchoolYear], [StudentUSI], [ProgramTypeId], [ProgramEducationOrganizationId], [BeginDate], [CareerPathwayTypeId], [ProgramName], [EducationOrganizationId]) REFERENCES [extension].[WiDpiStudentCTEProgram] ([SchoolYear], [StudentUSI], [ProgramTypeId], [ProgramEducationOrganizationId], [BeginDate], [CareerPathwayTypeId], [ProgramName], [EducationOrganizationId]) ON DELETE CASCADE,
    CONSTRAINT [FK_StudentCTEProgramArea_ CteProgramAreaType] FOREIGN KEY (CteProgramAreaTypeId) REFERENCES [extension].[CteProgramAreaType] (CteProgramAreaTypeId)
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'WI Program Areas.', @level0type = N'SCHEMA', @level0name = N'extension', @level1type = N'TABLE', @level1name = N'StudentCTEProgramArea';


GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Key for CTE Program Area Type' , @level0type=N'SCHEMA',@level0name=N'extension', @level1type=N'TABLE',@level1name=N'StudentCTEProgramArea', @level2type=N'COLUMN',@level2name=N'CteProgramAreaTypeId'
GO
