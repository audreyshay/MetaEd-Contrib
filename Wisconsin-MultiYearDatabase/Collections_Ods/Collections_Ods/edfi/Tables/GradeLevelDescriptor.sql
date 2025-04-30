CREATE TABLE [edfi].[GradeLevelDescriptor] (
    [GradeLevelDescriptorId] INT NOT NULL,
    [GradeLevelTypeId]       INT NOT NULL,
    CONSTRAINT [PK_GradeLevelDescriptor] PRIMARY KEY CLUSTERED ([GradeLevelDescriptorId] ASC),
    CONSTRAINT [FK_GradeLevelDescriptor_Descriptor_DescriptorId] FOREIGN KEY ([GradeLevelDescriptorId]) REFERENCES [edfi].[Descriptor] ([DescriptorId]) ON DELETE CASCADE,
    CONSTRAINT [FK_GradeLevelDescriptor_GradeLevelType_GradeLevelTypeId] FOREIGN KEY ([GradeLevelTypeId]) REFERENCES [edfi].[GradeLevelType] ([GradeLevelTypeId])
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'This descriptor defines the set of grade levels.', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'GradeLevelDescriptor';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'A unique identifier used as Primary Key, not derived from business logic, when acting as Foreign Key, references the parent table.', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'GradeLevelDescriptor', @level2type = N'COLUMN', @level2name = N'GradeLevelDescriptorId';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Key for GradeLevel', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'GradeLevelDescriptor', @level2type = N'COLUMN', @level2name = N'GradeLevelTypeId';

