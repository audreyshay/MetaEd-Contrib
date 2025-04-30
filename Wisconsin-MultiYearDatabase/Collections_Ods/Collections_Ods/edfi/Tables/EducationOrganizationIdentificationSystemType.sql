CREATE TABLE [edfi].[EducationOrganizationIdentificationSystemType] (
    [EducationOrganizationIdentificationSystemTypeId] INT              IDENTITY (1, 1) NOT NULL,
    [CodeValue]                                       NVARCHAR (50)    NOT NULL,
    [Description]                                     NVARCHAR (1024)  NOT NULL,
    [ShortDescription]                                NVARCHAR (450)   NOT NULL,
    [Id]                                              UNIQUEIDENTIFIER CONSTRAINT [EducationOrganizationIdentificationSystemType_DF_Id] DEFAULT (newid()) NOT NULL,
    [LastModifiedDate]                                DATETIME         CONSTRAINT [EducationOrganizationIdentificationSystemType_DF_LastModifiedDate] DEFAULT (getdate()) NOT NULL,
    [CreateDate]                                      DATETIME         CONSTRAINT [EducationOrganizationIdentificationSystemType_DF_CreateDate] DEFAULT (getdate()) NOT NULL,
    CONSTRAINT [PK_EducationOrgIdentificationSystemType] PRIMARY KEY CLUSTERED ([EducationOrganizationIdentificationSystemTypeId] ASC)
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'A shortened description for the education organization identification system type.', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'EducationOrganizationIdentificationSystemType', @level2type = N'COLUMN', @level2name = N'ShortDescription';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The description of the descriptor.', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'EducationOrganizationIdentificationSystemType', @level2type = N'COLUMN', @level2name = N'Description';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Code for EducationOrgIdentificationSystemType type.', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'EducationOrganizationIdentificationSystemType', @level2type = N'COLUMN', @level2name = N'CodeValue';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Key for EducationOrgIdentificationSystemType', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'EducationOrganizationIdentificationSystemType', @level2type = N'COLUMN', @level2name = N'EducationOrganizationIdentificationSystemTypeId';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'A coding scheme that is used for identification and record-keeping purposes by education organizations, social services or other agencies to refer to an education organization.', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'EducationOrganizationIdentificationSystemType';

