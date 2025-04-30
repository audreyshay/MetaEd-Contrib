CREATE TABLE [edfiV3].[GradeTypeDescriptor] (
    [GradeTypeDescriptorId] INT NOT NULL,
    CONSTRAINT [V3_GradeTypeDescriptor_PK] PRIMARY KEY CLUSTERED ([GradeTypeDescriptorId] ASC),
    CONSTRAINT [V3_FK_GradeTypeDescriptor_Descriptor] FOREIGN KEY ([GradeTypeDescriptorId]) REFERENCES [edfiV3].[Descriptor] ([DescriptorId]) ON DELETE CASCADE
);
