/********************************************************************************************************
**Procedure Name:
**      integrity.GetSupportProgramSchoolAssociationData
**
**Author:
**      Amit Verma
**
**Description:  
**	Get Support Program School Association Data for integrity processing  
**               
**Input:
**
**Output:
**	Support Program School Association Data for integrity processing
**
**Returns:
**
**Implementation:
**	Used to get Support Program School Association Data for integrity processing  
**
**Revision History:
**	Who			When		What
**	Jeff Stokes	9/12/2016	Initial Creation
**	PSharma		9/13/2016	Added join with leadata.StudentEnrollmentProgramAssociation. This will help identify the Valid Enrollment
**  MKillens	9/14/2016   Moving Grade to last field to correspond to dapper ORM requirements
**	P Kanyar	10/05/2016	Excluding membership type 'p'
**  PSharma		11/4/2016   Changed Gradecode to GradeType	
**  PSharma		12/22/2016  Added ProgramBeginDate and ProgramCode
**  Sucharita   12/23/2016  Commented ProgramTypeId= 6 and added ProgramTypeId=59 and move ProgramName and ProgramBeginDate above Grade in SELECT
**  Sucharita   01/05/2017   Added ProgramEndDate
**	MKillens	01/13/2017	Added TrackEducationOrganizationId field
**	P Kanyar	04/11/2017	Updated to make Track table changes
**  R chinta	05/19/2017	Use TrackEducationOrganizationid instead of EducationOranizationid, this change is only for FY 2018
**	P Kanyar	06/22/2017	Removed Track table join & switched to school & LEA views
**  Sucharita   03/01/2019  Added CalendarCode 
**  Rchinta		05/22/2019	updating the proc to use the udf funtion to return enrollmentprogramAssociation as performance tuning, and adding fiscalyear for descriptor tables
***************************************************************************************************************************************************/
CREATE PROCEDURE [integrity].[GetSupportProgramSchoolAssociationData]
	@ExecutionId	int,
	@MessageId		nvarchar(36)

AS
BEGIN

SET NOCOUNT ON;
SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED  


DECLARE @FiscalYear int
	Select @FiscalYear = Fiscalyear from process.Execution (nolock)
	where ExecutionId = @ExecutionId

	Select * into #temp_StudentEnrollmentProgramAssociation
	from [integrity].[udfStudentEnrollmentProgramAssociationPerExecutionMessage](@ExecutionId, @MessageId, @FiscalYear)

--- Get SPED School Association Data
	SELECT DISTINCT 
		ssa.StudentUSI, 
		ssa.SchoolId								AS SchoolID,
		sch.IsVirtual,								                           
		mtd.CodeValue								AS MembershipType,
		doa.LocalEducationAgencyId					AS DOA_LocalEducationAgencyID, 
		ISNULL(ssa.FiscalYear,SPEDDM.FiscalYear)	AS FiscalYear,
		etde.CodeValue								AS EntryTypeDescriptor, 
		ewtd.CodeValue								AS ExitWithdrawTypeDescriptor, 
		CONVERT(DATETIME, ssa.EntryDate)			AS Entrydate, 
		CONVERT(DATETIME, ssa.ExitWithdrawDate)		AS ExitDate,
		ssa.TrackNumber								AS TrackNumber,
		ssa.TrackEducationOrganizationId			AS TrackEducationOrganizationId,
		ssa.CalendarCode,
		SPA.ProgramName,
		SPA.ProgramBeginDate,
		SPA.ProgramEndDate                          AS ProgramEndDate,  
		glt.GradeLevelTypeId						AS Grade
		                                                
	FROM 
		leadata.StudentSchoolAssociation ssa 
		INNER JOIN [integrity].[vw_GetIntegrityHistoryPerExecution] SPEDDM ON 
			(
				ssa.StudentUSI = SPEDDM.StudentUSI AND 
				ssa.SchoolId = SPEDDM.SchoolId AND 
				ssa.FiscalYear = SPEDDM.FiscalYear AND 
				ssa.MembershipTypeDescriptorId <> 11738	AND		-- membership type 'P'
				SPEDDM.IntegrityRuleTypeId = 14					-- Brings only data for STATE Support Program
			)
		INNER JOIN entity.vw_School sch ON 
			(
				ssa.SchoolId = sch.SchoolId AND 
				Ssa.Fiscalyear = sch.FiscalYear
			)
		INNER JOIN #temp_StudentEnrollmentProgramAssociation spa
			      ON Spa.Fiscalyear = ssa.FiscalYear
					AND spa.StudentUSI = ssa.StudentUSI
				    AND spa.SchoolId = ssa.SchoolId					
					AND spa.EnrollmentEntryDate = ssa.EntryDate 
					AND spa.ProgramTypeId = 59
   --     INNER JOIN leadata.StudentProgramAssociation sp                       /*Task171372*/
			-- ON  spa.FiscalYear = sp.FiscalYear
			--AND spa.StudentUSI = sp.StudentUSI
			--AND spa.SchoolId = sp.EducationOrganizationId 
			--AND spa.ProgramBeginDate = sp.BeginDate
			--AND spa.ProgramEducationOrganizationId = sp.ProgramEducationOrganizationId
			--AND spa.ProgramName = sp.ProgramName
			--AND spa.ProgramTypeId = sp.ProgramTypeId                                    /*Task1372*/
		
		LEFT JOIN leadata.Descriptor mtd ON 
			(
				mtd.Fiscalyear = ssa.FiscalYear AND
				ssa.MembershipTypeDescriptorId = mtd.DescriptorId AND 
				mtd.FiscalYear = @FiscalYear
			)
		LEFT JOIN leadata.Descriptor gld ON 
			(
				gld.Fiscalyear = ssa.FiscalYear and
				gld.DescriptorId = ssa.EntryGradeLevelDescriptorId  AND 
				gld.FiscalYear = @FiscalYear
			)
		LEFT JOIN entity.GradeLevelType glt ON
		  	(
				glt.GradelevelDescriptorID = gld.DescriptorId
			)
		LEFT JOIN entity.vw_LocalEducationAgency doa ON 
			(
				doa.LocalEducationAgencyId = sch.LocalEducationAgencyId AND 
				doa.Fiscalyear = sch.FiscalYear
			)
		LEFT JOIN leadata.Descriptor etde ON  -- join SSA entrytypedescriptorID to leadata.descriptor table 
			(
				etde.FiscalYear= ssa.FiscalYear AND
				etde.DescriptorId = ssa.EntryTypeDescriptorId and 
				etde.FiscalYear = @FiscalYear
			)
		LEFT JOIN leadata.Descriptor ewtd  ON 
			(
				ewtd.Fiscalyear = ssa.FiscalYear AND
				ewtd.DescriptorId = ssa.ExitWithdrawTypeDescriptorId AND 
				ewtd.FiscalYear = @FiscalYear
			)
	WHERE  
		SPEDDM.Executionid = @ExecutionId AND 
		SPEDDM.messageid = @MessageId

	ORDER BY 
		ssa.StudentUSI, 
		ssa.SchoolId, 
		EntryDate


Drop table #temp_StudentEnrollmentProgramAssociation






END




