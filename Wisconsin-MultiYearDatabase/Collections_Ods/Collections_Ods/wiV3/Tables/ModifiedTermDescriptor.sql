CREATE TABLE [wiV3].[ModifiedTermDescriptor] (
    [ModifiedTermDescriptorId] INT NOT NULL,
    CONSTRAINT [V3_ModifiedTermDescriptor_PK] PRIMARY KEY CLUSTERED ([ModifiedTermDescriptorId] ASC),
    CONSTRAINT [V3_FK_ModifiedTermDescriptor_Descriptor] FOREIGN KEY ([ModifiedTermDescriptorId]) REFERENCES [edfiV3].[Descriptor] ([DescriptorId]) ON DELETE CASCADE
);
