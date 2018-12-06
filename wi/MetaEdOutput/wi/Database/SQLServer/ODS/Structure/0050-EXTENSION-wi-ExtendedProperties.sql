-- Extended Properties [wi].[CertificatedProgramStatusDescriptor] --
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Status in a certificated program', @level0type=N'SCHEMA', @level0name=N'wi', @level1type=N'TABLE', @level1name=N'CertificatedProgramStatusDescriptor'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A unique identifier used as Primary Key, not derived from business logic, when acting as Foreign Key, references the parent table.', @level0type=N'SCHEMA', @level0name=N'wi', @level1type=N'TABLE', @level1name=N'CertificatedProgramStatusDescriptor', @level2type=N'COLUMN', @level2name=N'CertificatedProgramStatusDescriptorId'
GO

-- Extended Properties [wi].[CountDateNameDescriptor] --
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'This descriptor describes the name of a count date for which services are recorded', @level0type=N'SCHEMA', @level0name=N'wi', @level1type=N'TABLE', @level1name=N'CountDateNameDescriptor'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A unique identifier used as Primary Key, not derived from business logic, when acting as Foreign Key, references the parent table.', @level0type=N'SCHEMA', @level0name=N'wi', @level1type=N'TABLE', @level1name=N'CountDateNameDescriptor', @level2type=N'COLUMN', @level2name=N'CountDateNameDescriptorId'
GO

-- Extended Properties [wi].[CountDateReceivingServiceDescriptor] --
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'This descriptor describes the state of services on a count date', @level0type=N'SCHEMA', @level0name=N'wi', @level1type=N'TABLE', @level1name=N'CountDateReceivingServiceDescriptor'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A unique identifier used as Primary Key, not derived from business logic, when acting as Foreign Key, references the parent table.', @level0type=N'SCHEMA', @level0name=N'wi', @level1type=N'TABLE', @level1name=N'CountDateReceivingServiceDescriptor', @level2type=N'COLUMN', @level2name=N'CountDateReceivingServiceDescriptorId'
GO

-- Extended Properties [wi].[CteProgramAreaDescriptor] --
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Wisconsin CTE program areas.', @level0type=N'SCHEMA', @level0name=N'wi', @level1type=N'TABLE', @level1name=N'CteProgramAreaDescriptor'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A unique identifier used as Primary Key, not derived from business logic, when acting as Foreign Key, references the parent table.', @level0type=N'SCHEMA', @level0name=N'wi', @level1type=N'TABLE', @level1name=N'CteProgramAreaDescriptor', @level2type=N'COLUMN', @level2name=N'CteProgramAreaDescriptorId'
GO

-- Extended Properties [wi].[DisciplineActionExtension] --
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'', @level0type=N'SCHEMA', @level0name=N'wi', @level1type=N'TABLE', @level1name=N'DisciplineActionExtension'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Identifier assigned by the education organization to the DisciplineAction.', @level0type=N'SCHEMA', @level0name=N'wi', @level1type=N'TABLE', @level1name=N'DisciplineActionExtension', @level2type=N'COLUMN', @level2name=N'DisciplineActionIdentifier'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The date of the DisciplineAction.', @level0type=N'SCHEMA', @level0name=N'wi', @level1type=N'TABLE', @level1name=N'DisciplineActionExtension', @level2type=N'COLUMN', @level2name=N'DisciplineDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A unique alphanumeric code assigned to a student.', @level0type=N'SCHEMA', @level0name=N'wi', @level1type=N'TABLE', @level1name=N'DisciplineActionExtension', @level2type=N'COLUMN', @level2name=N'StudentUSI'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Identifies if the duration of the expulsion has been modified from the federally required one year of expulsion for a fire arms incident.', @level0type=N'SCHEMA', @level0name=N'wi', @level1type=N'TABLE', @level1name=N'DisciplineActionExtension', @level2type=N'COLUMN', @level2name=N'ModifiedTermDescriptorId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Following an expulsion, the student had early reinstatement condition to return to school prior to the end of the expulsion.', @level0type=N'SCHEMA', @level0name=N'wi', @level1type=N'TABLE', @level1name=N'DisciplineActionExtension', @level2type=N'COLUMN', @level2name=N'EarlyReinstatementCondition'
GO

-- Extended Properties [wi].[IacCodeDescriptor] --
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'IAC - subset of federal CIP codes used in Wisconsin CTE programs.', @level0type=N'SCHEMA', @level0name=N'wi', @level1type=N'TABLE', @level1name=N'IacCodeDescriptor'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A unique identifier used as Primary Key, not derived from business logic, when acting as Foreign Key, references the parent table.', @level0type=N'SCHEMA', @level0name=N'wi', @level1type=N'TABLE', @level1name=N'IacCodeDescriptor', @level2type=N'COLUMN', @level2name=N'IacCodeDescriptorId'
GO

-- Extended Properties [wi].[ModifiedTermDescriptor] --
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Identifies if the duration of the expulsion has been modified from the federally required one year of expulsion for a fire arms incident.', @level0type=N'SCHEMA', @level0name=N'wi', @level1type=N'TABLE', @level1name=N'ModifiedTermDescriptor'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A unique identifier used as Primary Key, not derived from business logic, when acting as Foreign Key, references the parent table.', @level0type=N'SCHEMA', @level0name=N'wi', @level1type=N'TABLE', @level1name=N'ModifiedTermDescriptor', @level2type=N'COLUMN', @level2name=N'ModifiedTermDescriptorId'
GO

-- Extended Properties [wi].[StateEndorsedRegionalCareerPathwayStatusDescriptor] --
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Status in a State Endorsed Regional Career Pathway.', @level0type=N'SCHEMA', @level0name=N'wi', @level1type=N'TABLE', @level1name=N'StateEndorsedRegionalCareerPathwayStatusDescriptor'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A unique identifier used as Primary Key, not derived from business logic, when acting as Foreign Key, references the parent table.', @level0type=N'SCHEMA', @level0name=N'wi', @level1type=N'TABLE', @level1name=N'StateEndorsedRegionalCareerPathwayStatusDescriptor', @level2type=N'COLUMN', @level2name=N'StateEndorsedRegionalCareerPathwayStatusDescriptorId'
GO

-- Extended Properties [wi].[StudentCTEProgramAssociationCTEConcentrationCteProgramArea] --
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'WI Program areas of concentration.', @level0type=N'SCHEMA', @level0name=N'wi', @level1type=N'TABLE', @level1name=N'StudentCTEProgramAssociationCTEConcentrationCteProgramArea'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The month, day, and year on which the Student first received services.', @level0type=N'SCHEMA', @level0name=N'wi', @level1type=N'TABLE', @level1name=N'StudentCTEProgramAssociationCTEConcentrationCteProgramArea', @level2type=N'COLUMN', @level2name=N'BeginDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'WI Program areas of concentration.', @level0type=N'SCHEMA', @level0name=N'wi', @level1type=N'TABLE', @level1name=N'StudentCTEProgramAssociationCTEConcentrationCteProgramArea', @level2type=N'COLUMN', @level2name=N'CteProgramAreaDescriptorId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The identifier assigned to an education organization.', @level0type=N'SCHEMA', @level0name=N'wi', @level1type=N'TABLE', @level1name=N'StudentCTEProgramAssociationCTEConcentrationCteProgramArea', @level2type=N'COLUMN', @level2name=N'EducationOrganizationId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The identifier assigned to an education organization.', @level0type=N'SCHEMA', @level0name=N'wi', @level1type=N'TABLE', @level1name=N'StudentCTEProgramAssociationCTEConcentrationCteProgramArea', @level2type=N'COLUMN', @level2name=N'ProgramEducationOrganizationId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The formal name of the Program of instruction, training, services, or benefits available through federal, state, or local agencies.', @level0type=N'SCHEMA', @level0name=N'wi', @level1type=N'TABLE', @level1name=N'StudentCTEProgramAssociationCTEConcentrationCteProgramArea', @level2type=N'COLUMN', @level2name=N'ProgramName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The type of program.', @level0type=N'SCHEMA', @level0name=N'wi', @level1type=N'TABLE', @level1name=N'StudentCTEProgramAssociationCTEConcentrationCteProgramArea', @level2type=N'COLUMN', @level2name=N'ProgramTypeDescriptorId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A unique alphanumeric code assigned to a student.', @level0type=N'SCHEMA', @level0name=N'wi', @level1type=N'TABLE', @level1name=N'StudentCTEProgramAssociationCTEConcentrationCteProgramArea', @level2type=N'COLUMN', @level2name=N'StudentUSI'
GO

-- Extended Properties [wi].[StudentCTEProgramAssociationExtension] --
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'', @level0type=N'SCHEMA', @level0name=N'wi', @level1type=N'TABLE', @level1name=N'StudentCTEProgramAssociationExtension'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The month, day, and year on which the Student first received services.', @level0type=N'SCHEMA', @level0name=N'wi', @level1type=N'TABLE', @level1name=N'StudentCTEProgramAssociationExtension', @level2type=N'COLUMN', @level2name=N'BeginDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The identifier assigned to an education organization.', @level0type=N'SCHEMA', @level0name=N'wi', @level1type=N'TABLE', @level1name=N'StudentCTEProgramAssociationExtension', @level2type=N'COLUMN', @level2name=N'EducationOrganizationId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The identifier assigned to an education organization.', @level0type=N'SCHEMA', @level0name=N'wi', @level1type=N'TABLE', @level1name=N'StudentCTEProgramAssociationExtension', @level2type=N'COLUMN', @level2name=N'ProgramEducationOrganizationId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The formal name of the Program of instruction, training, services, or benefits available through federal, state, or local agencies.', @level0type=N'SCHEMA', @level0name=N'wi', @level1type=N'TABLE', @level1name=N'StudentCTEProgramAssociationExtension', @level2type=N'COLUMN', @level2name=N'ProgramName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The type of program.', @level0type=N'SCHEMA', @level0name=N'wi', @level1type=N'TABLE', @level1name=N'StudentCTEProgramAssociationExtension', @level2type=N'COLUMN', @level2name=N'ProgramTypeDescriptorId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A unique alphanumeric code assigned to a student.', @level0type=N'SCHEMA', @level0name=N'wi', @level1type=N'TABLE', @level1name=N'StudentCTEProgramAssociationExtension', @level2type=N'COLUMN', @level2name=N'StudentUSI'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Indicator of Certificated Program Status', @level0type=N'SCHEMA', @level0name=N'wi', @level1type=N'TABLE', @level1name=N'StudentCTEProgramAssociationExtension', @level2type=N'COLUMN', @level2name=N'CertificatedProgramStatusDescriptorId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Indicator of StateEndorsedRegionalCareerPathwayStatus', @level0type=N'SCHEMA', @level0name=N'wi', @level1type=N'TABLE', @level1name=N'StudentCTEProgramAssociationExtension', @level2type=N'COLUMN', @level2name=N'StateEndorsedRegionalCareerPathwayStatusDescriptorId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'IacCode of concentration.', @level0type=N'SCHEMA', @level0name=N'wi', @level1type=N'TABLE', @level1name=N'StudentCTEProgramAssociationExtension', @level2type=N'COLUMN', @level2name=N'CTEConcentrationIacCodeDescriptorId'
GO

-- Extended Properties [wi].[StudentDisciplineIncidentAssociationExtension] --
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'', @level0type=N'SCHEMA', @level0name=N'wi', @level1type=N'TABLE', @level1name=N'StudentDisciplineIncidentAssociationExtension'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A locally assigned unique identifier (within the school or school district) to identify each specific DisciplineIncident or occurrence. The same identifier should be used to document the entire DisciplineIncident even if it included multiple offenses and multiple offenders.', @level0type=N'SCHEMA', @level0name=N'wi', @level1type=N'TABLE', @level1name=N'StudentDisciplineIncidentAssociationExtension', @level2type=N'COLUMN', @level2name=N'IncidentIdentifier'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The identifier assigned to a school.', @level0type=N'SCHEMA', @level0name=N'wi', @level1type=N'TABLE', @level1name=N'StudentDisciplineIncidentAssociationExtension', @level2type=N'COLUMN', @level2name=N'SchoolId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A unique alphanumeric code assigned to a student.', @level0type=N'SCHEMA', @level0name=N'wi', @level1type=N'TABLE', @level1name=N'StudentDisciplineIncidentAssociationExtension', @level2type=N'COLUMN', @level2name=N'StudentUSI'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Incident resulted in serious bodily injury. Serious Bodily Injury involves a substantial risk of death; extreme physical pain; protracted and obvious disfigurement; or protracted loss or impairment of the function of a bodily member, organ, or faculty (18 USC Section 1365 (3)(h)).', @level0type=N'SCHEMA', @level0name=N'wi', @level1type=N'TABLE', @level1name=N'StudentDisciplineIncidentAssociationExtension', @level2type=N'COLUMN', @level2name=N'SeriousBodilyInjury'
GO

-- Extended Properties [wi].[StudentEducationOrganizationAssociationExtension] --
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'', @level0type=N'SCHEMA', @level0name=N'wi', @level1type=N'TABLE', @level1name=N'StudentEducationOrganizationAssociationExtension'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The identifier assigned to an education organization.', @level0type=N'SCHEMA', @level0name=N'wi', @level1type=N'TABLE', @level1name=N'StudentEducationOrganizationAssociationExtension', @level2type=N'COLUMN', @level2name=N'EducationOrganizationId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A unique alphanumeric code assigned to a student.', @level0type=N'SCHEMA', @level0name=N'wi', @level1type=N'TABLE', @level1name=N'StudentEducationOrganizationAssociationExtension', @level2type=N'COLUMN', @level2name=N'StudentUSI'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The identifier assigned to a local education agency.', @level0type=N'SCHEMA', @level0name=N'wi', @level1type=N'TABLE', @level1name=N'StudentEducationOrganizationAssociationExtension', @level2type=N'COLUMN', @level2name=N'ResidentLocalEducationAgencyId'
GO

-- Extended Properties [wi].[StudentSchoolAssociationExtension] --
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'', @level0type=N'SCHEMA', @level0name=N'wi', @level1type=N'TABLE', @level1name=N'StudentSchoolAssociationExtension'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The month, day, and year on which an individual enters and begins to receive instructional services in a school.', @level0type=N'SCHEMA', @level0name=N'wi', @level1type=N'TABLE', @level1name=N'StudentSchoolAssociationExtension', @level2type=N'COLUMN', @level2name=N'EntryDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The identifier assigned to a school.', @level0type=N'SCHEMA', @level0name=N'wi', @level1type=N'TABLE', @level1name=N'StudentSchoolAssociationExtension', @level2type=N'COLUMN', @level2name=N'SchoolId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A unique alphanumeric code assigned to a student.', @level0type=N'SCHEMA', @level0name=N'wi', @level1type=N'TABLE', @level1name=N'StudentSchoolAssociationExtension', @level2type=N'COLUMN', @level2name=N'StudentUSI'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Identifies if a student is receiving Primary education services from a Private school and Special education services from a public schoolIndication of a student placed by a parent or guardian in private school, Parentally Placed Private, who receives special education or related services from the submitting district that meet state standards under a service plan (34 CFR 300.452--300.462).', @level0type=N'SCHEMA', @level0name=N'wi', @level1type=N'TABLE', @level1name=N'StudentSchoolAssociationExtension', @level2type=N'COLUMN', @level2name=N'ParentPlacedPrivate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'', @level0type=N'SCHEMA', @level0name=N'wi', @level1type=N'TABLE', @level1name=N'StudentSchoolAssociationExtension', @level2type=N'COLUMN', @level2name=N'CompletedSchoolTerm'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The identifier assigned to a local education agency.', @level0type=N'SCHEMA', @level0name=N'wi', @level1type=N'TABLE', @level1name=N'StudentSchoolAssociationExtension', @level2type=N'COLUMN', @level2name=N'ExpectedTransferLocalEducationAgencyId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The identifier assigned to a school.', @level0type=N'SCHEMA', @level0name=N'wi', @level1type=N'TABLE', @level1name=N'StudentSchoolAssociationExtension', @level2type=N'COLUMN', @level2name=N'ExpectedTransferSchoolId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'', @level0type=N'SCHEMA', @level0name=N'wi', @level1type=N'TABLE', @level1name=N'StudentSchoolAssociationExtension', @level2type=N'COLUMN', @level2name=N'ActualDaysAttendance'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'', @level0type=N'SCHEMA', @level0name=N'wi', @level1type=N'TABLE', @level1name=N'StudentSchoolAssociationExtension', @level2type=N'COLUMN', @level2name=N'PossibleDaysAttendance'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'', @level0type=N'SCHEMA', @level0name=N'wi', @level1type=N'TABLE', @level1name=N'StudentSchoolAssociationExtension', @level2type=N'COLUMN', @level2name=N'PrivateSchoolChoiceProgramParticipant'
GO

-- Extended Properties [wi].[StudentSchoolAssociationReceivingService] --
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The status of a student during a specific count date', @level0type=N'SCHEMA', @level0name=N'wi', @level1type=N'TABLE', @level1name=N'StudentSchoolAssociationReceivingService'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The count date name for the student status (e.g 3rd Fri Sept)', @level0type=N'SCHEMA', @level0name=N'wi', @level1type=N'TABLE', @level1name=N'StudentSchoolAssociationReceivingService', @level2type=N'COLUMN', @level2name=N'CountDateNameDescriptorId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The month, day, and year on which an individual enters and begins to receive instructional services in a school.', @level0type=N'SCHEMA', @level0name=N'wi', @level1type=N'TABLE', @level1name=N'StudentSchoolAssociationReceivingService', @level2type=N'COLUMN', @level2name=N'EntryDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The identifier assigned to a school.', @level0type=N'SCHEMA', @level0name=N'wi', @level1type=N'TABLE', @level1name=N'StudentSchoolAssociationReceivingService', @level2type=N'COLUMN', @level2name=N'SchoolId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A unique alphanumeric code assigned to a student.', @level0type=N'SCHEMA', @level0name=N'wi', @level1type=N'TABLE', @level1name=N'StudentSchoolAssociationReceivingService', @level2type=N'COLUMN', @level2name=N'StudentUSI'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The status of the student during the specific count date (e.g. Present)', @level0type=N'SCHEMA', @level0name=N'wi', @level1type=N'TABLE', @level1name=N'StudentSchoolAssociationReceivingService', @level2type=N'COLUMN', @level2name=N'CountDateReceivingServiceDescriptorId'
GO

-- Extended Properties [wi].[StudentSpecialEducationProgramAssociationExtension] --
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'', @level0type=N'SCHEMA', @level0name=N'wi', @level1type=N'TABLE', @level1name=N'StudentSpecialEducationProgramAssociationExtension'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The month, day, and year on which the Student first received services.', @level0type=N'SCHEMA', @level0name=N'wi', @level1type=N'TABLE', @level1name=N'StudentSpecialEducationProgramAssociationExtension', @level2type=N'COLUMN', @level2name=N'BeginDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The identifier assigned to an education organization.', @level0type=N'SCHEMA', @level0name=N'wi', @level1type=N'TABLE', @level1name=N'StudentSpecialEducationProgramAssociationExtension', @level2type=N'COLUMN', @level2name=N'EducationOrganizationId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The identifier assigned to an education organization.', @level0type=N'SCHEMA', @level0name=N'wi', @level1type=N'TABLE', @level1name=N'StudentSpecialEducationProgramAssociationExtension', @level2type=N'COLUMN', @level2name=N'ProgramEducationOrganizationId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The formal name of the Program of instruction, training, services, or benefits available through federal, state, or local agencies.', @level0type=N'SCHEMA', @level0name=N'wi', @level1type=N'TABLE', @level1name=N'StudentSpecialEducationProgramAssociationExtension', @level2type=N'COLUMN', @level2name=N'ProgramName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The type of program.', @level0type=N'SCHEMA', @level0name=N'wi', @level1type=N'TABLE', @level1name=N'StudentSpecialEducationProgramAssociationExtension', @level2type=N'COLUMN', @level2name=N'ProgramTypeDescriptorId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A unique alphanumeric code assigned to a student.', @level0type=N'SCHEMA', @level0name=N'wi', @level1type=N'TABLE', @level1name=N'StudentSpecialEducationProgramAssociationExtension', @level2type=N'COLUMN', @level2name=N'StudentUSI'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The identifier assigned to a school.', @level0type=N'SCHEMA', @level0name=N'wi', @level1type=N'TABLE', @level1name=N'StudentSpecialEducationProgramAssociationExtension', @level2type=N'COLUMN', @level2name=N'FapeResponsibleSchoolId'
GO

