CREATE TABLE [edfi].[BehaviorDescriptor] (
    [BehaviorDescriptorId] INT NOT NULL,
    [BehaviorTypeId]       INT NULL,
    CONSTRAINT [PK_BehaviorDescriptor] PRIMARY KEY CLUSTERED ([BehaviorDescriptorId] ASC),
    CONSTRAINT [FK_BehaviorDescriptor_BehaviorType_BehaviorTypeId] FOREIGN KEY ([BehaviorTypeId]) REFERENCES [edfi].[BehaviorType] ([BehaviorTypeId]),
    CONSTRAINT [FK_BehaviorDescriptor_Descriptor_DescriptorId] FOREIGN KEY ([BehaviorDescriptorId]) REFERENCES [edfi].[Descriptor] ([DescriptorId]) ON DELETE CASCADE
);


GO
CREATE NONCLUSTERED INDEX [FK_BehaviorDescriptor_BehaviorType_BehaviorTypeId]
    ON [edfi].[BehaviorDescriptor]([BehaviorTypeId] ASC);


GO
CREATE NONCLUSTERED INDEX [FK_BehaviorDescriptor_Descriptor_DescriptorId]
    ON [edfi].[BehaviorDescriptor]([BehaviorDescriptorId] ASC);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'This descriptor holds the categories of behavior describing a discipline incident.', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'BehaviorDescriptor';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The ID of the Behavior Descriptor', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'BehaviorDescriptor', @level2type = N'COLUMN', @level2name = N'BehaviorDescriptorId';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'A unique identifier used as Primary Key, not derived from business logic, when acting as Foreign Key, references the parent table.', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'BehaviorDescriptor', @level2type = N'COLUMN', @level2name = N'BehaviorTypeId';

