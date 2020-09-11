CREATE FUNCTION tracked_deletes_edfixfinance.AccountTypeDescriptor_TR_DelTrkg()
    RETURNS trigger AS
$BODY$
BEGIN
    INSERT INTO tracked_deletes_edfixfinance.AccountTypeDescriptor(AccountTypeDescriptorId, Id, ChangeVersion)
    SELECT OLD.AccountTypeDescriptorId, Id, nextval('changes.ChangeVersionSequence')
    FROM edfi.Descriptor WHERE DescriptorId = OLD.AccountTypeDescriptorId;
    RETURN NULL;
END;
$BODY$ LANGUAGE plpgsql;

CREATE TRIGGER TrackDeletes AFTER DELETE ON edfixfinance.AccountTypeDescriptor 
    FOR EACH ROW EXECUTE PROCEDURE tracked_deletes_edfixfinance.AccountTypeDescriptor_TR_DelTrkg();

CREATE FUNCTION tracked_deletes_edfixfinance.BalanceSheetDimension_TR_DelTrkg()
    RETURNS trigger AS
$BODY$
BEGIN
    INSERT INTO tracked_deletes_edfixfinance.BalanceSheetDimension(Code, FiscalYear, Id, ChangeVersion)
    VALUES (OLD.Code, OLD.FiscalYear, OLD.Id, nextval('changes.ChangeVersionSequence'));
    RETURN NULL;
END;
$BODY$ LANGUAGE plpgsql;

CREATE TRIGGER TrackDeletes AFTER DELETE ON edfixfinance.BalanceSheetDimension 
    FOR EACH ROW EXECUTE PROCEDURE tracked_deletes_edfixfinance.BalanceSheetDimension_TR_DelTrkg();

CREATE FUNCTION tracked_deletes_edfixfinance.ChartOfAccount_TR_DelTrkg()
    RETURNS trigger AS
$BODY$
BEGIN
    INSERT INTO tracked_deletes_edfixfinance.ChartOfAccount(AccountIdentifier, EducationOrganizationId, FiscalYear, Id, ChangeVersion)
    VALUES (OLD.AccountIdentifier, OLD.EducationOrganizationId, OLD.FiscalYear, OLD.Id, nextval('changes.ChangeVersionSequence'));
    RETURN NULL;
END;
$BODY$ LANGUAGE plpgsql;

CREATE TRIGGER TrackDeletes AFTER DELETE ON edfixfinance.ChartOfAccount 
    FOR EACH ROW EXECUTE PROCEDURE tracked_deletes_edfixfinance.ChartOfAccount_TR_DelTrkg();

CREATE FUNCTION tracked_deletes_edfixfinance.FinancialCollectionDescriptor_TR_DelTrkg()
    RETURNS trigger AS
$BODY$
BEGIN
    INSERT INTO tracked_deletes_edfixfinance.FinancialCollectionDescriptor(FinancialCollectionDescriptorId, Id, ChangeVersion)
    SELECT OLD.FinancialCollectionDescriptorId, Id, nextval('changes.ChangeVersionSequence')
    FROM edfi.Descriptor WHERE DescriptorId = OLD.FinancialCollectionDescriptorId;
    RETURN NULL;
END;
$BODY$ LANGUAGE plpgsql;

CREATE TRIGGER TrackDeletes AFTER DELETE ON edfixfinance.FinancialCollectionDescriptor 
    FOR EACH ROW EXECUTE PROCEDURE tracked_deletes_edfixfinance.FinancialCollectionDescriptor_TR_DelTrkg();

CREATE FUNCTION tracked_deletes_edfixfinance.FunctionDimension_TR_DelTrkg()
    RETURNS trigger AS
$BODY$
BEGIN
    INSERT INTO tracked_deletes_edfixfinance.FunctionDimension(Code, FiscalYear, Id, ChangeVersion)
    VALUES (OLD.Code, OLD.FiscalYear, OLD.Id, nextval('changes.ChangeVersionSequence'));
    RETURN NULL;
END;
$BODY$ LANGUAGE plpgsql;

CREATE TRIGGER TrackDeletes AFTER DELETE ON edfixfinance.FunctionDimension 
    FOR EACH ROW EXECUTE PROCEDURE tracked_deletes_edfixfinance.FunctionDimension_TR_DelTrkg();

CREATE FUNCTION tracked_deletes_edfixfinance.FundDimension_TR_DelTrkg()
    RETURNS trigger AS
$BODY$
BEGIN
    INSERT INTO tracked_deletes_edfixfinance.FundDimension(Code, FiscalYear, Id, ChangeVersion)
    VALUES (OLD.Code, OLD.FiscalYear, OLD.Id, nextval('changes.ChangeVersionSequence'));
    RETURN NULL;
END;
$BODY$ LANGUAGE plpgsql;

CREATE TRIGGER TrackDeletes AFTER DELETE ON edfixfinance.FundDimension 
    FOR EACH ROW EXECUTE PROCEDURE tracked_deletes_edfixfinance.FundDimension_TR_DelTrkg();

CREATE FUNCTION tracked_deletes_edfixfinance.LocalAccount_TR_DelTrkg()
    RETURNS trigger AS
$BODY$
BEGIN
    INSERT INTO tracked_deletes_edfixfinance.LocalAccount(AccountIdentifier, EducationOrganizationId, FiscalYear, Id, ChangeVersion)
    VALUES (OLD.AccountIdentifier, OLD.EducationOrganizationId, OLD.FiscalYear, OLD.Id, nextval('changes.ChangeVersionSequence'));
    RETURN NULL;
END;
$BODY$ LANGUAGE plpgsql;

CREATE TRIGGER TrackDeletes AFTER DELETE ON edfixfinance.LocalAccount 
    FOR EACH ROW EXECUTE PROCEDURE tracked_deletes_edfixfinance.LocalAccount_TR_DelTrkg();

CREATE FUNCTION tracked_deletes_edfixfinance.LocalActual_TR_DelTrkg()
    RETURNS trigger AS
$BODY$
BEGIN
    INSERT INTO tracked_deletes_edfixfinance.LocalActual(AccountIdentifier, AsOfDate, EducationOrganizationId, FiscalYear, Id, ChangeVersion)
    VALUES (OLD.AccountIdentifier, OLD.AsOfDate, OLD.EducationOrganizationId, OLD.FiscalYear, OLD.Id, nextval('changes.ChangeVersionSequence'));
    RETURN NULL;
END;
$BODY$ LANGUAGE plpgsql;

CREATE TRIGGER TrackDeletes AFTER DELETE ON edfixfinance.LocalActual 
    FOR EACH ROW EXECUTE PROCEDURE tracked_deletes_edfixfinance.LocalActual_TR_DelTrkg();

CREATE FUNCTION tracked_deletes_edfixfinance.LocalBudget_TR_DelTrkg()
    RETURNS trigger AS
$BODY$
BEGIN
    INSERT INTO tracked_deletes_edfixfinance.LocalBudget(AccountIdentifier, AsOfDate, EducationOrganizationId, FiscalYear, Id, ChangeVersion)
    VALUES (OLD.AccountIdentifier, OLD.AsOfDate, OLD.EducationOrganizationId, OLD.FiscalYear, OLD.Id, nextval('changes.ChangeVersionSequence'));
    RETURN NULL;
END;
$BODY$ LANGUAGE plpgsql;

CREATE TRIGGER TrackDeletes AFTER DELETE ON edfixfinance.LocalBudget 
    FOR EACH ROW EXECUTE PROCEDURE tracked_deletes_edfixfinance.LocalBudget_TR_DelTrkg();

CREATE FUNCTION tracked_deletes_edfixfinance.ObjectDimension_TR_DelTrkg()
    RETURNS trigger AS
$BODY$
BEGIN
    INSERT INTO tracked_deletes_edfixfinance.ObjectDimension(Code, FiscalYear, Id, ChangeVersion)
    VALUES (OLD.Code, OLD.FiscalYear, OLD.Id, nextval('changes.ChangeVersionSequence'));
    RETURN NULL;
END;
$BODY$ LANGUAGE plpgsql;

CREATE TRIGGER TrackDeletes AFTER DELETE ON edfixfinance.ObjectDimension 
    FOR EACH ROW EXECUTE PROCEDURE tracked_deletes_edfixfinance.ObjectDimension_TR_DelTrkg();

CREATE FUNCTION tracked_deletes_edfixfinance.OperationalUnitDimension_TR_DelTrkg()
    RETURNS trigger AS
$BODY$
BEGIN
    INSERT INTO tracked_deletes_edfixfinance.OperationalUnitDimension(Code, FiscalYear, Id, ChangeVersion)
    VALUES (OLD.Code, OLD.FiscalYear, OLD.Id, nextval('changes.ChangeVersionSequence'));
    RETURN NULL;
END;
$BODY$ LANGUAGE plpgsql;

CREATE TRIGGER TrackDeletes AFTER DELETE ON edfixfinance.OperationalUnitDimension 
    FOR EACH ROW EXECUTE PROCEDURE tracked_deletes_edfixfinance.OperationalUnitDimension_TR_DelTrkg();

CREATE FUNCTION tracked_deletes_edfixfinance.ProgramDimension_TR_DelTrkg()
    RETURNS trigger AS
$BODY$
BEGIN
    INSERT INTO tracked_deletes_edfixfinance.ProgramDimension(Code, FiscalYear, Id, ChangeVersion)
    VALUES (OLD.Code, OLD.FiscalYear, OLD.Id, nextval('changes.ChangeVersionSequence'));
    RETURN NULL;
END;
$BODY$ LANGUAGE plpgsql;

CREATE TRIGGER TrackDeletes AFTER DELETE ON edfixfinance.ProgramDimension 
    FOR EACH ROW EXECUTE PROCEDURE tracked_deletes_edfixfinance.ProgramDimension_TR_DelTrkg();

CREATE FUNCTION tracked_deletes_edfixfinance.ProjectDimension_TR_DelTrkg()
    RETURNS trigger AS
$BODY$
BEGIN
    INSERT INTO tracked_deletes_edfixfinance.ProjectDimension(Code, FiscalYear, Id, ChangeVersion)
    VALUES (OLD.Code, OLD.FiscalYear, OLD.Id, nextval('changes.ChangeVersionSequence'));
    RETURN NULL;
END;
$BODY$ LANGUAGE plpgsql;

CREATE TRIGGER TrackDeletes AFTER DELETE ON edfixfinance.ProjectDimension 
    FOR EACH ROW EXECUTE PROCEDURE tracked_deletes_edfixfinance.ProjectDimension_TR_DelTrkg();

CREATE FUNCTION tracked_deletes_edfixfinance.ReportingTagDescriptor_TR_DelTrkg()
    RETURNS trigger AS
$BODY$
BEGIN
    INSERT INTO tracked_deletes_edfixfinance.ReportingTagDescriptor(ReportingTagDescriptorId, Id, ChangeVersion)
    SELECT OLD.ReportingTagDescriptorId, Id, nextval('changes.ChangeVersionSequence')
    FROM edfi.Descriptor WHERE DescriptorId = OLD.ReportingTagDescriptorId;
    RETURN NULL;
END;
$BODY$ LANGUAGE plpgsql;

CREATE TRIGGER TrackDeletes AFTER DELETE ON edfixfinance.ReportingTagDescriptor 
    FOR EACH ROW EXECUTE PROCEDURE tracked_deletes_edfixfinance.ReportingTagDescriptor_TR_DelTrkg();

CREATE FUNCTION tracked_deletes_edfixfinance.SourceDimension_TR_DelTrkg()
    RETURNS trigger AS
$BODY$
BEGIN
    INSERT INTO tracked_deletes_edfixfinance.SourceDimension(Code, FiscalYear, Id, ChangeVersion)
    VALUES (OLD.Code, OLD.FiscalYear, OLD.Id, nextval('changes.ChangeVersionSequence'));
    RETURN NULL;
END;
$BODY$ LANGUAGE plpgsql;

CREATE TRIGGER TrackDeletes AFTER DELETE ON edfixfinance.SourceDimension 
    FOR EACH ROW EXECUTE PROCEDURE tracked_deletes_edfixfinance.SourceDimension_TR_DelTrkg();

