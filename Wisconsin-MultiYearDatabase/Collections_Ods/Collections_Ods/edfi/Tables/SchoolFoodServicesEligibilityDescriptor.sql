CREATE TABLE [edfi].[SchoolFoodServicesEligibilityDescriptor] (
    [SchoolFoodServicesEligibilityDescriptorId] INT NOT NULL,
    [SchoolFoodServicesEligibilityTypeId]       INT NULL,
    CONSTRAINT [PK_SchoolFoodServicesEligibilityDescriptor] PRIMARY KEY CLUSTERED ([SchoolFoodServicesEligibilityDescriptorId] ASC),
    CONSTRAINT [FK_SchoolFoodServicesEligibilityDescriptor_Descriptor_DescriptorId] FOREIGN KEY ([SchoolFoodServicesEligibilityDescriptorId]) REFERENCES [edfi].[Descriptor] ([DescriptorId]) ON DELETE CASCADE,
    CONSTRAINT [FK_SchoolFoodServicesEligibilityDescriptor_SchoolFoodServicesEligibilityType_SchoolFoodServicesEligibilityTypeId] FOREIGN KEY ([SchoolFoodServicesEligibilityTypeId]) REFERENCES [edfi].[SchoolFoodServicesEligibilityType] ([SchoolFoodServicesEligibilityTypeId])
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'This descriptor defines indications of a student''s level of eligibility for breakfast, lunch, snack, supper and milk programs.', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'SchoolFoodServicesEligibilityDescriptor';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'A unique identifier used as Primary Key, not derived from business logic, when acting as Foreign Key, references the parent table.', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'SchoolFoodServicesEligibilityDescriptor', @level2type = N'COLUMN', @level2name = N'SchoolFoodServicesEligibilityDescriptorId';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Key for SchoolFoodServicesEligibility', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'SchoolFoodServicesEligibilityDescriptor', @level2type = N'COLUMN', @level2name = N'SchoolFoodServicesEligibilityTypeId';

