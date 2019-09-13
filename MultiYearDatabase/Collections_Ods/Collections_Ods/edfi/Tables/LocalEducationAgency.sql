CREATE TABLE [edfi].[LocalEducationAgency] (
	[LocalEducationAgencyId]             INT NOT NULL,
	[ParentLocalEducationAgencyId]       INT NULL,
	[LocalEducationAgencyCategoryTypeId] INT NOT NULL,
	[CharterStatusTypeId]                INT NULL,
	[EducationServiceCenterId]           INT NULL,
	[StateEducationAgencyId]             INT NULL,
	[SchoolYear] SMALLINT NOT NULL DEFAULT (datepart(year,getdate())), 
	[IsChoice] BIT  CONSTRAINT [LocalEducationAgency_DF_IsChoice] DEFAULT (0) NOT NULL, 
	CONSTRAINT [PK_LocalEducationAgency] PRIMARY KEY CLUSTERED 
		([SchoolYear],[LocalEducationAgencyId]),
	CONSTRAINT [FK_LocalEducationAgency_CharterStatusType_CharterStatusTypeId] 
		FOREIGN KEY ([CharterStatusTypeId]) 
		REFERENCES [edfi].[CharterStatusType] ([CharterStatusTypeId]),
	CONSTRAINT [FK_LocalEducationAgency_EducationOrganization_LocalEducationAgencyId] 
		FOREIGN KEY ([SchoolYear],[LocalEducationAgencyId]) 
		REFERENCES [edfi].[EducationOrganization] ([SchoolYear],[EducationOrganizationId]) 
		ON DELETE CASCADE,
	CONSTRAINT [FK_LocalEducationAgency_EducationServiceCenter_EducationServiceCenterId] 
		FOREIGN KEY ([SchoolYear],[EducationServiceCenterId]) 
		REFERENCES [edfi].[EducationServiceCenter] ([SchoolYear],[EducationServiceCenterId]),
	CONSTRAINT [FK_LocalEducationAgency_LocalEducationAgency_LocalEducationAgencyId] 
		FOREIGN KEY ([SchoolYear],[ParentLocalEducationAgencyId]) 
		REFERENCES [edfi].[LocalEducationAgency] ([SchoolYear],[LocalEducationAgencyId]),
	CONSTRAINT [FK_LocalEducationAgency_LocalEducationAgencyCategoryType_LocalEducationAgencyCategoryTypeId] 
		FOREIGN KEY ([LocalEducationAgencyCategoryTypeId]) 
		REFERENCES [edfi].[LocalEducationAgencyCategoryType] ([LocalEducationAgencyCategoryTypeId]),
	CONSTRAINT [FK_LocalEducationAgency_StateEducationAgency_StateEducationAgencyId] 
		FOREIGN KEY ([SchoolYear],[StateEducationAgencyId]) 
		REFERENCES [edfi].[StateEducationAgency] ([SchoolYear],[StateEducationAgencyId])
);

GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'This entity represents an administrative unit at the local level, which exists primarily to operate schools or to contract for educational services.  It includes school districts, charter schools, charter management organizations or other local administrative organizations.', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'LocalEducationAgency';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'EducationOrganization Identity Column', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'LocalEducationAgency', @level2type = N'COLUMN', @level2name = N'LocalEducationAgencyId';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'A unique identifier used as Primary Key, not derived from business logic, when acting as Foreign Key, references the parent table.', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'LocalEducationAgency', @level2type = N'COLUMN', @level2name = N'ParentLocalEducationAgencyId';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Key for LEACategory', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'LocalEducationAgency', @level2type = N'COLUMN', @level2name = N'LocalEducationAgencyCategoryTypeId';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Key for CharterStatus', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'LocalEducationAgency', @level2type = N'COLUMN', @level2name = N'CharterStatusTypeId';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'EducationServiceCenter Identity Column', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'LocalEducationAgency', @level2type = N'COLUMN', @level2name = N'EducationServiceCenterId';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'StateEducationAgency Identity Column', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'LocalEducationAgency', @level2type = N'COLUMN', @level2name = N'StateEducationAgencyId';

