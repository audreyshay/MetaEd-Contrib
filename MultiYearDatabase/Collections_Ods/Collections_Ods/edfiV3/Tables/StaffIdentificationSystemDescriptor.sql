CREATE TABLE [edfiV3].[StaffIdentificationSystemDescriptor] (
    [StaffIdentificationSystemDescriptorId] INT NOT NULL,
    CONSTRAINT [V3_StaffIdentificationSystemDescriptor_PK] PRIMARY KEY CLUSTERED ([StaffIdentificationSystemDescriptorId] ASC),
    CONSTRAINT [V3_FK_StaffIdentificationSystemDescriptor_Descriptor] FOREIGN KEY ([StaffIdentificationSystemDescriptorId]) REFERENCES [edfiV3].[Descriptor] ([DescriptorId]) ON DELETE CASCADE
);