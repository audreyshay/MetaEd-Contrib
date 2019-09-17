/**************************************************************************
** Script Name: udfStudentEnrollmentProgramAssociation
** 
**
** Author: Rohith Chintamaneni
** 
**
** Description: Retrieves enrollmentprogramassociation per execution and message
**
** Input: @@Executionid			    INT
**        @messageid	        [nvarchar](36)
**        @FiscalYear               INT
** 
** Output: Table
**
** Returns: Table
**
** Implementation:
** 
**
** Revision History: Created - Rohith Chintamaneni - 05/22/2019
** using a user defined funtion to return enrollmentprogramAssociation for integrity execution and message
**************************************************************************/

CREATE FUNCTION [integrity].[udfStudentEnrollmentProgramAssociationPerExecutionMessage]
(	
	@executionid int,
	@MessageId as [nvarchar](36),
	@fiscalYear int
)
RETURNS TABLE 
AS
RETURN 
(
	-- Add the SELECT statement with parameter references here
	With CTE(
	fiscalyear, 
	studentusi, 
	programtypeid, 
	programname, 
	programeducationorganizationid, 
	ProgramBeginDate, 
	ProgramEndDate, 
	SchoolId, 
	EnrollmentEntryDate, 
	EnrollmentExitWithdrawDate, 
	entrytypedescriptorid, 
	exitwithdrawtypedescriptorid, 
	trackeducationorganizationid, 
	entrygradeleveldescriptorid, 
	membershiptypedescriptorid, 
	tracknumber,
	ProgramType,
	EnrollmentFiscalYear)
	as
	(
	SELECT 
	   SPA.fiscalyear, 
       SPA.studentusi, 
       SPA.programtypeid, 
       SPA.programname, 
       SPA.programeducationorganizationid, 
       SPA.begindate               AS ProgramBeginDate, 
       SPA.enddate                 AS ProgramEndDate, 
       SPA.educationorganizationid AS SchoolId, 
       SSA.entrydate               AS EnrollmentEntryDate, 
       SSA.exitwithdrawdate        AS EnrollmentExitWithdrawDate, 
       SSA.entrytypedescriptorid, 
       SSA.exitwithdrawtypedescriptorid, 
       SSA.trackeducationorganizationid, 
       SSA.entrygradeleveldescriptorid, 
       SSA.membershiptypedescriptorid, 
       SSA.tracknumber,	  
	   PT.CodeValue as ProgramType,
	    SSA.FiscalYear AS EnrollmentFiscalYear
FROM   [integrity].[vw_getintegrityhistoryperexecution] (nolock) IH 
       INNER JOIN leadata.studentschoolassociation (nolock) SSA 
               ON Ih.fiscalyear = SSA.fiscalyear 
                  AND ih.studentusi = ssa.studentusi 
                  AND ih.schoolid = ssa.schoolid 
                 AND Isnull(ih.schoolentrydate, '1900-01-01') = Case when ih.IntegrityRuleTypeId =14 then '1900-01-01'
											    When ih.IntegrityRuleTypeId in (1,3) then ssa.entrydate 
												end --Since IntegrityNeed does not have entrydate for programs, I am defaulting it to 1900-01-01. Making this generic so in future you can use this function in GetMembershipRuleDRPGCD proc, instead of duplicating logic again (To do: have to chnage GetMembershipRuleDRPGCD to use this UDF).
       LEFT JOIN leadata.studentprogramassociation (nolock) SPA 
              ON SPA.fiscalyear = SSA.fiscalyear 
                 AND SPA.studentusi = SSA.studentusi 
                 AND SPA.educationorganizationid = SSA.schoolid 
       INNER JOIN entity.programtype PT 
               ON SPA.programtypeid = PT.programtypeid 
WHERE  SSA.fiscalyear = @fiscalYear 
       AND ih.executionid = @executionid 
       AND ih.messageid = @MessageId  	   
	),
	CTE_BEGIN_ENTRY_DATE(fiscalyear, 
	studentusi, 
	programtypeid, 
	programname, 
	programeducationorganizationid, 
	ProgramBeginDate, 
	ProgramEndDate, 
	SchoolId, 
	EnrollmentEntryDate, 
	EnrollmentExitWithdrawDate, 
	entrytypedescriptorid, 
	exitwithdrawtypedescriptorid, 
	trackeducationorganizationid, 
	entrygradeleveldescriptorid, 
	membershiptypedescriptorid, 
	tracknumber,
	ProgramType,	
	RN) AS
	(
	SELECT fiscalyear, 
	studentusi, 
	programtypeid, 
	programname, 
	programeducationorganizationid, 
	ProgramBeginDate, 
	ProgramEndDate, 
	SchoolId, 
	EnrollmentEntryDate, 
	EnrollmentExitWithdrawDate, 
	entrytypedescriptorid, 
	exitwithdrawtypedescriptorid, 
	trackeducationorganizationid, 
	entrygradeleveldescriptorid, 
	membershiptypedescriptorid, 
	tracknumber,
	ProgramType,
		Row_number() OVER (partition BY fiscalyear, studentusi, programname, programeducationorganizationid, ProgramBeginDate, schoolid,EnrollmentEntryDate ORDER BY 
		EnrollmentEntryDate ASC) as RN
		 FROM CTE where ( ProgramBeginDate >= EnrollmentEntryDate 
				AND ProgramBeginDate <= Isnull(EnrollmentExitWithdrawDate, Cast('06-30-'+ Cast(EnrollmentFiscalYear AS VARCHAR(4)) AS DATE)) 
		)
        OR 
		( EnrollmentEntryDate >= ProgramBeginDate 
				AND EnrollmentEntryDate <= Isnull(ProgramEndDate, Cast('06-30-' + Cast(EnrollmentFiscalYear AS VARCHAR(4)) AS DATE))
				
	 )
		 
	)
	   Select * from CTE_BEGIN_ENTRY_DATE
	   where rn=1

)
GO