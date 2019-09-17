CREATE TABLE [entity].[TermType] (
    [TermTypeId]       INT              IDENTITY (1, 1) NOT NULL,
    [CodeValue]        NVARCHAR (50)    NOT NULL,
    [Description]      NVARCHAR (1024)  NOT NULL,
    [ShortDescription] NVARCHAR (450)   NOT NULL,
    [Id]               UNIQUEIDENTIFIER CONSTRAINT [TermType_DF_Id] DEFAULT (newid()) NOT NULL,
    [LastModifiedDate] DATETIME         CONSTRAINT [TermType_DF_LastModifiedDate] DEFAULT (getdate()) NOT NULL,
    [CreateDate]       DATETIME         CONSTRAINT [TermType_DF_CreateDate] DEFAULT (getdate()) NOT NULL,
    CONSTRAINT [PK_TermType] PRIMARY KEY CLUSTERED ([TermTypeId] ASC)
);
