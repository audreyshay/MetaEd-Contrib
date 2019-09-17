CREATE TABLE [integrity].[IntegrityRuleApplication] (
    [IntegrityRuleTypeId] INT             IDENTITY (1, 1) NOT NULL,
    [FiscalYear]          INT             NOT NULL,
    [RuleApplicationName] NVARCHAR (1024) NOT NULL,
    CONSTRAINT [PK_IntegrityRuleApplication] PRIMARY KEY CLUSTERED ([IntegrityRuleTypeId] ASC, [FiscalYear] ASC),
    CONSTRAINT [FK_IntegrityRuleApplication_IntegrityRuleType] FOREIGN KEY ([IntegrityRuleTypeId]) REFERENCES [integrity].[IntegrityRuleType] ([IntegrityRuleTypeId])
);

