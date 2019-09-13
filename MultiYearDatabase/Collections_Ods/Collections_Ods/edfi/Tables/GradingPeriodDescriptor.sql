CREATE TABLE [edfi].[GradingPeriodDescriptor] (
    [GradingPeriodDescriptorId] INT NOT NULL,
    [GradingPeriodTypeId]       INT NOT NULL,
    CONSTRAINT [PK_GradingPeriodDescriptor] PRIMARY KEY CLUSTERED ([GradingPeriodDescriptorId] ASC),
    CONSTRAINT [FK_GradingPeriodDescriptor_Descriptor_DescriptorId] FOREIGN KEY ([GradingPeriodDescriptorId]) REFERENCES [edfi].[Descriptor] ([DescriptorId]) ON DELETE CASCADE,
    CONSTRAINT [FK_GradingPeriodDescriptor_GradingPeriodType_GradingPeriodTypeId] FOREIGN KEY ([GradingPeriodTypeId]) REFERENCES [edfi].[GradingPeriodType] ([GradingPeriodTypeId])
);


GO
CREATE NONCLUSTERED INDEX [FK_GradingPeriodDescriptor_Descriptor_DescriptorId]
    ON [edfi].[GradingPeriodDescriptor]([GradingPeriodDescriptorId] ASC);


GO
CREATE NONCLUSTERED INDEX [FK_GradingPeriodDescriptor_GradingPeriodType_GradingPeriodTypeId]
    ON [edfi].[GradingPeriodDescriptor]([GradingPeriodTypeId] ASC);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'This descriptor defines the name of the period for which grades are reported. The mapping of descriptor values to known Ed-Fi enumeration values is required.', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'GradingPeriodDescriptor';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'A unique identifier used as Primary Key, not derived from business logic, when acting as Foreign Key, references the parent table.', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'GradingPeriodDescriptor', @level2type = N'COLUMN', @level2name = N'GradingPeriodDescriptorId';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Key for GradingPeriod', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'GradingPeriodDescriptor', @level2type = N'COLUMN', @level2name = N'GradingPeriodTypeId';

