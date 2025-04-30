CREATE TABLE [wiV3].[CountDateNameDescriptor] (
    [CountDateNameDescriptorId] INT NOT NULL,
    CONSTRAINT [V3_CountDateNameDescriptor_PK] PRIMARY KEY CLUSTERED ([CountDateNameDescriptorId] ASC),
    CONSTRAINT [V3_FK_CountDateNameDescriptor_Descriptor] FOREIGN KEY ([CountDateNameDescriptorId]) REFERENCES [edfiV3].[Descriptor] ([DescriptorId]) ON DELETE CASCADE
);
