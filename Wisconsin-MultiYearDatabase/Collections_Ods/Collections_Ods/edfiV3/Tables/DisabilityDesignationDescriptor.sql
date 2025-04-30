CREATE TABLE [edfiV3].[DisabilityDesignationDescriptor] (
    [DisabilityDesignationDescriptorId] INT NOT NULL,
    CONSTRAINT [V3_DisabilityDesignationDescriptor_PK] PRIMARY KEY CLUSTERED ([DisabilityDesignationDescriptorId] ASC),
    CONSTRAINT [V3_FK_DisabilityDesignationDescriptor_Descriptor] FOREIGN KEY ([DisabilityDesignationDescriptorId]) REFERENCES [edfiV3].[Descriptor] ([DescriptorId]) ON DELETE CASCADE
);
