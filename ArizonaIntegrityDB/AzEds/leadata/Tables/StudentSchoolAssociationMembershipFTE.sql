CREATE TABLE [leadata].[StudentSchoolAssociationMembershipFTE] (
    [FiscalYear]                INT           NOT NULL,
    [StudentUSI]                INT           NOT NULL,
    [SchoolId]                  INT           NOT NULL,
    [EntryDate]                 DATE          NOT NULL,
    [FTEStartDate]              DATE          NOT NULL,
    [FTEEndDate]                DATE          NULL,
    [MembershipFTEDescriptorId] INT           NOT NULL,
    [SourceId]                  UNIQUEIDENTIFIER NULL,
 	[SourceCreateDate]			DATETIME	  NOT NULL CONSTRAINT [StudentSchoolAssociationMembershipFTE_DF_SourceCreateDate]  DEFAULT (getutcdate()),
	[SourceLastModifiedDate]	DATETIME	  NOT NULL CONSTRAINT [StudentSchoolAssociationMembershipFTE_DF_SourceLastModifiedDate]  DEFAULT (getutcdate()),
	[LoadDate]					DATETIME	  NOT NULL CONSTRAINT [StudentSchoolAssociationMembershipFTE_DF_Loaddate]  DEFAULT (getutcdate()),   
	[HashValue] [binary](64)      DEFAULT (00)  NOT NULL,
	CONSTRAINT [PK_StudentSchoolAssociationMembershipFTE] PRIMARY KEY CLUSTERED ([FiscalYear] ASC, [StudentUSI] ASC, [SchoolId] ASC, [EntryDate] ASC, [FTEStartDate] ASC),
    CONSTRAINT [FK_StudentSchoolAssociationMembershipFTE_StudentSchoolAssociation] FOREIGN KEY ([FiscalYear], [StudentUSI], [SchoolId], [EntryDate]) REFERENCES [leadata].[StudentSchoolAssociation] ([FiscalYear], [StudentUSI], [SchoolId], [EntryDate]) ON DELETE CASCADE
);




GO
CREATE NONCLUSTERED INDEX [IX_StudentSchoolAssociationMembershipFTE_StudentUSI_SchoolId]
    ON [leadata].[StudentSchoolAssociationMembershipFTE]([StudentUSI] ASC, [SchoolId] ASC)
    INCLUDE([EntryDate], [FTEStartDate], [FTEEndDate], [MembershipFTEDescriptorId]);

