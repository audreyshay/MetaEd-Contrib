CREATE TABLE [edfi].[TermDescriptor] (
    [TermDescriptorId] INT NOT NULL,
    [TermTypeId]       INT NULL,
    CONSTRAINT [PK_TermDescriptor] PRIMARY KEY CLUSTERED ([TermDescriptorId] ASC),
    CONSTRAINT [FK_TermDescriptor_Descriptor_DescriptorId] FOREIGN KEY ([TermDescriptorId]) REFERENCES [edfi].[Descriptor] ([DescriptorId]),
    CONSTRAINT [FK_TermDescriptor_TermType_TermTypeId] FOREIGN KEY ([TermTypeId]) REFERENCES [edfi].[TermType] ([TermTypeId])
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'This descriptor defines the term of a session during the school year (e.g., Fall Semester).', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'TermDescriptor';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'A unique identifier used as Primary Key, not derived from business logic, when acting as Foreign Key, references the parent table.', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'TermDescriptor', @level2type = N'COLUMN', @level2name = N'TermDescriptorId';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Key for Term', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'TermDescriptor', @level2type = N'COLUMN', @level2name = N'TermTypeId';

