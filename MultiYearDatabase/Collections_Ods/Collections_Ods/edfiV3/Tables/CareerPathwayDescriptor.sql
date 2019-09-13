CREATE TABLE [edfiV3].[CareerPathwayDescriptor] (
    [CareerPathwayDescriptorId] INT NOT NULL,
    CONSTRAINT [V3_CareerPathwayDescriptor_PK] PRIMARY KEY CLUSTERED ([CareerPathwayDescriptorId] ASC),
    CONSTRAINT [V3_FK_CareerPathwayDescriptor_Descriptor] FOREIGN KEY ([CareerPathwayDescriptorId]) REFERENCES [edfiV3].[Descriptor] ([DescriptorId]) ON DELETE CASCADE
);

