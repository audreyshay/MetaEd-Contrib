CREATE TABLE [edfiV3].[SchoolChoiceImplementStatusDescriptor] (
    [SchoolChoiceImplementStatusDescriptorId] INT NOT NULL,
    CONSTRAINT [V3_SchoolChoiceImplementStatusDescriptor_PK] PRIMARY KEY CLUSTERED ([SchoolChoiceImplementStatusDescriptorId] ASC),
    CONSTRAINT [V3_FK_SchoolChoiceImplementStatusDescriptor_Descriptor] FOREIGN KEY ([SchoolChoiceImplementStatusDescriptorId]) REFERENCES [edfiV3].[Descriptor] ([DescriptorId]) ON DELETE CASCADE
);