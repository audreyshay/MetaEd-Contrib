CREATE TABLE [report].[XrefGradeLevelSortOrder] (
    [GradeLevel] VARCHAR (3) NOT NULL,
    [SortOrder]  SMALLINT    NOT NULL,
    CONSTRAINT [PK_XrefGradeLevelSortOrder] PRIMARY KEY CLUSTERED ([GradeLevel] ASC, [SortOrder] ASC)
);

GO

