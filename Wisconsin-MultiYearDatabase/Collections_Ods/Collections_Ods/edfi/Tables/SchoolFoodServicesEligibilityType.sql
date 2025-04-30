CREATE TABLE [edfi].[SchoolFoodServicesEligibilityType] (
    [SchoolFoodServicesEligibilityTypeId] INT              IDENTITY (1, 1) NOT NULL,
    [CodeValue]                           NVARCHAR (50)    NOT NULL,
    [Description]                         NVARCHAR (1024)  NOT NULL,
    [ShortDescription]                    NVARCHAR (450)   NOT NULL,
    [Id]                                  UNIQUEIDENTIFIER CONSTRAINT [SchoolFoodServicesEligibilityType_DF_Id] DEFAULT (newid()) NOT NULL,
    [LastModifiedDate]                    DATETIME         CONSTRAINT [SchoolFoodServicesEligibilityType_DF_LastModifiedDate] DEFAULT (getdate()) NOT NULL,
    [CreateDate]                          DATETIME         CONSTRAINT [SchoolFoodServicesEligibilityType_DF_CreateDate] DEFAULT (getdate()) NOT NULL,
    CONSTRAINT [PK_SchoolFoodServicesEligibilityType] PRIMARY KEY CLUSTERED ([SchoolFoodServicesEligibilityTypeId] ASC)
);


GO
CREATE UNIQUE NONCLUSTERED INDEX [AK_SchoolFoodServicesEligibilityType_ShortDescription]
    ON [edfi].[SchoolFoodServicesEligibilityType]([ShortDescription] ASC);


GO
CREATE UNIQUE NONCLUSTERED INDEX [GUID_SchoolFoodServicesEligibilityType]
    ON [edfi].[SchoolFoodServicesEligibilityType]([Id] ASC);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'An indication of a student''s level of eligibility for breakfast, lunch, snack, supper and milk programs.', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'SchoolFoodServicesEligibilityType';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Key for SchoolFoodServicesEligibility', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'SchoolFoodServicesEligibilityType', @level2type = N'COLUMN', @level2name = N'SchoolFoodServicesEligibilityTypeId';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Code for SchoolFoodServicesEligibility type.', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'SchoolFoodServicesEligibilityType', @level2type = N'COLUMN', @level2name = N'CodeValue';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Description for SchoolFoodServicesEligibility type.', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'SchoolFoodServicesEligibilityType', @level2type = N'COLUMN', @level2name = N'Description';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'A shortened description for the descriptor.', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'SchoolFoodServicesEligibilityType', @level2type = N'COLUMN', @level2name = N'ShortDescription';

