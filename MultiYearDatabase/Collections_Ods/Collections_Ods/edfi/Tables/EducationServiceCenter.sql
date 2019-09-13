CREATE TABLE [edfi].[EducationServiceCenter] (
	[EducationServiceCenterId] INT NOT NULL,
	[StateEducationAgencyId]   INT NULL,
	[SchoolYear] SMALLINT NOT NULL DEFAULT (datepart(year,getdate())), 
	CONSTRAINT [PK_EducationServiceCenter] PRIMARY KEY CLUSTERED 
		([SchoolYear], [EducationServiceCenterId]),
	CONSTRAINT [FK_EducationServiceCenter_EducationOrganization_EducationServiceCenterId] 
		FOREIGN KEY ([SchoolYear], [EducationServiceCenterId]) 
		REFERENCES [edfi].[EducationOrganization] ([SchoolYear], [EducationOrganizationId]) 
		ON DELETE CASCADE,
	CONSTRAINT [FK_EducationServiceCenter_StateEducationAgency_StateEducationAgencyId] 
		FOREIGN KEY ([SchoolYear], [StateEducationAgencyId]) 
		REFERENCES [edfi].[StateEducationAgency] ([SchoolYear], [StateEducationAgencyId])
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'This entity represents a regional, multi-services public agency authorized by State Law to develop, manage and provide services, programs or other options support (e.g., construction, food services and technology services) to LEAs.', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'EducationServiceCenter';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'EducationServiceCenter Identity Column', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'EducationServiceCenter', @level2type = N'COLUMN', @level2name = N'EducationServiceCenterId';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The SEA of which the ESC is an organizational component.', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'EducationServiceCenter', @level2type = N'COLUMN', @level2name = N'StateEducationAgencyId';

