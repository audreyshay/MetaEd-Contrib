CREATE TABLE [edfi].[CharterApprovalAgencyType] (
    [CharterApprovalAgencyTypeId] INT              IDENTITY (1, 1) NOT NULL,
    [CodeValue]                   NVARCHAR (50)    NOT NULL,
    [Description]                 NVARCHAR (1024)  NOT NULL,
    [ShortDescription]            NVARCHAR (450)   NOT NULL,
    [Id]                          UNIQUEIDENTIFIER CONSTRAINT [CharterApprovalAgencyType_DF_Id] DEFAULT (newid()) NOT NULL,
    [LastModifiedDate]            DATETIME         CONSTRAINT [CharterApprovalAgencyType_DF_LastModifiedDate] DEFAULT (getdate()) NOT NULL,
    [CreateDate]                  DATETIME         CONSTRAINT [CharterApprovalAgencyType_DF_CreateDate] DEFAULT (getdate()) NOT NULL,
    CONSTRAINT [PK_CharterApprovalAgencyType] PRIMARY KEY CLUSTERED ([CharterApprovalAgencyTypeId] ASC)
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The type of agency that approved the establishment or continuation of a charter school.', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'CharterApprovalAgencyType';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Key for MagnetSpecialProgramEmphasisSchool', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'CharterApprovalAgencyType', @level2type = N'COLUMN', @level2name = N'CharterApprovalAgencyTypeId';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Code for MagnetSpecialProgramEmphasisSchool type.', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'CharterApprovalAgencyType', @level2type = N'COLUMN', @level2name = N'CodeValue';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The description of the descriptor.', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'CharterApprovalAgencyType', @level2type = N'COLUMN', @level2name = N'Description';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'A shortened description for the charter approval agency type.', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'CharterApprovalAgencyType', @level2type = N'COLUMN', @level2name = N'ShortDescription';

