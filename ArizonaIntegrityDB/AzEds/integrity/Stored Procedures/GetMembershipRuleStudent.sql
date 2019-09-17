
/********************************************************************************************************
**Procedure Name:
**      integrity.GetMembershipStudent
**
**Author:
**      Amit Verma
**
**Description:  
**	Get StudentMembershipData for integrity membership rule processing  
**               
**Input:
**
**Output:
**	StudentMembershipData for integrity processing
**
**Returns:
**
**Implementation:
**	Used to get StudentMembershipData for integrity processing  
**
**Revision History:
**	Who			When		What
**	Amit Verma	12/23/2014	Initial Creation
**  PSharma		05-06-2016	Added OnlyOneMainMembership
**  PSharma		05-10-2016  Modified OnlyOneMainMembership
**  PSharma		12-02-2016  Added the TodaysDate to add the fix for 10122
**  Sucharita   6/28/2017   Added field 'GraduationDate' for rule 10200, Task# 187098
**  Sucharita   6/30/2017   Added field 'SameYearGraduationDate' and 'HavingJtedEnrollmentOnFeb012016' for rule 10200, Task# 187098
**  Sucharita   07/07/2017  Removed field 'SameYearGraduationDate' for rule 10200
**  Sucharita   01/22/2019  Added field 'ThresholdDays' for rule 10127,changed AZEDSDatamart table schema name from DM to StudentDemo 
** Sucharita    02/06/2019  Modified rule to get min of the graduationdate as some students have more than one graduation date
** Sucharita    02/06/2019  Fixed the syntax for getting min value of  graduationdate
***************************************************************************************************************************************/

CREATE PROCEDURE [integrity].[GetMembershipRuleStudent] 
	@ExecutionId as int,
	@MessageId as [nvarchar](36)
AS
BEGIN 
      SET NOCOUNT ON;
	   SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED  -- this is simiar to Nolock. Instead of doing for each table I set this at SP level.
	       --- Get Student Membership Data
				SELECT DISTINCT 
				       stu.StudentUSI, 					    
				       stu.FirstName															  AS 'Firstname', 
				       stu.LastSurname															  AS 'Lastname', 
				       Cast(stu.BirthDate AS DATETIME)											  AS 'DateOfBirth', 
				       cct.CodeValue															  AS 'CountryOfBirth', 
				       sat.CodeValue															  AS 'StateOfBirth',
					   ISNULL((SELECT OverrideDate FROM config.SystemDateOverride),GETDATE())	  AS 'TodaysDate',
					   CAST(min(SDM.GraduationDate) AS datetime)                                  AS 'GraduationDate',
					   CASE WHEN enfeb.studentusi is not null THEN 1 ELSE 0 END                   AS  'HavingJtedEnrollmentOnFeb012016',
					   GDTH.ThresholdDays                                                         AS  'ThresholdDays'
				FROM [integrity].[vw_GetIntegrityHistoryPerExecution]  ih	
                    INNER JOIN leadata.Student stu 
						 ON ih.StudentUSI = stu.StudentUSI 

				    LEFT JOIN leadata.CountryCodeType cct with (nolock)
				         ON cct.CountryCodeTypeId = stu.BirthCountryCodeTypeId 

				    LEFT JOIN leadata.StateAbbreviationType sat with (nolock)
				         ON sat.StateAbbreviationTypeId = stu.BirthStateAbbreviationTypeId 

                     LEFT JOIN [AzEDSDatamart].[StudentDemo].StudentGraduationDate SDM with (nolock)
                         ON SDM.StateStudentID =stu.StudentUniqueId										 
                     
					LEFT JOIN [integrity].[vw_HavingJtedEnrollmentOnFeb012016] enfeb with (nolock)
					on enfeb.studentusi = stu.studentusi

					LEFT JOIN config.GradDateThreshold GDTH
					       ON GDTH.Fiscalyear = Ih.FiscalYear
                     
					WHERE ih.Executionid = @executionid and ih.messageid = @messageid	
					and ih.IntegrityRuleTypeId = 1  -- for Membership data only 
					Group by stu.StudentUSI,		    
				      stu.FirstName,															  
				      stu.LastSurname,															  
				      stu.BirthDate,											 
				      cct.CodeValue	,													
				      sat.CodeValue,
					  enfeb.studentusi,
					  GDTH.ThresholdDays 
				    ORDER BY stu.StudentUSI 	                 
				
END
