CREATE TABLE [edfi].[StudentAcademicRecordAcademicHonor] (
    [AcademicHonorCategoryTypeId]     INT            NOT NULL,
    [StudentUSI]                      INT            NOT NULL,
    [EducationOrganizationId]         INT            NOT NULL,
    [SchoolYear]                      SMALLINT       NOT NULL,
    [HonorDescription]                NVARCHAR (80)  NULL,
    [HonorAwardDate]                  DATE           NULL,
    [HonorAwardExpiresDate]           DATE           NULL,
    [AchievementTitle]                NVARCHAR (60)  NULL,
    [AchievementCategoryDescriptorId] INT            NOT NULL,
    [AchievementCategorySystem]       NVARCHAR (60)  NULL,
    [IssuerName]                      NVARCHAR (150) NULL,
    [IssuerOriginURL]                 NVARCHAR (255) NULL,
    [Criteria]                        NVARCHAR (150) NULL,
    [CriteriaURL]                     NVARCHAR (255) NULL,
    [EvidenceStatement]               NVARCHAR (150) NULL,
    [ImageURL]                        NVARCHAR (255) NULL,
    [CreateDate]                      DATETIME       CONSTRAINT [StudentAcademicRecordAcademicHonor_DF_CreateDate] DEFAULT (getdate()) NOT NULL,
    [TermDescriptorId]                INT            NOT NULL,
    CONSTRAINT [PK_StudentAcademicRecordAcademicHonor] PRIMARY KEY CLUSTERED 
		([SchoolYear] ASC, [AcademicHonorCategoryTypeId] ASC, [StudentUSI] ASC, [TermDescriptorId] ASC, [EducationOrganizationId] ASC),
    CONSTRAINT [FK_StudentAcademicRecordAcademicHonor_AcademicHonorCategoryType_AcademicHonorCategoryTypeId] 
		FOREIGN KEY ([AcademicHonorCategoryTypeId]) 
		REFERENCES [edfi].[AcademicHonorCategoryType] ([AcademicHonorCategoryTypeId]),
    CONSTRAINT [FK_StudentAcademicRecordAcademicHonor_AchievementCategoryDescriptor_AchievementCategoryDescriptorId] 
		FOREIGN KEY ([AchievementCategoryDescriptorId]) 
		REFERENCES [edfi].[AchievementCategoryDescriptor] ([AchievementCategoryDescriptorId])
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Academic distinctions earned by or awarded to the student.', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'StudentAcademicRecordAcademicHonor';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'A designation of the type of academic distinctions earned by or awarded to the student.
', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'StudentAcademicRecordAcademicHonor', @level2type = N'COLUMN', @level2name = N'AcademicHonorCategoryTypeId';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'A unique number or alphanumeric code assigned to a student by a state education agency.', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'StudentAcademicRecordAcademicHonor', @level2type = N'COLUMN', @level2name = N'StudentUSI';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'EducationOrganization Identity Column', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'StudentAcademicRecordAcademicHonor', @level2type = N'COLUMN', @level2name = N'EducationOrganizationId';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The identifier for the school year.', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'StudentAcademicRecordAcademicHonor', @level2type = N'COLUMN', @level2name = N'SchoolYear';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'A description of the type of academic distinctions earned by or awarded to the individual.
', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'StudentAcademicRecordAcademicHonor', @level2type = N'COLUMN', @level2name = N'HonorDescription';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The date the honor was awarded or earned.
', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'StudentAcademicRecordAcademicHonor', @level2type = N'COLUMN', @level2name = N'HonorAwardDate';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The title assigned to the achievement.', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'StudentAcademicRecordAcademicHonor', @level2type = N'COLUMN', @level2name = N'AchievementTitle';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'A unique identifier used as Primary Key, not derived from business logic, when acting as Foreign Key, references the parent table.', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'StudentAcademicRecordAcademicHonor', @level2type = N'COLUMN', @level2name = N'AchievementCategoryDescriptorId';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The system that defines the categories by which an achievement is attributed to the learner.', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'StudentAcademicRecordAcademicHonor', @level2type = N'COLUMN', @level2name = N'AchievementCategorySystem';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The name of the agent issuing the award.', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'StudentAcademicRecordAcademicHonor', @level2type = N'COLUMN', @level2name = N'IssuerName';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The Uniform Resource Locator (URL) from which the award was issued.', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'StudentAcademicRecordAcademicHonor', @level2type = N'COLUMN', @level2name = N'IssuerOriginURL';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The criteria for competency-based completion of the achievement/award.', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'StudentAcademicRecordAcademicHonor', @level2type = N'COLUMN', @level2name = N'Criteria';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The Uniform Resource Locator (URL) for the unique address of a web page describing the competency-based completion criteria for the achievement/award.', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'StudentAcademicRecordAcademicHonor', @level2type = N'COLUMN', @level2name = N'CriteriaURL';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'A statement or reference describing the evidence that the learner met the criteria for attainment of the achievement.', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'StudentAcademicRecordAcademicHonor', @level2type = N'COLUMN', @level2name = N'EvidenceStatement';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The Uniform Resource Locator (URL) for the unique address of an image representing an award or badge associated with the achievement.', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'StudentAcademicRecordAcademicHonor', @level2type = N'COLUMN', @level2name = N'ImageURL';

