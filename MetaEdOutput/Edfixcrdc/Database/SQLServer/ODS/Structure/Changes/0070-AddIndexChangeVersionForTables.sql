BEGIN TRANSACTION
    IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'edfixcrdc.ClassGroup') AND name = N'UX_ClassGroup_ChangeVersion')
    CREATE INDEX [UX_ClassGroup_ChangeVersion] ON [edfixcrdc].[ClassGroup] ([ChangeVersion] ASC)
    GO
COMMIT

BEGIN TRANSACTION
    IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'edfixcrdc.CommunityProviderLocation') AND name = N'UX_CommunityProviderLocation_ChangeVersion')
    CREATE INDEX [UX_CommunityProviderLocation_ChangeVersion] ON [edfixcrdc].[CommunityProviderLocation] ([ChangeVersion] ASC)
    GO
COMMIT

BEGIN TRANSACTION
    IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'edfixcrdc.StudentClassGroupAssociation') AND name = N'UX_StudentClassGroupAssociation_ChangeVersion')
    CREATE INDEX [UX_StudentClassGroupAssociation_ChangeVersion] ON [edfixcrdc].[StudentClassGroupAssociation] ([ChangeVersion] ASC)
    GO
COMMIT

BEGIN TRANSACTION
    IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'edfixcrdc.StudentCommunityProviderLocationAssociation') AND name = N'UX_StudentCommunityProviderLocationAssociation_ChangeVersion')
    CREATE INDEX [UX_StudentCommunityProviderLocationAssociation_ChangeVersion] ON [edfixcrdc].[StudentCommunityProviderLocationAssociation] ([ChangeVersion] ASC)
    GO
COMMIT

