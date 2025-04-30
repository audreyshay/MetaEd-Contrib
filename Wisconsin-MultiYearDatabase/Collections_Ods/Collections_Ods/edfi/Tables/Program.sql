CREATE TABLE [edfi].[Program] (
	[EducationOrganizationId] INT              NOT NULL,
	[ProgramTypeId]           INT              NOT NULL,
	[ProgramName]             NVARCHAR (60)    NOT NULL,
	[ProgramId]               NVARCHAR (20)    NULL,
	[ProgramSponsorTypeId]    INT              NULL,
	[Id]                      UNIQUEIDENTIFIER CONSTRAINT [Program_DF_Id] DEFAULT (newid()) NOT NULL,
	[LastModifiedDate]        DATETIME         CONSTRAINT [Program_DF_LastModifiedDate] DEFAULT (getdate()) NOT NULL,
	[CreateDate]              DATETIME         CONSTRAINT [Program_DF_CreateDate] DEFAULT (getdate()) NOT NULL,
	[SchoolYear]                                SMALLINT         DEFAULT (datepart(year,getdate())) NOT NULL,
	CONSTRAINT [PK_Program] PRIMARY KEY CLUSTERED 
		([SchoolYear],[EducationOrganizationId], [ProgramTypeId], [ProgramName]),
	CONSTRAINT [FK_Program_EducationOrganization_EducationOrganizationId] 
		FOREIGN KEY ([SchoolYear],[EducationOrganizationId]) 
		REFERENCES [edfi].[EducationOrganization] ([SchoolYear],[EducationOrganizationId]),
	CONSTRAINT [FK_Program_ProgramType_ProgramTypeId] 
		FOREIGN KEY ([ProgramTypeId]) 
		REFERENCES [edfi].[ProgramType] ([ProgramTypeId])
);


GO
CREATE NONCLUSTERED INDEX [FK_Program_EducationOrganization_EducationOrganizationId]
	ON [edfi].[Program]([EducationOrganizationId] ASC);


GO
CREATE NONCLUSTERED INDEX [FK_Program_ProgramType_ProgramTypeId]
	ON [edfi].[Program]([ProgramTypeId] ASC);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'This entity represents any program designed to work in conjunction with, or as a supplement to, the main academic program. Programs may provide instruction, training, services, or benefits through federal, state, or local agencies. Programs may also include organized extracurricular activities for students.', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'Program';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'EducationOrganization Identity Column', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'Program', @level2type = N'COLUMN', @level2name = N'EducationOrganizationId';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Key for Program', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'Program', @level2type = N'COLUMN', @level2name = N'ProgramTypeId';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The formal name of the program of instruction, training, services or benefits available through federal, state, or local agencies.', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'Program', @level2type = N'COLUMN', @level2name = N'ProgramName';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'A unique number or alphanumeric code assigned to a program by a school, school system, a state, or other agency or entity.', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'Program', @level2type = N'COLUMN', @level2name = N'ProgramId';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Key for ProgramSponsor', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'Program', @level2type = N'COLUMN', @level2name = N'ProgramSponsorTypeId';

