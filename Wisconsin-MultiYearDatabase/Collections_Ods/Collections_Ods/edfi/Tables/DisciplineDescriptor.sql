CREATE TABLE [edfi].[DisciplineDescriptor] (
    [DisciplineDescriptorId] INT NOT NULL,
    [DisciplineTypeId]       INT NULL,
    CONSTRAINT [PK_DisciplineDescriptor] PRIMARY KEY CLUSTERED ([DisciplineDescriptorId] ASC),
    CONSTRAINT [FK_DisciplineDescriptor_Descriptor_DescriptorId] FOREIGN KEY ([DisciplineDescriptorId]) REFERENCES [edfi].[Descriptor] ([DescriptorId]) ON DELETE CASCADE,
    CONSTRAINT [FK_DisciplineDescriptor_DisciplineType_DisciplineTypeId] FOREIGN KEY ([DisciplineTypeId]) REFERENCES [edfi].[DisciplineType] ([DisciplineTypeId])
);


GO
CREATE NONCLUSTERED INDEX [FK_DisciplineDescriptor_Descriptor_DescriptorId]
    ON [edfi].[DisciplineDescriptor]([DisciplineDescriptorId] ASC);


GO
CREATE NONCLUSTERED INDEX [FK_DisciplineDescriptor_DisciplineType_DisciplineTypeId]
    ON [edfi].[DisciplineDescriptor]([DisciplineTypeId] ASC);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'This descriptor defines the type of action or removal from the classroom used to discipline the student involved as a perpetrator in a discipline incident.', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'DisciplineDescriptor';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The ID of the Discipline Descriptor', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'DisciplineDescriptor', @level2type = N'COLUMN', @level2name = N'DisciplineDescriptorId';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'A unique identifier used as Primary Key, not derived from business logic, when acting as Foreign Key, references the parent table.', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'DisciplineDescriptor', @level2type = N'COLUMN', @level2name = N'DisciplineTypeId';

