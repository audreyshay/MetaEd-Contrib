CREATE TABLE [edfi].[LimitedEnglishProficiencyDescriptor] (
    [LimitedEnglishProficiencyDescriptorId] INT NOT NULL,
    [LimitedEnglishProficiencyTypeId]       INT NOT NULL,
    CONSTRAINT [PK_LimitedEnglishProficiencyDescriptor] PRIMARY KEY CLUSTERED ([LimitedEnglishProficiencyDescriptorId] ASC),
    CONSTRAINT [FK_LimitedEnglishProficiencyDescriptor_Descriptor_DescriptorId] FOREIGN KEY ([LimitedEnglishProficiencyDescriptorId]) REFERENCES [edfi].[Descriptor] ([DescriptorId]) ON DELETE CASCADE,
    CONSTRAINT [FK_LimitedEnglishProficiencyDescriptor_LimitedEnglishProficiencyType_LimitedEnglishProficiencyTypeId] FOREIGN KEY ([LimitedEnglishProficiencyTypeId]) REFERENCES [edfi].[LimitedEnglishProficiencyType] ([LimitedEnglishProficiencyTypeId])
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'This descriptor defines the indications that the student has been identified as Limited English Proficient or English Proficient by the Language Proficiency Assessment Committee (LPAC). The map is required. ', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'LimitedEnglishProficiencyDescriptor';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'A unique identifier used as Primary Key, not derived from business logic, when acting as Foreign Key, references the parent table.', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'LimitedEnglishProficiencyDescriptor', @level2type = N'COLUMN', @level2name = N'LimitedEnglishProficiencyDescriptorId';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Key for LimitedEnglishProficiency', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'LimitedEnglishProficiencyDescriptor', @level2type = N'COLUMN', @level2name = N'LimitedEnglishProficiencyTypeId';

