CREATE TABLE [integrity].[IntegrityRuleType] (
    [IntegrityRuleTypeId] INT             IDENTITY (1, 1) NOT NULL,
    [Description]         NVARCHAR (1024) NOT NULL,
    [IntegrityTypeId]     INT             NOT NULL,
    [ReportCategoryId]    INT             NOT NULL,
    [IntegrityRuleEntityName] VARCHAR(250) NULL, 
    CONSTRAINT [PK_IntegrityRuleType] PRIMARY KEY CLUSTERED ([IntegrityRuleTypeId] ASC),
    CONSTRAINT [FK_IntegrityRuleType_IntegrityType] FOREIGN KEY ([IntegrityTypeId]) REFERENCES [integrity].[IntegrityType] ([IntegrityTypeId]),
    CONSTRAINT [FK_IntegrityRuleType_ReportCategory] FOREIGN KEY ([ReportCategoryId]) REFERENCES [integrity].[ReportCategory] ([ReportCategoryId])
);

