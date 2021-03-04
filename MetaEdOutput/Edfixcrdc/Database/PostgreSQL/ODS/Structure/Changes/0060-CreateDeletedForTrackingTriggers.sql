CREATE FUNCTION tracked_deletes_edfixcrdc.AlternativeStatusDescriptor_TR_DelTrkg()
    RETURNS trigger AS
$BODY$
BEGIN
    INSERT INTO tracked_deletes_edfixcrdc.AlternativeStatusDescriptor(AlternativeStatusDescriptorId, Id, ChangeVersion)
    SELECT OLD.AlternativeStatusDescriptorId, Id, nextval('changes.ChangeVersionSequence')
    FROM edfi.Descriptor WHERE DescriptorId = OLD.AlternativeStatusDescriptorId;
    RETURN NULL;
END;
$BODY$ LANGUAGE plpgsql;

CREATE TRIGGER TrackDeletes AFTER DELETE ON edfixcrdc.AlternativeStatusDescriptor 
    FOR EACH ROW EXECUTE PROCEDURE tracked_deletes_edfixcrdc.AlternativeStatusDescriptor_TR_DelTrkg();

CREATE FUNCTION tracked_deletes_edfixcrdc.ClassGroup_TR_DelTrkg()
    RETURNS trigger AS
$BODY$
BEGIN
    INSERT INTO tracked_deletes_edfixcrdc.ClassGroup(ClassGroupName, CommunityProviderId, CommunityProviderLocationId, SpecialNeedsProvidedIndicator, Id, ChangeVersion)
    VALUES (OLD.ClassGroupName, OLD.CommunityProviderId, OLD.CommunityProviderLocationId, OLD.SpecialNeedsProvidedIndicator, OLD.Id, nextval('changes.ChangeVersionSequence'));
    RETURN NULL;
END;
$BODY$ LANGUAGE plpgsql;

CREATE TRIGGER TrackDeletes AFTER DELETE ON edfixcrdc.ClassGroup 
    FOR EACH ROW EXECUTE PROCEDURE tracked_deletes_edfixcrdc.ClassGroup_TR_DelTrkg();

CREATE FUNCTION tracked_deletes_edfixcrdc.CommunityProviderLocation_TR_DelTrkg()
    RETURNS trigger AS
$BODY$
BEGIN
    INSERT INTO tracked_deletes_edfixcrdc.CommunityProviderLocation(CommunityProviderId, CommunityProviderLocationId, Id, ChangeVersion)
    VALUES (OLD.CommunityProviderId, OLD.CommunityProviderLocationId, OLD.Id, nextval('changes.ChangeVersionSequence'));
    RETURN NULL;
END;
$BODY$ LANGUAGE plpgsql;

CREATE TRIGGER TrackDeletes AFTER DELETE ON edfixcrdc.CommunityProviderLocation 
    FOR EACH ROW EXECUTE PROCEDURE tracked_deletes_edfixcrdc.CommunityProviderLocation_TR_DelTrkg();

CREATE FUNCTION tracked_deletes_edfixcrdc.MeetingDayDescriptor_TR_DelTrkg()
    RETURNS trigger AS
$BODY$
BEGIN
    INSERT INTO tracked_deletes_edfixcrdc.MeetingDayDescriptor(MeetingDayDescriptorId, Id, ChangeVersion)
    SELECT OLD.MeetingDayDescriptorId, Id, nextval('changes.ChangeVersionSequence')
    FROM edfi.Descriptor WHERE DescriptorId = OLD.MeetingDayDescriptorId;
    RETURN NULL;
END;
$BODY$ LANGUAGE plpgsql;

CREATE TRIGGER TrackDeletes AFTER DELETE ON edfixcrdc.MeetingDayDescriptor 
    FOR EACH ROW EXECUTE PROCEDURE tracked_deletes_edfixcrdc.MeetingDayDescriptor_TR_DelTrkg();

CREATE FUNCTION tracked_deletes_edfixcrdc.ProgramCostDescriptor_TR_DelTrkg()
    RETURNS trigger AS
$BODY$
BEGIN
    INSERT INTO tracked_deletes_edfixcrdc.ProgramCostDescriptor(ProgramCostDescriptorId, Id, ChangeVersion)
    SELECT OLD.ProgramCostDescriptorId, Id, nextval('changes.ChangeVersionSequence')
    FROM edfi.Descriptor WHERE DescriptorId = OLD.ProgramCostDescriptorId;
    RETURN NULL;
END;
$BODY$ LANGUAGE plpgsql;

CREATE TRIGGER TrackDeletes AFTER DELETE ON edfixcrdc.ProgramCostDescriptor 
    FOR EACH ROW EXECUTE PROCEDURE tracked_deletes_edfixcrdc.ProgramCostDescriptor_TR_DelTrkg();

CREATE FUNCTION tracked_deletes_edfixcrdc.RestraintCategoryDescriptor_TR_DelTrkg()
    RETURNS trigger AS
$BODY$
BEGIN
    INSERT INTO tracked_deletes_edfixcrdc.RestraintCategoryDescriptor(RestraintCategoryDescriptorId, Id, ChangeVersion)
    SELECT OLD.RestraintCategoryDescriptorId, Id, nextval('changes.ChangeVersionSequence')
    FROM edfi.Descriptor WHERE DescriptorId = OLD.RestraintCategoryDescriptorId;
    RETURN NULL;
END;
$BODY$ LANGUAGE plpgsql;

CREATE TRIGGER TrackDeletes AFTER DELETE ON edfixcrdc.RestraintCategoryDescriptor 
    FOR EACH ROW EXECUTE PROCEDURE tracked_deletes_edfixcrdc.RestraintCategoryDescriptor_TR_DelTrkg();

CREATE FUNCTION tracked_deletes_edfixcrdc.StudentClassGroupAssociation_TR_DelTrkg()
    RETURNS trigger AS
$BODY$
BEGIN
    INSERT INTO tracked_deletes_edfixcrdc.StudentClassGroupAssociation(BeginDate, ClassGroupName, CommunityProviderId, CommunityProviderLocationId, SpecialNeedsProvidedIndicator, StudentUSI, Id, ChangeVersion)
    VALUES (OLD.BeginDate, OLD.ClassGroupName, OLD.CommunityProviderId, OLD.CommunityProviderLocationId, OLD.SpecialNeedsProvidedIndicator, OLD.StudentUSI, OLD.Id, nextval('changes.ChangeVersionSequence'));
    RETURN NULL;
END;
$BODY$ LANGUAGE plpgsql;

CREATE TRIGGER TrackDeletes AFTER DELETE ON edfixcrdc.StudentClassGroupAssociation 
    FOR EACH ROW EXECUTE PROCEDURE tracked_deletes_edfixcrdc.StudentClassGroupAssociation_TR_DelTrkg();

CREATE FUNCTION tracked_deletes_edfixcrdc.StudentCommunityProviderLocationAssociation_TR_DelTrkg()
    RETURNS trigger AS
$BODY$
BEGIN
    INSERT INTO tracked_deletes_edfixcrdc.StudentCommunityProviderLocationAssociation(BeginDate, CommunityProviderId, CommunityProviderLocationId, StudentUSI, Id, ChangeVersion)
    VALUES (OLD.BeginDate, OLD.CommunityProviderId, OLD.CommunityProviderLocationId, OLD.StudentUSI, OLD.Id, nextval('changes.ChangeVersionSequence'));
    RETURN NULL;
END;
$BODY$ LANGUAGE plpgsql;

CREATE TRIGGER TrackDeletes AFTER DELETE ON edfixcrdc.StudentCommunityProviderLocationAssociation 
    FOR EACH ROW EXECUTE PROCEDURE tracked_deletes_edfixcrdc.StudentCommunityProviderLocationAssociation_TR_DelTrkg();

CREATE FUNCTION tracked_deletes_edfixcrdc.UngradedDetailDescriptor_TR_DelTrkg()
    RETURNS trigger AS
$BODY$
BEGIN
    INSERT INTO tracked_deletes_edfixcrdc.UngradedDetailDescriptor(UngradedDetailDescriptorId, Id, ChangeVersion)
    SELECT OLD.UngradedDetailDescriptorId, Id, nextval('changes.ChangeVersionSequence')
    FROM edfi.Descriptor WHERE DescriptorId = OLD.UngradedDetailDescriptorId;
    RETURN NULL;
END;
$BODY$ LANGUAGE plpgsql;

CREATE TRIGGER TrackDeletes AFTER DELETE ON edfixcrdc.UngradedDetailDescriptor 
    FOR EACH ROW EXECUTE PROCEDURE tracked_deletes_edfixcrdc.UngradedDetailDescriptor_TR_DelTrkg();

