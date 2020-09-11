ALTER TABLE wi.CertificatedProgramStatusDescriptor ADD CONSTRAINT FK_47db03_Descriptor FOREIGN KEY (CertificatedProgramStatusDescriptorId)
REFERENCES edfi.Descriptor (DescriptorId)
ON DELETE CASCADE
;

ALTER TABLE wi.CountDateNameDescriptor ADD CONSTRAINT FK_db3f44_Descriptor FOREIGN KEY (CountDateNameDescriptorId)
REFERENCES edfi.Descriptor (DescriptorId)
ON DELETE CASCADE
;

ALTER TABLE wi.CountDateReceivingServiceDescriptor ADD CONSTRAINT FK_b2b802_Descriptor FOREIGN KEY (CountDateReceivingServiceDescriptorId)
REFERENCES edfi.Descriptor (DescriptorId)
ON DELETE CASCADE
;

ALTER TABLE wi.CourseOfferingCareerPathway ADD CONSTRAINT FK_49d43f_CareerPathwayDescriptor FOREIGN KEY (CareerPathwayDescriptorId)
REFERENCES edfi.CareerPathwayDescriptor (CareerPathwayDescriptorId)
;

CREATE INDEX FK_49d43f_CareerPathwayDescriptor
ON wi.CourseOfferingCareerPathway (CareerPathwayDescriptorId ASC);

ALTER TABLE wi.CourseOfferingCareerPathway ADD CONSTRAINT FK_49d43f_CourseOffering FOREIGN KEY (LocalCourseCode, SchoolId, SchoolYear, SessionName)
REFERENCES edfi.CourseOffering (LocalCourseCode, SchoolId, SchoolYear, SessionName)
ON DELETE CASCADE
ON UPDATE CASCADE
;

CREATE INDEX FK_49d43f_CourseOffering
ON wi.CourseOfferingCareerPathway (LocalCourseCode ASC, SchoolId ASC, SchoolYear ASC, SessionName ASC);

ALTER TABLE wi.CteProgramAreaDescriptor ADD CONSTRAINT FK_3c541d_Descriptor FOREIGN KEY (CteProgramAreaDescriptorId)
REFERENCES edfi.Descriptor (DescriptorId)
ON DELETE CASCADE
;

ALTER TABLE wi.DisciplineActionExtension ADD CONSTRAINT FK_699fda_DisciplineAction FOREIGN KEY (DisciplineActionIdentifier, DisciplineDate, StudentUSI)
REFERENCES edfi.DisciplineAction (DisciplineActionIdentifier, DisciplineDate, StudentUSI)
ON DELETE CASCADE
;

ALTER TABLE wi.DisciplineActionExtension ADD CONSTRAINT FK_699fda_ModifiedTermDescriptor FOREIGN KEY (ModifiedTermDescriptorId)
REFERENCES wi.ModifiedTermDescriptor (ModifiedTermDescriptorId)
;

CREATE INDEX FK_699fda_ModifiedTermDescriptor
ON wi.DisciplineActionExtension (ModifiedTermDescriptorId ASC);

ALTER TABLE wi.EnrollmentTypeDescriptor ADD CONSTRAINT FK_d3c777_Descriptor FOREIGN KEY (EnrollmentTypeDescriptorId)
REFERENCES edfi.Descriptor (DescriptorId)
ON DELETE CASCADE
;

ALTER TABLE wi.GradeExtension ADD CONSTRAINT FK_537a84_CertificatedProgramStatusDescriptor FOREIGN KEY (CertificatedProgramStatusDescriptorId)
REFERENCES wi.CertificatedProgramStatusDescriptor (CertificatedProgramStatusDescriptorId)
;

CREATE INDEX FK_537a84_CertificatedProgramStatusDescriptor
ON wi.GradeExtension (CertificatedProgramStatusDescriptorId ASC);

ALTER TABLE wi.GradeExtension ADD CONSTRAINT FK_537a84_Grade FOREIGN KEY (BeginDate, GradeTypeDescriptorId, GradingPeriodDescriptorId, GradingPeriodSchoolYear, GradingPeriodSequence, LocalCourseCode, SchoolId, SchoolYear, SectionIdentifier, SessionName, StudentUSI)
REFERENCES edfi.Grade (BeginDate, GradeTypeDescriptorId, GradingPeriodDescriptorId, GradingPeriodSchoolYear, GradingPeriodSequence, LocalCourseCode, SchoolId, SchoolYear, SectionIdentifier, SessionName, StudentUSI)
ON DELETE CASCADE
ON UPDATE CASCADE
;

ALTER TABLE wi.GraduationPlanExtension ADD CONSTRAINT FK_208ea5_GraduationPlan FOREIGN KEY (EducationOrganizationId, GraduationPlanTypeDescriptorId, GraduationSchoolYear)
REFERENCES edfi.GraduationPlan (EducationOrganizationId, GraduationPlanTypeDescriptorId, GraduationSchoolYear)
ON DELETE CASCADE
;

ALTER TABLE wi.IacCodeDescriptor ADD CONSTRAINT FK_accc03_Descriptor FOREIGN KEY (IacCodeDescriptorId)
REFERENCES edfi.Descriptor (DescriptorId)
ON DELETE CASCADE
;

ALTER TABLE wi.ModifiedTermDescriptor ADD CONSTRAINT FK_f8bd5c_Descriptor FOREIGN KEY (ModifiedTermDescriptorId)
REFERENCES edfi.Descriptor (DescriptorId)
ON DELETE CASCADE
;

ALTER TABLE wi.StateEndorsedRegionalCareerPathwayStatusDescriptor ADD CONSTRAINT FK_1559fd_Descriptor FOREIGN KEY (StateEndorsedRegionalCareerPathwayStatusDescriptorId)
REFERENCES edfi.Descriptor (DescriptorId)
ON DELETE CASCADE
;

ALTER TABLE wi.StudentCTEProgramAssociationCTEConcentrationCteProgramArea ADD CONSTRAINT FK_9acc13_CteProgramAreaDescriptor FOREIGN KEY (CteProgramAreaDescriptorId)
REFERENCES wi.CteProgramAreaDescriptor (CteProgramAreaDescriptorId)
;

CREATE INDEX FK_9acc13_CteProgramAreaDescriptor
ON wi.StudentCTEProgramAssociationCTEConcentrationCteProgramArea (CteProgramAreaDescriptorId ASC);

ALTER TABLE wi.StudentCTEProgramAssociationCTEConcentrationCteProgramArea ADD CONSTRAINT FK_9acc13_StudentCTEProgramAssociation FOREIGN KEY (BeginDate, EducationOrganizationId, ProgramEducationOrganizationId, ProgramName, ProgramTypeDescriptorId, StudentUSI)
REFERENCES edfi.StudentCTEProgramAssociation (BeginDate, EducationOrganizationId, ProgramEducationOrganizationId, ProgramName, ProgramTypeDescriptorId, StudentUSI)
ON DELETE CASCADE
;

CREATE INDEX FK_9acc13_StudentCTEProgramAssociation
ON wi.StudentCTEProgramAssociationCTEConcentrationCteProgramArea (BeginDate ASC, EducationOrganizationId ASC, ProgramEducationOrganizationId ASC, ProgramName ASC, ProgramTypeDescriptorId ASC, StudentUSI ASC);

ALTER TABLE wi.StudentCTEProgramAssociationExtension ADD CONSTRAINT FK_1020a1_CertificatedProgramStatusDescriptor FOREIGN KEY (CertificatedProgramStatusDescriptorId)
REFERENCES wi.CertificatedProgramStatusDescriptor (CertificatedProgramStatusDescriptorId)
;

CREATE INDEX FK_1020a1_CertificatedProgramStatusDescriptor
ON wi.StudentCTEProgramAssociationExtension (CertificatedProgramStatusDescriptorId ASC);

ALTER TABLE wi.StudentCTEProgramAssociationExtension ADD CONSTRAINT FK_1020a1_StateEndorsedRegionalCareerPathwayStatusDescriptor FOREIGN KEY (StateEndorsedRegionalCareerPathwayStatusDescriptorId)
REFERENCES wi.StateEndorsedRegionalCareerPathwayStatusDescriptor (StateEndorsedRegionalCareerPathwayStatusDescriptorId)
;

CREATE INDEX FK_1020a1_StateEndorsedRegionalCareerPathwayStatusDescriptor
ON wi.StudentCTEProgramAssociationExtension (StateEndorsedRegionalCareerPathwayStatusDescriptorId ASC);

ALTER TABLE wi.StudentCTEProgramAssociationExtension ADD CONSTRAINT FK_1020a1_StudentCTEProgramAssociation FOREIGN KEY (BeginDate, EducationOrganizationId, ProgramEducationOrganizationId, ProgramName, ProgramTypeDescriptorId, StudentUSI)
REFERENCES edfi.StudentCTEProgramAssociation (BeginDate, EducationOrganizationId, ProgramEducationOrganizationId, ProgramName, ProgramTypeDescriptorId, StudentUSI)
ON DELETE CASCADE
;

ALTER TABLE wi.StudentDisciplineIncidentAssociationExtension ADD CONSTRAINT FK_e9afec_StudentDisciplineIncidentAssociation FOREIGN KEY (IncidentIdentifier, SchoolId, StudentUSI)
REFERENCES edfi.StudentDisciplineIncidentAssociation (IncidentIdentifier, SchoolId, StudentUSI)
ON DELETE CASCADE
;

ALTER TABLE wi.StudentEducationOrganizationAssociationExtension ADD CONSTRAINT FK_2c2930_LocalEducationAgency FOREIGN KEY (ResidentLocalEducationAgencyId)
REFERENCES edfi.LocalEducationAgency (LocalEducationAgencyId)
;

CREATE INDEX FK_2c2930_LocalEducationAgency
ON wi.StudentEducationOrganizationAssociationExtension (ResidentLocalEducationAgencyId ASC);

ALTER TABLE wi.StudentEducationOrganizationAssociationExtension ADD CONSTRAINT FK_2c2930_StudentEducationOrganizationAssociation FOREIGN KEY (EducationOrganizationId, StudentUSI)
REFERENCES edfi.StudentEducationOrganizationAssociation (EducationOrganizationId, StudentUSI)
ON DELETE CASCADE
;

ALTER TABLE wi.StudentSchoolAssociationEnrollmentType ADD CONSTRAINT FK_bba0bc_EnrollmentTypeDescriptor FOREIGN KEY (EnrollmentTypeDescriptorId)
REFERENCES wi.EnrollmentTypeDescriptor (EnrollmentTypeDescriptorId)
;

CREATE INDEX FK_bba0bc_EnrollmentTypeDescriptor
ON wi.StudentSchoolAssociationEnrollmentType (EnrollmentTypeDescriptorId ASC);

ALTER TABLE wi.StudentSchoolAssociationEnrollmentType ADD CONSTRAINT FK_bba0bc_StudentSchoolAssociation FOREIGN KEY (EntryDate, SchoolId, StudentUSI)
REFERENCES edfi.StudentSchoolAssociation (EntryDate, SchoolId, StudentUSI)
ON DELETE CASCADE
ON UPDATE CASCADE
;

CREATE INDEX FK_bba0bc_StudentSchoolAssociation
ON wi.StudentSchoolAssociationEnrollmentType (EntryDate ASC, SchoolId ASC, StudentUSI ASC);

ALTER TABLE wi.StudentSchoolAssociationExtension ADD CONSTRAINT FK_880cb1_LocalEducationAgency FOREIGN KEY (ExpectedTransferLocalEducationAgencyId)
REFERENCES edfi.LocalEducationAgency (LocalEducationAgencyId)
;

CREATE INDEX FK_880cb1_LocalEducationAgency
ON wi.StudentSchoolAssociationExtension (ExpectedTransferLocalEducationAgencyId ASC);

ALTER TABLE wi.StudentSchoolAssociationExtension ADD CONSTRAINT FK_880cb1_School FOREIGN KEY (ExpectedTransferSchoolId)
REFERENCES edfi.School (SchoolId)
;

CREATE INDEX FK_880cb1_School
ON wi.StudentSchoolAssociationExtension (ExpectedTransferSchoolId ASC);

ALTER TABLE wi.StudentSchoolAssociationExtension ADD CONSTRAINT FK_880cb1_StudentSchoolAssociation FOREIGN KEY (EntryDate, SchoolId, StudentUSI)
REFERENCES edfi.StudentSchoolAssociation (EntryDate, SchoolId, StudentUSI)
ON DELETE CASCADE
ON UPDATE CASCADE
;

ALTER TABLE wi.StudentSchoolAssociationReceivingService ADD CONSTRAINT FK_a2bfb7_CountDateNameDescriptor FOREIGN KEY (CountDateNameDescriptorId)
REFERENCES wi.CountDateNameDescriptor (CountDateNameDescriptorId)
;

CREATE INDEX FK_a2bfb7_CountDateNameDescriptor
ON wi.StudentSchoolAssociationReceivingService (CountDateNameDescriptorId ASC);

ALTER TABLE wi.StudentSchoolAssociationReceivingService ADD CONSTRAINT FK_a2bfb7_CountDateReceivingServiceDescriptor FOREIGN KEY (CountDateReceivingServiceDescriptorId)
REFERENCES wi.CountDateReceivingServiceDescriptor (CountDateReceivingServiceDescriptorId)
;

CREATE INDEX FK_a2bfb7_CountDateReceivingServiceDescriptor
ON wi.StudentSchoolAssociationReceivingService (CountDateReceivingServiceDescriptorId ASC);

ALTER TABLE wi.StudentSchoolAssociationReceivingService ADD CONSTRAINT FK_a2bfb7_StudentSchoolAssociation FOREIGN KEY (EntryDate, SchoolId, StudentUSI)
REFERENCES edfi.StudentSchoolAssociation (EntryDate, SchoolId, StudentUSI)
ON DELETE CASCADE
ON UPDATE CASCADE
;

CREATE INDEX FK_a2bfb7_StudentSchoolAssociation
ON wi.StudentSchoolAssociationReceivingService (EntryDate ASC, SchoolId ASC, StudentUSI ASC);

ALTER TABLE wi.StudentSpecialEducationProgramAssociationExtension ADD CONSTRAINT FK_3da84f_School FOREIGN KEY (FapeResponsibleSchoolId)
REFERENCES edfi.School (SchoolId)
;

CREATE INDEX FK_3da84f_School
ON wi.StudentSpecialEducationProgramAssociationExtension (FapeResponsibleSchoolId ASC);

ALTER TABLE wi.StudentSpecialEducationProgramAssociationExtension ADD CONSTRAINT FK_3da84f_StudentSpecialEducationProgramAssociation FOREIGN KEY (BeginDate, EducationOrganizationId, ProgramEducationOrganizationId, ProgramName, ProgramTypeDescriptorId, StudentUSI)
REFERENCES edfi.StudentSpecialEducationProgramAssociation (BeginDate, EducationOrganizationId, ProgramEducationOrganizationId, ProgramName, ProgramTypeDescriptorId, StudentUSI)
ON DELETE CASCADE
;

