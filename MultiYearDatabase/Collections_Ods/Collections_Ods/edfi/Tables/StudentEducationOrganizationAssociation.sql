CREATE TABLE [edfi].[StudentEducationOrganizationAssociation] (
    [StudentUSI]                 INT              NOT NULL,
    [EducationOrganizationId]    INT              NOT NULL,
    [ResponsibilityDescriptorId] INT              NOT NULL,
    [Id]                         UNIQUEIDENTIFIER CONSTRAINT [StudentEducationOrganizationAssociation_DF_Id] DEFAULT (newid()) NOT NULL,
    [LastModifiedDate]           DATETIME         CONSTRAINT [StudentEducationOrganizationAssociation_DF_LastModifiedDate] DEFAULT (getdate()) NOT NULL,
    [CreateDate]                 DATETIME         CONSTRAINT [StudentEducationOrganizationAssociation_DF_CreateDate] DEFAULT (getdate()) NOT NULL,
    [SchoolYear]                 SMALLINT         DEFAULT (datepart(year,getdate())) NOT NULL,
    [IsActive]                   BIT              CONSTRAINT [DF_StudentEducationOrganizationAssociationt_IsActive] DEFAULT ((1)) NOT NULL,
    CONSTRAINT [PK_StudentEducationOrganizationAssociation] PRIMARY KEY CLUSTERED 
		([SchoolYear] ASC, [StudentUSI] ASC, [EducationOrganizationId] ASC, [ResponsibilityDescriptorId] ASC),
    CONSTRAINT [FK_StudentEducationOrganizationAssociation_EducationOrganization_EducationOrganizationId] 
		FOREIGN KEY ([SchoolYear],[EducationOrganizationId]) 
		REFERENCES [edfi].[EducationOrganization] ([SchoolYear],[EducationOrganizationId]),
    CONSTRAINT [FK_StudentEducationOrganizationAssociation_ResponsibilityDescriptor_ResponsibilityDescriptorId] 
		FOREIGN KEY ([ResponsibilityDescriptorId]) 
		REFERENCES [edfi].[ResponsibilityDescriptor] ([ResponsibilityDescriptorId]),
    CONSTRAINT [FK_StudentEducationOrganizationAssociation_Student_StudentUSI_SchoolYear] 
		FOREIGN KEY ([SchoolYear],[StudentUSI]) 
		REFERENCES [edfi].[Student] ([SchoolYear],[StudentUSI])
);

GO
CREATE UNIQUE NONCLUSTERED INDEX [GUID_StudentEducationOrganizationAssociation]
    ON [edfi].[StudentEducationOrganizationAssociation]([Id] ASC);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'This association indicates any relationship between a student and an education organization other than however the state views enrollment. Enrollment relationship semantics are covered by StudentSchoolAssociation.', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'StudentEducationOrganizationAssociation';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'A unique number or alphanumeric code assigned to a student by a state education agency.', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'StudentEducationOrganizationAssociation', @level2type = N'COLUMN', @level2name = N'StudentUSI';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'EducationOrganization Identity Column', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'StudentEducationOrganizationAssociation', @level2type = N'COLUMN', @level2name = N'EducationOrganizationId';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'A unique identifier used as Primary Key, not derived from business logic, when acting as Foreign Key, references the parent table.', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'StudentEducationOrganizationAssociation', @level2type = N'COLUMN', @level2name = N'ResponsibilityDescriptorId';

