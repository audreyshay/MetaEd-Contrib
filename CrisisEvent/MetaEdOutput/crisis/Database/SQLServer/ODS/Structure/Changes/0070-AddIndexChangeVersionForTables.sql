BEGIN TRANSACTION
    IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'crisis.CrisisDetails') AND name = N'UX_CrisisDetails_ChangeVersion')
    CREATE INDEX [UX_CrisisDetails_ChangeVersion] ON [crisis].[CrisisDetails] ([ChangeVersion] ASC)
    GO
COMMIT

