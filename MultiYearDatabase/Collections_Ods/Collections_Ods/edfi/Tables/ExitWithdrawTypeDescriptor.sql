CREATE TABLE [edfi].[ExitWithdrawTypeDescriptor] (
    [ExitWithdrawTypeDescriptorId] INT NOT NULL,
    [ExitWithdrawTypeId]           INT NULL,
    CONSTRAINT [PK_ExitWithdrawTypeDescriptor] PRIMARY KEY CLUSTERED ([ExitWithdrawTypeDescriptorId] ASC),
    CONSTRAINT [FK_ExitWithdrawTypeDescriptor_Descriptor_DescriptorId] FOREIGN KEY ([ExitWithdrawTypeDescriptorId]) REFERENCES [edfi].[Descriptor] ([DescriptorId]) ON DELETE CASCADE,
    CONSTRAINT [FK_ExitWithdrawTypeDescriptor_ExitWithdrawType_ExitWithdrawTypeId] FOREIGN KEY ([ExitWithdrawTypeId]) REFERENCES [edfi].[ExitWithdrawType] ([ExitWithdrawTypeId])
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'This descriptor defines the circumstances under which the student exited from membership in an educational institution.', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'ExitWithdrawTypeDescriptor';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'A unique identifier used as Primary Key, not derived from business logic, when acting as Foreign Key, references the parent table.', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'ExitWithdrawTypeDescriptor', @level2type = N'COLUMN', @level2name = N'ExitWithdrawTypeDescriptorId';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Key for ExitWithdraw', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'ExitWithdrawTypeDescriptor', @level2type = N'COLUMN', @level2name = N'ExitWithdrawTypeId';

