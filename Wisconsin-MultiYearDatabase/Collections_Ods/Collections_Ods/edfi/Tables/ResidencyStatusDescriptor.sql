CREATE TABLE [edfi].[ResidencyStatusDescriptor] (
    [ResidencyStatusDescriptorId] INT NOT NULL,
    [ResidencyStatusTypeId]       INT NULL,
    CONSTRAINT [PK_ResidencyStatusDescriptor] PRIMARY KEY CLUSTERED ([ResidencyStatusDescriptorId] ASC),
    CONSTRAINT [FK_ResidencyStatusDescriptor_Descriptor_DescriptorId] FOREIGN KEY ([ResidencyStatusDescriptorId]) REFERENCES [edfi].[Descriptor] ([DescriptorId]) ON DELETE CASCADE,
    CONSTRAINT [FK_ResidencyStatusDescriptor_ResidencyStatusType_ResidencyStatusTypeId] FOREIGN KEY ([ResidencyStatusTypeId]) REFERENCES [edfi].[ResidencyStatusType] ([ResidencyStatusTypeId])
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'This descriptor defines indications of the location of a persons legal residence relative to (within or outside of) the boundaries of the public school attended and its administrative unit.', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'ResidencyStatusDescriptor';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'A unique identifier used as Primary Key, not derived from business logic, when acting as Foreign Key, references the parent table.', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'ResidencyStatusDescriptor', @level2type = N'COLUMN', @level2name = N'ResidencyStatusDescriptorId';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'A unique identifier used as Primary Key, not derived from business logic, when acting as Foreign Key, references the parent table.', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'ResidencyStatusDescriptor', @level2type = N'COLUMN', @level2name = N'ResidencyStatusTypeId';

