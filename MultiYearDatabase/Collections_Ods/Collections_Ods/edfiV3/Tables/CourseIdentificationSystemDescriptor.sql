CREATE TABLE [edfiV3].[CourseIdentificationSystemDescriptor] (
    [CourseIdentificationSystemDescriptorId] INT NOT NULL,
    CONSTRAINT [V3_CourseIdentificationSystemDescriptor_PK] PRIMARY KEY CLUSTERED ([CourseIdentificationSystemDescriptorId] ASC),
    CONSTRAINT [V3_FK_CourseIdentificationSystemDescriptor_Descriptor] FOREIGN KEY ([CourseIdentificationSystemDescriptorId]) REFERENCES [edfiV3].[Descriptor] ([DescriptorId]) ON DELETE CASCADE
);

