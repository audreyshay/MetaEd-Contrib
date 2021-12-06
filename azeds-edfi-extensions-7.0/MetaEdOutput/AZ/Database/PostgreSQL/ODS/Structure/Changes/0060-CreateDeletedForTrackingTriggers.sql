CREATE FUNCTION tracked_deletes_az.AbsenceAmountDescriptor_TR_DelTrkg()
    RETURNS trigger AS
$BODY$
BEGIN
    INSERT INTO tracked_deletes_az.AbsenceAmountDescriptor(AbsenceAmountDescriptorId, Id, ChangeVersion)
    SELECT OLD.AbsenceAmountDescriptorId, Id, nextval('changes.ChangeVersionSequence')
    FROM edfi.Descriptor WHERE DescriptorId = OLD.AbsenceAmountDescriptorId;
    RETURN NULL;
END;
$BODY$ LANGUAGE plpgsql;

CREATE TRIGGER TrackDeletes AFTER DELETE ON az.AbsenceAmountDescriptor 
    FOR EACH ROW EXECUTE PROCEDURE tracked_deletes_az.AbsenceAmountDescriptor_TR_DelTrkg();

CREATE FUNCTION tracked_deletes_az.AssessmentOutcomesSummaryDescriptor_TR_DelTrkg()
    RETURNS trigger AS
$BODY$
BEGIN
    INSERT INTO tracked_deletes_az.AssessmentOutcomesSummaryDescriptor(AssessmentOutcomesSummaryDescriptorId, Id, ChangeVersion)
    SELECT OLD.AssessmentOutcomesSummaryDescriptorId, Id, nextval('changes.ChangeVersionSequence')
    FROM edfi.Descriptor WHERE DescriptorId = OLD.AssessmentOutcomesSummaryDescriptorId;
    RETURN NULL;
END;
$BODY$ LANGUAGE plpgsql;

CREATE TRIGGER TrackDeletes AFTER DELETE ON az.AssessmentOutcomesSummaryDescriptor 
    FOR EACH ROW EXECUTE PROCEDURE tracked_deletes_az.AssessmentOutcomesSummaryDescriptor_TR_DelTrkg();

CREATE FUNCTION tracked_deletes_az.CourseEntryDescriptor_TR_DelTrkg()
    RETURNS trigger AS
$BODY$
BEGIN
    INSERT INTO tracked_deletes_az.CourseEntryDescriptor(CourseEntryDescriptorId, Id, ChangeVersion)
    SELECT OLD.CourseEntryDescriptorId, Id, nextval('changes.ChangeVersionSequence')
    FROM edfi.Descriptor WHERE DescriptorId = OLD.CourseEntryDescriptorId;
    RETURN NULL;
END;
$BODY$ LANGUAGE plpgsql;

CREATE TRIGGER TrackDeletes AFTER DELETE ON az.CourseEntryDescriptor 
    FOR EACH ROW EXECUTE PROCEDURE tracked_deletes_az.CourseEntryDescriptor_TR_DelTrkg();

CREATE FUNCTION tracked_deletes_az.CourseExitDescriptor_TR_DelTrkg()
    RETURNS trigger AS
$BODY$
BEGIN
    INSERT INTO tracked_deletes_az.CourseExitDescriptor(CourseExitDescriptorId, Id, ChangeVersion)
    SELECT OLD.CourseExitDescriptorId, Id, nextval('changes.ChangeVersionSequence')
    FROM edfi.Descriptor WHERE DescriptorId = OLD.CourseExitDescriptorId;
    RETURN NULL;
END;
$BODY$ LANGUAGE plpgsql;

CREATE TRIGGER TrackDeletes AFTER DELETE ON az.CourseExitDescriptor 
    FOR EACH ROW EXECUTE PROCEDURE tracked_deletes_az.CourseExitDescriptor_TR_DelTrkg();

CREATE FUNCTION tracked_deletes_az.EducationLevelDescriptor_TR_DelTrkg()
    RETURNS trigger AS
$BODY$
BEGIN
    INSERT INTO tracked_deletes_az.EducationLevelDescriptor(EducationLevelDescriptorId, Id, ChangeVersion)
    SELECT OLD.EducationLevelDescriptorId, Id, nextval('changes.ChangeVersionSequence')
    FROM edfi.Descriptor WHERE DescriptorId = OLD.EducationLevelDescriptorId;
    RETURN NULL;
END;
$BODY$ LANGUAGE plpgsql;

CREATE TRIGGER TrackDeletes AFTER DELETE ON az.EducationLevelDescriptor 
    FOR EACH ROW EXECUTE PROCEDURE tracked_deletes_az.EducationLevelDescriptor_TR_DelTrkg();

CREATE FUNCTION tracked_deletes_az.EndOfCourseAssessmentCodeDescriptor_TR_DelTrkg()
    RETURNS trigger AS
$BODY$
BEGIN
    INSERT INTO tracked_deletes_az.EndOfCourseAssessmentCodeDescriptor(EndOfCourseAssessmentCodeDescriptorId, Id, ChangeVersion)
    SELECT OLD.EndOfCourseAssessmentCodeDescriptorId, Id, nextval('changes.ChangeVersionSequence')
    FROM edfi.Descriptor WHERE DescriptorId = OLD.EndOfCourseAssessmentCodeDescriptorId;
    RETURN NULL;
END;
$BODY$ LANGUAGE plpgsql;

CREATE TRIGGER TrackDeletes AFTER DELETE ON az.EndOfCourseAssessmentCodeDescriptor 
    FOR EACH ROW EXECUTE PROCEDURE tracked_deletes_az.EndOfCourseAssessmentCodeDescriptor_TR_DelTrkg();

CREATE FUNCTION tracked_deletes_az.ExitWithdrawReasonDescriptor_TR_DelTrkg()
    RETURNS trigger AS
$BODY$
BEGIN
    INSERT INTO tracked_deletes_az.ExitWithdrawReasonDescriptor(ExitWithdrawReasonDescriptorId, Id, ChangeVersion)
    SELECT OLD.ExitWithdrawReasonDescriptorId, Id, nextval('changes.ChangeVersionSequence')
    FROM edfi.Descriptor WHERE DescriptorId = OLD.ExitWithdrawReasonDescriptorId;
    RETURN NULL;
END;
$BODY$ LANGUAGE plpgsql;

CREATE TRIGGER TrackDeletes AFTER DELETE ON az.ExitWithdrawReasonDescriptor 
    FOR EACH ROW EXECUTE PROCEDURE tracked_deletes_az.ExitWithdrawReasonDescriptor_TR_DelTrkg();

CREATE FUNCTION tracked_deletes_az.FinalLetterGradeDescriptor_TR_DelTrkg()
    RETURNS trigger AS
$BODY$
BEGIN
    INSERT INTO tracked_deletes_az.FinalLetterGradeDescriptor(FinalLetterGradeDescriptorId, Id, ChangeVersion)
    SELECT OLD.FinalLetterGradeDescriptorId, Id, nextval('changes.ChangeVersionSequence')
    FROM edfi.Descriptor WHERE DescriptorId = OLD.FinalLetterGradeDescriptorId;
    RETURN NULL;
END;
$BODY$ LANGUAGE plpgsql;

CREATE TRIGGER TrackDeletes AFTER DELETE ON az.FinalLetterGradeDescriptor 
    FOR EACH ROW EXECUTE PROCEDURE tracked_deletes_az.FinalLetterGradeDescriptor_TR_DelTrkg();

CREATE FUNCTION tracked_deletes_az.MembershipFTEDescriptor_TR_DelTrkg()
    RETURNS trigger AS
$BODY$
BEGIN
    INSERT INTO tracked_deletes_az.MembershipFTEDescriptor(MembershipFTEDescriptorId, Id, ChangeVersion)
    SELECT OLD.MembershipFTEDescriptorId, Id, nextval('changes.ChangeVersionSequence')
    FROM edfi.Descriptor WHERE DescriptorId = OLD.MembershipFTEDescriptorId;
    RETURN NULL;
END;
$BODY$ LANGUAGE plpgsql;

CREATE TRIGGER TrackDeletes AFTER DELETE ON az.MembershipFTEDescriptor 
    FOR EACH ROW EXECUTE PROCEDURE tracked_deletes_az.MembershipFTEDescriptor_TR_DelTrkg();

CREATE FUNCTION tracked_deletes_az.MembershipResponsibilityDescriptor_TR_DelTrkg()
    RETURNS trigger AS
$BODY$
BEGIN
    INSERT INTO tracked_deletes_az.MembershipResponsibilityDescriptor(MembershipResponsibilityDescriptorId, Id, ChangeVersion)
    SELECT OLD.MembershipResponsibilityDescriptorId, Id, nextval('changes.ChangeVersionSequence')
    FROM edfi.Descriptor WHERE DescriptorId = OLD.MembershipResponsibilityDescriptorId;
    RETURN NULL;
END;
$BODY$ LANGUAGE plpgsql;

CREATE TRIGGER TrackDeletes AFTER DELETE ON az.MembershipResponsibilityDescriptor 
    FOR EACH ROW EXECUTE PROCEDURE tracked_deletes_az.MembershipResponsibilityDescriptor_TR_DelTrkg();

CREATE FUNCTION tracked_deletes_az.MembershipTypeDescriptor_TR_DelTrkg()
    RETURNS trigger AS
$BODY$
BEGIN
    INSERT INTO tracked_deletes_az.MembershipTypeDescriptor(MembershipTypeDescriptorId, Id, ChangeVersion)
    SELECT OLD.MembershipTypeDescriptorId, Id, nextval('changes.ChangeVersionSequence')
    FROM edfi.Descriptor WHERE DescriptorId = OLD.MembershipTypeDescriptorId;
    RETURN NULL;
END;
$BODY$ LANGUAGE plpgsql;

CREATE TRIGGER TrackDeletes AFTER DELETE ON az.MembershipTypeDescriptor 
    FOR EACH ROW EXECUTE PROCEDURE tracked_deletes_az.MembershipTypeDescriptor_TR_DelTrkg();

CREATE FUNCTION tracked_deletes_az.MonthDescriptor_TR_DelTrkg()
    RETURNS trigger AS
$BODY$
BEGIN
    INSERT INTO tracked_deletes_az.MonthDescriptor(MonthDescriptorId, Id, ChangeVersion)
    SELECT OLD.MonthDescriptorId, Id, nextval('changes.ChangeVersionSequence')
    FROM edfi.Descriptor WHERE DescriptorId = OLD.MonthDescriptorId;
    RETURN NULL;
END;
$BODY$ LANGUAGE plpgsql;

CREATE TRIGGER TrackDeletes AFTER DELETE ON az.MonthDescriptor 
    FOR EACH ROW EXECUTE PROCEDURE tracked_deletes_az.MonthDescriptor_TR_DelTrkg();

CREATE FUNCTION tracked_deletes_az.NumberOfInstructionalDaysInWeekDescriptor_TR_DelTrkg()
    RETURNS trigger AS
$BODY$
BEGIN
    INSERT INTO tracked_deletes_az.NumberOfInstructionalDaysInWeekDescriptor(NumberOfInstructionalDaysInWeekDescriptorId, Id, ChangeVersion)
    SELECT OLD.NumberOfInstructionalDaysInWeekDescriptorId, Id, nextval('changes.ChangeVersionSequence')
    FROM edfi.Descriptor WHERE DescriptorId = OLD.NumberOfInstructionalDaysInWeekDescriptorId;
    RETURN NULL;
END;
$BODY$ LANGUAGE plpgsql;

CREATE TRIGGER TrackDeletes AFTER DELETE ON az.NumberOfInstructionalDaysInWeekDescriptor 
    FOR EACH ROW EXECUTE PROCEDURE tracked_deletes_az.NumberOfInstructionalDaysInWeekDescriptor_TR_DelTrkg();

CREATE FUNCTION tracked_deletes_az.PrimaryNightTimeResidenceDescriptor_TR_DelTrkg()
    RETURNS trigger AS
$BODY$
BEGIN
    INSERT INTO tracked_deletes_az.PrimaryNightTimeResidenceDescriptor(PrimaryNightTimeResidenceDescriptorId, Id, ChangeVersion)
    SELECT OLD.PrimaryNightTimeResidenceDescriptorId, Id, nextval('changes.ChangeVersionSequence')
    FROM edfi.Descriptor WHERE DescriptorId = OLD.PrimaryNightTimeResidenceDescriptorId;
    RETURN NULL;
END;
$BODY$ LANGUAGE plpgsql;

CREATE TRIGGER TrackDeletes AFTER DELETE ON az.PrimaryNightTimeResidenceDescriptor 
    FOR EACH ROW EXECUTE PROCEDURE tracked_deletes_az.PrimaryNightTimeResidenceDescriptor_TR_DelTrkg();

CREATE FUNCTION tracked_deletes_az.SpecialEnrollmentDescriptor_TR_DelTrkg()
    RETURNS trigger AS
$BODY$
BEGIN
    INSERT INTO tracked_deletes_az.SpecialEnrollmentDescriptor(SpecialEnrollmentDescriptorId, Id, ChangeVersion)
    SELECT OLD.SpecialEnrollmentDescriptorId, Id, nextval('changes.ChangeVersionSequence')
    FROM edfi.Descriptor WHERE DescriptorId = OLD.SpecialEnrollmentDescriptorId;
    RETURN NULL;
END;
$BODY$ LANGUAGE plpgsql;

CREATE TRIGGER TrackDeletes AFTER DELETE ON az.SpecialEnrollmentDescriptor 
    FOR EACH ROW EXECUTE PROCEDURE tracked_deletes_az.SpecialEnrollmentDescriptor_TR_DelTrkg();

CREATE FUNCTION tracked_deletes_az.StudentDropOutRecoveryProgramAssociation_TR_DelTrkg()
    RETURNS trigger AS
$BODY$
BEGIN
    INSERT INTO tracked_deletes_az.StudentDropOutRecoveryProgramAssociation(BeginDate, EducationOrganizationId, ProgramEducationOrganizationId, ProgramName, ProgramTypeDescriptorId, StudentUSI, Id, ChangeVersion)
    SELECT OLD.BeginDate, OLD.EducationOrganizationId, OLD.ProgramEducationOrganizationId, OLD.ProgramName, OLD.ProgramTypeDescriptorId, OLD.StudentUSI, Id, nextval('changes.ChangeVersionSequence')
    FROM edfi.GeneralStudentProgramAssociation WHERE BeginDate = OLD.BeginDate AND EducationOrganizationId = OLD.EducationOrganizationId AND ProgramEducationOrganizationId = OLD.ProgramEducationOrganizationId AND ProgramName = OLD.ProgramName AND ProgramTypeDescriptorId = OLD.ProgramTypeDescriptorId AND StudentUSI = OLD.StudentUSI;
    RETURN NULL;
END;
$BODY$ LANGUAGE plpgsql;

CREATE TRIGGER TrackDeletes AFTER DELETE ON az.StudentDropOutRecoveryProgramAssociation 
    FOR EACH ROW EXECUTE PROCEDURE tracked_deletes_az.StudentDropOutRecoveryProgramAssociation_TR_DelTrkg();

CREATE FUNCTION tracked_deletes_az.StudentDropOutRecoveryProgramMonthlyUpdate_TR_DelTrkg()
    RETURNS trigger AS
$BODY$
BEGIN
    INSERT INTO tracked_deletes_az.StudentDropOutRecoveryProgramMonthlyUpdate(BeginDate, EducationOrganizationId, MonthDescriptorId, ProgramEducationOrganizationId, ProgramName, ProgramTypeDescriptorId, StudentUSI, Id, ChangeVersion)
    VALUES (OLD.BeginDate, OLD.EducationOrganizationId, OLD.MonthDescriptorId, OLD.ProgramEducationOrganizationId, OLD.ProgramName, OLD.ProgramTypeDescriptorId, OLD.StudentUSI, OLD.Id, nextval('changes.ChangeVersionSequence'));
    RETURN NULL;
END;
$BODY$ LANGUAGE plpgsql;

CREATE TRIGGER TrackDeletes AFTER DELETE ON az.StudentDropOutRecoveryProgramMonthlyUpdate 
    FOR EACH ROW EXECUTE PROCEDURE tracked_deletes_az.StudentDropOutRecoveryProgramMonthlyUpdate_TR_DelTrkg();

CREATE FUNCTION tracked_deletes_az.StudentNeedCategoryDescriptor_TR_DelTrkg()
    RETURNS trigger AS
$BODY$
BEGIN
    INSERT INTO tracked_deletes_az.StudentNeedCategoryDescriptor(StudentNeedCategoryDescriptorId, Id, ChangeVersion)
    SELECT OLD.StudentNeedCategoryDescriptorId, Id, nextval('changes.ChangeVersionSequence')
    FROM edfi.Descriptor WHERE DescriptorId = OLD.StudentNeedCategoryDescriptorId;
    RETURN NULL;
END;
$BODY$ LANGUAGE plpgsql;

CREATE TRIGGER TrackDeletes AFTER DELETE ON az.StudentNeedCategoryDescriptor 
    FOR EACH ROW EXECUTE PROCEDURE tracked_deletes_az.StudentNeedCategoryDescriptor_TR_DelTrkg();

CREATE FUNCTION tracked_deletes_az.StudentNeedDescriptor_TR_DelTrkg()
    RETURNS trigger AS
$BODY$
BEGIN
    INSERT INTO tracked_deletes_az.StudentNeedDescriptor(StudentNeedDescriptorId, Id, ChangeVersion)
    SELECT OLD.StudentNeedDescriptorId, Id, nextval('changes.ChangeVersionSequence')
    FROM edfi.Descriptor WHERE DescriptorId = OLD.StudentNeedDescriptorId;
    RETURN NULL;
END;
$BODY$ LANGUAGE plpgsql;

CREATE TRIGGER TrackDeletes AFTER DELETE ON az.StudentNeedDescriptor 
    FOR EACH ROW EXECUTE PROCEDURE tracked_deletes_az.StudentNeedDescriptor_TR_DelTrkg();

CREATE FUNCTION tracked_deletes_az.StudentNeed_TR_DelTrkg()
    RETURNS trigger AS
$BODY$
BEGIN
    INSERT INTO tracked_deletes_az.StudentNeed(EducationOrganizationId, StudentNeedDescriptorId, StudentNeedEntryDate, StudentUSI, Id, ChangeVersion)
    VALUES (OLD.EducationOrganizationId, OLD.StudentNeedDescriptorId, OLD.StudentNeedEntryDate, OLD.StudentUSI, OLD.Id, nextval('changes.ChangeVersionSequence'));
    RETURN NULL;
END;
$BODY$ LANGUAGE plpgsql;

CREATE TRIGGER TrackDeletes AFTER DELETE ON az.StudentNeed 
    FOR EACH ROW EXECUTE PROCEDURE tracked_deletes_az.StudentNeed_TR_DelTrkg();

CREATE FUNCTION tracked_deletes_az.TuitionPayerDescriptor_TR_DelTrkg()
    RETURNS trigger AS
$BODY$
BEGIN
    INSERT INTO tracked_deletes_az.TuitionPayerDescriptor(TuitionPayerDescriptorId, Id, ChangeVersion)
    SELECT OLD.TuitionPayerDescriptorId, Id, nextval('changes.ChangeVersionSequence')
    FROM edfi.Descriptor WHERE DescriptorId = OLD.TuitionPayerDescriptorId;
    RETURN NULL;
END;
$BODY$ LANGUAGE plpgsql;

CREATE TRIGGER TrackDeletes AFTER DELETE ON az.TuitionPayerDescriptor 
    FOR EACH ROW EXECUTE PROCEDURE tracked_deletes_az.TuitionPayerDescriptor_TR_DelTrkg();

