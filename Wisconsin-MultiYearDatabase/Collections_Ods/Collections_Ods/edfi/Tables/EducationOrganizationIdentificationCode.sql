CREATE TABLE [edfi].[EducationOrganizationIdentificationCode] (
	[EducationOrganizationId]                               INT           NOT NULL,
	[IdentificationCode]                                    NVARCHAR (60) NOT NULL,
	[CreateDate]                                            DATETIME      CONSTRAINT [EducationOrganizationIdentificationCode_DF_CreateDate] DEFAULT (getdate()) NOT NULL,
	[EducationOrganizationIdentificationSystemDescriptorId] INT           NOT NULL,
	[SchoolYear] SMALLINT NOT NULL DEFAULT (datepart(year,getdate())), 
	CONSTRAINT [PK_EducationOrganizationIdentificationCode] PRIMARY KEY CLUSTERED 
		([SchoolYear], [EducationOrganizationId], [EducationOrganizationIdentificationSystemDescriptorId]),
	CONSTRAINT [FK_EducationOrganizationIdentificationCode_EducationOrganization_EducationOrganizationId] 
		FOREIGN KEY ([SchoolYear], [EducationOrganizationId]) 
		REFERENCES [edfi].[EducationOrganization] ([SchoolYear], [EducationOrganizationId]) 
		ON DELETE CASCADE,
	CONSTRAINT [FK_EducationOrganizationIdentificationCode_EducationOrganizationIdentificationSystemDescriptorId] 
		FOREIGN KEY ([EducationOrganizationIdentificationSystemDescriptorId]) 
		REFERENCES [edfi].[EducationOrganizationIdentificationSystemDescriptor] ([EducationOrganizationIdentificationSystemDescriptorId])
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'A unique identifier used as Primary Key, not derived from business logic, when acting as Foreign Key, references the parent table.', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'EducationOrganizationIdentificationCode', @level2type = N'COLUMN', @level2name = N'EducationOrganizationIdentificationSystemDescriptorId';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'A unique number or alphanumeric code assigned to a space, room, site, building, individual, organization, program, or institution by a school, school system, a state, or other agency or entity.', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'EducationOrganizationIdentificationCode', @level2type = N'COLUMN', @level2name = N'IdentificationCode';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'EducationOrganization Identity Column', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'EducationOrganizationIdentificationCode', @level2type = N'COLUMN', @level2name = N'EducationOrganizationId';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'A unique number or alphanumeric code that is assigned to an education organization by a school, school system, state, or other agency or entity.', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'EducationOrganizationIdentificationCode';

