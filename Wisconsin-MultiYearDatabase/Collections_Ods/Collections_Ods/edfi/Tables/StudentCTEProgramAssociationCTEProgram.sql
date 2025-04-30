CREATE TABLE [edfi].[StudentCTEProgramAssociationCTEProgram] (
    [StudentUSI]                     INT            NOT NULL,
    [ProgramTypeId]                  INT            NOT NULL,
    [ProgramEducationOrganizationId] INT            NOT NULL,
    [BeginDate]                      DATE           NOT NULL,
    [CareerPathwayTypeId]            INT            NOT NULL,
    [CIPCode]                        NVARCHAR (120) NULL,
    [PrimaryCTEProgramIndicator]     BIT            NULL,
    [CTEProgramCompletionIndicator]  BIT            NULL,
    [ProgramName]                    NVARCHAR (60)  NOT NULL,
    [EducationOrganizationId]        INT            NOT NULL,
    [CreateDate]                     DATETIME       CONSTRAINT [StudentCTEProgramAssociationCTEProgram_DF_CreateDate] DEFAULT (getdate()) NOT NULL,
	[SchoolYear] SMALLINT not null,
	CONSTRAINT [PK_StudentCTEProgramAssociationCTEProgram] PRIMARY KEY CLUSTERED ([SchoolYear] ASC, [StudentUSI] ASC, [ProgramTypeId] ASC, [ProgramEducationOrganizationId] ASC, [BeginDate] ASC, [CareerPathwayTypeId] ASC, [ProgramName] ASC, [EducationOrganizationId] ASC),
    CONSTRAINT [FK_StudentCTEProgramAssociationCTEProgram_CareerPathwayType_CareerPathwayTypeId] FOREIGN KEY ([CareerPathwayTypeId]) REFERENCES [edfi].[CareerPathwayType] ([CareerPathwayTypeId]),
    CONSTRAINT [FK_StudentCTEProgramAssociationCTEProgram_StudentCTEProgramAssociation] FOREIGN KEY ([SchoolYear],[StudentUSI], [EducationOrganizationId], [ProgramTypeId], [ProgramName], [ProgramEducationOrganizationId], [BeginDate]) REFERENCES [edfi].[StudentCTEProgramAssociation] ([SchoolYear],[StudentUSI], [EducationOrganizationId], [ProgramTypeId], [ProgramName], [ProgramEducationOrganizationId], [BeginDate]) ON DELETE CASCADE
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'This association represents the career and technical education (CTE) program that a student participates in. The association is an extension of the StudentProgramAssociation particular for CTE programs.', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'StudentCTEProgramAssociationCTEProgram';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'A unique number or alphanumeric code assigned to a student by a state education agency.', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'StudentCTEProgramAssociationCTEProgram', @level2type = N'COLUMN', @level2name = N'StudentUSI';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The month, day, and year on which the student first received services.', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'StudentCTEProgramAssociationCTEProgram', @level2type = N'COLUMN', @level2name = N'ProgramTypeId';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The education organization where the student is participating in or receiving the program services.', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'StudentCTEProgramAssociationCTEProgram', @level2type = N'COLUMN', @level2name = N'ProgramEducationOrganizationId';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'The month, day, and year on which the student first received services.  NEDM: Beginning Date', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'StudentCTEProgramAssociationCTEProgram', @level2type = N'COLUMN', @level2name = N'BeginDate';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'The career cluster representing the career path of the Vocational/Career Tech concentrator.  NEDM: Career Cluster', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'StudentCTEProgramAssociationCTEProgram', @level2type = N'COLUMN', @level2name = N'CareerPathwayTypeId';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'Number and description of the CIP Code associated with the student''s CTE program.', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'StudentCTEProgramAssociationCTEProgram', @level2type = N'COLUMN', @level2name = N'CIPCode';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'A boolean indicator of whether this CTEProgram, is the student''s primary CTEProgram.', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'StudentCTEProgramAssociationCTEProgram', @level2type = N'COLUMN', @level2name = N'PrimaryCTEProgramIndicator';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'A boolean indicator of whether the Student has completed the CTEProgram.', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'StudentCTEProgramAssociationCTEProgram', @level2type = N'COLUMN', @level2name = N'CTEProgramCompletionIndicator';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The formal name of the program of instruction, training, services or benefits available through federal, state, or local agencies.', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'StudentCTEProgramAssociationCTEProgram', @level2type = N'COLUMN', @level2name = N'ProgramName';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The education organization where the student is participating in or receiving the program services.', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'StudentCTEProgramAssociationCTEProgram', @level2type = N'COLUMN', @level2name = N'EducationOrganizationId';

