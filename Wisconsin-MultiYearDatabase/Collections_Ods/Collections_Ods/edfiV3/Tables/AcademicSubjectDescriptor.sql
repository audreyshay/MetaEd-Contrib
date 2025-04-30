CREATE TABLE [edfiV3].[AcademicSubjectDescriptor] (
    [AcademicSubjectDescriptorId] INT NOT NULL,
    CONSTRAINT [V3_AcademicSubjectDescriptor_PK] PRIMARY KEY CLUSTERED ([AcademicSubjectDescriptorId] ASC),
    CONSTRAINT [V3_FK_AcademicSubjectDescriptor_Descriptor] FOREIGN KEY ([AcademicSubjectDescriptorId]) REFERENCES [edfiV3].[Descriptor] ([DescriptorId]) ON DELETE CASCADE
);