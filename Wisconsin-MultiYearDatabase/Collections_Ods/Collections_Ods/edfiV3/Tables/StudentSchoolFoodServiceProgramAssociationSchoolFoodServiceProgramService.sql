CREATE TABLE [edfiV3].[StudentSchoolFoodServiceProgramAssociationSchoolFoodServiceProgramService] (
	[ApiSchoolYear]	   SMALLINT NOT NULL,
    [BeginDate]                                   DATE          NOT NULL,
    [EducationOrganizationId]                     INT           NOT NULL,
    [ProgramEducationOrganizationId]              INT           NOT NULL,
    [ProgramName]                                 NVARCHAR (60) NOT NULL,
    [ProgramTypeDescriptorId]                     INT           NOT NULL,
    [SchoolFoodServiceProgramServiceDescriptorId] INT           NOT NULL,
    [StudentUSI]                                  INT           NOT NULL,
    [PrimaryIndicator]                            BIT           NULL,
    [ServiceBeginDate]                            DATE          NULL,
    [ServiceEndDate]                              DATE          NULL,
    [CreateDate]                                  DATETIME2 (7)      NOT NULL,
    CONSTRAINT [V3_StudentSchoolFoodServiceProgramAssociationSchoolFoodServiceProgramService_PK] PRIMARY KEY CLUSTERED ([ApiSchoolYear] ASC, [BeginDate] ASC, [EducationOrganizationId] ASC, [ProgramEducationOrganizationId] ASC, [ProgramName] ASC, [ProgramTypeDescriptorId] ASC, [SchoolFoodServiceProgramServiceDescriptorId] ASC, [StudentUSI] ASC),
    CONSTRAINT [V3_FK_StudentSchoolFoodServiceProgramAssociationSchoolFoodServiceProgramService_SchoolFoodServiceProgramServiceDescriptor] FOREIGN KEY ([SchoolFoodServiceProgramServiceDescriptorId]) REFERENCES [edfiV3].[SchoolFoodServiceProgramServiceDescriptor] ([SchoolFoodServiceProgramServiceDescriptorId]),
    CONSTRAINT [V3_FK_StudentSchoolFoodServiceProgramAssociationSchoolFoodServiceProgramService_StudentSchoolFoodServiceProgramAssociation] FOREIGN KEY ([ApiSchoolYear], [EducationOrganizationId], [StudentUSI], [BeginDate], [ProgramEducationOrganizationId], [ProgramName], [ProgramTypeDescriptorId]) REFERENCES [edfiV3].[StudentSchoolFoodServiceProgramAssociation] ([ApiSchoolYear], [EducationOrganizationId], [StudentUSI], [BeginDate], [ProgramEducationOrganizationId], [ProgramName], [ProgramTypeDescriptorId]) ON DELETE CASCADE
);


GO
CREATE NONCLUSTERED INDEX [FK_StudentSchoolFoodServiceProgramAssociationSchoolFoodServiceProgramService_SchoolFoodServiceProgramServiceDescriptor]
    ON [edfiV3].[StudentSchoolFoodServiceProgramAssociationSchoolFoodServiceProgramService]([SchoolFoodServiceProgramServiceDescriptorId] ASC);


GO
CREATE NONCLUSTERED INDEX [FK_StudentSchoolFoodServiceProgramAssociationSchoolFoodServiceProgramService_StudentSchoolFoodServiceProgramAssociation]
    ON [edfiV3].[StudentSchoolFoodServiceProgramAssociationSchoolFoodServiceProgramService]([BeginDate] ASC, [EducationOrganizationId] ASC, [ProgramEducationOrganizationId] ASC, [ProgramName] ASC, [ProgramTypeDescriptorId] ASC, [StudentUSI] ASC);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Last date the Student was in this option for the current school year.', @level0type = N'SCHEMA', @level0name = N'edfiV3', @level1type = N'TABLE', @level1name = N'StudentSchoolFoodServiceProgramAssociationSchoolFoodServiceProgramService', @level2type = N'COLUMN', @level2name = N'ServiceEndDate';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'First date the Student was in this option for the current school year.', @level0type = N'SCHEMA', @level0name = N'edfiV3', @level1type = N'TABLE', @level1name = N'StudentSchoolFoodServiceProgramAssociationSchoolFoodServiceProgramService', @level2type = N'COLUMN', @level2name = N'ServiceBeginDate';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'True if service is a primary service.', @level0type = N'SCHEMA', @level0name = N'edfiV3', @level1type = N'TABLE', @level1name = N'StudentSchoolFoodServiceProgramAssociationSchoolFoodServiceProgramService', @level2type = N'COLUMN', @level2name = N'PrimaryIndicator';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'A unique alphanumeric code assigned to a student.', @level0type = N'SCHEMA', @level0name = N'edfiV3', @level1type = N'TABLE', @level1name = N'StudentSchoolFoodServiceProgramAssociationSchoolFoodServiceProgramService', @level2type = N'COLUMN', @level2name = N'StudentUSI';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Indicates the service being provided to the student by the School Food Service Program.', @level0type = N'SCHEMA', @level0name = N'edfiV3', @level1type = N'TABLE', @level1name = N'StudentSchoolFoodServiceProgramAssociationSchoolFoodServiceProgramService', @level2type = N'COLUMN', @level2name = N'SchoolFoodServiceProgramServiceDescriptorId';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The type of program.', @level0type = N'SCHEMA', @level0name = N'edfiV3', @level1type = N'TABLE', @level1name = N'StudentSchoolFoodServiceProgramAssociationSchoolFoodServiceProgramService', @level2type = N'COLUMN', @level2name = N'ProgramTypeDescriptorId';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The formal name of the Program of instruction, training, services, or benefits available through federal, state, or local agencies.', @level0type = N'SCHEMA', @level0name = N'edfiV3', @level1type = N'TABLE', @level1name = N'StudentSchoolFoodServiceProgramAssociationSchoolFoodServiceProgramService', @level2type = N'COLUMN', @level2name = N'ProgramName';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The identifier assigned to an education organization.', @level0type = N'SCHEMA', @level0name = N'edfiV3', @level1type = N'TABLE', @level1name = N'StudentSchoolFoodServiceProgramAssociationSchoolFoodServiceProgramService', @level2type = N'COLUMN', @level2name = N'ProgramEducationOrganizationId';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The identifier assigned to an education organization.', @level0type = N'SCHEMA', @level0name = N'edfiV3', @level1type = N'TABLE', @level1name = N'StudentSchoolFoodServiceProgramAssociationSchoolFoodServiceProgramService', @level2type = N'COLUMN', @level2name = N'EducationOrganizationId';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The month, day, and year on which the Student first received services.', @level0type = N'SCHEMA', @level0name = N'edfiV3', @level1type = N'TABLE', @level1name = N'StudentSchoolFoodServiceProgramAssociationSchoolFoodServiceProgramService', @level2type = N'COLUMN', @level2name = N'BeginDate';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Indicates the service(s) being provided to the Student by the School Food Service Program.', @level0type = N'SCHEMA', @level0name = N'edfiV3', @level1type = N'TABLE', @level1name = N'StudentSchoolFoodServiceProgramAssociationSchoolFoodServiceProgramService';