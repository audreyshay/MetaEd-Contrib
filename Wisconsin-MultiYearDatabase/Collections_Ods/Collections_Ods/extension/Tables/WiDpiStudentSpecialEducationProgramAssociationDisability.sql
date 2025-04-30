CREATE TABLE [extension].[WiDpiStudentSpecialEducationProgramAssociationDisability]
(
	[StudentUSI] INT NOT NULL , 
	[EducationOrganizationId] INT NOT NULL, 
	[ProgramTypeId] INT NOT NULL,
	[ProgramName] nvarchar(60) NOT NULL,
	[ProgramEducationOrganizationId] INT NOT NULL,
	[BeginDate] DATE NOT NULL,
	[DisabilityDescriptorId] [int] NOT NULL,
	[SchoolYear] SMALLINT not null,
	[CreateDate] [datetime] NOT NULL CONSTRAINT [WiDpiStudentSpecialEducationProgramAssociationDisability_DF_CreateDate]  DEFAULT (getdate()),
	[Reporting] BIT NULL CONSTRAINT [DF_WiDpiStudentSpecialEducationProgramAssociationDisability_Reporting] DEFAULT(0), 
	CONSTRAINT [PK_WiDpiStudentSpecialEducationProgramAssociationDisability] PRIMARY KEY CLUSTERED 
		([SchoolYear],[StudentUSI], [EducationOrganizationId], [ProgramTypeId],[ProgramName], [ProgramEducationOrganizationId], [BeginDate],[DisabilityDescriptorId]), 
	CONSTRAINT [FK_WiDpiStudentSpecialEducationProgramAssociationDisability_StudentSpecialEducationProgramAssociation] 
		FOREIGN KEY ([SchoolYear],[StudentUSI], [EducationOrganizationId], [ProgramTypeId],[ProgramName], [ProgramEducationOrganizationId], [BeginDate]) 
		REFERENCES [edfi].[StudentSpecialEducationProgramAssociation]([SchoolYear],[StudentUSI], [EducationOrganizationId], [ProgramTypeId],[ProgramName], [ProgramEducationOrganizationId], [BeginDate]) 
		ON DELETE CASCADE, 
	CONSTRAINT [FK_WiDpiStudentSpecialEducationProgramAssociationDisability_DisabilityDescriptor] 
		FOREIGN KEY([DisabilityDescriptorId]) 
		REFERENCES [edfi].[DisabilityDescriptor] ([DisabilityDescriptorId]) 
	
)