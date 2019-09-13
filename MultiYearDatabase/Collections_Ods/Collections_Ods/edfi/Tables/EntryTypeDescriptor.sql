CREATE TABLE [edfi].[EntryTypeDescriptor] (
    [EntryTypeDescriptorId] INT NOT NULL,
    [EntryTypeId]           INT NULL,
    CONSTRAINT [PK_EntryTypeDescriptor] PRIMARY KEY CLUSTERED ([EntryTypeDescriptorId] ASC),
    CONSTRAINT [FK_EntryTypeDescriptor_Descriptor_DescriptorId] FOREIGN KEY ([EntryTypeDescriptorId]) REFERENCES [edfi].[Descriptor] ([DescriptorId]) ON DELETE CASCADE,
    CONSTRAINT [FK_EntryTypeDescriptor_EntryType_EntryTypeId] FOREIGN KEY ([EntryTypeId]) REFERENCES [edfi].[EntryType] ([EntryTypeId])
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'This descriptor defines the process by which a student enters a school during a given academic session.', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'EntryTypeDescriptor';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'A unique identifier used as Primary Key, not derived from business logic, when acting as Foreign Key, references the parent table.', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'EntryTypeDescriptor', @level2type = N'COLUMN', @level2name = N'EntryTypeDescriptorId';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Key for Entry', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'EntryTypeDescriptor', @level2type = N'COLUMN', @level2name = N'EntryTypeId';

