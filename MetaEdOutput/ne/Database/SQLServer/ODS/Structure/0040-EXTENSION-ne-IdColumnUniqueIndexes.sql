BEGIN TRANSACTION
    IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'ne.PostGraduateActivity') AND name = N'UX_PostGraduateActivity_Id')
    CREATE UNIQUE NONCLUSTERED INDEX UX_PostGraduateActivity_Id ON [ne].[PostGraduateActivity]
    (Id) WITH (PAD_INDEX = ON, FILLFACTOR = 75, STATISTICS_NORECOMPUTE = OFF) ON [PRIMARY]
    GO
COMMIT

