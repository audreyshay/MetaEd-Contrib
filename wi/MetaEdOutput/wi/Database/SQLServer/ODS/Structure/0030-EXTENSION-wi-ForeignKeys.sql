ALTER TABLE [wi].[CertificatedProgramStatusDescriptor] WITH CHECK ADD CONSTRAINT [FK_CertificatedProgramStatusDescriptor_Descriptor] FOREIGN KEY ([CertificatedProgramStatusDescriptorId])
REFERENCES [edfi].[Descriptor] ([DescriptorId])
ON DELETE CASCADE
GO

ALTER TABLE [wi].[CountDateNameDescriptor] WITH CHECK ADD CONSTRAINT [FK_CountDateNameDescriptor_Descriptor] FOREIGN KEY ([CountDateNameDescriptorId])
REFERENCES [edfi].[Descriptor] ([DescriptorId])
ON DELETE CASCADE
GO

ALTER TABLE [wi].[CountDateReceivingServiceDescriptor] WITH CHECK ADD CONSTRAINT [FK_CountDateReceivingServiceDescriptor_Descriptor] FOREIGN KEY ([CountDateReceivingServiceDescriptorId])
REFERENCES [edfi].[Descriptor] ([DescriptorId])
ON DELETE CASCADE
GO

ALTER TABLE [wi].[CourseOfferingCareerPathway] WITH CHECK ADD CONSTRAINT [FK_CourseOfferingCareerPathway_CareerPathwayDescriptor] FOREIGN KEY ([CareerPathwayDescriptorId])
REFERENCES [edfi].[CareerPathwayDescriptor] ([CareerPathwayDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_CourseOfferingCareerPathway_CareerPathwayDescriptor]
ON [wi].[CourseOfferingCareerPathway] ([CareerPathwayDescriptorId] ASC)
GO

ALTER TABLE [wi].[CourseOfferingCareerPathway] WITH CHECK ADD CONSTRAINT [FK_CourseOfferingCareerPathway_CourseOffering] FOREIGN KEY ([LocalCourseCode], [SchoolId], [SchoolYear], [SessionName])
REFERENCES [edfi].[CourseOffering] ([LocalCourseCode], [SchoolId], [SchoolYear], [SessionName])
ON DELETE CASCADE
GO

CREATE NONCLUSTERED INDEX [FK_CourseOfferingCareerPathway_CourseOffering]
ON [wi].[CourseOfferingCareerPathway] ([LocalCourseCode] ASC, [SchoolId] ASC, [SchoolYear] ASC, [SessionName] ASC)
GO

ALTER TABLE [wi].[CteProgramAreaDescriptor] WITH CHECK ADD CONSTRAINT [FK_CteProgramAreaDescriptor_Descriptor] FOREIGN KEY ([CteProgramAreaDescriptorId])
REFERENCES [edfi].[Descriptor] ([DescriptorId])
ON DELETE CASCADE
GO

ALTER TABLE [wi].[DisciplineActionExtension] WITH CHECK ADD CONSTRAINT [FK_DisciplineActionExtension_DisciplineAction] FOREIGN KEY ([DisciplineActionIdentifier], [DisciplineDate], [StudentUSI])
REFERENCES [edfi].[DisciplineAction] ([DisciplineActionIdentifier], [DisciplineDate], [StudentUSI])
ON DELETE CASCADE
GO

ALTER TABLE [wi].[DisciplineActionExtension] WITH CHECK ADD CONSTRAINT [FK_DisciplineActionExtension_ModifiedTermDescriptor] FOREIGN KEY ([ModifiedTermDescriptorId])
REFERENCES [wi].[ModifiedTermDescriptor] ([ModifiedTermDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_DisciplineActionExtension_ModifiedTermDescriptor]
ON [wi].[DisciplineActionExtension] ([ModifiedTermDescriptorId] ASC)
GO

ALTER TABLE [wi].[EnrollmentTypeDescriptor] WITH CHECK ADD CONSTRAINT [FK_EnrollmentTypeDescriptor_Descriptor] FOREIGN KEY ([EnrollmentTypeDescriptorId])
REFERENCES [edfi].[Descriptor] ([DescriptorId])
ON DELETE CASCADE
GO

ALTER TABLE [wi].[GradeExtension] WITH CHECK ADD CONSTRAINT [FK_GradeExtension_CertificatedProgramStatusDescriptor] FOREIGN KEY ([CertificatedProgramStatusDescriptorId])
REFERENCES [wi].[CertificatedProgramStatusDescriptor] ([CertificatedProgramStatusDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_GradeExtension_CertificatedProgramStatusDescriptor]
ON [wi].[GradeExtension] ([CertificatedProgramStatusDescriptorId] ASC)
GO

ALTER TABLE [wi].[GradeExtension] WITH CHECK ADD CONSTRAINT [FK_GradeExtension_Grade] FOREIGN KEY ([BeginDate], [GradeTypeDescriptorId], [GradingPeriodDescriptorId], [GradingPeriodSchoolYear], [GradingPeriodSequence], [LocalCourseCode], [SchoolId], [SchoolYear], [SectionIdentifier], [SessionName], [StudentUSI])
REFERENCES [edfi].[Grade] ([BeginDate], [GradeTypeDescriptorId], [GradingPeriodDescriptorId], [GradingPeriodSchoolYear], [GradingPeriodSequence], [LocalCourseCode], [SchoolId], [SchoolYear], [SectionIdentifier], [SessionName], [StudentUSI])
ON DELETE CASCADE
ON UPDATE CASCADE
GO

ALTER TABLE [wi].[IacCodeDescriptor] WITH CHECK ADD CONSTRAINT [FK_IacCodeDescriptor_Descriptor] FOREIGN KEY ([IacCodeDescriptorId])
REFERENCES [edfi].[Descriptor] ([DescriptorId])
ON DELETE CASCADE
GO

ALTER TABLE [wi].[ModifiedTermDescriptor] WITH CHECK ADD CONSTRAINT [FK_ModifiedTermDescriptor_Descriptor] FOREIGN KEY ([ModifiedTermDescriptorId])
REFERENCES [edfi].[Descriptor] ([DescriptorId])
ON DELETE CASCADE
GO

ALTER TABLE [wi].[StateEndorsedRegionalCareerPathwayStatusDescriptor] WITH CHECK ADD CONSTRAINT [FK_StateEndorsedRegionalCareerPathwayStatusDescriptor_Descriptor] FOREIGN KEY ([StateEndorsedRegionalCareerPathwayStatusDescriptorId])
REFERENCES [edfi].[Descriptor] ([DescriptorId])
ON DELETE CASCADE
GO

ALTER TABLE [wi].[StudentCTEProgramAssociationCTEConcentrationCteProgramArea] WITH CHECK ADD CONSTRAINT [FK_StudentCTEProgramAssociationCTEConcentrationCteProgramArea_CteProgramAreaDescriptor] FOREIGN KEY ([CteProgramAreaDescriptorId])
REFERENCES [wi].[CteProgramAreaDescriptor] ([CteProgramAreaDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_StudentCTEProgramAssociationCTEConcentrationCteProgramArea_CteProgramAreaDescriptor]
ON [wi].[StudentCTEProgramAssociationCTEConcentrationCteProgramArea] ([CteProgramAreaDescriptorId] ASC)
GO

ALTER TABLE [wi].[StudentCTEProgramAssociationCTEConcentrationCteProgramArea] WITH CHECK ADD CONSTRAINT [FK_StudentCTEProgramAssociationCTEConcentrationCteProgramArea_StudentCTEProgramAssociation] FOREIGN KEY ([BeginDate], [EducationOrganizationId], [ProgramEducationOrganizationId], [ProgramName], [ProgramTypeDescriptorId], [StudentUSI])
REFERENCES [edfi].[StudentCTEProgramAssociation] ([BeginDate], [EducationOrganizationId], [ProgramEducationOrganizationId], [ProgramName], [ProgramTypeDescriptorId], [StudentUSI])
ON DELETE CASCADE
GO

CREATE NONCLUSTERED INDEX [FK_StudentCTEProgramAssociationCTEConcentrationCteProgramArea_StudentCTEProgramAssociation]
ON [wi].[StudentCTEProgramAssociationCTEConcentrationCteProgramArea] ([BeginDate] ASC, [EducationOrganizationId] ASC, [ProgramEducationOrganizationId] ASC, [ProgramName] ASC, [ProgramTypeDescriptorId] ASC, [StudentUSI] ASC)
GO

ALTER TABLE [wi].[StudentCTEProgramAssociationExtension] WITH CHECK ADD CONSTRAINT [FK_StudentCTEProgramAssociationExtension_CertificatedProgramStatusDescriptor] FOREIGN KEY ([CertificatedProgramStatusDescriptorId])
REFERENCES [wi].[CertificatedProgramStatusDescriptor] ([CertificatedProgramStatusDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_StudentCTEProgramAssociationExtension_CertificatedProgramStatusDescriptor]
ON [wi].[StudentCTEProgramAssociationExtension] ([CertificatedProgramStatusDescriptorId] ASC)
GO

ALTER TABLE [wi].[StudentCTEProgramAssociationExtension] WITH CHECK ADD CONSTRAINT [FK_StudentCTEProgramAssociationExtension_StateEndorsedRegionalCareerPathwayStatusDescriptor] FOREIGN KEY ([StateEndorsedRegionalCareerPathwayStatusDescriptorId])
REFERENCES [wi].[StateEndorsedRegionalCareerPathwayStatusDescriptor] ([StateEndorsedRegionalCareerPathwayStatusDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_StudentCTEProgramAssociationExtension_StateEndorsedRegionalCareerPathwayStatusDescriptor]
ON [wi].[StudentCTEProgramAssociationExtension] ([StateEndorsedRegionalCareerPathwayStatusDescriptorId] ASC)
GO

ALTER TABLE [wi].[StudentCTEProgramAssociationExtension] WITH CHECK ADD CONSTRAINT [FK_StudentCTEProgramAssociationExtension_StudentCTEProgramAssociation] FOREIGN KEY ([BeginDate], [EducationOrganizationId], [ProgramEducationOrganizationId], [ProgramName], [ProgramTypeDescriptorId], [StudentUSI])
REFERENCES [edfi].[StudentCTEProgramAssociation] ([BeginDate], [EducationOrganizationId], [ProgramEducationOrganizationId], [ProgramName], [ProgramTypeDescriptorId], [StudentUSI])
ON DELETE CASCADE
GO

ALTER TABLE [wi].[StudentDisciplineIncidentAssociationExtension] WITH CHECK ADD CONSTRAINT [FK_StudentDisciplineIncidentAssociationExtension_StudentDisciplineIncidentAssociation] FOREIGN KEY ([IncidentIdentifier], [SchoolId], [StudentUSI])
REFERENCES [edfi].[StudentDisciplineIncidentAssociation] ([IncidentIdentifier], [SchoolId], [StudentUSI])
ON DELETE CASCADE
GO

ALTER TABLE [wi].[StudentEducationOrganizationAssociationExtension] WITH CHECK ADD CONSTRAINT [FK_StudentEducationOrganizationAssociationExtension_LocalEducationAgency] FOREIGN KEY ([ResidentLocalEducationAgencyId])
REFERENCES [edfi].[LocalEducationAgency] ([LocalEducationAgencyId])
GO

CREATE NONCLUSTERED INDEX [FK_StudentEducationOrganizationAssociationExtension_LocalEducationAgency]
ON [wi].[StudentEducationOrganizationAssociationExtension] ([ResidentLocalEducationAgencyId] ASC)
GO

ALTER TABLE [wi].[StudentEducationOrganizationAssociationExtension] WITH CHECK ADD CONSTRAINT [FK_StudentEducationOrganizationAssociationExtension_StudentEducationOrganizationAssociation] FOREIGN KEY ([EducationOrganizationId], [StudentUSI])
REFERENCES [edfi].[StudentEducationOrganizationAssociation] ([EducationOrganizationId], [StudentUSI])
ON DELETE CASCADE
GO

ALTER TABLE [wi].[StudentSchoolAssociationEnrollmentType] WITH CHECK ADD CONSTRAINT [FK_StudentSchoolAssociationEnrollmentType_EnrollmentTypeDescriptor] FOREIGN KEY ([EnrollmentTypeDescriptorId])
REFERENCES [wi].[EnrollmentTypeDescriptor] ([EnrollmentTypeDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_StudentSchoolAssociationEnrollmentType_EnrollmentTypeDescriptor]
ON [wi].[StudentSchoolAssociationEnrollmentType] ([EnrollmentTypeDescriptorId] ASC)
GO

ALTER TABLE [wi].[StudentSchoolAssociationEnrollmentType] WITH CHECK ADD CONSTRAINT [FK_StudentSchoolAssociationEnrollmentType_StudentSchoolAssociation] FOREIGN KEY ([EntryDate], [SchoolId], [StudentUSI])
REFERENCES [edfi].[StudentSchoolAssociation] ([EntryDate], [SchoolId], [StudentUSI])
ON DELETE CASCADE
ON UPDATE CASCADE
GO

CREATE NONCLUSTERED INDEX [FK_StudentSchoolAssociationEnrollmentType_StudentSchoolAssociation]
ON [wi].[StudentSchoolAssociationEnrollmentType] ([EntryDate] ASC, [SchoolId] ASC, [StudentUSI] ASC)
GO

ALTER TABLE [wi].[StudentSchoolAssociationExtension] WITH CHECK ADD CONSTRAINT [FK_StudentSchoolAssociationExtension_LocalEducationAgency] FOREIGN KEY ([ExpectedTransferLocalEducationAgencyId])
REFERENCES [edfi].[LocalEducationAgency] ([LocalEducationAgencyId])
GO

CREATE NONCLUSTERED INDEX [FK_StudentSchoolAssociationExtension_LocalEducationAgency]
ON [wi].[StudentSchoolAssociationExtension] ([ExpectedTransferLocalEducationAgencyId] ASC)
GO

ALTER TABLE [wi].[StudentSchoolAssociationExtension] WITH CHECK ADD CONSTRAINT [FK_StudentSchoolAssociationExtension_School] FOREIGN KEY ([ExpectedTransferSchoolId])
REFERENCES [edfi].[School] ([SchoolId])
GO

CREATE NONCLUSTERED INDEX [FK_StudentSchoolAssociationExtension_School]
ON [wi].[StudentSchoolAssociationExtension] ([ExpectedTransferSchoolId] ASC)
GO

ALTER TABLE [wi].[StudentSchoolAssociationExtension] WITH CHECK ADD CONSTRAINT [FK_StudentSchoolAssociationExtension_StudentSchoolAssociation] FOREIGN KEY ([EntryDate], [SchoolId], [StudentUSI])
REFERENCES [edfi].[StudentSchoolAssociation] ([EntryDate], [SchoolId], [StudentUSI])
ON DELETE CASCADE
ON UPDATE CASCADE
GO

ALTER TABLE [wi].[StudentSchoolAssociationReceivingService] WITH CHECK ADD CONSTRAINT [FK_StudentSchoolAssociationReceivingService_CountDateNameDescriptor] FOREIGN KEY ([CountDateNameDescriptorId])
REFERENCES [wi].[CountDateNameDescriptor] ([CountDateNameDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_StudentSchoolAssociationReceivingService_CountDateNameDescriptor]
ON [wi].[StudentSchoolAssociationReceivingService] ([CountDateNameDescriptorId] ASC)
GO

ALTER TABLE [wi].[StudentSchoolAssociationReceivingService] WITH CHECK ADD CONSTRAINT [FK_StudentSchoolAssociationReceivingService_CountDateReceivingServiceDescriptor] FOREIGN KEY ([CountDateReceivingServiceDescriptorId])
REFERENCES [wi].[CountDateReceivingServiceDescriptor] ([CountDateReceivingServiceDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_StudentSchoolAssociationReceivingService_CountDateReceivingServiceDescriptor]
ON [wi].[StudentSchoolAssociationReceivingService] ([CountDateReceivingServiceDescriptorId] ASC)
GO

ALTER TABLE [wi].[StudentSchoolAssociationReceivingService] WITH CHECK ADD CONSTRAINT [FK_StudentSchoolAssociationReceivingService_StudentSchoolAssociation] FOREIGN KEY ([EntryDate], [SchoolId], [StudentUSI])
REFERENCES [edfi].[StudentSchoolAssociation] ([EntryDate], [SchoolId], [StudentUSI])
ON DELETE CASCADE
ON UPDATE CASCADE
GO

CREATE NONCLUSTERED INDEX [FK_StudentSchoolAssociationReceivingService_StudentSchoolAssociation]
ON [wi].[StudentSchoolAssociationReceivingService] ([EntryDate] ASC, [SchoolId] ASC, [StudentUSI] ASC)
GO

ALTER TABLE [wi].[StudentSpecialEducationProgramAssociationExtension] WITH CHECK ADD CONSTRAINT [FK_StudentSpecialEducationProgramAssociationExtension_School] FOREIGN KEY ([FapeResponsibleSchoolId])
REFERENCES [edfi].[School] ([SchoolId])
GO

CREATE NONCLUSTERED INDEX [FK_StudentSpecialEducationProgramAssociationExtension_School]
ON [wi].[StudentSpecialEducationProgramAssociationExtension] ([FapeResponsibleSchoolId] ASC)
GO

ALTER TABLE [wi].[StudentSpecialEducationProgramAssociationExtension] WITH CHECK ADD CONSTRAINT [FK_StudentSpecialEducationProgramAssociationExtension_StudentSpecialEducationProgramAssociation] FOREIGN KEY ([BeginDate], [EducationOrganizationId], [ProgramEducationOrganizationId], [ProgramName], [ProgramTypeDescriptorId], [StudentUSI])
REFERENCES [edfi].[StudentSpecialEducationProgramAssociation] ([BeginDate], [EducationOrganizationId], [ProgramEducationOrganizationId], [ProgramName], [ProgramTypeDescriptorId], [StudentUSI])
ON DELETE CASCADE
GO

