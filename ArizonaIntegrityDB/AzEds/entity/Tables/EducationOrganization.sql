CREATE TABLE [entity].[EducationOrganization] (
    [EducationOrganizationId]			INT            NOT NULL,
    [FiscalYear]						INT            NOT NULL,
    [OperationalStatusTypeId]			INT            NULL,
    [NameOfInstitution]					NVARCHAR (100) NOT NULL,
    [CTDS]								NVARCHAR (12)  NOT NULL,
	[OperationalStatusEffectiveDate]    DATE           NULL,
    CONSTRAINT [PK_EducationOrganization] PRIMARY KEY CLUSTERED ([EducationOrganizationId] ASC, [FiscalYear] ASC),
    CONSTRAINT [FK_EducationOrganization_OperationalStatusType] FOREIGN KEY ([OperationalStatusTypeId]) REFERENCES [entity].[OperationalStatusType] ([OperationalStatusTypeId])
);



