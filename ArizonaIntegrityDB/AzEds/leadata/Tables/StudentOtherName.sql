CREATE TABLE [leadata].[StudentOtherName] 
(
    [StudentUSI]           INT           NOT NULL,
    [OtherNameTypeId]      INT           NOT NULL,
    [PersonalTitlePrefix]  NVARCHAR (75) NULL,
    [FirstName]            NVARCHAR (75) NOT NULL,
    [MiddleName]           NVARCHAR (75) NULL,
    [LastSurname]          NVARCHAR (75) NOT NULL,
    [GenerationCodeSuffix] NVARCHAR (75) NULL,
    [SourceCreateDate]     DATETIME		 NOT NULL,
	[LoadDate]			   DATETIME      NOT NULL  CONSTRAINT [StudentOtherName_DF_LoadDate] DEFAULT (getUTCdate()),  
	[HashValue]	[binary](64)	  CONSTRAINT [StudentOtherName_DF_HashValue] DEFAULT (00) NOT NULL,
    CONSTRAINT [PK_StudentOtherName] PRIMARY KEY CLUSTERED ([StudentUSI] ASC, [OtherNameTypeId] ASC),
    CONSTRAINT [FK_StudentOtherName_OtherNameType_OtherNameTypeId] FOREIGN KEY ([OtherNameTypeId]) REFERENCES [leadata].[OtherNameType] ([OtherNameTypeId]),
    CONSTRAINT [FK_StudentOtherName_Student_StudentUSI] FOREIGN KEY ([StudentUSI]) REFERENCES [leadata].[Student] ([StudentUSI]) ON DELETE CASCADE
);
