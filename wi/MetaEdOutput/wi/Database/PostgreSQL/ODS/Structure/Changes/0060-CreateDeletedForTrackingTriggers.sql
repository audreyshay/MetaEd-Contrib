CREATE FUNCTION tracked_deletes_wi.CertificatedProgramStatusDescriptor_TR_DelTrkg()
    RETURNS trigger AS
$BODY$
BEGIN
    INSERT INTO tracked_deletes_wi.CertificatedProgramStatusDescriptor(CertificatedProgramStatusDescriptorId, Id, ChangeVersion)
    SELECT OLD.CertificatedProgramStatusDescriptorId, Id, nextval('changes.ChangeVersionSequence')
    FROM edfi.Descriptor WHERE DescriptorId = OLD.CertificatedProgramStatusDescriptorId;
    RETURN NULL;
END;
$BODY$ LANGUAGE plpgsql;

CREATE TRIGGER TrackDeletes AFTER DELETE ON wi.CertificatedProgramStatusDescriptor 
    FOR EACH ROW EXECUTE PROCEDURE tracked_deletes_wi.CertificatedProgramStatusDescriptor_TR_DelTrkg();

CREATE FUNCTION tracked_deletes_wi.CountDateNameDescriptor_TR_DelTrkg()
    RETURNS trigger AS
$BODY$
BEGIN
    INSERT INTO tracked_deletes_wi.CountDateNameDescriptor(CountDateNameDescriptorId, Id, ChangeVersion)
    SELECT OLD.CountDateNameDescriptorId, Id, nextval('changes.ChangeVersionSequence')
    FROM edfi.Descriptor WHERE DescriptorId = OLD.CountDateNameDescriptorId;
    RETURN NULL;
END;
$BODY$ LANGUAGE plpgsql;

CREATE TRIGGER TrackDeletes AFTER DELETE ON wi.CountDateNameDescriptor 
    FOR EACH ROW EXECUTE PROCEDURE tracked_deletes_wi.CountDateNameDescriptor_TR_DelTrkg();

CREATE FUNCTION tracked_deletes_wi.CountDateReceivingServiceDescriptor_TR_DelTrkg()
    RETURNS trigger AS
$BODY$
BEGIN
    INSERT INTO tracked_deletes_wi.CountDateReceivingServiceDescriptor(CountDateReceivingServiceDescriptorId, Id, ChangeVersion)
    SELECT OLD.CountDateReceivingServiceDescriptorId, Id, nextval('changes.ChangeVersionSequence')
    FROM edfi.Descriptor WHERE DescriptorId = OLD.CountDateReceivingServiceDescriptorId;
    RETURN NULL;
END;
$BODY$ LANGUAGE plpgsql;

CREATE TRIGGER TrackDeletes AFTER DELETE ON wi.CountDateReceivingServiceDescriptor 
    FOR EACH ROW EXECUTE PROCEDURE tracked_deletes_wi.CountDateReceivingServiceDescriptor_TR_DelTrkg();

CREATE FUNCTION tracked_deletes_wi.CteProgramAreaDescriptor_TR_DelTrkg()
    RETURNS trigger AS
$BODY$
BEGIN
    INSERT INTO tracked_deletes_wi.CteProgramAreaDescriptor(CteProgramAreaDescriptorId, Id, ChangeVersion)
    SELECT OLD.CteProgramAreaDescriptorId, Id, nextval('changes.ChangeVersionSequence')
    FROM edfi.Descriptor WHERE DescriptorId = OLD.CteProgramAreaDescriptorId;
    RETURN NULL;
END;
$BODY$ LANGUAGE plpgsql;

CREATE TRIGGER TrackDeletes AFTER DELETE ON wi.CteProgramAreaDescriptor 
    FOR EACH ROW EXECUTE PROCEDURE tracked_deletes_wi.CteProgramAreaDescriptor_TR_DelTrkg();

CREATE FUNCTION tracked_deletes_wi.EnrollmentTypeDescriptor_TR_DelTrkg()
    RETURNS trigger AS
$BODY$
BEGIN
    INSERT INTO tracked_deletes_wi.EnrollmentTypeDescriptor(EnrollmentTypeDescriptorId, Id, ChangeVersion)
    SELECT OLD.EnrollmentTypeDescriptorId, Id, nextval('changes.ChangeVersionSequence')
    FROM edfi.Descriptor WHERE DescriptorId = OLD.EnrollmentTypeDescriptorId;
    RETURN NULL;
END;
$BODY$ LANGUAGE plpgsql;

CREATE TRIGGER TrackDeletes AFTER DELETE ON wi.EnrollmentTypeDescriptor 
    FOR EACH ROW EXECUTE PROCEDURE tracked_deletes_wi.EnrollmentTypeDescriptor_TR_DelTrkg();

CREATE FUNCTION tracked_deletes_wi.IacCodeDescriptor_TR_DelTrkg()
    RETURNS trigger AS
$BODY$
BEGIN
    INSERT INTO tracked_deletes_wi.IacCodeDescriptor(IacCodeDescriptorId, Id, ChangeVersion)
    SELECT OLD.IacCodeDescriptorId, Id, nextval('changes.ChangeVersionSequence')
    FROM edfi.Descriptor WHERE DescriptorId = OLD.IacCodeDescriptorId;
    RETURN NULL;
END;
$BODY$ LANGUAGE plpgsql;

CREATE TRIGGER TrackDeletes AFTER DELETE ON wi.IacCodeDescriptor 
    FOR EACH ROW EXECUTE PROCEDURE tracked_deletes_wi.IacCodeDescriptor_TR_DelTrkg();

CREATE FUNCTION tracked_deletes_wi.ModifiedTermDescriptor_TR_DelTrkg()
    RETURNS trigger AS
$BODY$
BEGIN
    INSERT INTO tracked_deletes_wi.ModifiedTermDescriptor(ModifiedTermDescriptorId, Id, ChangeVersion)
    SELECT OLD.ModifiedTermDescriptorId, Id, nextval('changes.ChangeVersionSequence')
    FROM edfi.Descriptor WHERE DescriptorId = OLD.ModifiedTermDescriptorId;
    RETURN NULL;
END;
$BODY$ LANGUAGE plpgsql;

CREATE TRIGGER TrackDeletes AFTER DELETE ON wi.ModifiedTermDescriptor 
    FOR EACH ROW EXECUTE PROCEDURE tracked_deletes_wi.ModifiedTermDescriptor_TR_DelTrkg();

CREATE FUNCTION tracked_deletes_wi.StateEndorsedRegionalCareerPathwayStatusDescriptor_TR_DelTrkg()
    RETURNS trigger AS
$BODY$
BEGIN
    INSERT INTO tracked_deletes_wi.StateEndorsedRegionalCareerPathwayStatusDescriptor(StateEndorsedRegionalCareerPathwayStatusDescriptorId, Id, ChangeVersion)
    SELECT OLD.StateEndorsedRegionalCareerPathwayStatusDescriptorId, Id, nextval('changes.ChangeVersionSequence')
    FROM edfi.Descriptor WHERE DescriptorId = OLD.StateEndorsedRegionalCareerPathwayStatusDescriptorId;
    RETURN NULL;
END;
$BODY$ LANGUAGE plpgsql;

CREATE TRIGGER TrackDeletes AFTER DELETE ON wi.StateEndorsedRegionalCareerPathwayStatusDescriptor 
    FOR EACH ROW EXECUTE PROCEDURE tracked_deletes_wi.StateEndorsedRegionalCareerPathwayStatusDescriptor_TR_DelTrkg();

