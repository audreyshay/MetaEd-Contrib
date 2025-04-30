CREATE TABLE [edfiV3].[AchievementCategoryDescriptor] (
    [AchievementCategoryDescriptorId] INT NOT NULL,
    CONSTRAINT [V3_AchievementCategoryDescriptor_PK] PRIMARY KEY CLUSTERED ([AchievementCategoryDescriptorId] ASC),
    CONSTRAINT [V3_FK_AchievementCategoryDescriptor_Descriptor] FOREIGN KEY ([AchievementCategoryDescriptorId]) REFERENCES [edfiV3].[Descriptor] ([DescriptorId]) ON DELETE CASCADE
);
