CREATE TABLE [edfi].[StudentCTEProgramAssociation] (
    [StudentUSI]                     INT           NOT NULL,
    [EducationOrganizationId]        INT           NOT NULL,
    [ProgramTypeId]                  INT           NOT NULL,
    [ProgramName]                    NVARCHAR (60) NOT NULL,
    [ProgramEducationOrganizationId] INT           NOT NULL,
    [BeginDate]                      DATE          NOT NULL,
    [WiDpiCertificatedProgramStatusTypeId] INT			NULL, 
	[WiDpiStateEndorsedRegionalCareerPathwayStatusTypeId] INT NULL,
	[SchoolYear]                          SMALLINT       CONSTRAINT [DF_StudentCTEProgramAssociation_SchoolYear] DEFAULT (datepart(year,getdate())) NOT NULL,
	[IsActive]                            BIT            CONSTRAINT [DF_StudentCTEProgramAssociation_IsActive] DEFAULT ((1)) NOT NULL,
  CONSTRAINT [PK_StudentCTEProgramAssociation] PRIMARY KEY CLUSTERED ([SchoolYear] ASC, [StudentUSI] ASC, [EducationOrganizationId] ASC, [ProgramTypeId] ASC, [ProgramName] ASC, [ProgramEducationOrganizationId] ASC, [BeginDate] ASC),
  CONSTRAINT [FK_StudentCTEProgramAssociation_StudentProgramAssociation] FOREIGN KEY ([SchoolYear], [StudentUSI], [EducationOrganizationId], [ProgramTypeId], [ProgramName], [ProgramEducationOrganizationId], [BeginDate]) REFERENCES [edfi].[StudentProgramAssociation] ([SchoolYear], [StudentUSI], [EducationOrganizationId], [ProgramTypeId], [ProgramName], [ProgramEducationOrganizationId], [BeginDate]) ON DELETE CASCADE,
   CONSTRAINT [FK_StudentCTEProgramAssociation_CertificatedProgramStatusType] FOREIGN KEY ([WiDpiCertificatedProgramStatusTypeId]) REFERENCES [extension].[CertificatedProgramStatusType] ([CertificatedProgramStatusTypeId]), 
    CONSTRAINT [FK_StudentCTEProgramAssociation_StateEndorsedRegionalCareerPathwayStatusType] FOREIGN KEY ([WiDpiStateEndorsedRegionalCareerPathwayStatusTypeId]) REFERENCES [extension].[StateEndorsedRegionalCareerPathwayStatusType] ([StateEndorsedRegionalCareerPathwayStatusTypeId]) 
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'This association represents the career and technical education (CTE) program that a student participates in. The association is an extension of the StudentProgramAssociation particular for CTE programs.', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'StudentCTEProgramAssociation';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'A unique number or alphanumeric code assigned to a student by a state education agency.', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'StudentCTEProgramAssociation', @level2type = N'COLUMN', @level2name = N'StudentUSI';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'The education organization where the student is participating in or receiving the program services.', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'StudentCTEProgramAssociation', @level2type = N'COLUMN', @level2name = N'EducationOrganizationId';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'The program associated with the student.', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'StudentCTEProgramAssociation', @level2type = N'COLUMN', @level2name = N'ProgramTypeId';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'The formal name of the program of instruction, training, services or benefits available through federal, state, or local agencies.', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'StudentCTEProgramAssociation', @level2type = N'COLUMN', @level2name = N'ProgramName';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'The education organization where the student is participating in or receiving the program services.', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'StudentCTEProgramAssociation', @level2type = N'COLUMN', @level2name = N'ProgramEducationOrganizationId';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'The month, day, and year on which the Student first received services.', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'StudentCTEProgramAssociation', @level2type = N'COLUMN', @level2name = N'BeginDate';

