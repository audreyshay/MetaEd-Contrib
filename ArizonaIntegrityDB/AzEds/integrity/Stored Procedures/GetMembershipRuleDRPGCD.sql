/********************************************************************************************************
**Procedure Name:
**      [integrity].[GetMembershipRuleDRPGCD]
**
**Author:
**      PSharma
**
**Description:  
**	Get DRP and GCD Data for integrity membership rule processing  
**               
**Input:
**
**Output:
**	SPEDData for integrity processing
**
**Returns:
**
**Implementation:
**	Used to get DRP and GCD Data for integrity processing  
**
**Revision History:
**	Who			When		What
**	PSharma	10/11/2016	Initial Creation
**  PSharma 12/13/2016  Added the StudentEnrollmentProgramAssociation view
**  PSharma	12/16/2017  Missed the StudentUSI in join
** Rchinta	5/9/2019	Improving performance by passing fiscalYear in join conditions and changing order
** Rchinta	5/20/2019	Proc performance Improvement. Instead of joining to leadata.StudentEnrollmentProgramAssociation view, we have directly used the view logic in proc. By doing this we are applying it only batch size hence improved the performance. For now, when ever view logic changes we might have to change this proc. 
**********************************************************************************************************/
Create PROCEDURE [integrity].[GetMembershipRuleDRPGCD]
    @ExecutionId as int,
    @MessageId as [nvarchar](36)
AS
BEGIN 
      SET NOCOUNT ON;
       SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED  -- this is simiar to Nolock. Instead of doing for each table I set this at SP level.

   Declare @FiscalYear INT
   Select @FiscalYear = FiscalYear from process.Execution
   where ExecutionId = @ExecutionId

SELECT SPA.fiscalyear, 
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
	   PT.CodeValue as ProgramType
INTO   #temp_drpgcdschoolslist 
FROM   [integrity].[vw_getintegrityhistoryperexecution] (nolock) IH 
       INNER JOIN leadata.studentschoolassociation (nolock) SSA 
               ON Ih.fiscalyear = SSA.fiscalyear 
                  AND ih.studentusi = ssa.studentusi 
                  AND ih.schoolid = ssa.schoolid 
                  AND ih.schoolentrydate = ssa.entrydate 
       LEFT JOIN leadata.studentprogramassociation (nolock) SPA 
              ON SPA.fiscalyear = SSA.fiscalyear 
                 AND SPA.studentusi = SSA.studentusi 
                 AND SPA.educationorganizationid = SSA.schoolid 
       INNER JOIN entity.programtype PT 
               ON SPA.programtypeid = PT.programtypeid 
WHERE  SSA.fiscalyear = @FiscalYear 
       AND ih.executionid = @ExecutionId 
       AND ih.messageid = @MessageId 
       AND SPA.programtypeid IN ( 60, 61 ) --60 GCD, 61 DRP 
       AND ih.integrityruletypeid = 1 -- for Membership data only    

;WITH cte( fiscalyear, studentusi, programtypeid, programname, 
     programeducationorganizationid, programbegindate, programenddate, schoolid, 
     enrollmententrydate, enrollmentexitwithdrawdate, entrytypedescriptorid, 
     exitwithdrawtypedescriptorid, trackeducationorganizationid, 
     entrygradeleveldescriptorid, membershiptypedescriptorid, tracknumber,ProgramType, rn ) 
     AS (SELECT fiscalyear, 
                studentusi, 
                programtypeid, 
                programname, 
                programeducationorganizationid, 
                programbegindate, 
                programenddate, 
                schoolid, 
                enrollmententrydate, 
                enrollmentexitwithdrawdate, 
                entrytypedescriptorid, 
                exitwithdrawtypedescriptorid, 
                trackeducationorganizationid, 
                entrygradeleveldescriptorid, 
                membershiptypedescriptorid, 
                tracknumber, 
				ProgramType,
                Row_number() OVER (partition BY C.fiscalyear, C.studentusi, C.programname, C.programeducationorganizationid, C.programbegindate, C.schoolid, C.enrollmententrydate ORDER BY C.enrollmententrydate ASC) AS RN 
 FROM   #temp_drpgcdschoolslist C 
 WHERE  ( C.programbegindate >= C.enrollmententrydate 
				AND C.programbegindate <= Isnull(C.enrollmentexitwithdrawdate, Cast('06-30-'+ Cast(C.fiscalyear AS VARCHAR(4)) AS DATE)) 
		)
        OR 
		( C.enrollmententrydate >= C.programbegindate 
				AND C.enrollmententrydate <= Isnull(C.programenddate, Cast('06-30-' + Cast(C.fiscalyear AS VARCHAR(4)) AS DATE)) )
		)
	SELECT	StudentUSI, 
				SchoolId, 
				enrollmententrydate as EntryDate,
				ProgramType,   
				LEFT(ProgramName, CHARINDEX(' ', ProgramName) - 1) AS 'ProgramName',
				ProgramBeginDate, 
                ProgramEndDate
	FROM   cte 
	WHERE  rn = 1 

DROP TABLE #temp_drpgcdschoolslist 
END