CREATE FUNCTION tracked_deletes_edfixlearningmodality.ModalityTimeTypeDescriptor_TR_DelTrkg()
    RETURNS trigger AS
$BODY$
BEGIN
    INSERT INTO tracked_deletes_edfixlearningmodality.ModalityTimeTypeDescriptor(ModalityTimeTypeDescriptorId, Id, ChangeVersion)
    SELECT OLD.ModalityTimeTypeDescriptorId, Id, nextval('changes.ChangeVersionSequence')
    FROM edfi.Descriptor WHERE DescriptorId = OLD.ModalityTimeTypeDescriptorId;
    RETURN NULL;
END;
$BODY$ LANGUAGE plpgsql;

CREATE TRIGGER TrackDeletes AFTER DELETE ON edfixlearningmodality.ModalityTimeTypeDescriptor 
    FOR EACH ROW EXECUTE PROCEDURE tracked_deletes_edfixlearningmodality.ModalityTimeTypeDescriptor_TR_DelTrkg();

CREATE FUNCTION tracked_deletes_edfixlearningmodality.ModalityTypeDescriptor_TR_DelTrkg()
    RETURNS trigger AS
$BODY$
BEGIN
    INSERT INTO tracked_deletes_edfixlearningmodality.ModalityTypeDescriptor(ModalityTypeDescriptorId, Id, ChangeVersion)
    SELECT OLD.ModalityTypeDescriptorId, Id, nextval('changes.ChangeVersionSequence')
    FROM edfi.Descriptor WHERE DescriptorId = OLD.ModalityTypeDescriptorId;
    RETURN NULL;
END;
$BODY$ LANGUAGE plpgsql;

CREATE TRIGGER TrackDeletes AFTER DELETE ON edfixlearningmodality.ModalityTypeDescriptor 
    FOR EACH ROW EXECUTE PROCEDURE tracked_deletes_edfixlearningmodality.ModalityTypeDescriptor_TR_DelTrkg();

