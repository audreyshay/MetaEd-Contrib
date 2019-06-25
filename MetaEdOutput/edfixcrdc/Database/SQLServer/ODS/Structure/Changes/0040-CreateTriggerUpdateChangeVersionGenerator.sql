CREATE TRIGGER [edfixcrdc].[edfixcrdc_ClassGroup_TR_UpdateChangeVersion] ON [edfixcrdc].[ClassGroup] AFTER UPDATE AS
BEGIN
    SET NOCOUNT ON;
    UPDATE [edfixcrdc].[ClassGroup]
    SET ChangeVersion = (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM [edfixcrdc].[ClassGroup] u
    WHERE EXISTS (SELECT 1 FROM inserted i WHERE i.id = u.id);
END	
GO

CREATE TRIGGER [edfixcrdc].[edfixcrdc_CommunityProviderLocation_TR_UpdateChangeVersion] ON [edfixcrdc].[CommunityProviderLocation] AFTER UPDATE AS
BEGIN
    SET NOCOUNT ON;
    UPDATE [edfixcrdc].[CommunityProviderLocation]
    SET ChangeVersion = (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM [edfixcrdc].[CommunityProviderLocation] u
    WHERE EXISTS (SELECT 1 FROM inserted i WHERE i.id = u.id);
END	
GO

CREATE TRIGGER [edfixcrdc].[edfixcrdc_StudentClassGroupAssociation_TR_UpdateChangeVersion] ON [edfixcrdc].[StudentClassGroupAssociation] AFTER UPDATE AS
BEGIN
    SET NOCOUNT ON;
    UPDATE [edfixcrdc].[StudentClassGroupAssociation]
    SET ChangeVersion = (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM [edfixcrdc].[StudentClassGroupAssociation] u
    WHERE EXISTS (SELECT 1 FROM inserted i WHERE i.id = u.id);
END	
GO

CREATE TRIGGER [edfixcrdc].[edfixcrdc_StudentCommunityProviderLocationAssociation_TR_UpdateChangeVersion] ON [edfixcrdc].[StudentCommunityProviderLocationAssociation] AFTER UPDATE AS
BEGIN
    SET NOCOUNT ON;
    UPDATE [edfixcrdc].[StudentCommunityProviderLocationAssociation]
    SET ChangeVersion = (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM [edfixcrdc].[StudentCommunityProviderLocationAssociation] u
    WHERE EXISTS (SELECT 1 FROM inserted i WHERE i.id = u.id);
END	
GO

