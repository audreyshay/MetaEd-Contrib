/********************************************************************************************************
**Procedure Name:
**      integrity.GetMembershipRuleStudent
**
**Author:
**      Rothih Chintamaneni
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
**	Who					When		What
**	Rohith Chintamaneni	07/30/2015	Initial Creation
**  Sucharita   12/02/2016  Added field TodaysDate and IntgrityRuleTypeId 15 to bring data for Accountability NonPayment (Task# 168956)
**  Psharma     12/22/2016  Added IntegrityRuleTypeId
** SMahapatra   05/16/2017  Added field HavingCohortYear
** SMahapatra   06/05/2017  Modified Stored Procedure to remove view integrity.vw_HasCohortYear
** SMahapatra   01/22/2019  Changed schema name from DM to StudentDemo for AZEDSDatamart table
** Harsha Kankanala  03/19/2019 Removed the sub query from select and performed tuning on the query
*******************************************************************************************************************/

CREATE PROCEDURE [integrity].[GetACCTRuleStudent] 
	@ExecutionId as int,
	@MessageId as [nvarchar](36)
AS
BEGIN 
      SET NOCOUNT ON;
	  SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED  -- this is simiar to Nolock. Instead of doing for each table I set this at SP level.
	       --- Get Student Membership Data
			SELECT 
                                  stu.StudentUSI, 
                                  stu.FirstName                                                             AS 'Firstname', 
                                  stu.LastSurname                                                           AS 'Lastname', 
                                  Cast(stu.BirthDate AS DATETIME)                                           AS 'DateOfBirth', 
                                  cct.CodeValue                                                             AS 'CountryOfBirth', 
                                  sat.CodeValue                                                             AS 'StateOfBirth',
                                  GETDATE()                                                                 AS 'TodaysDate',                                                                    
                                  CONVERT(BIT, CASE WHEN COUNT(SDM.CohortYear) >= 1 THEN 1 ELSE 0 END )     AS 'HavingCohortYear', 
                                  ih.IntegrityRuleTypeId
                             FROM [integrity].[vw_GetIntegrityHistoryPerExecution] ih
                               INNER JOIN leadata.Student stu 
                                  ON ih.StudentUSI = stu.StudentUSI 
                               LEFT JOIN leadata.CountryCodeType cct 
                                    ON cct.CountryCodeTypeId = stu.BirthCountryCodeTypeId 
                               LEFT JOIN leadata.StateAbbreviationType sat 
                                    ON sat.StateAbbreviationTypeId = stu.BirthStateAbbreviationTypeId
                               LEFT JOIN [AzEDSDatamart].[StudentDemo].[StudentCohort] SDM 
                                  ON SDM.StateStudentID = ih.StudentUniqueId
                                  Where ih.Executionid = @executionid and ih.messageid = @messageid     
                                  AND ih.IntegrityRuleTypeId in (3,15)  -- Bring data only for Accountability and Accountability Non-Payment
                                 GROUP BY
                                  stu.StudentUSI, 
                                  stu.FirstName                                                             , 
                                  stu.LastSurname                                                           , 
                                  Cast(stu.BirthDate AS DATETIME)                                         , 
                                  cct.CodeValue                                                           , 
                                  sat.CodeValue                                                        ,                                                         
                          --    CONVERT(BIT, CASE WHEN COUNT(SDM.CohortYear) >= 1 THEN 1 ELSE 0 END ) 
                                 ih.IntegrityRuleTypeId
                ORDER BY stu.StudentUSI


END