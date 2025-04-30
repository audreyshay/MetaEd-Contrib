CREATE TABLE [edfi].[ProgramType] (
    [ProgramTypeId]    INT              IDENTITY (1, 1) NOT NULL,
    [CodeValue]        NVARCHAR (50)    NOT NULL,
    [Description]      NVARCHAR (1024)  NOT NULL,
    [ShortDescription] NVARCHAR (450)   NOT NULL,
    [Id]               UNIQUEIDENTIFIER CONSTRAINT [ProgramType_DF_Id] DEFAULT (newid()) NOT NULL,
    [LastModifiedDate] DATETIME         CONSTRAINT [ProgramType_DF_LastModifiedDate] DEFAULT (getdate()) NOT NULL,
    [CreateDate]       DATETIME         CONSTRAINT [ProgramType_DF_CreateDate] DEFAULT (getdate()) NOT NULL,
    CONSTRAINT [PK_ProgramType] PRIMARY KEY CLUSTERED ([ProgramTypeId] ASC)
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'The formal name of the program of instruction, training, services, or benefits available through federal, state, or local agencies.', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'ProgramType';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Key for Program', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'ProgramType', @level2type = N'COLUMN', @level2name = N'ProgramTypeId';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Code for Program type.', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'ProgramType', @level2type = N'COLUMN', @level2name = N'CodeValue';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The description of the descriptor.', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'ProgramType', @level2type = N'COLUMN', @level2name = N'Description';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'A shortened description for the program type.', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'ProgramType', @level2type = N'COLUMN', @level2name = N'ShortDescription';

