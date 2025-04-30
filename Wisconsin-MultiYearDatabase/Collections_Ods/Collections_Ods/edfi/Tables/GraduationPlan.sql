CREATE TABLE [edfi].[GraduationPlan] (
    [EducationOrganizationId]        INT              NOT NULL,
    [IndividualPlan]                 BIT              NULL,
    [TotalRequiredCredit]            DECIMAL (9, 2)   NOT NULL,
    [TotalRequiredCreditTypeId]      INT              NULL,
    [TotalRequiredCreditConversion]  DECIMAL (9, 2)   NULL,
    [GraduationPlanTypeDescriptorId] INT              NOT NULL,
    [GraduationSchoolYear]           SMALLINT         NOT NULL,
    [Id]                             UNIQUEIDENTIFIER CONSTRAINT [GraduationPlan_DF_Id] DEFAULT (newid()) NOT NULL,
    [LastModifiedDate]               DATETIME         CONSTRAINT [GraduationPlan_DF_LastModifiedDate] DEFAULT (getdate()) NOT NULL,
    [CreateDate]                     DATETIME         CONSTRAINT [GraduationPlan_DF_CreateDate] DEFAULT (getdate()) NOT NULL,
    [SchoolYear] SMALLINT NOT NULL DEFAULT (datepart(year,getdate())), 
    CONSTRAINT [PK_GraduationPlan] PRIMARY KEY CLUSTERED 
		([SchoolYear], [EducationOrganizationId], [GraduationPlanTypeDescriptorId], [GraduationSchoolYear]),
    CONSTRAINT [FK_GraduationPlan_CreditType_TotalCreditsRequiredCreditTypeId] 
		FOREIGN KEY ([TotalRequiredCreditTypeId]) 
		REFERENCES [edfi].[CreditType] ([CreditTypeId]),
    CONSTRAINT [FK_GraduationPlan_EducationOrganization_EducationOrganizationId] 
		FOREIGN KEY ([SchoolYear], [EducationOrganizationId]) 
		REFERENCES [edfi].[EducationOrganization] ([SchoolYear], [EducationOrganizationId]),
    CONSTRAINT [FK_GraduationPlan_GraduationPlanTypeDescriptor_GraduationPlanTypeDescriptorId] 
		FOREIGN KEY ([GraduationPlanTypeDescriptorId]) 
		REFERENCES [edfi].[GraduationPlanTypeDescriptor] ([GraduationPlanTypeDescriptorId]),
    CONSTRAINT [FK_GraduationPlan_SchoolYearType_GraduationSchoolYear] 
		FOREIGN KEY ([GraduationSchoolYear]) 
		REFERENCES [edfi].[SchoolYearType] ([SchoolYear])
);


GO
CREATE UNIQUE NONCLUSTERED INDEX [GUID_GraduationPlan]
    ON [edfi].[GraduationPlan]([Id] ASC);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'This entity is a plan outlining the required credits, credits by subject, credits by course and other criteria required for graduation. A graduation plan may be one or more standard plans defined by an education organization and/or individual plans for some or all students.', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'GraduationPlan';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'EducationOrganization Identity Column', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'GraduationPlan', @level2type = N'COLUMN', @level2name = N'EducationOrganizationId';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'An indicator of whether the graduation plan is tailored for an individual.', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'GraduationPlan', @level2type = N'COLUMN', @level2name = N'IndividualPlan';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The total number of credits required for graduation under this plan.', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'GraduationPlan', @level2type = N'COLUMN', @level2name = N'TotalRequiredCredit';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Key for Credit', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'GraduationPlan', @level2type = N'COLUMN', @level2name = N'TotalRequiredCreditTypeId';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Conversion factor that when multiplied by the number of credits is equivalent to Carnegie units.', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'GraduationPlan', @level2type = N'COLUMN', @level2name = N'TotalRequiredCreditConversion';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'A unique identifier used as Primary Key, not derived from business logic, when acting as Foreign Key, references the parent table.', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'GraduationPlan', @level2type = N'COLUMN', @level2name = N'GraduationPlanTypeDescriptorId';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Key for School', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'GraduationPlan', @level2type = N'COLUMN', @level2name = N'GraduationSchoolYear';

