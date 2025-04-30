CREATE TABLE [edfiV3].[LocalEducationAgencyCategoryDescriptor] (
    [LocalEducationAgencyCategoryDescriptorId] INT NOT NULL,
    CONSTRAINT [V3_LocalEducationAgencyCategoryDescriptor_PK] PRIMARY KEY CLUSTERED ([LocalEducationAgencyCategoryDescriptorId] ASC),
    CONSTRAINT [V3_FK_LocalEducationAgencyCategoryDescriptor_Descriptor] FOREIGN KEY ([LocalEducationAgencyCategoryDescriptorId]) REFERENCES [edfiV3].[Descriptor] ([DescriptorId]) ON DELETE CASCADE
);