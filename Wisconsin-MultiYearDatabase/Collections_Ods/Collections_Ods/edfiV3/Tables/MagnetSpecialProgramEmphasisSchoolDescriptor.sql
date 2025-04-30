CREATE TABLE [edfiV3].[MagnetSpecialProgramEmphasisSchoolDescriptor] (
    [MagnetSpecialProgramEmphasisSchoolDescriptorId] INT NOT NULL,
    CONSTRAINT [V3_MagnetSpecialProgramEmphasisSchoolDescriptor_PK] PRIMARY KEY CLUSTERED ([MagnetSpecialProgramEmphasisSchoolDescriptorId] ASC),
    CONSTRAINT [V3_FK_MagnetSpecialProgramEmphasisSchoolDescriptor_Descriptor] FOREIGN KEY ([MagnetSpecialProgramEmphasisSchoolDescriptorId]) REFERENCES [edfiV3].[Descriptor] ([DescriptorId]) ON DELETE CASCADE
);