CREATE TABLE [edfiV3].[SchoolYearType] (
    [SchoolYear]            SMALLINT         NOT NULL,
    [SchoolYearDescription] NVARCHAR (50)    NOT NULL,
    [CurrentSchoolYear]     BIT              NOT NULL,
    [CreateDate]            DATETIME         CONSTRAINT [V3_SchoolYearType_DF_CreateDate] DEFAULT (getdate()) NOT NULL,
    [LastModifiedDate]      DATETIME         CONSTRAINT [V3_SchoolYearType_DF_LastModifiedDate] DEFAULT (getdate()) NOT NULL,
    [Id]                    UNIQUEIDENTIFIER CONSTRAINT [V3_SchoolYearType_DF_Id] DEFAULT (newid()) NOT NULL,
    CONSTRAINT [V3_SchoolYearType_PK] PRIMARY KEY CLUSTERED ([SchoolYear] ASC)
);


GO
CREATE UNIQUE NONCLUSTERED INDEX [V3_UX_SchoolYearType_Id]
    ON [edfiV3].[SchoolYearType]([Id] ASC) WITH (FILLFACTOR = 100, PAD_INDEX = ON);