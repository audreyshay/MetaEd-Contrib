-- Extended Properties [edfixassessmentroster].[AssessmentAdministration] --
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The anticipated administration of an assessment under the purview of an EducationOrganization.', @level0type=N'SCHEMA', @level0name=N'edfixassessmentroster', @level1type=N'TABLE', @level1name=N'AssessmentAdministration'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The title or name of the assessment in the context of it''s administration.', @level0type=N'SCHEMA', @level0name=N'edfixassessmentroster', @level1type=N'TABLE', @level1name=N'AssessmentAdministration', @level2type=N'COLUMN', @level2name=N'AdministrationIdentifier'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A unique number or alphanumeric code assigned to an assessment.', @level0type=N'SCHEMA', @level0name=N'edfixassessmentroster', @level1type=N'TABLE', @level1name=N'AssessmentAdministration', @level2type=N'COLUMN', @level2name=N'AssessmentIdentifier'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The identifier assigned to an education organization.', @level0type=N'SCHEMA', @level0name=N'edfixassessmentroster', @level1type=N'TABLE', @level1name=N'AssessmentAdministration', @level2type=N'COLUMN', @level2name=N'AssigningEducationOrganizationId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Namespace for the Assessment.', @level0type=N'SCHEMA', @level0name=N'edfixassessmentroster', @level1type=N'TABLE', @level1name=N'AssessmentAdministration', @level2type=N'COLUMN', @level2name=N'Namespace'
GO

-- Extended Properties [edfixassessmentroster].[AssessmentAdministrationContact] --
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Pre-identified contacts for education organizations administering the assessment', @level0type=N'SCHEMA', @level0name=N'edfixassessmentroster', @level1type=N'TABLE', @level1name=N'AssessmentAdministrationContact'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The title or name of the assessment in the context of it''s administration.', @level0type=N'SCHEMA', @level0name=N'edfixassessmentroster', @level1type=N'TABLE', @level1name=N'AssessmentAdministrationContact', @level2type=N'COLUMN', @level2name=N'AdministrationIdentifier'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A unique number or alphanumeric code assigned to an assessment.', @level0type=N'SCHEMA', @level0name=N'edfixassessmentroster', @level1type=N'TABLE', @level1name=N'AssessmentAdministrationContact', @level2type=N'COLUMN', @level2name=N'AssessmentIdentifier'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The identifier assigned to an education organization.', @level0type=N'SCHEMA', @level0name=N'edfixassessmentroster', @level1type=N'TABLE', @level1name=N'AssessmentAdministrationContact', @level2type=N'COLUMN', @level2name=N'AssigningEducationOrganizationId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The identifier assigned to an education organization.', @level0type=N'SCHEMA', @level0name=N'edfixassessmentroster', @level1type=N'TABLE', @level1name=N'AssessmentAdministrationContact', @level2type=N'COLUMN', @level2name=N'EducationOrganizationId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The email address for the contact.', @level0type=N'SCHEMA', @level0name=N'edfixassessmentroster', @level1type=N'TABLE', @level1name=N'AssessmentAdministrationContact', @level2type=N'COLUMN', @level2name=N'ElectronicMailAddress'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Namespace for the Assessment.', @level0type=N'SCHEMA', @level0name=N'edfixassessmentroster', @level1type=N'TABLE', @level1name=N'AssessmentAdministrationContact', @level2type=N'COLUMN', @level2name=N'Namespace'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The conatcts''s first name', @level0type=N'SCHEMA', @level0name=N'edfixassessmentroster', @level1type=N'TABLE', @level1name=N'AssessmentAdministrationContact', @level2type=N'COLUMN', @level2name=N'FirstName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The contact''s last name', @level0type=N'SCHEMA', @level0name=N'edfixassessmentroster', @level1type=N'TABLE', @level1name=N'AssessmentAdministrationContact', @level2type=N'COLUMN', @level2name=N'LastSurname'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The login ID for the user; used for security access control interface.', @level0type=N'SCHEMA', @level0name=N'edfixassessmentroster', @level1type=N'TABLE', @level1name=N'AssessmentAdministrationContact', @level2type=N'COLUMN', @level2name=N'LoginId'
GO

-- Extended Properties [edfixassessmentroster].[AssessmentAdministrationPeriod] --
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The anticipated dates or administration window', @level0type=N'SCHEMA', @level0name=N'edfixassessmentroster', @level1type=N'TABLE', @level1name=N'AssessmentAdministrationPeriod'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The title or name of the assessment in the context of it''s administration.', @level0type=N'SCHEMA', @level0name=N'edfixassessmentroster', @level1type=N'TABLE', @level1name=N'AssessmentAdministrationPeriod', @level2type=N'COLUMN', @level2name=N'AdministrationIdentifier'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A unique number or alphanumeric code assigned to an assessment.', @level0type=N'SCHEMA', @level0name=N'edfixassessmentroster', @level1type=N'TABLE', @level1name=N'AssessmentAdministrationPeriod', @level2type=N'COLUMN', @level2name=N'AssessmentIdentifier'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The identifier assigned to an education organization.', @level0type=N'SCHEMA', @level0name=N'edfixassessmentroster', @level1type=N'TABLE', @level1name=N'AssessmentAdministrationPeriod', @level2type=N'COLUMN', @level2name=N'AssigningEducationOrganizationId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The month, day, and year for the start of the period.', @level0type=N'SCHEMA', @level0name=N'edfixassessmentroster', @level1type=N'TABLE', @level1name=N'AssessmentAdministrationPeriod', @level2type=N'COLUMN', @level2name=N'BeginDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Namespace for the Assessment.', @level0type=N'SCHEMA', @level0name=N'edfixassessmentroster', @level1type=N'TABLE', @level1name=N'AssessmentAdministrationPeriod', @level2type=N'COLUMN', @level2name=N'Namespace'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The month, day, and year for the end of the period.', @level0type=N'SCHEMA', @level0name=N'edfixassessmentroster', @level1type=N'TABLE', @level1name=N'AssessmentAdministrationPeriod', @level2type=N'COLUMN', @level2name=N'EndDate'
GO

-- Extended Properties [edfixassessmentroster].[StudentAssessmentRegistration] --
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Identifies a student who is expected to participate in particular assessment.', @level0type=N'SCHEMA', @level0name=N'edfixassessmentroster', @level1type=N'TABLE', @level1name=N'StudentAssessmentRegistration'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The title or name of the assessment in the context of it''s administration.', @level0type=N'SCHEMA', @level0name=N'edfixassessmentroster', @level1type=N'TABLE', @level1name=N'StudentAssessmentRegistration', @level2type=N'COLUMN', @level2name=N'AdministrationIdentifier'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A unique number or alphanumeric code assigned to an assessment.', @level0type=N'SCHEMA', @level0name=N'edfixassessmentroster', @level1type=N'TABLE', @level1name=N'StudentAssessmentRegistration', @level2type=N'COLUMN', @level2name=N'AssessmentIdentifier'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The identifier assigned to an education organization.', @level0type=N'SCHEMA', @level0name=N'edfixassessmentroster', @level1type=N'TABLE', @level1name=N'StudentAssessmentRegistration', @level2type=N'COLUMN', @level2name=N'AssigningEducationOrganizationId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The identifier assigned to an education organization.', @level0type=N'SCHEMA', @level0name=N'edfixassessmentroster', @level1type=N'TABLE', @level1name=N'StudentAssessmentRegistration', @level2type=N'COLUMN', @level2name=N'EducationOrganizationId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Namespace for the Assessment.', @level0type=N'SCHEMA', @level0name=N'edfixassessmentroster', @level1type=N'TABLE', @level1name=N'StudentAssessmentRegistration', @level2type=N'COLUMN', @level2name=N'Namespace'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A unique alphanumeric code assigned to a student.', @level0type=N'SCHEMA', @level0name=N'edfixassessmentroster', @level1type=N'TABLE', @level1name=N'StudentAssessmentRegistration', @level2type=N'COLUMN', @level2name=N'StudentUSI'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The identifier assigned to an education organization.', @level0type=N'SCHEMA', @level0name=N'edfixassessmentroster', @level1type=N'TABLE', @level1name=N'StudentAssessmentRegistration', @level2type=N'COLUMN', @level2name=N'TestingEducationOrganizationId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The identifier assigned to an education organization.', @level0type=N'SCHEMA', @level0name=N'edfixassessmentroster', @level1type=N'TABLE', @level1name=N'StudentAssessmentRegistration', @level2type=N'COLUMN', @level2name=N'ReportingEducationOrganizationId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The environment or format in which the assessment is expected to be administred', @level0type=N'SCHEMA', @level0name=N'edfixassessmentroster', @level1type=N'TABLE', @level1name=N'StudentAssessmentRegistration', @level2type=N'COLUMN', @level2name=N'PlatformTypeDescriptorId'
GO

-- Extended Properties [edfixassessmentroster].[StudentAssessmentRegistrationAssessmentCustomization] --
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Key/value pairs which may be used to facilitate customization of an assessment or to support vendor reporting/analysis', @level0type=N'SCHEMA', @level0name=N'edfixassessmentroster', @level1type=N'TABLE', @level1name=N'StudentAssessmentRegistrationAssessmentCustomization'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The title or name of the assessment in the context of it''s administration.', @level0type=N'SCHEMA', @level0name=N'edfixassessmentroster', @level1type=N'TABLE', @level1name=N'StudentAssessmentRegistrationAssessmentCustomization', @level2type=N'COLUMN', @level2name=N'AdministrationIdentifier'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A unique number or alphanumeric code assigned to an assessment.', @level0type=N'SCHEMA', @level0name=N'edfixassessmentroster', @level1type=N'TABLE', @level1name=N'StudentAssessmentRegistrationAssessmentCustomization', @level2type=N'COLUMN', @level2name=N'AssessmentIdentifier'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The identifier assigned to an education organization.', @level0type=N'SCHEMA', @level0name=N'edfixassessmentroster', @level1type=N'TABLE', @level1name=N'StudentAssessmentRegistrationAssessmentCustomization', @level2type=N'COLUMN', @level2name=N'AssigningEducationOrganizationId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The identifier assigned to an education organization.', @level0type=N'SCHEMA', @level0name=N'edfixassessmentroster', @level1type=N'TABLE', @level1name=N'StudentAssessmentRegistrationAssessmentCustomization', @level2type=N'COLUMN', @level2name=N'EducationOrganizationId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'An agreed upon code identifying the value for customization or reporting', @level0type=N'SCHEMA', @level0name=N'edfixassessmentroster', @level1type=N'TABLE', @level1name=N'StudentAssessmentRegistrationAssessmentCustomization', @level2type=N'COLUMN', @level2name=N'IdentificationCode'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Namespace for the Assessment.', @level0type=N'SCHEMA', @level0name=N'edfixassessmentroster', @level1type=N'TABLE', @level1name=N'StudentAssessmentRegistrationAssessmentCustomization', @level2type=N'COLUMN', @level2name=N'Namespace'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A unique alphanumeric code assigned to a student.', @level0type=N'SCHEMA', @level0name=N'edfixassessmentroster', @level1type=N'TABLE', @level1name=N'StudentAssessmentRegistrationAssessmentCustomization', @level2type=N'COLUMN', @level2name=N'StudentUSI'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The value indicated for customization or reporting', @level0type=N'SCHEMA', @level0name=N'edfixassessmentroster', @level1type=N'TABLE', @level1name=N'StudentAssessmentRegistrationAssessmentCustomization', @level2type=N'COLUMN', @level2name=N'CustomizationValue'
GO

