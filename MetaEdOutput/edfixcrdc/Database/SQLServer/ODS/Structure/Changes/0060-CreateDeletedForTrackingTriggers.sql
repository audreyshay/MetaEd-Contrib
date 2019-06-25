CREATE TRIGGER [edfixcrdc].[edfixcrdc_AlternativeStatusDescriptor_TR_DeleteTracking] ON [edfixcrdc].[AlternativeStatusDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[edfixcrdc_AlternativeStatusDescriptor_TrackedDelete](AlternativeStatusDescriptorId, Id, ChangeVersion)
    SELECT  d.AlternativeStatusDescriptorId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.AlternativeStatusDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [edfixcrdc].[AlternativeStatusDescriptor] ENABLE TRIGGER [edfixcrdc_AlternativeStatusDescriptor_TR_DeleteTracking]
GO


CREATE TRIGGER [edfixcrdc].[edfixcrdc_ClassGroup_TR_DeleteTracking] ON [edfixcrdc].[ClassGroup] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[edfixcrdc_ClassGroup_TrackedDelete](ClassGroupName, CommunityProviderId, CommunityProviderLocationId, SpecialNeedsProvidedIndicator, Id, ChangeVersion)
    SELECT  ClassGroupName, CommunityProviderId, CommunityProviderLocationId, SpecialNeedsProvidedIndicator, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
END
GO

ALTER TABLE [edfixcrdc].[ClassGroup] ENABLE TRIGGER [edfixcrdc_ClassGroup_TR_DeleteTracking]
GO


CREATE TRIGGER [edfixcrdc].[edfixcrdc_CommunityProviderLocation_TR_DeleteTracking] ON [edfixcrdc].[CommunityProviderLocation] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[edfixcrdc_CommunityProviderLocation_TrackedDelete](CommunityProviderId, CommunityProviderLocationId, Id, ChangeVersion)
    SELECT  CommunityProviderId, CommunityProviderLocationId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
END
GO

ALTER TABLE [edfixcrdc].[CommunityProviderLocation] ENABLE TRIGGER [edfixcrdc_CommunityProviderLocation_TR_DeleteTracking]
GO


CREATE TRIGGER [edfixcrdc].[edfixcrdc_MeetingDayDescriptor_TR_DeleteTracking] ON [edfixcrdc].[MeetingDayDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[edfixcrdc_MeetingDayDescriptor_TrackedDelete](MeetingDayDescriptorId, Id, ChangeVersion)
    SELECT  d.MeetingDayDescriptorId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.MeetingDayDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [edfixcrdc].[MeetingDayDescriptor] ENABLE TRIGGER [edfixcrdc_MeetingDayDescriptor_TR_DeleteTracking]
GO


CREATE TRIGGER [edfixcrdc].[edfixcrdc_ProgramCostDescriptor_TR_DeleteTracking] ON [edfixcrdc].[ProgramCostDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[edfixcrdc_ProgramCostDescriptor_TrackedDelete](ProgramCostDescriptorId, Id, ChangeVersion)
    SELECT  d.ProgramCostDescriptorId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.ProgramCostDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [edfixcrdc].[ProgramCostDescriptor] ENABLE TRIGGER [edfixcrdc_ProgramCostDescriptor_TR_DeleteTracking]
GO


CREATE TRIGGER [edfixcrdc].[edfixcrdc_RestraintCategoryDescriptor_TR_DeleteTracking] ON [edfixcrdc].[RestraintCategoryDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[edfixcrdc_RestraintCategoryDescriptor_TrackedDelete](RestraintCategoryDescriptorId, Id, ChangeVersion)
    SELECT  d.RestraintCategoryDescriptorId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.RestraintCategoryDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [edfixcrdc].[RestraintCategoryDescriptor] ENABLE TRIGGER [edfixcrdc_RestraintCategoryDescriptor_TR_DeleteTracking]
GO


CREATE TRIGGER [edfixcrdc].[edfixcrdc_StudentClassGroupAssociation_TR_DeleteTracking] ON [edfixcrdc].[StudentClassGroupAssociation] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[edfixcrdc_StudentClassGroupAssociation_TrackedDelete](BeginDate, ClassGroupName, CommunityProviderId, CommunityProviderLocationId, SpecialNeedsProvidedIndicator, StudentUSI, Id, ChangeVersion)
    SELECT  BeginDate, ClassGroupName, CommunityProviderId, CommunityProviderLocationId, SpecialNeedsProvidedIndicator, StudentUSI, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
END
GO

ALTER TABLE [edfixcrdc].[StudentClassGroupAssociation] ENABLE TRIGGER [edfixcrdc_StudentClassGroupAssociation_TR_DeleteTracking]
GO


CREATE TRIGGER [edfixcrdc].[edfixcrdc_StudentCommunityProviderLocationAssociation_TR_DeleteTracking] ON [edfixcrdc].[StudentCommunityProviderLocationAssociation] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[edfixcrdc_StudentCommunityProviderLocationAssociation_TrackedDelete](BeginDate, CommunityProviderId, CommunityProviderLocationId, StudentUSI, Id, ChangeVersion)
    SELECT  BeginDate, CommunityProviderId, CommunityProviderLocationId, StudentUSI, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
END
GO

ALTER TABLE [edfixcrdc].[StudentCommunityProviderLocationAssociation] ENABLE TRIGGER [edfixcrdc_StudentCommunityProviderLocationAssociation_TR_DeleteTracking]
GO


CREATE TRIGGER [edfixcrdc].[edfixcrdc_UngradedDetailDescriptor_TR_DeleteTracking] ON [edfixcrdc].[UngradedDetailDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[edfixcrdc_UngradedDetailDescriptor_TrackedDelete](UngradedDetailDescriptorId, Id, ChangeVersion)
    SELECT  d.UngradedDetailDescriptorId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.UngradedDetailDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [edfixcrdc].[UngradedDetailDescriptor] ENABLE TRIGGER [edfixcrdc_UngradedDetailDescriptor_TR_DeleteTracking]
GO


