/********************************************************************************************************
**Procedure Name:
**      integrity.GetSupportProgramStudentData
**
**Author:
**      Amit Verma
**
**Description:  
**	Get Student Support Program Information Data for integrity processing  
**               
**Input:
**
**Output:
**	Student Support Program Information Data for integrity processing
**
**Returns:
**
**Implementation:
**	Used to get Student Support Program Data for integrity processing  
**
**Revision History:
**	Who					When		What
**	Jeff Stokes			09/09/2016	Initial Creation
**	PSharma				09/10/2016	Removed Race
**  PSharma				09/19.2016	Added FiscalYear and SchoolId
**  SMahapatra          07/16/2018  Selecting ProgramList from  StudentProgramAttendanceEvent for
**                                   which there is no StudentProgramAssociation by left joining with view vw_NoProgramAssociationForProgramAttendanceEvent   
**  SMahapatra          07/23/2018  Added left join with view vw_ProgramOutsideCCLCFY to get list of ProgramNames for which BeginDate or EndDate falls outside of CCLC FiscalYear 
**  SMahapatra          10/02/2018  Addded join with config.DataSubmissionWindow table to get CCLCBeginDate and CCLCEndDate instead of getting it from vw_ProgramOutsideCCLCFY  
**  SMahapatra          03/01/2019  Fetching StudentCharacteristics '1/4 or more degree Indian blood' instead of Tribal Name from FY2020 onwards.
**                                  Also changed from inner join to left join with config.DataSubmissionWindow
*************************************************************************************************************************************************************************************/
CREATE PROCEDURE [integrity].[GetSupportProgramStudentData]
	@ExecutionId int,
	@MessageId as [nvarchar](36)
AS

SET NOCOUNT ON;
SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED  -- this is simiar to Nolock. Instead of doing for each table I set this at SP level.

BEGIN 
	--Get Student Support Program Data
	SELECT DISTINCT 
		S.StudentUSI,
		S.FirstName,
		S.LastSurname				                                  AS LastName,
		S.BirthDate					                                  AS DateOfBirth,
		S.HispanicLatinoEthnicity	                                  AS EthnicityIsHispanic,
		Case 
		WHEN SPEDDM.FiscalYear < 2020 THEN 
		S.TribalName                                                  
		WHEN SPEDDM.FiscalYear>=2020 THEN
		D.CodeValue  
		END                                                            AS TribalName,      
		SPEDDM.FiscalYear,
		ssa.SchoolId ,		
		VWPAE.ProgramList                                              AS ProgramList_WithoutProgramAssociaton,
		DSW.SubmissionStartDate                                          AS CCLCFYBeginDate, 
		DSW.SubmissionEndDate                                            AS CCLCFYEndDate,
		PODSW.ProgramOutsideDSW                                        AS ProgramList_ProgramOutsideCCLCFY
		
		                                      
	FROM  
		[integrity].[vw_GetIntegrityHistoryPerExecution] SPEDDM
		JOIN leadata.Student S ON 
			(
				SPEDDM.StudentUSI = S.StudentUSI AND
				SPEDDM.IntegrityRuleTypeId = 14		-- Brings only data for StudentSupportProgramInformation  
			)
		JOIN leadata.StudentSchoolAssociation SSA on
			(
			  SSA.StudentUSI = SPEDDM.StudentUSI
			  AND SSA.SchoolId = SPEDDM.SchoolId
			--AND SSA.EntryDate = SPEDDM.SchoolEntryDate   -- SPEDDM entry date will be null for programshence removing it from condition check
			  AND ssa.FiscalYear = SPEDDM.FiscalYear
			  AND SPEDDM.IntegrityRuleTypeId = 14            ---- Brings only data for SupportPrograms  
			)
		Left JOIN config.DataSubmissionWindow DSW on 
		     DSW.FiscalYear = SPEDDM.FiscalYear
			 AND DSW.RequestTypeId =3
         
        Left JOIN [integrity].[vw_NoProgramAssociationForProgramAttendanceEvent] VWPAE  on
		    (
			  SPEDDM.FiscalYear = VWPAE.FiscalYear
			  AND SPEDDM.Studentusi =VWPAE.Studentusi
			  AND SPEDDM.SchoolId = VWPAE.EducationOrganizationId
			  AND SPEDDM.IntegrityRuleTypeId = 14                ---- Brings only data for SupportPrograms  
			)
         Left JOIN [integrity].[vw_ProgramOutsideCCLCFY] PODSW on		 	
			 (
			  SPEDDM.FiscalYear = PODSW.FiscalYear
			  AND SPEDDM.Studentusi =PODSW.Studentusi
			  AND SPEDDM.SchoolId = PODSW.EducationOrganizationId
			  AND SPEDDM.IntegrityRuleTypeId = 14                ---- Brings only data for SupportPrograms  
			)	
		left JOIN azeds.leadata.StudentCharacteristic SC on 
			(
			  SPEDDM.StudentUSI =SC.StudentUSI
			  AND SPEDDM.SchoolId =SC.EducationOrganizationid
			  AND SPEDDM.IntegrityRuleTypeId = 14                     ---- Brings only data for SupportPrograms  
			  AND SC.StudentCharacteristicDescriptorId = 12101  
           )
    	left JOIN azeds.leadata.descriptor D on
			 D.descriptorid = SC.StudentCharacteristicDescriptorId	

	WHERE  
		SPEDDM.Executionid = @ExecutionId AND 
		SPEDDM.messageid = @MessageId	
END

