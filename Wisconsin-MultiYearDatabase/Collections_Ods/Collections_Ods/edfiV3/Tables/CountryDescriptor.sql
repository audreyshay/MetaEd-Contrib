CREATE TABLE [edfiV3].[CountryDescriptor] (
    [CountryDescriptorId] INT NOT NULL,
    CONSTRAINT [V3_CountryDescriptor_PK] PRIMARY KEY CLUSTERED ([CountryDescriptorId] ASC),
    CONSTRAINT [V3_FK_CountryDescriptor_Descriptor] FOREIGN KEY ([CountryDescriptorId]) REFERENCES [edfiV3].[Descriptor] ([DescriptorId]) ON DELETE CASCADE
);
