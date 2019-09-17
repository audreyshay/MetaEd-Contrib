CREATE TABLE [leadata].[StudentSchoolAssociationTuitionPayer] (
    [FiscalYear]               INT           NOT NULL,
    [StudentUSI]               INT           NOT NULL,
    [SchoolId]                 INT           NOT NULL,
    [EntryDate]                DATE          NOT NULL,
    [PayerStartDate]           DATE          NOT NULL,
    [PayerEndDate]             DATE          NULL,
    [TuitionPayerDescriptorId] INT           NOT NULL,
    [SourceId]                 UNIQUEIDENTIFIER NULL,
	[SourceCreateDate]		   DATETIME		 NOT NULL CONSTRAINT [StudentSchoolAssociationTuitionPayer_DF_SourceCreateDate]  DEFAULT (getutcdate()),
	[SourceLastModifiedDate]   DATETIME		 NOT NULL CONSTRAINT [StudentSchoolAssociationTuitionPayer_DF_SourceLastModifiedDate]  DEFAULT (getutcdate()),
	[LoadDate]				   DATETIME		 NOT NULL CONSTRAINT [StudentSchoolAssociationTuitionPayer_DF_Loaddate]  DEFAULT (getutcdate()),
	[HashValue] [binary](64)      DEFAULT (00)  NOT NULL,
    CONSTRAINT [PK_StudentSchoolAssociationTuitionPayer] PRIMARY KEY CLUSTERED ([FiscalYear] ASC, [StudentUSI] ASC, [SchoolId] ASC, [EntryDate] ASC, [PayerStartDate] ASC),
    CONSTRAINT [FK_StudentSchoolAssociationTuitionPayer_StudentSchoolAssociation] FOREIGN KEY ([FiscalYear], [StudentUSI], [SchoolId], [EntryDate]) REFERENCES [leadata].[StudentSchoolAssociation] ([FiscalYear], [StudentUSI], [SchoolId], [EntryDate]) ON DELETE CASCADE
);




GO
CREATE NONCLUSTERED INDEX [IX_StudentSchoolAssociationTuitionPayer_Student_SchoolId_EntryDate_FiscalYear]
    ON [leadata].[StudentSchoolAssociationTuitionPayer]([StudentUSI] ASC, [SchoolId] ASC, [EntryDate] ASC, [FiscalYear] ASC)
    INCLUDE([PayerStartDate], [PayerEndDate], [TuitionPayerDescriptorId]);

