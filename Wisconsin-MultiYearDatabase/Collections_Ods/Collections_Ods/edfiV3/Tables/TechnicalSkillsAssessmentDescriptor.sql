CREATE TABLE [edfiV3].[TechnicalSkillsAssessmentDescriptor] (
    [TechnicalSkillsAssessmentDescriptorId] INT NOT NULL,
    CONSTRAINT [V3_TechnicalSkillsAssessmentDescriptor_PK] PRIMARY KEY CLUSTERED ([TechnicalSkillsAssessmentDescriptorId] ASC),
    CONSTRAINT [V3_FK_TechnicalSkillsAssessmentDescriptor_Descriptor] FOREIGN KEY ([TechnicalSkillsAssessmentDescriptorId]) REFERENCES [edfiV3].[Descriptor] ([DescriptorId]) ON DELETE CASCADE
);

