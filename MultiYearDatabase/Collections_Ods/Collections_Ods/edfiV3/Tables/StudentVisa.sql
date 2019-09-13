CREATE TABLE [edfiV3].[StudentVisa] (
    [ApiSchoolYear]	   SMALLINT NOT NULL,
    [StudentUSI]       INT      NOT NULL,
    [VisaDescriptorId] INT      NOT NULL,
    [CreateDate]       DATETIME2 (7) NOT NULL,
    CONSTRAINT [V3_StudentVisa_PK] PRIMARY KEY CLUSTERED ([ApiSchoolYear] ASC, [StudentUSI] ASC, [VisaDescriptorId] ASC),
    CONSTRAINT [V3_FK_StudentVisa_Student] FOREIGN KEY ([ApiSchoolYear], [StudentUSI]) REFERENCES [edfiV3].[Student] ([ApiSchoolYear],[StudentUSI]) ON DELETE CASCADE,
    CONSTRAINT [V3_FK_StudentVisa_VisaDescriptor] FOREIGN KEY ([VisaDescriptorId]) REFERENCES [edfiV3].[VisaDescriptor] ([VisaDescriptorId])
);

