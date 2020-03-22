BEGIN TRANSACTION
    IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'edfixtranscript.CourseTranscript') AND name = N'UX_CourseTranscript_Id')
    CREATE UNIQUE NONCLUSTERED INDEX UX_CourseTranscript_Id ON [edfixtranscript].[CourseTranscript]
    (Id) WITH (PAD_INDEX = ON, FILLFACTOR = 75, STATISTICS_NORECOMPUTE = OFF) ON [PRIMARY]
    GO
COMMIT

BEGIN TRANSACTION
    IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'edfixtranscript.StudentAcademicRecord') AND name = N'UX_StudentAcademicRecord_Id')
    CREATE UNIQUE NONCLUSTERED INDEX UX_StudentAcademicRecord_Id ON [edfixtranscript].[StudentAcademicRecord]
    (Id) WITH (PAD_INDEX = ON, FILLFACTOR = 75, STATISTICS_NORECOMPUTE = OFF) ON [PRIMARY]
    GO
COMMIT

