/********************************************************************************************************
**Procedure Name:
**      ace.GetStudentsForACE
**
**Author:
**      Viju Viswanathan
**
**Description:  
**	Get the publisher data for ACE calculation
**               
**Input:
**       @ExecutionId INT
**
**Output:
**	This procedure returns two sets of data for the ACE Publisher
**
**Returns:
**
**Implementation:
**	Used to get publisher data for ACE calculation
**
**Revision History:
**	Who					When		What
**	Viju Viswanathan	06/25/2015	Initial Creation
**	Viju Viswanathan	07/27/2015	Opimized the Sproc, used Temp Tables and created indexes for 
**									better performance
**	Viju Viswanathan	10/13/2015	Modified to insert B&M, SPED & ELL record counts
**	Viju Viswanathan	11/13/2015	Modifed join to exclude Schools that are not in Entity.EducationOrganization 
**	Viju Viswanathan	11/24/2015	Fixed a bug that created extra ExecutionEducationOrganizationLog records
**	Viju Viswanathan	12/21/2015	Fixed a bug that was pulling integrity failed students for Aggregation
**	Viju Viswanathan	12/31/2015  Modified to include students who failed integrity with only warnings
**                                  or information
**	Viju Viswanathan	04/05/2016	Modified to insert Unit of Work data
**	Viju Viswanathan	04/13/2016	Modified to wrap the statments inside a TRANSACTION
**	Viju Viswanathan	04/25/2016	Modified to update execution status to 5 (Failed)
**									if no eligible students are found
**	Viju Viswanathan	04/26/2016	Fixed a bug that is not updating status if run for selected Schools
**	Viju Viswanathan	05/12/2016	Modified to use order by insert into unitofwork
**	Viju Viswanathan	06/30/2016	Fixed a bug where Null StudentUSI is returned
**  Ammit				07/05/2016  Nomore setting of status 5. It will set to Status 6 even if no students are found for processing 
**  Britto Augustine	08/15/2016	Changed the proc to use a new view [integrity].[vw_ADMIntegrityResult] to determine if student
									school combination passed ADM, State ELL or State SPED integrity
**  Chris Mullert		08/19/2016  Refactored after hotfix of adding the integ view. 
									Added suppressing of summer withdraw only and program only memberships.
**  Chris Mullert		04/18/2019  Removing executioneducationOrganizationLog
**********************************************************************************************************/

CREATE PROCEDURE [ace].[GetStudentsForACE]
	@ExecutionId INT,
	@ReadOnlyMode BIT = 0
AS
BEGIN
	SET NOCOUNT ON;
	--Declare Local variables

	DECLARE @FiscalYear INT 
	DECLARE @ExecutionType INT
	DECLARE @EligibleStudents INT
	DECLARE @SPEDRequested BIT
	DECLARE @ELLRequested BIT

	CREATE TABLE #SchoolList
			(	SchoolId INT
			)

	CREATE TABLE #StudentList
			(	StudentUSI INT,
				SchoolId INT,
				ADM BIT,
				SPED BIT,
				ELL BIT
			)

	CREATE TABLE #IntegrityViewList
			(	StudentUSI INT,
				SchoolId INT,
				IsStateFundingADMIntegrityPassed BIT,
				IsStateFundingSPEDIntegrityPassed BIT,
				IsStateFundingELLIntegrityPassed BIT
			)

	--Get the FiscalYear, Exuction Type from the ExecutionId
	SELECT @FiscalYear = FiscalYear, @ExecutionType = ExecutionTypeId 
		FROM [process].[Execution] 
		WHERE ExecutionId = @ExecutionId

	-- Load what has been requested by the ExecutionProcessSubType table for this execution.
	SELECT @SPEDRequested = 1 FROM process.ExecutionProcessSubType WHERE ExecutionId = @ExecutionId AND ProcessSubTypeId = 2
	SELECT @ELLRequested  = 1 FROM process.ExecutionProcessSubType WHERE ExecutionId = @ExecutionId AND ProcessSubTypeId = 3

	-- Get Integrity view contents into a temp table.
	INSERT INTO #IntegrityViewList (StudentUSI, SchoolId, IsStateFundingADMIntegrityPassed, IsStateFundingSPEDIntegrityPassed, IsStateFundingELLIntegrityPassed )
		SELECT  StudentUSI, SchoolId, ISNULL(IsStateFundingADMIntegrityPassed, 0), ISNULL(IsStateFundingSPEDIntegrityPassed, 0), ISNULL(IsStateFundingELLIntegrityPassed, 0)
		FROM [integrity].[vw_ADMIntegrityResult]
		WHERE FiscalYear = @FiscalYear
		  AND StudentUSI IS NOT NULL
		  AND ISNULL(IsStateFundingADMIntegrityPassed, 0) = 1

	-- Set SPED/ELL flags to 0 if they weren't requested to be processed (process.ExecutionProcessSubTypes table).
	If @SPEDRequested = 0
		UPDATE #IntegrityViewList SET IsStateFundingSPEDIntegrityPassed = 0

	If @ELLRequested = 0
		UPDATE #IntegrityViewList SET IsStateFundingELLIntegrityPassed = 0

	--Get the list of schools being submitted
	IF @ExecutionType = 2 -- Selected Schools	
		BEGIN	
			INSERT INTO #SchoolList 
				SELECT EducationOrganizationId
					FROM [process].[ExecutionEducationOrganization] eeo
				WHERE 
					eeo.ExecutionId = @ExecutionId

			-- remove from the temp integrity view any schools that weren't requested to be loaded.
			DELETE FROM #IntegrityViewList
				WHERE NOT EXISTS (SELECT * FROM #SchoolList WHERE #IntegrityViewList.SchoolId = #SchoolList.SchoolId)
		END

	-- Remove any student/school combinations that only have excluded memberships (based on excluded memberships table)
	DELETE FROM #IntegrityViewList
	WHERE NOT EXISTS (SELECT * FROM 
		(SELECT #IntegrityViewList.StudentUSI, #IntegrityViewList.SchoolId, mainSsa.MembershipTypeDescriptorId 
			FROM #IntegrityViewList
				INNER JOIN [leadata].[StudentSchoolAssociation] mainSsa 
				ON #IntegrityViewList.StudentUSI = mainSsa.StudentUSI 
					AND #IntegrityViewList.SchoolId = mainSsa.SchoolId 
					AND mainSsa.FiscalYear = @FiscalYear
			EXCEPT
				SELECT ssa.StudentUSI, ssa.SchoolId, ssa.MembershipTypeDescriptorId
				FROM [leadata].[StudentSchoolAssociation] ssa
				INNER JOIN config.ExcludeMembershipType emt 
				ON ssa.MembershipTypeDescriptorId = emt.MembershipTypeDescriptorId
					AND ssa.FiscalYear = emt.FiscalYear 
				INNER JOIN #IntegrityViewList IVL ON ssa.StudentUSI = IVL.StudentUSI 
					AND ssa.SchoolId = IVL.SchoolId
				WHERE ssa.FiscalYear = @FiscalYear
		) excludeMt
	WHERE excludeMt.StudentUSI = #IntegrityViewList.StudentUSI
	AND excludeMt.SchoolId = #IntegrityViewList.SchoolId)

	-- Remove any student/school combinations that only have excluded exit withdraw types (based on excluded withdrawType tables)
	DELETE FROM #IntegrityViewList
	WHERE NOT EXISTS (SELECT * FROM 
		(SELECT #IntegrityViewList.StudentUSI, #IntegrityViewList.SchoolId, mainSsa.ExitWithdrawTypeDescriptorId 
			FROM #IntegrityViewList
				INNER JOIN [leadata].[StudentSchoolAssociation] mainSsa 
				ON #IntegrityViewList.StudentUSI = mainSsa.StudentUSI 
					AND #IntegrityViewList.SchoolId = mainSsa.SchoolId 
					AND mainSsa.FiscalYear = @FiscalYear
			EXCEPT
				SELECT ssa.StudentUSI, ssa.SchoolId, ssa.ExitWithdrawTypeDescriptorId
				FROM [leadata].[StudentSchoolAssociation] ssa
				INNER JOIN config.ExcludeExitWithdrawType eewt 
				ON ssa.ExitWithdrawTypeDescriptorId = eewt.ExitWithdrawTypeDescriptorId
					AND ssa.FiscalYear = eewt.FiscalYear 
				INNER JOIN #IntegrityViewList IVL ON ssa.StudentUSI = IVL.StudentUSI 
					AND ssa.SchoolId = IVL.SchoolId
				WHERE ssa.FiscalYear = @FiscalYear
		) excludeMt
	WHERE excludeMt.StudentUSI = #IntegrityViewList.StudentUSI
	AND excludeMt.SchoolId = #IntegrityViewList.SchoolId)

	-- Push integrity view list into studentList only using valid edOrgs (may have been a reduced set because if executionType 2)
	INSERT INTO #StudentList (StudentUSI, SchoolId, ADM, SPED, ELL)
	SELECT ivl.StudentUSI, ivl.SchoolId , IsStateFundingADMIntegrityPassed, IsStateFundingSPEDIntegrityPassed, IsStateFundingELLIntegrityPassed
		FROM #IntegrityViewList	ivl
	INNER JOIN Entity.EducationOrganization eo
		ON ivl.SchoolId = eo.EducationOrganizationId
		AND eo.FiscalYear = @FiscalYear
		
			
	--Get the number of eligible students
	SELECT @EligibleStudents = COUNT(*) FROM #StudentList
								
	IF @EligibleStudents = 0
		BEGIN
			--No elegible students found...
			If @ReadOnlyMode = 0
			BEGIN
				UPDATE [process].[Execution]
					SET
						[EndDateTime] = GETUTCDATE(),
						[StatusTypeId] = 6
					WHERE ExecutionId = @ExecutionId
				INSERT INTO [process].[ExecutionLog]
					([ExecutionId],[LogDateTime],[Message])
				VALUES
					(@ExecutionId,GETUTCDATE(), 'No eligible students found')
			END
		END
	ELSE
		BEGIN
			--Output	
			BEGIN TRY	
				BEGIN TRAN	GetStudentsForAceTransaction
					--Insert the Execution EdOrg Log
					If @ReadOnlyMode = 0
					BEGIN
						--Insert Unit of Work
						INSERT INTO
							[ace].[UnitOfWork]
							([ExecutionId],[FiscalYear],[StudentUSI],[SchoolId],[ADM],[SPED],[ELL])
							SELECT @ExecutionId, @FiscalYear, StudentUSI, SchoolId, ADM, SPED, ELL  FROM #StudentList
							ORDER BY  StudentUSI, SchoolId
					END
					--Get Final List
					SELECT StudentUSI, SchoolId, ADM, SPED, ELL  FROM #StudentList
						ORDER BY  StudentUSI, SchoolId
						
				IF @@TRANCOUNT > 0
					COMMIT TRAN GetStudentsForAceTransaction;
			END TRY
			BEGIN CATCH
				IF @@TRANCOUNT > 0
					ROLLBACK TRAN GetStudentsForAceTransaction;
					THROW; --Rethrow error to calling program
			END CATCH
		END

	--Drop all the temporary tables created
	DROP TABLE #SchoolList
	DROP TABLE #IntegrityViewList
	DROP TABLE #StudentList

END		

RETURN 0
