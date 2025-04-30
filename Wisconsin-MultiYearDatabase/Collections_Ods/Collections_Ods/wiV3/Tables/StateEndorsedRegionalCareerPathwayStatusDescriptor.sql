CREATE TABLE [wiV3].[StateEndorsedRegionalCareerPathwayStatusDescriptor] (
    [StateEndorsedRegionalCareerPathwayStatusDescriptorId] INT NOT NULL,
    CONSTRAINT [V3_StateEndorsedRegionalCareerPathwayStatusDescriptor_PK] PRIMARY KEY CLUSTERED ([StateEndorsedRegionalCareerPathwayStatusDescriptorId] ASC),
    CONSTRAINT [V3_FK_StateEndorsedRegionalCareerPathwayStatusDescriptor_Descriptor] FOREIGN KEY ([StateEndorsedRegionalCareerPathwayStatusDescriptorId]) REFERENCES [edfiV3].[Descriptor] ([DescriptorId]) ON DELETE CASCADE
);

