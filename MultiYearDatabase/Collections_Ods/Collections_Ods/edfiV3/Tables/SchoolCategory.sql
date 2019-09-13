CREATE TABLE [edfiV3].[SchoolCategory] (
	[ApiSchoolYear]	   SMALLINT NOT NULL,  
    [SchoolCategoryDescriptorId] INT      NOT NULL,
    [SchoolId]                   INT      NOT NULL,
    [CreateDate]                 DATETIME2 (7) NOT NULL,
    CONSTRAINT [V3_SchoolCategory_PK] PRIMARY KEY CLUSTERED ([ApiSchoolYear] ASC, [SchoolCategoryDescriptorId] ASC, [SchoolId] ASC),
    CONSTRAINT [V3_FK_SchoolCategory_School] FOREIGN KEY ([ApiSchoolYear], [SchoolId]) REFERENCES [edfiV3].[School] ([ApiSchoolYear], [SchoolId]) ON DELETE CASCADE,
    CONSTRAINT [V3_FK_SchoolCategory_SchoolCategoryDescriptor] FOREIGN KEY ([SchoolCategoryDescriptorId]) REFERENCES [edfiV3].[SchoolCategoryDescriptor] ([SchoolCategoryDescriptorId])
);


