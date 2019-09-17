CREATE TABLE [leadata].[StudentSchoolAssociationSpecialEnrollment] (
    [FiscalYear]                    INT              NOT NULL,
    [StudentUSI]                    INT              NOT NULL,
    [SchoolId]                      INT              NOT NULL,
    [EntryDate]                     DATE             NOT NULL,
    [SpecialEnrollmentStartDate]    DATE             NOT NULL,
    [SpecialEnrollmentEndDate]      DATE             NULL,
    [SpecialEnrollmentDescriptorId] INT              NOT NULL,
    [SourceId]						UNIQUEIDENTIFIER	 NULL,
	[SourceCreateDate]				DATETIME		 NOT NULL CONSTRAINT [StudentSchoolAssociationSpecialEnrollment_DF_SourceCreateDate]  DEFAULT (getutcdate()),
	[SourceLastModifiedDate]		DATETIME		 NOT NULL CONSTRAINT [StudentSchoolAssociationSpecialEnrollment_DF_SourceLastModifiedDate]  DEFAULT (getutcdate()),
	[LoadDate]						DATETIME		 NOT NULL CONSTRAINT [StudentSchoolAssociationSpecialEnrollment_DF_Loaddate]  DEFAULT (getutcdate()),
	[HashValue] [binary](64)        DEFAULT (00)  NOT NULL,
    CONSTRAINT [PK_StudentSchoolAssociationSpecialEnrollment] PRIMARY KEY CLUSTERED ([FiscalYear] ASC, [StudentUSI] ASC, [SchoolId] ASC, [EntryDate] ASC, [SpecialEnrollmentStartDate] ASC),
    CONSTRAINT [FK_StudentSchoolAssociationSpecialEnrollment_StudentSchoolAssociation] FOREIGN KEY ([FiscalYear], [StudentUSI], [SchoolId], [EntryDate]) REFERENCES [leadata].[StudentSchoolAssociation] ([FiscalYear], [StudentUSI], [SchoolId], [EntryDate]) ON DELETE CASCADE
);

