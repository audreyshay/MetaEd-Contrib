CREATE TABLE [edfiV3].[SchoolCategoryDescriptor] (
    [SchoolCategoryDescriptorId] INT NOT NULL,
    CONSTRAINT [V3_SchoolCategoryDescriptor_PK] PRIMARY KEY CLUSTERED ([SchoolCategoryDescriptorId] ASC),
    CONSTRAINT [V3_FK_SchoolCategoryDescriptor_Descriptor] FOREIGN KEY ([SchoolCategoryDescriptorId]) REFERENCES [edfiV3].[Descriptor] ([DescriptorId]) ON DELETE CASCADE
);