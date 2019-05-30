BEGIN TRANSACTION
    IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'crisis.CrisisDetails') AND name = N'UX_CrisisDetails_Id')
    CREATE UNIQUE NONCLUSTERED INDEX UX_CrisisDetails_Id ON [crisis].[CrisisDetails]
    (Id) WITH (PAD_INDEX = ON, FILLFACTOR = 75, STATISTICS_NORECOMPUTE = OFF) ON [PRIMARY]
    GO
COMMIT

