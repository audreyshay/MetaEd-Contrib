CREATE TABLE [edfiV3].[SchoolTypeDescriptor] (
    [SchoolTypeDescriptorId] INT NOT NULL,
    CONSTRAINT [V3_SchoolTypeDescriptor_PK] PRIMARY KEY CLUSTERED ([SchoolTypeDescriptorId] ASC),
    CONSTRAINT [V3_FK_SchoolTypeDescriptor_Descriptor] FOREIGN KEY ([SchoolTypeDescriptorId]) REFERENCES [edfiV3].[Descriptor] ([DescriptorId]) ON DELETE CASCADE
);