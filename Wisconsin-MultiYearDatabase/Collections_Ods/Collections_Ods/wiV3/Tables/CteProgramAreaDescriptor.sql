CREATE TABLE [wiV3].[CteProgramAreaDescriptor] (
    [CteProgramAreaDescriptorId] INT NOT NULL,
    CONSTRAINT [V3_CteProgramAreaDescriptor_PK] PRIMARY KEY CLUSTERED ([CteProgramAreaDescriptorId] ASC),
    CONSTRAINT [V3_FK_CteProgramAreaDescriptor_Descriptor] FOREIGN KEY ([CteProgramAreaDescriptorId]) REFERENCES [edfiV3].[Descriptor] ([DescriptorId]) ON DELETE CASCADE
);
