CREATE TABLE [edfi].[SchoolYearType] (
    [SchoolYear]            SMALLINT         NOT NULL,
    [SchoolYearDescription] NVARCHAR (50)    NOT NULL,
    [CurrentSchoolYear]     BIT              NOT NULL,
    [Id]                    UNIQUEIDENTIFIER CONSTRAINT [SchoolYearType_DF_Id] DEFAULT (newid()) NOT NULL,
    [LastModifiedDate]      DATETIME         CONSTRAINT [SchoolYearType_DF_LastModifiedDate] DEFAULT (getdate()) NOT NULL,
    [CreateDate]            DATETIME         CONSTRAINT [SchoolYearType_DF_CreateDate] DEFAULT (getdate()) NOT NULL,
    CONSTRAINT [PK_SchoolYearType] PRIMARY KEY CLUSTERED ([SchoolYear] ASC)
);


GO
CREATE UNIQUE NONCLUSTERED INDEX [GUID_SchoolYearType]
    ON [edfi].[SchoolYearType]([Id] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_SchoolYearType_CurrentSchoolYear]
    ON [edfi].[SchoolYearType]([CurrentSchoolYear] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_SchoolYearType_Description]
    ON [edfi].[SchoolYearType]([SchoolYearDescription] ASC);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Identifier for a school year.', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'SchoolYearType';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Key for School', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'SchoolYearType', @level2type = N'COLUMN', @level2name = N'SchoolYear';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Description for SchoolYear type.', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'SchoolYearType', @level2type = N'COLUMN', @level2name = N'SchoolYearDescription';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Code for SchoolYear type.', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'SchoolYearType', @level2type = N'COLUMN', @level2name = N'CurrentSchoolYear';

