CREATE TABLE [extension].[WiDpiStudentCTEProgram] (
    [SchoolYear] SMALLINT not null,
	[StudentUSI]                     INT            NOT NULL,
    [ProgramTypeId]                  INT            NOT NULL,
    [ProgramEducationOrganizationId] INT            NOT NULL,
    [BeginDate]                      DATE           NOT NULL,
    [CareerPathwayTypeId]            INT            NOT NULL,
    [ProgramName]                    NVARCHAR (60)  NOT NULL,
    [EducationOrganizationId]        INT            NOT NULL,
    [IacCodeTypeId]					INT				NULL,
	[CreateDate] [datetime] NOT NULL,
    CONSTRAINT [PK_WiDpiStudentCTEProgram] PRIMARY KEY CLUSTERED ([SchoolYear] ASC, [StudentUSI] ASC, [ProgramTypeId] ASC, [ProgramEducationOrganizationId] ASC, [BeginDate] ASC, [CareerPathwayTypeId] ASC, [ProgramName] ASC, [EducationOrganizationId] ASC),
    CONSTRAINT [FK_WiDpiStudentCTEProgram_StudentCTEProgramAssociationCTEProgram] FOREIGN KEY ([SchoolYear], [StudentUSI], [ProgramTypeId], [ProgramEducationOrganizationId], [BeginDate], [CareerPathwayTypeId], [ProgramName], [EducationOrganizationId]) REFERENCES [edfi].[StudentCTEProgramAssociationCTEProgram] ([SchoolYear], [StudentUSI], [ProgramTypeId], [ProgramEducationOrganizationId], [BeginDate], [CareerPathwayTypeId], [ProgramName], [EducationOrganizationId]) ON DELETE CASCADE,
    CONSTRAINT [FK_WiDpiStudentCTEProgram_IacCodeType] FOREIGN KEY (IacCodeTypeId) REFERENCES [extension].[IacCodeType] (IacCodeTypeId)
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'CTE programs IAC code and WI Program Areas.', @level0type = N'SCHEMA', @level0name = N'extension', @level1type = N'TABLE', @level1name = N'WiDpiStudentCTEProgram';

GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Key for IAC Code Type' , @level0type=N'SCHEMA',@level0name=N'extension', @level1type=N'TABLE',@level1name=N'WiDpiStudentCTEProgram', @level2type=N'COLUMN',@level2name=N'IacCodeTypeId'
GO
