CREATE TABLE [edfi].[StateEducationAgency] (
	[StateEducationAgencyId] INT NOT NULL,
	[SchoolYear] SMALLINT NOT NULL DEFAULT (datepart(year,getdate())), 
	CONSTRAINT [PK_StateEducationAgency] PRIMARY KEY CLUSTERED 
		([SchoolYear],[StateEducationAgencyId]),
	CONSTRAINT [FK_StateEducationAgency_EducationOrganization_StateEducationAgencyId] 
		FOREIGN KEY ([SchoolYear],[StateEducationAgencyId]) 
		REFERENCES [edfi].[EducationOrganization] ([SchoolYear],[EducationOrganizationId]) 
		ON DELETE CASCADE
);






GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'This entity represents the agency of the state charged with the primary responsibility for coordinating and supervising public instruction, including the setting of standards for elementary and secondary instructional programs.', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'StateEducationAgency';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'StateEducationAgency Identity Column', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'StateEducationAgency', @level2type = N'COLUMN', @level2name = N'StateEducationAgencyId';

