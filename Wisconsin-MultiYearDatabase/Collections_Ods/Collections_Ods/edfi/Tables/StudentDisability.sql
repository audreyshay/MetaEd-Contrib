CREATE TABLE [edfi].[StudentDisability] (
	[StudentUSI]             INT           NOT NULL,
	[DisabilityDiagnosis]    NVARCHAR (80) NULL,
	[OrderOfDisability]      INT           NULL,
	[DisabilityDescriptorId] INT           NOT NULL,
	[CreateDate]             DATETIME      CONSTRAINT [StudentDisability_DF_CreateDate] DEFAULT (getdate()) NOT NULL,
	[SchoolYear]             SMALLINT      DEFAULT (datepart(year,getdate())) NOT NULL,
	[DisabilityDeterminationSourceTypeId] INT NULL,
	CONSTRAINT [PK_StudentDisability] PRIMARY KEY CLUSTERED 
		([SchoolYear] ASC, [StudentUSI] ASC, [DisabilityDescriptorId] ASC),
	CONSTRAINT [FK_StudentDisability_DisabilityDescriptor_DisabilityDescriptorId] 
		FOREIGN KEY ([DisabilityDescriptorId]) 
		REFERENCES [edfi].[DisabilityDescriptor] ([DisabilityDescriptorId]),
	CONSTRAINT [FK_StudentDisability_Student_StudentUSI_SchoolYear] 
		FOREIGN KEY ([SchoolYear],[StudentUSI]) 
		REFERENCES [edfi].[Student] ([SchoolYear],[StudentUSI])
		ON DELETE CASCADE,
	CONSTRAINT [FK_StudentDisability_DisabilityDeterminationSourceType_DisabilityDeterminationSourceTypeId] 
		FOREIGN KEY ([DisabilityDeterminationSourceTypeId]) 
		REFERENCES [edfi].[DisabilityDeterminationSourceType] ([DisabilityDeterminationSourceTypeId])
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'This type represents an impairment of body structure or function, a limitation in activities or a restriction in participation, as ordered by severity of impairment.', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'StudentDisability';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'A unique number or alphanumeric code assigned to a student by a state education agency.', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'StudentDisability', @level2type = N'COLUMN', @level2name = N'StudentUSI';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'A description of the exact disability diagnosis.
', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'StudentDisability', @level2type = N'COLUMN', @level2name = N'DisabilityDiagnosis';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Primary, Secondary, Tertiary, etc.
', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'StudentDisability', @level2type = N'COLUMN', @level2name = N'OrderOfDisability';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'A unique identifier used as Primary Key, not derived from business logic, when acting as Foreign Key, references the parent table.', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'StudentDisability', @level2type = N'COLUMN', @level2name = N'DisabilityDescriptorId';

