BEGIN TRANSACTION
    IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'ne.PostGraduateActivity') AND name = N'UX_PostGraduateActivity_ChangeVersion')
    CREATE INDEX [UX_PostGraduateActivity_ChangeVersion] ON [ne].[PostGraduateActivity] ([ChangeVersion] ASC)
    GO
COMMIT

