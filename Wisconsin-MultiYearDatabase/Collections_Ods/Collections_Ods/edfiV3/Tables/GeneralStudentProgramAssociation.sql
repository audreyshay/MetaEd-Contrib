CREATE TABLE [edfiV3].[GeneralStudentProgramAssociation] (
    [ApiSchoolYear]	   SMALLINT NOT NULL,
    [BeginDate]                      DATE             NOT NULL,
    [EducationOrganizationId]        INT              NOT NULL,
    [ProgramEducationOrganizationId] INT              NOT NULL,
    [ProgramName]                    NVARCHAR (60)    NOT NULL,
    [ProgramTypeDescriptorId]        INT              NOT NULL,
    [StudentUSI]                     INT              NOT NULL,
    [EndDate]                        DATE             NULL,
    [ReasonExitedDescriptorId]       INT              NULL,
    [ServedOutsideOfRegularSession]  BIT              NULL,
    [Discriminator]					 NVARCHAR (128)   NULL,
    [CreateDate]                     DATETIME2 (7)         NOT NULL,
    [LastModifiedDate]               DATETIME2 (7)         NOT NULL,
    [Id]                             UNIQUEIDENTIFIER NOT NULL,
	[IsActive] BIT CONSTRAINT [V3_GeneralStudentProgramAssocaition_DF_IsActive] DEFAULT ((1)) NOT NULL,
	[EffectiveBeginDate]				  DATE		 NULL,
	[EffectiveEndDate]					  DATE		 NULL,
    [Auto] BIT CONSTRAINT [V3_GeneralStudentProgramAssocaition_DF_Auto] DEFAULT ((0)) NOT NULL,
	CONSTRAINT [V3_GeneralStudentProgramAssociation_PK] PRIMARY KEY CLUSTERED ([ApiSchoolYear] ASC, [EducationOrganizationId] ASC, [StudentUSI] ASC, [BeginDate] ASC, [ProgramEducationOrganizationId] ASC, [ProgramName] ASC, [ProgramTypeDescriptorId] ASC),
    CONSTRAINT [V3_FK_GeneralStudentProgramAssociation_EducationOrganization] FOREIGN KEY ([ApiSchoolYear], [EducationOrganizationId]) REFERENCES [edfiV3].[EducationOrganization] ([ApiSchoolYear], [EducationOrganizationId]),
    CONSTRAINT [V3_FK_GeneralStudentProgramAssociation_Program] FOREIGN KEY ([ApiSchoolYear], [ProgramEducationOrganizationId], [ProgramName], [ProgramTypeDescriptorId]) REFERENCES [edfiV3].[Program] ([ApiSchoolYear], [EducationOrganizationId], [ProgramName], [ProgramTypeDescriptorId]),
    CONSTRAINT [V3_FK_GeneralStudentProgramAssociation_ReasonExitedDescriptor] FOREIGN KEY ([ReasonExitedDescriptorId]) REFERENCES [edfiV3].[ReasonExitedDescriptor] ([ReasonExitedDescriptorId]),
    CONSTRAINT [V3_FK_GeneralStudentProgramAssociation_Student] FOREIGN KEY ([ApiSchoolYear], [StudentUSI]) REFERENCES [edfiV3].[Student] ([ApiSchoolYear], [StudentUSI])
);


GO
CREATE UNIQUE NONCLUSTERED INDEX [V3_UX_GeneralStudentProgramAssociation_Id]
    ON [edfiV3].[GeneralStudentProgramAssociation]([Id] ASC) WITH (FILLFACTOR = 75, PAD_INDEX = ON);


GO