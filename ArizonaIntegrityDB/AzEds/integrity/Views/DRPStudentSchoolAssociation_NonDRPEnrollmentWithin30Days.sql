/** Script Name:DRPStudentSchoolAssociation_NonDRPEnrollmentWithin30Days
** 
**
** Author: Amit Vera
** 
**
** Description: Returns the Enrollments which have Non DRP Enrollment With in 30Days
**
**
** 
** 
**
**Revision History:
**	Who				When		What
**	Amit Verma		07/29/2016	Initial Creation
**	Pratibha Kanyar	09/09/2016	Removed the SchoolId from join to look for Non DRP 
**								enrollments across Schools/ LEAs
**  Amit Verma      09/13/2016  Updated the logic to exclude JTED
**  Amit Verma      09/13/2016  Updated the logic to Check for 31 days period instead of 32 days
**  Amit Verma      09/13/2016  Updated the logic to Check for 30 days period instead of 31 days
**  Amit Verma		09/20/2016  Updtaed the ExitWithdrawDate with FY End Date if it is NULL
**  Amit Verma      10/04/2016  Added the condition to check all Non DRP enrollments before DRP Enrollments
**
****************************************************************************************************************/
CREATE VIEW [integrity].[DRPStudentSchoolAssociation_NonDRPEnrollmentWithin30Days]
AS 
SELECT DRP.FiscalYear, 
       DRP.StudentUSI, 
       DRP.SchoolId, 
       DRP.EntryDate, 
       CONVERT(BIT, CASE WHEN COUNT(*) >= 1 THEN 1 ELSE 0 END) AS NonDRPEnrollmentWithin30Days 
FROM   (SELECT SSA.* 
        FROM   leadata.StudentSchoolAssociation SSA
		       JOIN entity.School S 
			     ON SSA.FiscalYear = S.FiscalYear
			        AND SSA.SchoolId = S.SchoolId
			   JOIN entity.LocalEducationAgency LEA
			     ON S.FiscalYear = LEA.FiscalYear
			        AND S.LocalEducationAgencyId = LEA.LocalEducationAgencyId
				    AND LEA.IsCTE <> 1																		-- Not JTED
        WHERE  SSA.MembershipTypeDescriptorId <> 11743														-- 'D' TYPE MEMBERSHIP
		       AND (SSA.ExitWithdrawTypeDescriptorId NOT IN (10491,10492,10493,10494,10495,10496,10497,		-- SUMMER WITHDRAWAL CODES
														11717,11718,11719,11720,11721,11722,11723) 
					 OR SSA.ExitWithdrawTypeDescriptorId IS NULL) 
		) SSA 
       INNER JOIN (SELECT *  
                   FROM   leadata.StudentSchoolAssociation 
                   WHERE  MembershipTypeDescriptorId = 11743 
				   ) DRP 
               ON (SSA.EntryDate >= DATEADD(DAY, -30, DRP.EntryDate)
				    OR ISNULL(SSA.ExitWithdrawDate, ( CAST(CAST(SSA.FiscalYear AS VARCHAR(4))+ '-06-30' AS DATE) )) >= DATEADD(DAY, -30, DRP.EntryDate)
                    OR ISNULL(SSA.ExitWithdrawDate, ( CAST(CAST(SSA.FiscalYear AS VARCHAR(4))+ '-06-30' AS DATE) )) >= DRP.EntryDate 
				  ) 
                  AND SSA.StudentUSI = DRP.StudentUSI 
				  AND SSA.EntryDate <= DRP.EntryDate
                  --AND SSA.SchoolId = DRP.SchoolId 
GROUP  BY DRP.StudentUSI, 
          DRP.SchoolId, 
          DRP.EntryDate, 
          DRP.FiscalYear
GO


