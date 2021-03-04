CREATE TRIGGER UpdateChangeVersion BEFORE UPDATE ON edfixcrdc.ClassGroup
    FOR EACH ROW EXECUTE PROCEDURE changes.UpdateChangeVersion();

CREATE TRIGGER UpdateChangeVersion BEFORE UPDATE ON edfixcrdc.CommunityProviderLocation
    FOR EACH ROW EXECUTE PROCEDURE changes.UpdateChangeVersion();

CREATE TRIGGER UpdateChangeVersion BEFORE UPDATE ON edfixcrdc.StudentClassGroupAssociation
    FOR EACH ROW EXECUTE PROCEDURE changes.UpdateChangeVersion();

CREATE TRIGGER UpdateChangeVersion BEFORE UPDATE ON edfixcrdc.StudentCommunityProviderLocationAssociation
    FOR EACH ROW EXECUTE PROCEDURE changes.UpdateChangeVersion();

