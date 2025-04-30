CREATE TABLE [edfi].[ReporterDescriptionDescriptor] (
    [ReporterDescriptionDescriptorId] INT NOT NULL,
    [ReporterDescriptionTypeId]       INT NULL,
    CONSTRAINT [PK_ReporterDescriptionDescriptor] PRIMARY KEY CLUSTERED ([ReporterDescriptionDescriptorId] ASC),
    CONSTRAINT [FK_ReporterDescriptionDescriptor_Descriptor_DescriptorId] FOREIGN KEY ([ReporterDescriptionDescriptorId]) REFERENCES [edfi].[Descriptor] ([DescriptorId]) ON DELETE CASCADE,
    CONSTRAINT [FK_ReporterDescriptionDescriptor_ReporterDescriptionType_ReporterDescriptionTypeId] FOREIGN KEY ([ReporterDescriptionTypeId]) REFERENCES [edfi].[ReporterDescriptionType] ([ReporterDescriptionTypeId])
);


GO
CREATE NONCLUSTERED INDEX [FK_ReporterDescriptionDescriptor_Descriptor_DescriptorId]
    ON [edfi].[ReporterDescriptionDescriptor]([ReporterDescriptionDescriptorId] ASC);


GO
CREATE NONCLUSTERED INDEX [FK_ReporterDescriptionDescriptor_ReporterDescriptionType_ReporterDescriptionTypeId]
    ON [edfi].[ReporterDescriptionDescriptor]([ReporterDescriptionTypeId] ASC);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'This descriptor defines the type of individual who reported an incident.', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'ReporterDescriptionDescriptor';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'A unique identifier used as Primary Key, not derived from business logic, when acting as Foreign Key, references the parent table.', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'ReporterDescriptionDescriptor', @level2type = N'COLUMN', @level2name = N'ReporterDescriptionDescriptorId';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Key for ReporterDescription', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'ReporterDescriptionDescriptor', @level2type = N'COLUMN', @level2name = N'ReporterDescriptionTypeId';

