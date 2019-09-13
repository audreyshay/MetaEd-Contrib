CREATE TABLE [edfiV3].[ClassroomPositionDescriptor] (
    [ClassroomPositionDescriptorId] INT NOT NULL,
    CONSTRAINT [V3_ClassroomPositionDescriptor_PK] PRIMARY KEY CLUSTERED ([ClassroomPositionDescriptorId] ASC),
    CONSTRAINT [V3_FK_ClassroomPositionDescriptor_Descriptor] FOREIGN KEY ([ClassroomPositionDescriptorId]) REFERENCES [edfiV3].[Descriptor] ([DescriptorId]) ON DELETE CASCADE
);
