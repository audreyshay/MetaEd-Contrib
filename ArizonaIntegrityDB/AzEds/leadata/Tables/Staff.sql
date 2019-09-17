CREATE TABLE [leadata].[Staff] (
    [StaffUSI]               INT              NOT NULL IDENTITY(1,1),
    [PersonalTitlePrefix]    NVARCHAR (75)    NULL,
    [FirstName]              NVARCHAR (75)    NOT NULL,
    [MiddleName]             NVARCHAR (75)    NULL,
    [LastSurname]            NVARCHAR (75)    NOT NULL,
    [GenerationCodeSuffix]   NVARCHAR (75)    NULL,
    [MaidenName]             NVARCHAR (75)    NULL,
    [SexTypeId]              INT              NULL,
    [BirthDate]              DATE             NULL,
    [HighlyQualifiedTeacher] BIT              NULL,
    [StaffUniqueId]          NVARCHAR (32)    NOT NULL,
    [SourceId]               UNIQUEIDENTIFIER	  NULL,
    [SourceCreateDate]       DATETIME         CONSTRAINT [Staff_DF_CreateDate] DEFAULT (GETUTCDATE()) NOT NULL,
    [SourceLastModifiedDate] DATETIME         CONSTRAINT [Staff_DF_LastModifiedDate] DEFAULT (GETUTCDATE()) NOT NULL,
	[LoadDate]				 DATETIME		  CONSTRAINT [Staff_DF_Loaddate] DEFAULT (GETUTCDATE()) NOT NULL ,
	[HashValue]				[binary](64)	  CONSTRAINT [Staff_DF_HashValue] DEFAULT (00) NOT NULL,
    CONSTRAINT [PK_Staff] PRIMARY KEY CLUSTERED ([StaffUSI] ASC),
    CONSTRAINT [FK_Staff_SexType_SexTypeId] FOREIGN KEY ([SexTypeId]) REFERENCES [leadata].[SexType] ([SexTypeId])
);

