CREATE TABLE [edfiV3].[HomelessPrimaryNighttimeResidenceDescriptor] (
    [HomelessPrimaryNighttimeResidenceDescriptorId] INT NOT NULL,
    CONSTRAINT [V3_HomelessPrimaryNighttimeResidenceDescriptor_PK] PRIMARY KEY CLUSTERED ([HomelessPrimaryNighttimeResidenceDescriptorId] ASC),
    CONSTRAINT [V3_FK_HomelessPrimaryNighttimeResidenceDescriptor_Descriptor] FOREIGN KEY ([HomelessPrimaryNighttimeResidenceDescriptorId]) REFERENCES [edfiV3].[Descriptor] ([DescriptorId]) ON DELETE CASCADE
);
