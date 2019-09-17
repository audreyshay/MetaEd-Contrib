CREATE TABLE [leadata].[StudentEducationOrganizationAssociation] (
    [StudentUSI]                 INT           NOT NULL,
	[EducationOrganizationId]	 INT		   NOT NULL,
	[SexDescriptorId]			 INT		   NOT NULL,	
	[HispanicLatinoEthnicity]	 BIT		   NULL,	
    [SourceId]                   UNIQUEIDENTIFIER NULL,
	[SourceCreateDate]			 DATETIME	   NOT NULL CONSTRAINT [StudentEducationOrganizationAssociation_DF_SourceCreateDate]  DEFAULT (getutcdate()),
	[SourceLastModifiedDate]	 DATETIME	   NOT NULL CONSTRAINT [StudentEducationOrganizationAssociation_DF_SourceLastModifiedDate]  DEFAULT (getutcdate()),
	[LoadDate]					 DATETIME	   NOT NULL CONSTRAINT [StudentEducationOrganizationAssociation_DF_Loaddate]  DEFAULT (getutcdate()),
	[HashValue]	[binary](64)	 CONSTRAINT [StudentEducationOrganizationAssociation_DF_HashValue] DEFAULT (00) NOT NULL,
	CONSTRAINT [PK_StudentEducationOrganizationAssociation] PRIMARY KEY CLUSTERED ([StudentUSI] ASC, [EducationOrganizationId] ASC),  
    CONSTRAINT [FK_StudentEducationOrganizationAssociation_Student] FOREIGN KEY ([StudentUSI]) REFERENCES [leadata].[Student] ([StudentUSI]) ON DELETE CASCADE
);
