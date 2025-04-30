CREATE TABLE [edfiV3].[CharterApprovalAgencyTypeDescriptor] (
    [CharterApprovalAgencyTypeDescriptorId] INT NOT NULL,
    CONSTRAINT [V3_CharterApprovalAgencyTypeDescriptor_PK] PRIMARY KEY CLUSTERED ([CharterApprovalAgencyTypeDescriptorId] ASC),
    CONSTRAINT [V3_FK_CharterApprovalAgencyTypeDescriptor_Descriptor] FOREIGN KEY ([CharterApprovalAgencyTypeDescriptorId]) REFERENCES [edfiV3].[Descriptor] ([DescriptorId]) ON DELETE CASCADE
);