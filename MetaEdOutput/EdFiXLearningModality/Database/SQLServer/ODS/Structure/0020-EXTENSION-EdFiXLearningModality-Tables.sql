-- Table [edfixlearningmodality].[ModalityTimeTypeDescriptor] --
CREATE TABLE [edfixlearningmodality].[ModalityTimeTypeDescriptor] (
    [ModalityTimeTypeDescriptorId] [INT] NOT NULL,
    CONSTRAINT [ModalityTimeTypeDescriptor_PK] PRIMARY KEY CLUSTERED (
        [ModalityTimeTypeDescriptorId] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

-- Table [edfixlearningmodality].[ModalityTypeDescriptor] --
CREATE TABLE [edfixlearningmodality].[ModalityTypeDescriptor] (
    [ModalityTypeDescriptorId] [INT] NOT NULL,
    CONSTRAINT [ModalityTypeDescriptor_PK] PRIMARY KEY CLUSTERED (
        [ModalityTypeDescriptorId] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

-- Table [edfixlearningmodality].[ProgramLearningModality] --
CREATE TABLE [edfixlearningmodality].[ProgramLearningModality] (
    [EducationOrganizationId] [INT] NOT NULL,
    [ModalityTypeDescriptorId] [INT] NOT NULL,
    [ProgramName] [NVARCHAR](60) NOT NULL,
    [ProgramTypeDescriptorId] [INT] NOT NULL,
    [ModalityTime] [DECIMAL](8, 2) NOT NULL,
    [ModalityTimeTypeDescriptorId] [INT] NOT NULL,
    [CreateDate] [DATETIME2] NOT NULL,
    CONSTRAINT [ProgramLearningModality_PK] PRIMARY KEY CLUSTERED (
        [EducationOrganizationId] ASC,
        [ModalityTypeDescriptorId] ASC,
        [ProgramName] ASC,
        [ProgramTypeDescriptorId] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [edfixlearningmodality].[ProgramLearningModality] ADD CONSTRAINT [ProgramLearningModality_DF_CreateDate] DEFAULT (getdate()) FOR [CreateDate]
GO

