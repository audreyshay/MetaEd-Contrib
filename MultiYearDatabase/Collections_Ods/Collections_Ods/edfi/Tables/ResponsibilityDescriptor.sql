CREATE TABLE [edfi].[ResponsibilityDescriptor] (
    [ResponsibilityDescriptorId] INT NOT NULL,
    [ResponsibilityTypeId]       INT NULL,
    CONSTRAINT [PK_ResponsibilityDescriptor] PRIMARY KEY CLUSTERED ([ResponsibilityDescriptorId] ASC),
    CONSTRAINT [FK_ResponsibilityDescriptor_Descriptor_DescriptorId] FOREIGN KEY ([ResponsibilityDescriptorId]) REFERENCES [edfi].[Descriptor] ([DescriptorId]) ON DELETE CASCADE,
    CONSTRAINT [FK_ResponsibilityDescriptor_ResponsibilityType_ResponsibilityTypeId] FOREIGN KEY ([ResponsibilityTypeId]) REFERENCES [edfi].[ResponsibilityType] ([ResponsibilityTypeId])
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'This descriptor defines types of responsibility an education organization may have for a student (e.g., accountability, attendance, funding).', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'ResponsibilityDescriptor';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'A unique identifier used as Primary Key, not derived from business logic, when acting as Foreign Key, references the parent table.', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'ResponsibilityDescriptor', @level2type = N'COLUMN', @level2name = N'ResponsibilityDescriptorId';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'A unique identifier used as Primary Key, not derived from business logic, when acting as Foreign Key, references the parent table.', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'ResponsibilityDescriptor', @level2type = N'COLUMN', @level2name = N'ResponsibilityTypeId';

