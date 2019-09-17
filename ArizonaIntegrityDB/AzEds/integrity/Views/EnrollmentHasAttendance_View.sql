

/**************************************************************************
** Script Name:EnrollmentHasAttendance
** 
**
** Author: Amit Verma
** 
**
** Description: Retrieves a bit indicating whether or not the identified 
**				ELL has Subsequent SPED Program based on the StudentUSI 
**              and EducationOrganizationId.
**
** Input: @StudentUSI			    INT
**        @EducationOrganization	INT
** 
** Output: BIT
**
** Returns: BIT
**
** Implementation:
** 
**
** Revision History: Created - Amit Verma - 04/08/2015
** PS	04/18/2016 Added ExitWithdrawDescriptorid in the select 
**
**************************************************************************/

CREATE VIEW [integrity].[EnrollmentHasAttendance_View]
AS
    SELECT SSA.StudentUSI, ssa.SchoolId, ssa.FiscalYear, ssa.EntryDate, ssa.ExitWithdrawDate, ssa.ExitWithdrawTypeDescriptorId
    --, CASE WHEN SSAE.StudentUSI IS NULL THEN 0 ELSE 1 END AS HasAttendance
            , CASE WHEN Count(SSAE.StudentUSI) > 0 THEN 1 ELSE 0 END AS HasAttendance
            , TrackNumber
            , MembershipTypeDescriptorId
            , EntryGradeLevelDescriptorId
            FROM leadata.StudentSchoolAssociation (nolock) SSA
                LEFT OUTER JOIN leadata.StudentSchoolAttendanceEvent (nolock) SSAE
                    ON SSA.StudentUSI = SSAE.StudentUSI
                    AND SSA.SchoolId = SSAE.SchoolId
                        AND SSA.FiscalYear = SSAE.FiscalYear
                        AND SSAE.EventDate BETWEEN ssa.EntryDate AND ISNULL(ssa.ExitWithdrawDate,CAST(CAST (SSA.FiscalYear AS VARCHAR(4)) + '-06-30' AS DATE))
                        AND SSAE.AttendanceEventCategoryDescriptorId = 10527
								 
            GROUP BY  SSA.StudentUSI, ssa.SchoolId, ssa.FiscalYear, ssa.EntryDate, MembershipTypeDescriptorId, EntryGradeLevelDescriptorId, TrackNumber, ssa.ExitWithdrawDate, ssa.ExitWithdrawTypeDescriptorId


GO

