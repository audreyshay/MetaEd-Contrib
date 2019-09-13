CREATE TABLE [edfi].[StudentAcademicRecordDiploma] (
	[StudentUSI]                      INT            NOT NULL,
	[DiplomaTypeId]                   INT            NOT NULL,
	[SchoolYear]                      SMALLINT       NOT NULL,
	[EducationOrganizationId]         INT            NOT NULL,
	[DiplomaAwardDate]                DATE           NOT NULL,
	[DiplomaLevelTypeId]              INT            NULL,
	[CTECompleter]                    BIT            NULL,
	[DiplomaDescription]              NVARCHAR (80)  NULL,
	[DiplomaAwardExpiresDate]         DATE           NULL,
	[AchievementTitle]                NVARCHAR (60)  NULL,
	[AchievementCategoryDescriptorId] INT            NULL,
	[AchievementCategorySystem]       NVARCHAR (60)  NULL,
	[IssuerName]                      NVARCHAR (150) NULL,
	[IssuerOriginURL]                 NVARCHAR (255) NULL,
	[Criteria]                        NVARCHAR (150) NULL,
	[CriteriaURL]                     NVARCHAR (255) NULL,
	[EvidenceStatement]               NVARCHAR (150) NULL,
	[ImageURL]                        NVARCHAR (255) NULL,
	[CreateDate]                      DATETIME       CONSTRAINT [StudentAcademicRecordDiploma_DF_CreateDate] DEFAULT (getdate()) NOT NULL,
	[TermDescriptorId]                INT            NOT NULL,
	CONSTRAINT [PK_StudentAcademicRecordDiploma] PRIMARY KEY CLUSTERED 
		([SchoolYear] ASC, [StudentUSI] ASC, [DiplomaTypeId] ASC, [EducationOrganizationId] ASC, [DiplomaAwardDate] ASC, [TermDescriptorId] ASC),
	CONSTRAINT [FK_StudentAcademicRecordDiploma_AchievementCategoryDescriptor_AchievementCategoryDescriptorId] 
		FOREIGN KEY ([AchievementCategoryDescriptorId]) 
		REFERENCES [edfi].[AchievementCategoryDescriptor] ([AchievementCategoryDescriptorId]),
	CONSTRAINT [FK_StudentAcademicRecordDiploma_DiplomaLevelType_DiplomaLevelTypeId] 
		FOREIGN KEY ([DiplomaLevelTypeId]) 
		REFERENCES [edfi].[DiplomaLevelType] ([DiplomaLevelTypeId]),
	CONSTRAINT [FK_StudentAcademicRecordDiploma_DiplomaType_DiplomaTypeId] 
		FOREIGN KEY ([DiplomaTypeId]) 
		REFERENCES [edfi].[DiplomaType] ([DiplomaTypeId]),
	CONSTRAINT [FK_StudentAcademicRecordDiploma_StudentAcademicRecord_StudentUSI] 
		FOREIGN KEY ([SchoolYear],[StudentUSI], [EducationOrganizationId], [TermDescriptorId]) 
		REFERENCES [edfi].[StudentAcademicRecord] ([SchoolYear],[StudentUSI], [EducationOrganizationId], [TermDescriptorId]) 
		ON DELETE CASCADE
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'This educational entity represents the conferring or certification by an educational organization that the student has successfully completed a particular course of study. It represents the electronic version of its physical document counterpart.', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'StudentAcademicRecordDiploma';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'A unique number or alphanumeric code assigned to a student by a state education agency.', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'StudentAcademicRecordDiploma', @level2type = N'COLUMN', @level2name = N'StudentUSI';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The type of diploma/credential that is awarded to a student in recognition of his/her completion of the curricular requirements.
', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'StudentAcademicRecordDiploma', @level2type = N'COLUMN', @level2name = N'DiplomaTypeId';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The identifier for the school year.', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'StudentAcademicRecordDiploma', @level2type = N'COLUMN', @level2name = N'SchoolYear';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'EducationOrganization Identity Column', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'StudentAcademicRecordDiploma', @level2type = N'COLUMN', @level2name = N'EducationOrganizationId';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The month, day, and year on which the student met  graduation requirements and was awarded a diploma.
', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'StudentAcademicRecordDiploma', @level2type = N'COLUMN', @level2name = N'DiplomaAwardDate';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The type of diploma/credential that is awarded to a student in recognition of his/her completion of the curricular requirements.
Minimum high school program
Recommended high school program
Distinguished Achievement Program

', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'StudentAcademicRecordDiploma', @level2type = N'COLUMN', @level2name = N'DiplomaLevelTypeId';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Indicated a student who reached a state-defined threshold of vocational education and who attained a high school diploma or its recognized state equivalent or GED.
', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'StudentAcademicRecordDiploma', @level2type = N'COLUMN', @level2name = N'CTECompleter';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The description of diploma given to the student for accomplishments.', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'StudentAcademicRecordDiploma', @level2type = N'COLUMN', @level2name = N'DiplomaDescription';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The title assigned to the achievement.', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'StudentAcademicRecordDiploma', @level2type = N'COLUMN', @level2name = N'AchievementTitle';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'A unique identifier used as Primary Key, not derived from business logic, when acting as Foreign Key, references the parent table.', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'StudentAcademicRecordDiploma', @level2type = N'COLUMN', @level2name = N'AchievementCategoryDescriptorId';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The system that defines the categories by which an achievement is attributed to the learner.', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'StudentAcademicRecordDiploma', @level2type = N'COLUMN', @level2name = N'AchievementCategorySystem';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The name of the agent issuing the award.', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'StudentAcademicRecordDiploma', @level2type = N'COLUMN', @level2name = N'IssuerName';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The Uniform Resource Locator (URL) from which the award was issued.', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'StudentAcademicRecordDiploma', @level2type = N'COLUMN', @level2name = N'IssuerOriginURL';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The criteria for competency-based completion of the achievement/award.', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'StudentAcademicRecordDiploma', @level2type = N'COLUMN', @level2name = N'Criteria';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The Uniform Resource Locator (URL) for the unique address of a web page describing the competency-based completion criteria for the achievement/award.', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'StudentAcademicRecordDiploma', @level2type = N'COLUMN', @level2name = N'CriteriaURL';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'A statement or reference describing the evidence that the learner met the criteria for attainment of the achievement.', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'StudentAcademicRecordDiploma', @level2type = N'COLUMN', @level2name = N'EvidenceStatement';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The Uniform Resource Locator (URL) for the unique address of an image representing an award or badge associated with the achievement.', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'StudentAcademicRecordDiploma', @level2type = N'COLUMN', @level2name = N'ImageURL';

