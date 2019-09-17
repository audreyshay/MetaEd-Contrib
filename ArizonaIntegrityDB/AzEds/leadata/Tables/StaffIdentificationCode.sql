CREATE TABLE [leadata].[StaffIdentificationCode] (
    [StaffUSI]                                INT           NOT NULL,
    [StaffIdentificationSystemTypeId]         INT           NOT NULL,
    [AssigningOrganizationIdentificationCode] NVARCHAR (60) NULL,
    [IdentificationCode]                      NVARCHAR (60) NOT NULL,
	[SourceCreateDate]						  DATETIME		NOT NULL,
	[LoadDate]								  DATETIME		NOT NULL,
	[HashValue]				[binary](64)	  CONSTRAINT [StaffIdentificationCode_DF_HashValue] DEFAULT (00) NOT NULL,
    CONSTRAINT [PK_StaffIdentificationCode] PRIMARY KEY CLUSTERED ([StaffUSI] ASC, [StaffIdentificationSystemTypeId] ASC),
    CONSTRAINT [FK_StaffIdentificationCode_Staff_StaffUSI] FOREIGN KEY ([StaffUSI]) REFERENCES [leadata].[Staff] ([StaffUSI]) ON DELETE CASCADE,
    CONSTRAINT [FK_StaffIdentificationCode_StaffIdentificationSystemType_StaffIdentificationSystemTypeId] FOREIGN KEY ([StaffIdentificationSystemTypeId]) REFERENCES [leadata].[StaffIdentificationSystemType] ([StaffIdentificationSystemTypeId])
);

