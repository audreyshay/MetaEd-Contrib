ALTER TABLE [crisis].[CrisisDetails] ADD [ChangeVersion] [BIGINT] DEFAULT (NEXT VALUE FOR [changes].[ChangeVersionSequence]) NOT NULL;

