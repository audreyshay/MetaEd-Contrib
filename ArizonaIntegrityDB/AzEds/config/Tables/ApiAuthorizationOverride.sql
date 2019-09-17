CREATE TABLE [config].[ApiAuthorizationOverride]
(
	[ApiAuthorizationOverrideId]		INT IDENTITY (1, 1) NOT NULL,
	[EducationOrganizationId]			INT,
	[FiscalYear]						INT NOT NULL,
	[ApiWideOverride]					BIT,
	[AllowedFromDate]					DATE NOT NULL,
	[AllowedToDate]						DATE NOT NULL,
	[CreatedBy]							NVARCHAR(100) NOT NULL,
	[CreatedDate]						DATETIME NOT NULL,
	[LastModifiedBy]					NVARCHAR(100) NOT NULL,
	[LastModifiedDate]					DATETIME NOT NULL,
	[Comment]							NVARCHAR(MAX),
	
	CONSTRAINT [PK_ApiAuthorizationOverride] PRIMARY KEY CLUSTERED ([ApiAuthorizationOverrideId] ASC),
	CONSTRAINT [FK_ApiAuthorizationOverride_EducationOrganization] FOREIGN KEY ([EducationOrganizationId], [FiscalYear]) REFERENCES [entity].[EducationOrganization] ([EducationOrganizationId], [FiscalYear])
)
