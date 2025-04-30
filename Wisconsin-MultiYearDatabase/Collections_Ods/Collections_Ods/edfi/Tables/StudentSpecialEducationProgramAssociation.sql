CREATE TABLE [edfi].[StudentSpecialEducationProgramAssociation] (
	[StudentUSI]                          INT            NOT NULL,
	[EducationOrganizationId]             INT            NOT NULL,
	[ProgramTypeId]                       INT            NOT NULL,
	[ProgramName]                         NVARCHAR (60)  NOT NULL,
	[ProgramEducationOrganizationId]      INT            NOT NULL,
	[BeginDate]                           DATE           NOT NULL,
	[IdeaEligibility]                     BIT            NULL,
	[SpecialEducationSettingDescriptorId] INT            NULL,
	[SpecialEducationHoursPerWeek]        DECIMAL (5, 2) NULL,
	[SchoolHoursPerWeek]                  DECIMAL (5, 2) NULL,
	[MultiplyDisabled]                    BIT            NULL,
	[MedicallyFragile]                    BIT            NULL,
	[LastEvaluationDate]                  DATE           NULL,
	[IEPReviewDate]                       DATE           NULL,
	[IEPBeginDate]                        DATE           NULL,
	[IEPEndDate]                          DATE           NULL,
	[SchoolYear]                          SMALLINT       CONSTRAINT [DF_StudentSpecialEducationProgramAssociation_SchoolYear] DEFAULT (datepart(year,getdate())) NOT NULL,
	[IsActive]                            BIT            CONSTRAINT [DF_StudentSpecialEducationProgramAssociation_IsActive] DEFAULT ((1)) NOT NULL,
	[WiDpiParentPlacedPrivate]			  BIT NULL, 
	[WiDpiFapeResponsibleSchoolId]		  INT NULL,
	[EffectiveBeginDate]				  DATE		 NULL,
	[EffectiveEndDate]					  DATE		 NULL,
	CONSTRAINT [PK_StudentSpecialEducationProgramAssociation] PRIMARY KEY CLUSTERED 
		([SchoolYear], [StudentUSI], [EducationOrganizationId], [ProgramTypeId], [ProgramName], [ProgramEducationOrganizationId], [BeginDate]),
	CONSTRAINT [FK_StudentSpecialEducationProgramAssociation_SpecialEducationSettingDescriptor_SpecialEducationSettingDescriptorId] 
		FOREIGN KEY ([SpecialEducationSettingDescriptorId]) 
		REFERENCES [edfi].[SpecialEducationSettingDescriptor] ([SpecialEducationSettingDescriptorId]), 
	CONSTRAINT [FK_StudentSpecialEducationProgramAssociation_StudentProgramAssociation] 
		FOREIGN KEY ([SchoolYear],[StudentUSI], [EducationOrganizationId], [ProgramTypeId],[ProgramName], [ProgramEducationOrganizationId], [BeginDate]) 
		REFERENCES [edfi].[StudentProgramAssociation] ([SchoolYear], [StudentUSI], [EducationOrganizationId], [ProgramTypeId], [ProgramName],[ProgramEducationOrganizationId], [BeginDate])
		ON DELETE CASCADE,
	CONSTRAINT [FK_StudentSpecialEducationProgramAssociation_School] 
		FOREIGN KEY([SchoolYear],[WiDpiFapeResponsibleSchoolId]) 
		REFERENCES [edfi].[School] ([SchoolYear],[SchoolId])
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The end date of the most recent IEP.', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'StudentSpecialEducationProgramAssociation', @level2type = N'COLUMN', @level2name = N'IEPEndDate';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The effective date of the most recent IEP.', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'StudentSpecialEducationProgramAssociation', @level2type = N'COLUMN', @level2name = N'IEPBeginDate';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The date of the last IEP review.', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'StudentSpecialEducationProgramAssociation', @level2type = N'COLUMN', @level2name = N'IEPReviewDate';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The date of the last special education evaluation.', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'StudentSpecialEducationProgramAssociation', @level2type = N'COLUMN', @level2name = N'LastEvaluationDate';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Indicates whether the Student receiving special education and related services is: 1) in the age range of birth to 22 years, and 2) has a serious, ongoing illness or a chronic condition that has lasted or is anticipated to last at least 12 or more months or has required at least one month of hospitalization, and that requires daily, ongoing medical treatments and monitoring by appropriately trained personnel which may include parents or other family members, and 3) requires the routine use of medical device or of assistive technology to compensate for the loss of usefulness of a body function needed to participate in activities of daily living, and 4) lives with ongoing threat to his or her continued well-being. Aligns with federal requirements.', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'StudentSpecialEducationProgramAssociation', @level2type = N'COLUMN', @level2name = N'MedicallyFragile';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Indicates whether the Student receiving special education and related services has been designated as multiply disabled by the admission, review, and dismissal committee as aligned with federal requirements.', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'StudentSpecialEducationProgramAssociation', @level2type = N'COLUMN', @level2name = N'MultiplyDisabled';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Indicate the total number of hours of instructional time per week for the school that the student attends.', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'StudentSpecialEducationProgramAssociation', @level2type = N'COLUMN', @level2name = N'SchoolHoursPerWeek';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The number of hours per week for special education instruction and therapy.', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'StudentSpecialEducationProgramAssociation', @level2type = N'COLUMN', @level2name = N'SpecialEducationHoursPerWeek';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'A unique identifier used as Primary Key, not derived from business logic, when acting as Foreign Key, references the parent table.', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'StudentSpecialEducationProgramAssociation', @level2type = N'COLUMN', @level2name = N'SpecialEducationSettingDescriptorId';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Indicator of the eligibility of the student to receive special education services according to the Individuals with Disabilities Education Act (IDEA).', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'StudentSpecialEducationProgramAssociation', @level2type = N'COLUMN', @level2name = N'IdeaEligibility';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The month, day, and year on which the Student first received services.', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'StudentSpecialEducationProgramAssociation', @level2type = N'COLUMN', @level2name = N'BeginDate';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The education organization where the student is participating in or receiving the program services.', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'StudentSpecialEducationProgramAssociation', @level2type = N'COLUMN', @level2name = N'ProgramEducationOrganizationId';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The formal name of the program of instruction, training, services or benefits available through federal, state, or local agencies.', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'StudentSpecialEducationProgramAssociation', @level2type = N'COLUMN', @level2name = N'ProgramName';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'A unique identifier used as Primary Key, not derived from business logic, when acting as Foreign Key, references the parent table.', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'StudentSpecialEducationProgramAssociation', @level2type = N'COLUMN', @level2name = N'ProgramTypeId';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The education organization where the student is participating in or receiving the program services.', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'StudentSpecialEducationProgramAssociation', @level2type = N'COLUMN', @level2name = N'EducationOrganizationId';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'A unique number or alphanumeric code assigned to a student by a state education agency.', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'StudentSpecialEducationProgramAssociation', @level2type = N'COLUMN', @level2name = N'StudentUSI';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'This association represents the special education program(s) that a student participates in or receives services from. The association is an extension of the StudentProgramAssociation particular for special education programs.', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'StudentSpecialEducationProgramAssociation';

