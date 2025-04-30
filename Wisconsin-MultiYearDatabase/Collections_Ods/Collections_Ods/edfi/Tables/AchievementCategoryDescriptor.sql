CREATE TABLE [edfi].[AchievementCategoryDescriptor] (
    [AchievementCategoryDescriptorId] INT NOT NULL,
    [AchievementCategoryTypeId]       INT NULL,
    CONSTRAINT [PK_AchievementCategoryDescriptor] PRIMARY KEY CLUSTERED ([AchievementCategoryDescriptorId] ASC),
    CONSTRAINT [FK_AchievementCategoryDescriptor_AchievementCategoryType_AchievementCategoryTypeId] FOREIGN KEY ([AchievementCategoryTypeId]) REFERENCES [edfi].[AchievementCategoryType] ([AchievementCategoryTypeId]),
    CONSTRAINT [FK_AchievementCategoryDescriptor_Descriptor_DescriptorId] FOREIGN KEY ([AchievementCategoryDescriptorId]) REFERENCES [edfi].[Descriptor] ([DescriptorId]) ON DELETE CASCADE
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'This descriptor defines the category of achievement attributed to the learner.', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'AchievementCategoryDescriptor';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'A unique identifier used as Primary Key, not derived from business logic, when acting as Foreign Key, references the parent table.', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'AchievementCategoryDescriptor', @level2type = N'COLUMN', @level2name = N'AchievementCategoryDescriptorId';

