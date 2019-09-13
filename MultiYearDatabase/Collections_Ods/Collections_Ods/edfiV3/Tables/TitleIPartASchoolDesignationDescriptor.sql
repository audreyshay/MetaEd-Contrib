CREATE TABLE [edfiV3].[TitleIPartASchoolDesignationDescriptor] (
    [TitleIPartASchoolDesignationDescriptorId] INT NOT NULL,
    CONSTRAINT [V3_TitleIPartASchoolDesignationDescriptor_PK] PRIMARY KEY CLUSTERED ([TitleIPartASchoolDesignationDescriptorId] ASC),
    CONSTRAINT [V3_FK_TitleIPartASchoolDesignationDescriptor_Descriptor] FOREIGN KEY ([TitleIPartASchoolDesignationDescriptorId]) REFERENCES [edfiV3].[Descriptor] ([DescriptorId]) ON DELETE CASCADE
);