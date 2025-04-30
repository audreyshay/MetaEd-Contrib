CREATE TABLE [edfi].[StudentProgramAssociation] (
	[StudentUSI]                     INT              NOT NULL,
	[EducationOrganizationId]        INT              NOT NULL,
	[ProgramTypeId]                  INT              NOT NULL,
	[ProgramName]                    NVARCHAR (60)    NOT NULL,
	[ProgramEducationOrganizationId] INT              NOT NULL,
	[BeginDate]                      DATE             NOT NULL,
	[EndDate]                        DATE             NULL,
	[ReasonExitedDescriptorId]       INT              NULL,
	[ServedOutsideOfRegularSession]  BIT              NULL,
	[WiDpiSchoolId]					 INT			  NULL,
	[Id]                             UNIQUEIDENTIFIER CONSTRAINT [StudentProgramAssociation_DF_Id] DEFAULT (newid()) NOT NULL,
	[LastModifiedDate]               DATETIME         CONSTRAINT [StudentProgramAssociation_DF_LastModifiedDate] DEFAULT (getdate()) NOT NULL,
	[CreateDate]                     DATETIME         CONSTRAINT [StudentProgramAssociation_DF_CreateDate] DEFAULT (getdate()) NOT NULL,
	[SchoolYear]                     SMALLINT         DEFAULT (datepart(year,getdate())) NOT NULL,
	[IsActive]                       BIT              CONSTRAINT [DF_StudentProgramAssociation_IsActive] DEFAULT ((1)) NOT NULL,
	CONSTRAINT [PK_StudentProgramAssociation] PRIMARY KEY CLUSTERED 
		([SchoolYear], [StudentUSI], [EducationOrganizationId], [ProgramTypeId], [ProgramName], [ProgramEducationOrganizationId], [BeginDate]),
	CONSTRAINT [FK_StudentProgramAssociation_EducationOrganization] 
		FOREIGN KEY ([SchoolYear],[EducationOrganizationId]) 
		REFERENCES [edfi].[EducationOrganization] ([SchoolYear],[EducationOrganizationId]),
	CONSTRAINT [FK_StudentProgramAssociation_Program] 
		FOREIGN KEY ([SchoolYear],[ProgramEducationOrganizationId], [ProgramTypeId], [ProgramName]) 
		REFERENCES [edfi].[Program] ([SchoolYear],[EducationOrganizationId], [ProgramTypeId], [ProgramName]),
	CONSTRAINT [FK_StudentProgramAssociation_ReasonExitedDescriptor_ReasonExitedDescriptorId] 
		FOREIGN KEY ([ReasonExitedDescriptorId]) 
		REFERENCES [edfi].[ReasonExitedDescriptor] ([ReasonExitedDescriptorId]),
	CONSTRAINT [FK_StudentProgramAssociation_Student_StudentUSI] 
		FOREIGN KEY ([SchoolYear],[StudentUSI]) 
		REFERENCES [edfi].[Student] ([SchoolYear],[StudentUSI])
);


GO
CREATE NONCLUSTERED INDEX [FK_StudentProgramAssociation_EducationOrganization]
	ON [edfi].[StudentProgramAssociation]([SchoolYear] ASC,[EducationOrganizationId] ASC);


GO
CREATE NONCLUSTERED INDEX [FK_StudentProgramAssociation_Program]
	ON [edfi].[StudentProgramAssociation]([ProgramTypeId] ASC, [ProgramEducationOrganizationId] ASC, [ProgramName] ASC);


GO
CREATE NONCLUSTERED INDEX [FK_StudentProgramAssociation_ReasonExitedDescriptor_ReasonExitedDescriptorId]
	ON [edfi].[StudentProgramAssociation]([ReasonExitedDescriptorId] ASC);


GO
CREATE NONCLUSTERED INDEX [FK_StudentProgramAssociation_Student_StudentUSI]
	ON [edfi].[StudentProgramAssociation]([SchoolYear] ASC,[StudentUSI] ASC);

GO

ALTER TABLE [edfi].[StudentProgramAssociation] ADD  CONSTRAINT [FK_StudentProgramAssociation_School] 
	FOREIGN KEY([SchoolYear], [WiDpiSchoolId])
	REFERENCES [edfi].[School] ([SchoolYear],[SchoolId])
GO

EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'This association represents the Program(s) that a student participates in or is served by.', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'StudentProgramAssociation';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'A unique number or alphanumeric code assigned to a student by a state education agency.', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'StudentProgramAssociation', @level2type = N'COLUMN', @level2name = N'StudentUSI';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'EducationOrganization Identity Column', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'StudentProgramAssociation', @level2type = N'COLUMN', @level2name = N'EducationOrganizationId';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'A unique identifier used as Primary Key, not derived from business logic, when acting as Foreign Key, references the parent table.', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'StudentProgramAssociation', @level2type = N'COLUMN', @level2name = N'ProgramTypeId';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'The formal name of the program of instruction, training, services or benefits available through federal, state, or local agencies.', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'StudentProgramAssociation', @level2type = N'COLUMN', @level2name = N'ProgramName';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'The education organization where the student is participating in or receiving the program services.', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'StudentProgramAssociation', @level2type = N'COLUMN', @level2name = N'ProgramEducationOrganizationId';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'The month, day, and year on which the Student first received services.', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'StudentProgramAssociation', @level2type = N'COLUMN', @level2name = N'BeginDate';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'The month, day, and year on which the Student exited the Program or stopped receiving services.', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'StudentProgramAssociation', @level2type = N'COLUMN', @level2name = N'EndDate';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'A unique identifier used as Primary Key, not derived from business logic, when acting as Foreign Key, references the parent table.', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'StudentProgramAssociation', @level2type = N'COLUMN', @level2name = N'ReasonExitedDescriptorId';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'Indicates whether the Student received services during the summer session or between sessions.', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'StudentProgramAssociation', @level2type = N'COLUMN', @level2name = N'ServedOutsideOfRegularSession';

GO

CREATE NONCLUSTERED INDEX [IX_StudentProgramAssociation_LastModified]
    ON [edfi].[StudentProgramAssociation](IsActive DESC, [SchoolYear] DESC, [EducationOrganizationId], [ProgramTypeId], [LastModifiedDate] DESC)
GO

CREATE NONCLUSTERED INDEX [IX_StudentProgramAssociation_Id_SchoolYear_Active]
ON [edfi].[StudentProgramAssociation] ([Id],[SchoolYear],[IsActive])
INCLUDE ([ProgramTypeId],[BeginDate],[EndDate],[WiDpiSchoolId])
GO