CREATE TABLE [edfiV3].[InternetAccessDescriptor] (
    [InternetAccessDescriptorId] INT NOT NULL,
    CONSTRAINT [V3_InternetAccessDescriptor_PK] PRIMARY KEY CLUSTERED ([InternetAccessDescriptorId] ASC),
    CONSTRAINT [V3_FK_InternetAccessDescriptor_Descriptor] FOREIGN KEY ([InternetAccessDescriptorId]) REFERENCES [edfiV3].[Descriptor] ([DescriptorId]) ON DELETE CASCADE
);
