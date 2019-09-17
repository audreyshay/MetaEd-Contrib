CREATE TABLE [xref].CareerPathwayDescriptorType (
 CareerPathwayTypeId int NOT NULL, 
 CareerPathwayTypeCodeValue nvarchar(50) NOT NULL,
 CareerPathwayDescription  nvarchar(1024) NOT NULL,
 CONSTRAINT [PK_CareerPathwayDescriptorType] PRIMARY KEY CLUSTERED ([CareerPathwayTypeId]ASC, [CareerPathwayTypeCodeValue]ASC)
);