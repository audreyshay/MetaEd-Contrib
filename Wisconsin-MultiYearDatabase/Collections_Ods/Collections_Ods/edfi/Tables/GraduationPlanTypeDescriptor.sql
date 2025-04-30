CREATE TABLE [edfi].[GraduationPlanTypeDescriptor] (
    [GraduationPlanTypeDescriptorId] INT NOT NULL,
    [GraduationPlanTypeId]           INT NULL,
    CONSTRAINT [PK_GraduationPlanTypeDescriptor] PRIMARY KEY CLUSTERED ([GraduationPlanTypeDescriptorId] ASC),
    CONSTRAINT [FK_GraduationPlanTypeDescriptor_Descriptor_DescriptorId] FOREIGN KEY ([GraduationPlanTypeDescriptorId]) REFERENCES [edfi].[Descriptor] ([DescriptorId]) ON DELETE CASCADE,
    CONSTRAINT [FK_GraduationPlanTypeDescriptor_GraduationPlanType_GraduationPlanTypeId] FOREIGN KEY ([GraduationPlanTypeId]) REFERENCES [edfi].[GraduationPlanType] ([GraduationPlanTypeId])
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'This descriptor defines the set of graduation plan types.', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'GraduationPlanTypeDescriptor';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'A unique identifier used as Primary Key, not derived from business logic, when acting as Foreign Key, references the parent table.', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'GraduationPlanTypeDescriptor', @level2type = N'COLUMN', @level2name = N'GraduationPlanTypeDescriptorId';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Key for graduation plan type.', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'GraduationPlanTypeDescriptor', @level2type = N'COLUMN', @level2name = N'GraduationPlanTypeId';

