CREATE TABLE [edfi].[ReasonExitedDescriptor] (
    [ReasonExitedDescriptorId] INT NOT NULL,
    [ReasonExitedTypeId]       INT NULL,
    CONSTRAINT [PK_ReasonExitedDescriptor] PRIMARY KEY CLUSTERED ([ReasonExitedDescriptorId] ASC),
    CONSTRAINT [FK_ReasonExitedDescriptor_Descriptor_DescriptorId] FOREIGN KEY ([ReasonExitedDescriptorId]) REFERENCES [edfi].[Descriptor] ([DescriptorId]) ON DELETE CASCADE,
    CONSTRAINT [FK_ReasonExitedDescriptor_ReasonExitedType_ReasonExitedTypeId] FOREIGN KEY ([ReasonExitedTypeId]) REFERENCES [edfi].[ReasonExitedType] ([ReasonExitedTypeId])
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'This descriptor defines the reason the student exited the program.', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'ReasonExitedDescriptor';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'A unique identifier used as Primary Key, not derived from business logic, when acting as Foreign Key, references the parent table.', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'ReasonExitedDescriptor', @level2type = N'COLUMN', @level2name = N'ReasonExitedDescriptorId';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Key for ReasonExited', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'ReasonExitedDescriptor', @level2type = N'COLUMN', @level2name = N'ReasonExitedTypeId';

