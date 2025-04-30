CREATE TABLE [edfi].[DisabilityDescriptor] (
    [DisabilityDescriptorId]   INT NOT NULL,
    [DisabilityCategoryTypeId] INT NOT NULL,
    [DisabilityTypeId]         INT NULL,
    CONSTRAINT [PK_DisabilityDescriptor] PRIMARY KEY CLUSTERED ([DisabilityDescriptorId] ASC),
    CONSTRAINT [FK_DisabilityDescriptor_Descriptor_DescriptorId] FOREIGN KEY ([DisabilityDescriptorId]) REFERENCES [edfi].[Descriptor] ([DescriptorId]) ON DELETE CASCADE,
    CONSTRAINT [FK_DisabilityDescriptor_DisabilityCategoryType_DisabilityCategoryId] FOREIGN KEY ([DisabilityCategoryTypeId]) REFERENCES [edfi].[DisabilityCategoryType] ([DisabilityCategoryTypeId]),
    CONSTRAINT [FK_DisabilityDescriptor_DisabilityType_DisabilityTypeId] FOREIGN KEY ([DisabilityTypeId]) REFERENCES [edfi].[DisabilityType] ([DisabilityTypeId])
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'This descriptor defines a child''s impairment.', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'DisabilityDescriptor';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'A unique identifier used as Primary Key, not derived from business logic, when acting as Foreign Key, references the parent table.', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'DisabilityDescriptor', @level2type = N'COLUMN', @level2name = N'DisabilityDescriptorId';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'A unique identifier used as Primary Key, not derived from business logic, when acting as Foreign Key, references the parent table.', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'DisabilityDescriptor', @level2type = N'COLUMN', @level2name = N'DisabilityCategoryTypeId';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Key for Disability', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'DisabilityDescriptor', @level2type = N'COLUMN', @level2name = N'DisabilityTypeId';

