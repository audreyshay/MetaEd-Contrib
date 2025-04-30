CREATE TABLE [edfi].[School] (
	[SchoolId]                                 INT      NOT NULL,
	[LocalEducationAgencyId]                   INT      NULL,
	[SchoolTypeId]                             INT      NULL,
	[CharterStatusTypeId]                      INT      NULL,
	[TitleIPartASchoolDesignationTypeId]       INT      NULL,
	[MagnetSpecialProgramEmphasisSchoolTypeId] INT      NULL,
	[AdministrativeFundingControlDescriptorId] INT      NULL,
	[InternetAccessTypeId]                     INT      NULL,
	[CharterApprovalAgencyTypeId]              INT      NULL,
	[CharterApprovalSchoolYear]                SMALLINT NULL,
	[SchoolYear] SMALLINT NOT NULL DEFAULT (datepart(year,getdate())), 
	[IsChoice] BIT  CONSTRAINT [School_DF_IsChoice] DEFAULT (0) NOT NULL, 
	CONSTRAINT [PK_School] PRIMARY KEY CLUSTERED 
		([SchoolYear],[SchoolId]),
	CONSTRAINT [FK_School_CharterApprovalAgencyType_CharterApprovalAgencyTypeId] 
		FOREIGN KEY ([CharterApprovalAgencyTypeId]) 
		REFERENCES [edfi].[CharterApprovalAgencyType] ([CharterApprovalAgencyTypeId]),
	CONSTRAINT [FK_School_CharterStatusType_CharterStatusTypeId] 
		FOREIGN KEY ([CharterStatusTypeId]) 
		REFERENCES [edfi].[CharterStatusType] ([CharterStatusTypeId]),
	CONSTRAINT [FK_School_EducationOrganization_SchoolId] 
		FOREIGN KEY ([SchoolYear],[SchoolId]) 
		REFERENCES [edfi].[EducationOrganization] ([SchoolYear],[EducationOrganizationId]) 
		ON DELETE CASCADE,
	CONSTRAINT [FK_School_LocalEducationAgency_LocalEducationAgencyId] 
		FOREIGN KEY ([SchoolYear],[LocalEducationAgencyId]) 
		REFERENCES [edfi].[LocalEducationAgency] ([SchoolYear],[LocalEducationAgencyId]),
	CONSTRAINT [FK_School_SchoolYearType_SchoolYear] 
		FOREIGN KEY ([CharterApprovalSchoolYear]) 
		REFERENCES [edfi].[SchoolYearType] ([SchoolYear]),
	 CONSTRAINT [FK_School_SchoolType_SchoolTypeId] FOREIGN KEY ([SchoolTypeId]) REFERENCES [edfi].[SchoolType] ([SchoolTypeId])
   
);

GO
CREATE INDEX [IX_School_LocalEducationAgencyId_SchoolYear] ON [edfi].[School] ([SchoolYear],[LocalEducationAgencyId]);



GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'This entity represents an educational organization that includes staff and students who participate in classes and educational activity groups.', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'School';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'School Identity Column', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'School', @level2type = N'COLUMN', @level2name = N'SchoolId';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'EducationOrganization Identity Column', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'School', @level2type = N'COLUMN', @level2name = N'LocalEducationAgencyId';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The instructional categorization of the school (e.g., Regular, Alternative, etc.)

', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'School', @level2type = N'COLUMN', @level2name = N'SchoolTypeId';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'A school or agency providing free public elementary or secondary education to eligible students under a specific charter granted by the state legislature or other appropriate authority and designated by such authority to be a charter school.

', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'School', @level2type = N'COLUMN', @level2name = N'CharterStatusTypeId';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Denotes the Title I Part A designation for the school.
', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'School', @level2type = N'COLUMN', @level2name = N'TitleIPartASchoolDesignationTypeId';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'A school that has been designed: 1) to attract students of different racial/ethnic backgrounds for the purpose of reducing, preventing, or eliminating racial isolation; and/or 2)to provide an academic or social focus on a particular theme (e.g., science/math, performing arts, gifted/talented, or foreign language).
', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'School', @level2type = N'COLUMN', @level2name = N'MagnetSpecialProgramEmphasisSchoolTypeId';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'A unique identifier used as Primary Key, not derived from business logic, when acting as Foreign Key, references the parent table.', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'School', @level2type = N'COLUMN', @level2name = N'AdministrativeFundingControlDescriptorId';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'A unique identifier used as Primary Key, not derived from business logic, when acting as Foreign Key, references the parent table.', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'School', @level2type = N'COLUMN', @level2name = N'InternetAccessTypeId';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Key for MagnetSpecialProgramEmphasisSchool', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'School', @level2type = N'COLUMN', @level2name = N'CharterApprovalAgencyTypeId';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Key for School', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'School', @level2type = N'COLUMN', @level2name = N'CharterApprovalSchoolYear';

