CREATE TABLE [edfi].[AchievementCategoryType] (
    [AchievementCategoryTypeId] INT              IDENTITY (1, 1) NOT NULL,
    [CodeValue]                 NVARCHAR (50)    NOT NULL,
    [ShortDescription]          NVARCHAR (450)   NOT NULL,
    [Description]               NVARCHAR (1024)  NOT NULL,
    [Id]                        UNIQUEIDENTIFIER CONSTRAINT [AchievementCategoryType_DF_Id] DEFAULT (newid()) NOT NULL,
    [LastModifiedDate]          DATETIME         CONSTRAINT [AchievementCategoryType_DF_LastModifiedDate] DEFAULT (getdate()) NOT NULL,
    [CreateDate]                DATETIME         CONSTRAINT [AchievementCategoryType_DF_CreateDate] DEFAULT (getdate()) NOT NULL,
    CONSTRAINT [PK_AchievementCategoryType] PRIMARY KEY CLUSTERED ([AchievementCategoryTypeId] ASC)
);


GO
CREATE UNIQUE NONCLUSTERED INDEX [AK_AchievementCategoryType_ShortDescription]
    ON [edfi].[AchievementCategoryType]([ShortDescription] ASC);


GO
CREATE UNIQUE NONCLUSTERED INDEX [GUID_AchievementCategoryType]
    ON [edfi].[AchievementCategoryType]([Id] ASC);

