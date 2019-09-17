/********************************************************************************************************
**Procedure Name:
**      process.GetIntegrityAttendanceStudentData
**
**Author:
**      Amit Verma
**
**Description:  
**	Get Attendance Student Data for integrity processing  
**               
**Input:
**
**Output:
**	Attendance Student Data for integrity processing
**
**Returns:
**
**Implementation:
**	Used to get Attendance Student Data for integrity processing  
**
**Revision History:
**	Who			When		What
**	Amit Verma	04/01/2015	Initial Creation
**	Rohith		10/22/2015 commentiing join condition on school entry date as for attendance the Schoolentry date will be null in IntegrityNeed table
**  Sucharita   04/18/2017  Added field TodaysDate Task# 182676
**  Sucharita   05/01/2017  Added FiscalYear Task#184420
**  PKanyar		08/17/2017	Filtering out DRP membership type records (bug fix for 10091)
**  Sucharita   02/11/2019  Removed join with leadata.CountryCodeType and leadata.StateAbbreviationType
**                           as we don't use StateOfBirth and CountryOfBirth in Attendance rules. Removed FirstName and LastName.
**                          Fetching CalendarCode from FY2020 onwards.For previous years the default value will be 'Not Applicable' 
**  Sucharita   02/26/2019  Removed CalendarCode, we will fetch calendar based on TrackEducationOrganizationId (the way it was happening before)
**********************************************************************************************************************************************************/

CREATE PROCEDURE [integrity].[GetAttendanceRuleStudent] 
	@ExecutionId INT,
	@MessageId as [nvarchar](36)
AS
BEGIN 
      SET NOCOUNT ON;
	  SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED  -- this is simiar to Nolock. Instead of doing for each table I set this at SP level.

	       --- Get Attendance Student Data
				SELECT DISTINCT 
				       stu.StudentUSI, 					   
				       Cast(stu.BirthDate AS DATETIME)			AS 'DateOfBirth',				     
					   ssa.SchoolId								AS 'SchoolID',
					   SSA.TrackEducationOrganizationId         AS 'TrackEducationOrganizationId',					
					   ISNULL((SELECT OverrideDate FROM config.SystemDateOverride),GETDATE())	 AS 'TodaysDate',
					   SSA.FiscalYear        
				FROM   leadata.Student stu 
				       
					   INNER JOIN leadata.StudentSchoolAssociation ssa 
				         ON ssa.StudentUSI = stu.StudentUSI 
							AND ssa.MembershipTypeDescriptorId <> 11743	-- Filtering DRP reocrds as it will bring record with NULL TrackEducationOrganizationId and multiple XMLs get
																		-- generated for the same IntegHistoryId one with Calendar Collection & one without Calandar Collection when a stundet has M & D membership types at same school & will cause problem in 10091 ruleapp
                       INNER JOIN [integrity].[vw_GetIntegrityHistoryPerExecution] ADM
					     ON ssa.StudentUSI = ADM.StudentUSI
						    AND ssa.SchoolId = ADM.SchoolId
							AND ssa.FiscalYear = ADM.FiscalYear
							AND ADM.IntegrityRuleTypeId = 2  -- for Attendance data only 			       
					   
					WHERE ADM.Executionid = @executionid 
						AND ADM.messageid = @messageid		 
                ORDER BY stu.StudentUSI
END
