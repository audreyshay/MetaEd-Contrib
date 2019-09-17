CREATE TABLE [entity].[AlternateEducationOrganizationRelationshipType](
	[AlternateEducationOrganizationRelationshipTypeId] [int] IDENTITY(1,1) NOT NULL,
    [CodeValue]				NVARCHAR (50)   NOT NULL,
	[Description]         NVARCHAR (1024)  NOT NULL,
 CONSTRAINT [PK_AlternateEducationOrganizationRelationshipType] PRIMARY KEY CLUSTERED 
(
	[AlternateEducationOrganizationRelationshipTypeId] ASC
))