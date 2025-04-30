CREATE TABLE [edfiV3].[StudentOtherName]
(
	[ApiSchoolYear]	   SMALLINT NOT NULL,
    [OtherNameTypeDescriptorId] INT           NOT NULL,
    [StudentUSI]                INT           NOT NULL,
    [PersonalTitlePrefix]       NVARCHAR (30) NULL,
    [FirstName]                 NVARCHAR (75) NOT NULL,
    [MiddleName]                NVARCHAR (75) NULL,
    [LastSurname]               NVARCHAR (75) NOT NULL,
    [GenerationCodeSuffix]      NVARCHAR (10) NULL,
    [CreateDate]                DATETIME2 (7)      CONSTRAINT [V3_StudentOtherName_DF_CreateDate] DEFAULT (getdate()) NOT NULL,
    CONSTRAINT [V3_StudentOtherName_PK] PRIMARY KEY CLUSTERED ([ApiSchoolYear] ASC, [StudentUSI] ASC, [OtherNameTypeDescriptorId] ASC),
    CONSTRAINT [V3_FK_StudentOtherName_OtherNameTypeDescriptor] FOREIGN KEY ([OtherNameTypeDescriptorId]) REFERENCES [edfiV3].[OtherNameTypeDescriptor] ([OtherNameTypeDescriptorId]),
    CONSTRAINT [V3_FK_StudentOtherName_Student] FOREIGN KEY ([ApiSchoolYear],[StudentUSI]) REFERENCES [edfiV3].[Student] ([ApiSchoolYear],[StudentUSI]) ON DELETE CASCADE

)
