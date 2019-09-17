CREATE TABLE [leadata].[StudentIdentificationCode] (
    [StudentUSI]                              INT           NOT NULL,
	[EducationOrganizationid] [int]			  CONSTRAINT [StudentIdentificationCode_DF_EducationOrganizationid] DEFAULT 79275 NOT NULL,
    [StudentIdentificationSystemTypeId]       INT           NOT NULL,
    [AssigningOrganizationIdentificationCode] NVARCHAR (60) NOT NULL,
    [IdentificationCode]                      NVARCHAR (60) NOT NULL,
	[SourceCreateDate]						  DATETIME		NOT NULL CONSTRAINT [StudentIdentificationCode_DF_SourceCreateDate]  DEFAULT (getutcdate()),
	[LoadDate]								  DATETIME		NOT NULL CONSTRAINT [StudentIdentificationCode_DF_Loaddate]  DEFAULT (getutcdate()),
	[HashValue]	[binary](64)				  CONSTRAINT [StudentIdentificationCode_DF_HashValue] DEFAULT (00) NOT NULL,
    CONSTRAINT [PK_StudentIdentificationCode] PRIMARY KEY CLUSTERED ([StudentUSI] ASC, [EducationOrganizationId] ASC, [StudentIdentificationSystemTypeId] ASC, [AssigningOrganizationIdentificationCode] ASC),
    CONSTRAINT [FK_StudentIdentificationCode_Student_StudentUSI] FOREIGN KEY ([StudentUSI]) REFERENCES [leadata].[Student] ([StudentUSI]) ON DELETE CASCADE,
    CONSTRAINT [FK_StudentIdentificationCode_StudentIdentificationSystemType_StudentIdentificationSystemTypeId] FOREIGN KEY ([StudentIdentificationSystemTypeId]) REFERENCES [leadata].[StudentIdentificationSystemType] ([StudentIdentificationSystemTypeId]) ON DELETE CASCADE
);

