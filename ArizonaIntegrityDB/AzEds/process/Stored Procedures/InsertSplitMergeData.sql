/************************************************************************************************
** Procedure Name:
**      leadata.InsertSplitMergeData
**
** Author:
**      "The" Martez Killens
**
** Description:
**      Inserts Split Merge Data (IDs, Detail reference to Identity Database) 
**      and cleans up integrity schema
**
** Output:
**		None
** Returns:
**
** Revision History:
**	Who				When		What
**	Martez Killens	08/05/2015	Initial Creation
**	Martez Killens	01/27/2016	Fixing for composite foreign keys ie. SSA, SSAFTE, SSATP, etc
                                                     ie. SSA, SSAFTE, SSATP, etc
**	Martez Killens	07/28/2016	Defensive redesing to block conflicts
**	Martez Killens	08/01/2016	Adding Dropout Recovery Tables
**	Viju   V		05/22/2017	AzEDS 3.0 Changes
**	Martez Killens	06/28/2017	AzEDS 3.0 Updates for StudentCharacteristics
**	Martez Killens	07/12/2017	AzEDS 3.0 Update dynamic sql to generate birthCity/CityOfBirth field based on fiscal year
**	Pratibha K		11/26/2018	Updating Old StudentUniqueId also, to New StudentUniqueId in IntegrityNeed table
**	Vinoth K		03/21/2018	Modified the proc based on the EDfi 3.0
**
******************************************************************************************************************/

CREATE PROCEDURE [process].[InsertSplitMergeData]
         @oldPersonId nvarchar(50),
         @newPersonId nvarchar(50),
         @splitMergeDetailId int,
         @completedDate datetime
AS
BEGIN

    BEGIN TRY

    DECLARE @splitMergeTypeId int
    DECLARE @OldUSI INT
    DECLARE @NewUSI INT

    SELECT @OldUSI = StudentUSI
    FROM leadata.Student
    WHERE StudentUniqueId = @oldPersonId

    SELECT @NewUSI = StudentUSI
    FROM leadata.Student
    WHERE StudentUniqueId = @newPersonId

    BEGIN TRANSACTION MergeTransaction

    --Fix for target student not existing in AzEDS DB
    --Attempt to retrieve it from active database
    IF (@NewUSI IS NULL)
    BEGIN
        DECLARE @databaseFiscalYearFormat nvarchar(10) = 'LEAData_FY'
        DECLARE @sql nvarchar(3500)
        DECLARE @databaseName nvarchar(14)
        DECLARE @fiscalYear int
        DECLARE @yearSpecificSql nvarchar(2000)

        SELECT fy.FiscalYear, fy.IsCurrent, fy.IsActive
        INTO #configTemp
        FROM config.FiscalYear fy
        WHERE IsCurrent = 1 OR IsActive = 1

        WHILE EXISTS(SELECT * FROM #configTemp)
        BEGIN
            SELECT TOP 1 @fiscalYear = FiscalYear 
            FROM #configTemp
            ORDER BY IsCurrent desc, FiscalYear desc

            SET @databaseName = CONCAT(@databaseFiscalYearFormat, @FiscalYear)

            DELETE #configTemp
            WHERE FiscalYear = @fiscalYear

			IF @fiscalYear >= 2020
            BEGIN

				SET @yearSpecificSql = 
						', BirthCity
						, CDT.CountryCodeTypeId			AS BirthCountryCodeTypeId
						, SE.SexTypeId					AS SexTypeId
						, SAT.StateAbbreviationTypeId		AS BirthStateAbbreviationTypeId
						, NULL
					FROM ' + @databaseName + '.edfi.Student S WITH (NOLOCK)
					JOIN AzEds.xref.CountryDescriptorType CDT
					 ON S.BirthCountryDescriptorId = CDT.CountryDescriptorId
					LEFT JOIN ' + @databaseName + '.edfi.descriptor D WITH (NOLOCK)
					 ON S.BirthStateAbbreviationDescriptorId = D.Descriptorid
					LEFT JOIN AzEDS.[leadata].[StateAbbreviationType] SAT WITH (NOLOCK)
					 ON D.CodeValue = SAT.CodeValue
					LEFT JOIN ' + @databaseName + '.edfi.descriptor SD WITH (NOLOCK)
					 ON S.BirthSexDescriptorId = SD.Descriptorid
					LEFT JOIN AzEDS.[leadata].[sextype] SE WITH (NOLOCK)
					 ON SD.CodeValue = SE.CodeValue
					WHERE StudentUniqueId = ' + @newPersonId;
            END
            ELSE IF @fiscalYear > 2017 and @fiscalYear <= 2019
            BEGIN

				SET @yearSpecificSql = 
						', BirthCity
						, CDT.CountryCodeTypeId			AS BirthCountryCodeTypeId
						, SexTypeId      
						, BirthStateAbbreviationTypeId      
						, HispanicLatinoEthnicity      
					FROM ' + @databaseName + '.edfi.Student S WITH (NOLOCK)
					JOIN AzEds.xref.CountryDescriptorType CDT
					 ON S.BirthCountryDescriptorId = CDT.CountryDescriptorId
					WHERE StudentUniqueId = ' + @newPersonId;
            END
            ELSE
            BEGIN
    --            
				SET @yearSpecificSql = 
						', CityOfBirth
						, BirthCountryCodeTypeId
						, SexTypeId 
						, BirthStateAbbreviationTypeId           
						, HispanicLatinoEthnicity      
					FROM ' + @databaseName + '.edfi.Student S WITH (NOLOCK)
					WHERE StudentUniqueId = ' + @newPersonId;

            END

            SET @sql = 
            'INSERT INTO leadata.Student
            (
				 PersonalTitlePrefix
				, FirstName      
				, MiddleName      
				, LastSurname      
				, GenerationCodeSuffix      
				, MaidenName      
				, BirthDate      
				, StudentUniqueId      
				, SourceId      
				, CreateDate      
				, LastModifiedDate
				, CityOfBirth
				, BirthCountryCodeTypeId
				, SexTypeId
				, BirthStateAbbreviationTypeId  
				, HispanicLatinoEthnicity          
            )
            SELECT
				PersonalTitlePrefix
				, FirstName      
				, MiddleName      
				, LastSurname      
				, GenerationCodeSuffix      
				, MaidenName      
				, BirthDate      
				, StudentUniqueId      
				, S.Id      
				, S.CreateDate      
				, S.LastModifiedDate'

			SET @sql = @sql + @yearSpecificSql
            
            --Try to bring over target student
            EXEC sp_executesql @sql

            --Again try to set the USI 
            SELECT @NewUSI = StudentUSI
            FROM leadata.Student
            WHERE StudentUniqueId = @newPersonId

            --If target USI set continue procedure
            IF (@NewUSI IS NOT NULL)
            BEGIN
                BREAK;
            END
        END
    END

    --If target USI still null leave procedure
    IF (@NewUSI IS NULL)
    BEGIN
        RAISERROR('Unable to locate suitable target student to merge.', 16, 1);
    END

    INSERT INTO process.SplitMergeData
    (
    NewPersonID,
    NewPersonUSI,
    OldPersonID,
    OldPersonUSI,
    SplitMergeDetailId,
    CompletedDate
    )
    VALUES
    (
    @newPersonId,
    @NewUSI,
    @oldPersonId,
    @OldUSI,
    @splitMergeDetailId,
    @completedDate
    )

    UPDATE integrity.IntegrityNeed 
    SET StudentUSI = @newUSI, StudentUniqueId = @newPersonId		-- updating Old StudentUniqueId also to New StudentUniqueId
    WHERE StudentUSI = @oldUSI

    SELECT * 
    INTO #StudentAddress
    FROM leadata.StudentAddress 
    WHERE StudentUSI = @OldUSI

    SELECT * 
    INTO #StudentCharacteristic
    FROM leadata.StudentCharacteristic 
    WHERE StudentUSI = @OldUSI

	SELECT * 
    INTO #StudentCharacteristicPeriod
    FROM leadata.StudentCharacteristicPeriod 
    WHERE StudentUSI = @OldUSI

    SELECT * 
    INTO #StudentIdentificationCode
    FROM leadata.StudentIdentificationCode 
    WHERE StudentUSI = @OldUSI

    SELECT * 
    INTO #StudentLanguage
    FROM leadata.StudentLanguage 
    WHERE StudentUSI = @OldUSI

	SELECT * 
    INTO #StudentLanguageUse
    FROM leadata.StudentLanguageUse
    WHERE StudentUSI = @OldUSI

    SELECT * 
    INTO #StudentNeed
    FROM leadata.StudentNeed 
    WHERE StudentUSI = @OldUSI

	SELECT * 
    INTO #StudentOtherName
    FROM leadata.StudentOtherName 
    WHERE StudentUSI = @OldUSI

    SELECT * 
    INTO #StudentProgramAssociation
    FROM leadata.StudentProgramAssociation 
    WHERE StudentUSI = @OldUSI

	
    SELECT * 
    INTO #StudentProgramAssociationService
    FROM leadata.StudentProgramAssociationService 
    WHERE StudentUSI = @OldUSI

	SELECT * 
    INTO #StudentProgramAttendanceEvent
    FROM leadata.StudentProgramAttendanceEvent 
    WHERE StudentUSI = @OldUSI

	SELECT * 
    INTO #StudentProgramAttendanceEventTimeLog
    FROM leadata.StudentProgramAttendanceEventTimeLog 
    WHERE StudentUSI = @OldUSI

    SELECT * 
    INTO #StudentRace
    FROM leadata.StudentRace 
    WHERE StudentUSI = @OldUSI

    SELECT * 
    INTO #StudentDropOutRecoveryProgramAssociation
    FROM leadata.StudentDropOutRecoveryProgramAssociation 
    WHERE StudentUSI = @OldUSI

    SELECT * 
    INTO #StudentDropOutRecoveryProgramMonthlyUpdate
    FROM leadata.StudentDropOutRecoveryProgramMonthlyUpdate
    WHERE StudentUSI = @OldUSI

    SELECT * 
    INTO #StudentSpecialEducationProgramAssociation
    FROM leadata.StudentSpecialEducationProgramAssociation 
    WHERE StudentUSI = @OldUSI

	SELECT * 
    INTO #StudentEducationOrganizationAssociation
    FROM leadata.StudentEducationOrganizationAssociation 
    WHERE StudentUSI = @OldUSI

    SELECT * 
    INTO #StudentSchoolAssociation
    FROM leadata.StudentSchoolAssociation 
    WHERE StudentUSI = @OldUSI

    SELECT * 
    INTO #StudentSchoolAssociationMembershipFTE
    FROM leadata.StudentSchoolAssociationMembershipFTE 
    WHERE StudentUSI = @OldUSI

    SELECT * 
    INTO #StudentSchoolAssociationSpecialEnrollment
    FROM leadata.StudentSchoolAssociationSpecialEnrollment 
    WHERE StudentUSI = @OldUSI

    SELECT * 
    INTO #StudentSchoolAssociationTuitionPayer
    FROM leadata.StudentSchoolAssociationTuitionPayer 
    WHERE StudentUSI = @OldUSI

	SELECT * 
    INTO #StudentSchoolAssociationLocalEducationAgency
    FROM leadata.StudentSchoolAssociationLocalEducationAgency 
    WHERE StudentUSI = @OldUSI

    SELECT * 
    INTO #StudentSchoolAttendanceEvent
    FROM leadata.StudentSchoolAttendanceEvent 
    WHERE StudentUSI = @OldUSI

    SELECT * 
    INTO #StudentSectionAssociation
    FROM leadata.StudentSectionAssociation
    WHERE StudentUSI = @OldUSI

	SELECT * 
    INTO #StudentEducationOrganizationAssociationTribalAffiliation
    FROM leadata.StudentEducationOrganizationAssociationTribalAffiliation
    WHERE StudentUSI = @OldUSI


    UPDATE #StudentAddress
    SET StudentUSI = @NewUSI

    UPDATE #StudentCharacteristic
    SET StudentUSI = @NewUSI

    UPDATE #StudentCharacteristicPeriod
    SET StudentUSI = @NewUSI

    UPDATE #StudentIdentificationCode
    SET StudentUSI = @NewUSI

    UPDATE #StudentLanguage
    SET StudentUSI = @NewUSI

	UPDATE #StudentLanguageUse
    SET StudentUSI = @NewUSI

    UPDATE #StudentNeed
    SET StudentUSI = @NewUSI

	UPDATE #StudentOtherName
    SET StudentUSI = @NewUSI

    UPDATE #StudentProgramAssociation
    SET StudentUSI = @NewUSI
	
    UPDATE #StudentProgramAssociationService
    SET StudentUSI = @NewUSI

	UPDATE #StudentProgramAttendanceEvent
    SET StudentUSI = @NewUSI

	UPDATE #StudentProgramAttendanceEventTimeLog
    SET StudentUSI = @NewUSI

    UPDATE #StudentRace
    SET StudentUSI = @NewUSI

    UPDATE #StudentDropOutRecoveryProgramAssociation
    SET StudentUSI = @NewUSI

    UPDATE #StudentDropOutRecoveryProgramMonthlyUpdate
    SET StudentUSI = @NewUSI
    
    UPDATE #StudentSpecialEducationProgramAssociation
    SET StudentUSI = @NewUSI

    UPDATE #StudentEducationOrganizationAssociation
    SET StudentUSI = @NewUSI

    UPDATE #StudentSchoolAssociation
    SET StudentUSI = @NewUSI

    UPDATE #StudentSchoolAssociationMembershipFTE
    SET StudentUSI = @NewUSI

    UPDATE #StudentSchoolAssociationSpecialEnrollment
    SET StudentUSI = @NewUSI

    UPDATE #StudentSchoolAssociationTuitionPayer
    SET StudentUSI = @NewUSI

    UPDATE #StudentSchoolAssociationLocalEducationAgency
    SET StudentUSI = @NewUSI

    UPDATE #StudentSchoolAttendanceEvent
    SET StudentUSI = @NewUSI

    UPDATE #StudentSectionAssociation
    SET StudentUSI = @NewUSI

	UPDATE #StudentEducationOrganizationAssociationTribalAffiliation
    SET StudentUSI = @NewUSI

    DELETE FROM leadata.StudentSectionAssociation
    WHERE StudentUSI = @OldUSI

    DELETE FROM leadata.StudentSchoolAttendanceEvent
    WHERE StudentUSI = @OldUSI

	DELETE FROM leadata.StudentSchoolAssociationLocalEducationAgency
    WHERE StudentUSI = @OldUSI

    DELETE FROM leadata.StudentSchoolAssociationTuitionPayer
    WHERE StudentUSI = @OldUSI

    DELETE FROM leadata.StudentSchoolAssociationSpecialEnrollment
    WHERE StudentUSI = @OldUSI

    DELETE FROM leadata.StudentSchoolAssociationMembershipFTE
    WHERE StudentUSI = @OldUSI

    DELETE FROM leadata.StudentSchoolAssociation
    WHERE StudentUSI = @OldUSI

    DELETE FROM leadata.StudentSpecialEducationProgramAssociation 
    WHERE StudentUSI = @OldUSI

    DELETE FROM leadata.StudentDropOutRecoveryProgramMonthlyUpdate
    WHERE StudentUSI = @OldUSI

    DELETE FROM leadata.StudentDropOutRecoveryProgramAssociation
    WHERE StudentUSI = @OldUSI

    DELETE FROM leadata.StudentRace
    WHERE StudentUSI = @OldUSI

    DELETE FROM leadata.StudentProgramAssociationService
    WHERE StudentUSI = @OldUSI

    DELETE FROM leadata.StudentProgramAssociation
    WHERE StudentUSI = @OldUSI

	DELETE FROM leadata.StudentProgramAttendanceEventTimeLog
    WHERE StudentUSI = @OldUSI

	DELETE FROM leadata.StudentProgramAttendanceEvent
    WHERE StudentUSI = @OldUSI

    DELETE FROM leadata.StudentNeed
    WHERE StudentUSI = @OldUSI

	DELETE FROM leadata.StudentLanguageUse
    WHERE StudentUSI = @OldUSI

    DELETE FROM leadata.StudentLanguage
    WHERE StudentUSI = @OldUSI

    DELETE FROM leadata.StudentIdentificationCode
    WHERE StudentUSI = @OldUSI

	DELETE FROM leadata.StudentCharacteristicPeriod
    WHERE StudentUSI = @OldUSI

    DELETE FROM leadata.StudentCharacteristic
    WHERE StudentUSI = @OldUSI

    DELETE FROM leadata.StudentAddress
    WHERE StudentUSI = @OldUSI

	DELETE FROM leadata.StudentEducationOrganizationAssociationTribalAffiliation
    WHERE StudentUSI = @OldUSI

	DELETE FROM leadata.StudentEducationOrganizationAssociation
    WHERE StudentUSI = @OldUSI

    INSERT INTO leadata.StudentAddress
    SELECT *
    FROM #StudentAddress new
    WHERE NOT EXISTS 
    (
        SELECT 1
        FROM leadata.StudentAddress old
        WHERE new.StudentUSI = old.StudentUSI
        AND new.AddressTypeId = old.AddressTypeId
    )

    INSERT INTO leadata.StudentCharacteristic
    SELECT *
    FROM #StudentCharacteristic new
    WHERE NOT EXISTS 
    (
        SELECT 1
        FROM leadata.StudentCharacteristic old
        WHERE new.StudentUSI = old.StudentUSI
        AND new.StudentCharacteristicDescriptorId = old.StudentCharacteristicDescriptorId
    )

    INSERT INTO leadata.StudentCharacteristicPeriod
    SELECT *
    FROM #StudentCharacteristicPeriod new
    WHERE NOT EXISTS 
    (
        SELECT 1
        FROM leadata.StudentCharacteristicPeriod old
        WHERE new.StudentUSI = old.StudentUSI
        AND new.StudentCharacteristicDescriptorId = old.StudentCharacteristicDescriptorId
		AND new.BeginDate = old.BeginDate
		AND new.educationOrganizationId=old.educationOrganizationId
    )

    INSERT INTO leadata.StudentIdentificationCode
    SELECT *
    FROM #StudentIdentificationCode new
    WHERE NOT EXISTS 
    (
        SELECT 1
        FROM leadata.StudentIdentificationCode old
        WHERE new.StudentUSI = old.StudentUSI
        AND new.StudentIdentificationSystemTypeId = old.StudentIdentificationSystemTypeId
        AND new.AssigningOrganizationIdentificationCode = old.AssigningOrganizationIdentificationCode
    )

    INSERT INTO leadata.StudentLanguage
    SELECT *
    FROM #StudentLanguage new
    WHERE NOT EXISTS 
    (
        SELECT 1
        FROM leadata.StudentLanguage old
        WHERE new.StudentUSI = old.StudentUSI
        AND new.LanguageDescriptorId = old.LanguageDescriptorId
		AND new.EducationOrganizationId = old.EducationOrganizationId
    )

	INSERT INTO leadata.StudentLanguageUse
    SELECT *
    FROM #StudentLanguageUse new
    WHERE NOT EXISTS 
    (
        SELECT 1
        FROM leadata.StudentLanguageUse old
        WHERE new.StudentUSI = old.StudentUSI
        AND new.LanguageDescriptorId = old.LanguageDescriptorId
		AND new.LanguageUseTypeId = old.LanguageUseTypeId
		AND new.EducationOrganizationId = old.EducationOrganizationId
    )

    INSERT INTO leadata.StudentNeed
    SELECT *
    FROM #StudentNeed new
    WHERE NOT EXISTS 
    (
        SELECT 1
        FROM leadata.StudentNeed old
        WHERE new.StudentUSI = old.StudentUSI
        AND new.FiscalYear = old.FiscalYear
        AND new.ReportingEducationOrganizationID = old.ReportingEducationOrganizationID
        AND new.StudentNeedDescriptorId = old.StudentNeedDescriptorId
        AND new.StudentNeedEntryDate = old.StudentNeedEntryDate
    )

	INSERT INTO leadata.StudentOtherName
    SELECT *
    FROM #StudentOtherName new
    WHERE NOT EXISTS 
    (
        SELECT 1
        FROM leadata.StudentOtherName old
        WHERE new.StudentUSI = old.StudentUSI
        AND new.OtherNameTypeId = old.OtherNameTypeId
    )

    INSERT INTO leadata.StudentProgramAssociation
    SELECT *
    FROM #StudentProgramAssociation new
    WHERE NOT EXISTS 
    (
        SELECT 1
        FROM leadata.StudentProgramAssociation old
        WHERE new.StudentUSI = old.StudentUSI
        AND new.FiscalYear = old.FiscalYear
        AND new.ProgramTypeId = old.ProgramTypeId
        AND new.ProgramName = old.ProgramName
        AND new.ProgramEducationOrganizationId = old.ProgramEducationOrganizationId
        AND new.BeginDate = old.BeginDate
        AND new.EducationOrganizationId = old.EducationOrganizationId
    )

	INSERT INTO leadata.StudentProgramAssociationService
    SELECT *
    FROM #StudentProgramAssociationService new
    WHERE NOT EXISTS 
    (
        SELECT 1
        FROM leadata.StudentProgramAssociationService old
        WHERE new.StudentUSI = old.StudentUSI
        AND new.FiscalYear = old.FiscalYear
        AND new.EducationOrganizationId = old.EducationOrganizationId
		AND new.ProgramTypeId = old.ProgramTypeId
        AND new.ProgramName = old.ProgramName
        AND new.ProgramEducationOrganizationId = old.ProgramEducationOrganizationId
        AND new.BeginDate = old.BeginDate
		AND new.ServiceDescriptorId = old.ServiceDescriptorId
    )

	INSERT INTO leadata.StudentProgramAttendanceEvent
    SELECT *
    FROM #StudentProgramAttendanceEvent new
    WHERE NOT EXISTS 
    (
        SELECT 1
        FROM leadata.StudentProgramAttendanceEvent old
        WHERE new.StudentUSI = old.StudentUSI
        AND new.FiscalYear = old.FiscalYear
        AND new.ProgramEducationOrganizationId = old.ProgramEducationOrganizationId
		AND new.ProgramTypeId = old.ProgramTypeId
		AND new.EventDate = old.EventDate
		AND new.AttendanceEventCategoryDescriptorId = old.AttendanceEventCategoryDescriptorId
        AND new.ProgramName = old.ProgramName
        AND new.EducationOrganizationId = old.EducationOrganizationId
    )

	INSERT INTO leadata.StudentProgramAttendanceEventTimeLog
    SELECT *
    FROM #StudentProgramAttendanceEventTimeLog new
    WHERE NOT EXISTS 
    (
        SELECT 1
        FROM leadata.StudentProgramAttendanceEventTimeLog old
        WHERE new.StudentUSI = old.StudentUSI
        AND new.FiscalYear = old.FiscalYear
        AND new.EducationOrganizationId = old.EducationOrganizationId
		AND new.AttendanceBeginTime = old.AttendanceBeginTime
		AND new.AttendanceEventCategoryDescriptorId = old.AttendanceEventCategoryDescriptorId
		AND new.EventDate = old.EventDate
		AND new.ProgramEducationOrganizationId = old.ProgramEducationOrganizationId
		AND new.ProgramTypeId = old.ProgramTypeId
		AND new.ProgramName = old.ProgramName
    )

    INSERT INTO leadata.StudentRace
    SELECT *
    FROM #StudentRace new
    WHERE NOT EXISTS 
    (
        SELECT 1
        FROM leadata.StudentRace old
        WHERE new.StudentUSI = old.StudentUSI
        AND new.RaceTypeId = old.RaceTypeId
    )

    INSERT INTO leadata.StudentDropOutRecoveryProgramAssociation
    SELECT *
    FROM #StudentDropOutRecoveryProgramAssociation new
    WHERE NOT EXISTS 
    (
        SELECT 1
        FROM leadata.StudentDropOutRecoveryProgramAssociation old
        WHERE new.StudentUSI = old.StudentUSI
        AND new.FiscalYear = old.FiscalYear
        AND new.ProgramTypeId = old.ProgramTypeId
        AND new.ProgramName = old.ProgramName
        AND new.ProgramEducationOrganizationId = old.ProgramEducationOrganizationId
        AND new.BeginDate = old.BeginDate
        AND new.EducationOrganizationId = old.EducationOrganizationId
    )

    INSERT INTO leadata.StudentDropOutRecoveryProgramMonthlyUpdate
    SELECT *
    FROM #StudentDropOutRecoveryProgramMonthlyUpdate new
    WHERE NOT EXISTS 
    (
        SELECT 1
        FROM leadata.StudentDropOutRecoveryProgramMonthlyUpdate old
        WHERE new.StudentUSI = old.StudentUSI
        AND new.FiscalYear = old.FiscalYear
        AND new.ProgramTypeId = old.ProgramTypeId
        AND new.ProgramName = old.ProgramName
        AND new.ProgramEducationOrganizationId = old.ProgramEducationOrganizationId
        AND new.BeginDate = old.BeginDate
        AND new.EducationOrganizationId = old.EducationOrganizationId
        AND new.MonthDescriptorId = old.MonthDescriptorId
    )

    INSERT INTO leadata.StudentSpecialEducationProgramAssociation
    SELECT *
    FROM #StudentSpecialEducationProgramAssociation new
    WHERE NOT EXISTS 
    (
        SELECT 1
        FROM leadata.StudentSpecialEducationProgramAssociation old
        WHERE new.StudentUSI = old.StudentUSI
        AND new.FiscalYear = old.FiscalYear
        AND new.ProgramTypeId = old.ProgramTypeId
        AND new.ProgramName = old.ProgramName
        AND new.ProgramEducationOrganizationId = old.ProgramEducationOrganizationId
        AND new.BeginDate = old.BeginDate
        AND new.EducationOrganizationId = old.EducationOrganizationId
    )

    INSERT INTO leadata.StudentEducationOrganizationAssociation
    SELECT *
    FROM #StudentEducationOrganizationAssociation new
    WHERE NOT EXISTS 
    (
        SELECT 1
        FROM leadata.StudentEducationOrganizationAssociation old
        WHERE new.StudentUSI = old.StudentUSI
        AND new.EducationOrganizationId = old.EducationOrganizationId
    )

    INSERT INTO leadata.StudentSchoolAssociation
    SELECT *
    FROM #StudentSchoolAssociation new
    WHERE NOT EXISTS 
    (
        SELECT 1
        FROM leadata.StudentSchoolAssociation old
        WHERE new.StudentUSI = old.StudentUSI
        AND new.FiscalYear = old.FiscalYear
        AND new.SchoolId = old.SchoolId
        AND new.EntryDate = old.EntryDate
    )

    INSERT INTO leadata.StudentSchoolAssociationMembershipFTE
    SELECT *
    FROM #StudentSchoolAssociationMembershipFTE new
    WHERE NOT EXISTS 
    (
        SELECT 1
        FROM leadata.StudentSchoolAssociationMembershipFTE old
        WHERE new.StudentUSI = old.StudentUSI
        AND new.FiscalYear = old.FiscalYear
        AND new.SchoolId = old.SchoolId
        AND new.EntryDate = old.EntryDate
        AND new.FTEStartDate = old.FTEStartDate
    )

    INSERT INTO leadata.StudentSchoolAssociationSpecialEnrollment
    SELECT *
    FROM #StudentSchoolAssociationSpecialEnrollment new
    WHERE NOT EXISTS 
    (
        SELECT 1
        FROM leadata.StudentSchoolAssociationSpecialEnrollment old
        WHERE new.StudentUSI = old.StudentUSI
        AND new.FiscalYear = old.FiscalYear
        AND new.SchoolId = old.SchoolId
        AND new.EntryDate = old.EntryDate
        AND new.SpecialEnrollmentStartDate = old.SpecialEnrollmentStartDate
    )

    INSERT INTO leadata.StudentSchoolAssociationTuitionPayer
    SELECT *
    FROM #StudentSchoolAssociationTuitionPayer new
    WHERE NOT EXISTS 
    (
        SELECT 1
        FROM leadata.StudentSchoolAssociationTuitionPayer old
        WHERE new.StudentUSI = old.StudentUSI
        AND new.FiscalYear = old.FiscalYear
        AND new.SchoolId = old.SchoolId
        AND new.EntryDate = old.EntryDate
        AND new.PayerStartDate = old.PayerStartDate
    )

	INSERT INTO leadata.StudentSchoolAssociationLocalEducationAgency
    SELECT *
    FROM #StudentSchoolAssociationLocalEducationAgency new
    WHERE NOT EXISTS 
    (
        SELECT 1
        FROM leadata.StudentSchoolAssociationLocalEducationAgency old
        WHERE new.StudentUSI = old.StudentUSI
        AND new.FiscalYear = old.FiscalYear
        AND new.EducationOrganizationId = old.EducationOrganizationId
        AND new.ResponsibilityDescriptorId = old.ResponsibilityDescriptorId
        AND new.SchoolId = old.SchoolId
        AND new.EntryDate = old.EntryDate 
        AND new.StartDate = old.StartDate
    )

    INSERT INTO leadata.StudentSchoolAttendanceEvent
    SELECT *
    FROM #StudentSchoolAttendanceEvent new
    WHERE NOT EXISTS 
    (
        SELECT 1
        FROM leadata.StudentSchoolAttendanceEvent old
        WHERE new.StudentUSI = old.StudentUSI
        AND new.FiscalYear = old.FiscalYear
        AND new.SchoolId = old.SchoolId
        AND new.TermTypeId = old.TermTypeId
        AND new.SchoolYear = old.SchoolYear
        AND new.EventDate = old.EventDate
        AND new.AttendanceEventCategoryDescriptorId = old.AttendanceEventCategoryDescriptorId
    )

    INSERT INTO leadata.StudentSectionAssociation
    SELECT *
    FROM #StudentSectionAssociation new
    WHERE NOT EXISTS 
    (
        SELECT 1
        FROM leadata.StudentSectionAssociation old
        WHERE new.StudentUSI = old.StudentUSI
        AND new.FiscalYear = old.FiscalYear
        AND new.SchoolId = old.SchoolId
        AND new.ClassPeriodName = old.ClassPeriodName
        AND new.ClassroomIdentificationCode = old.ClassroomIdentificationCode
        AND new.LocalCourseCode = old.LocalCourseCode
        AND new.TermTypeId = old.TermTypeId
        AND new.SchoolYear = old.SchoolYear
        AND new.BeginDate = old.BeginDate
        AND new.UniqueSectionCode = old.UniqueSectionCode 
        AND new.SequenceOfCourse = old.SequenceOfCourse 
    )

	INSERT INTO leadata.StudentEducationOrganizationAssociationTribalAffiliation
    SELECT *
    FROM #StudentEducationOrganizationAssociationTribalAffiliation new
    WHERE NOT EXISTS 
    (
        SELECT 1
        FROM leadata.StudentEducationOrganizationAssociationTribalAffiliation old
        WHERE new.StudentUSI = old.StudentUSI
        AND new.EducationOrganizationId = old.EducationOrganizationId
        AND new.TribalAffiliationDescriptorId = old.TribalAffiliationDescriptorId
    )

    COMMIT TRANSACTION MergeTransaction

    END TRY
    
    BEGIN CATCH
        IF @@TRANCOUNT > 0
        BEGIN 
            ROLLBACK TRAN MergeTransaction; 
                
            DECLARE @ErrorNumber INT = ERROR_NUMBER();
            DECLARE @ErrorLine INT = ERROR_LINE();
            DECLARE @ErrorMessage NVARCHAR(4000) = ERROR_MESSAGE();
            DECLARE @ErrorSeverity INT = ERROR_SEVERITY();
            DECLARE @ErrorState INT = ERROR_STATE();

            PRINT 'Actual error number: ' + CAST(@ErrorNumber AS VARCHAR(10));
            PRINT 'Actual line number: ' + CAST(@ErrorLine AS VARCHAR(10));

            RAISERROR(@ErrorMessage, @ErrorSeverity, @ErrorState);
        END
    END CATCH
END

GO


