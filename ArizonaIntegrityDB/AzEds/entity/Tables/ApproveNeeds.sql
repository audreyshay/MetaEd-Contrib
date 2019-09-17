CREATE TABLE [Entity].[ApprovedNeeds]
(
	EducationOrganizationId INT NOT NULL,
	NeedDescriptorId INT NOT NULL,
	CONSTRAINT [PK_ApprovedNeeds] PRIMARY KEY CLUSTERED ([EducationOrganizationId] ASC,	[NeedDescriptorId] ASC)
);
