CREATE TABLE [edfiV3].[DiplomaTypeDescriptor] (
    [DiplomaTypeDescriptorId] INT NOT NULL,
    CONSTRAINT [V3_DiplomaTypeDescriptor_PK] PRIMARY KEY CLUSTERED ([DiplomaTypeDescriptorId] ASC),
    CONSTRAINT [V3_FK_DiplomaTypeDescriptor_Descriptor] FOREIGN KEY ([DiplomaTypeDescriptorId]) REFERENCES [edfiV3].[Descriptor] ([DescriptorId]) ON DELETE CASCADE
);
