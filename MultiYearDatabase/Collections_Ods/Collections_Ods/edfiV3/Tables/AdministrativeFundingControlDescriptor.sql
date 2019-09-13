CREATE TABLE [edfiV3].[AdministrativeFundingControlDescriptor] (
    [AdministrativeFundingControlDescriptorId] INT NOT NULL,
    CONSTRAINT [V3_AdministrativeFundingControlDescriptor_PK] PRIMARY KEY CLUSTERED ([AdministrativeFundingControlDescriptorId] ASC),
    CONSTRAINT [V3_FK_AdministrativeFundingControlDescriptor_Descriptor] FOREIGN KEY ([AdministrativeFundingControlDescriptorId]) REFERENCES [edfiV3].[Descriptor] ([DescriptorId]) ON DELETE CASCADE
);
