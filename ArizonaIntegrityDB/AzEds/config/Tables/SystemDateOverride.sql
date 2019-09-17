CREATE TABLE [config].[SystemDateOverride] (
    [OverrideDate] [date] NOT NULL,
    CONSTRAINT [OverrideDate_PK] PRIMARY KEY CLUSTERED ([OverrideDate] ASC)
);

GO
ALTER TABLE [config].[SystemDateOverride] 
ADD  CONSTRAINT [ck_CountSystemDateOverride] CHECK ([config].[SystemDateOverrideConstraint]()<= 1)
GO