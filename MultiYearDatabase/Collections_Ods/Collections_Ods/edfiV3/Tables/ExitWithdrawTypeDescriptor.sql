CREATE TABLE [edfiV3].[ExitWithdrawTypeDescriptor] (
    [ExitWithdrawTypeDescriptorId] INT NOT NULL,
    CONSTRAINT [V3_ExitWithdrawTypeDescriptor_PK] PRIMARY KEY CLUSTERED ([ExitWithdrawTypeDescriptorId] ASC),
    CONSTRAINT [V3_FK_ExitWithdrawTypeDescriptor_Descriptor] FOREIGN KEY ([ExitWithdrawTypeDescriptorId]) REFERENCES [edfiV3].[Descriptor] ([DescriptorId]) ON DELETE CASCADE
);

