CREATE TABLE [edfiV3].[NeglectedOrDelinquentProgramDescriptor] (
    [NeglectedOrDelinquentProgramDescriptorId] INT NOT NULL,
    CONSTRAINT [V3_NeglectedOrDelinquentProgramDescriptor_PK] PRIMARY KEY CLUSTERED ([NeglectedOrDelinquentProgramDescriptorId] ASC),
    CONSTRAINT [V3_FK_NeglectedOrDelinquentProgramDescriptor_Descriptor] FOREIGN KEY ([NeglectedOrDelinquentProgramDescriptorId]) REFERENCES [edfiV3].[Descriptor] ([DescriptorId]) ON DELETE CASCADE
);

