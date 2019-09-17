CREATE TABLE [leadata].[Session] (
	[FiscalYear]			  INT			   NOT NULL,
    [SchoolId]                INT              NOT NULL,
    [TermTypeId]              INT              NOT NULL,
    [SchoolYear]              SMALLINT         NOT NULL, 
    [SessionName]             NVARCHAR (60)    NOT NULL,
    [BeginDate]               DATE             NOT NULL,
    [EndDate]                 DATE             NOT NULL,
    [TotalInstructionalDays]  INT              NOT NULL,
	[SessionTypeDescriptorID] INT  NULL ,
    [SessionTypeDescriptorCodeValue] NVarchar(50)  NULL ,
	[SessionTypeDescriptorShortDescription] NVarchar(1024)  NULL ,
    [SourceId]                UNIQUEIDENTIFIER  NOT NULL,
    [SourceLastModifiedDate]        DATETIME    NOT NULL,
    [SourceCreateDate]              DATETIME    NOT NULL,
	[LoadDate]					    DATETIME         CONSTRAINT [Session_DF_LoadDate] DEFAULT (GETUTCDATE()) NOT NULL,
	[HashValue] [binary](64) DEFAULT (00) NOT NULL,
    CONSTRAINT [PK_Session] PRIMARY KEY CLUSTERED ([FiscalYear] ASC,[SchoolId] ASC, [TermTypeId] ASC, [SchoolYear] ASC, [SessionName] ASC),
    CONSTRAINT [FK_Session_School_SchoolId_FiscalYear] FOREIGN KEY ([SchoolId], [FiscalYear]) REFERENCES [entity].[School] ([SchoolId], [FiscalYear])--,
   --CONSTRAINT [FK_Session_SchoolYearType_SchoolYear] FOREIGN KEY ([SchoolYear]) REFERENCES [edfi].[SchoolYearType] ([SchoolYear]),
   -- CONSTRAINT [FK_Session_SessionTypeDescriptor_SessionTypeDescriptorId] FOREIGN KEY ([SessionTypeDescriptorId]) REFERENCES [extension].[SessionTypeDescriptor] ([SessionTypeDescriptorId]),
   -- CONSTRAINT [FK_Session_TermType_TermTypeId] FOREIGN KEY ([TermTypeId]) REFERENCES [edfi].[TermType] ([TermTypeId])
);







