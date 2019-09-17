/********************************************************************************************************
**Procedure Name:
**      process.GetIntegritySPEDSpecialEnrollmentData
**
**Author:
**      Amit Verma
**
**Description:  
**	Get SPED SpecialEnrollment for integrity processing  
**               
**Input:
**
**Output:
**	SPED SpecialEnrollment for integrity processing
**
**Returns:
**
**Implementation:
**	Used to get SPED SpecialEnrollment for integrity processing  
**
**Revision History:
**	Who			When		What
**	Amit Verma	04/15/2015	Initial Creation
**	Rohith		08/10/2015 removing entrydate check in join conditions as SPED AND ELL will be at student and school level
**********************************************************************************************************/

CREATE PROCEDURE [Integrity].[GetStateSpedRuleSpecialEnrollment]
@ExecutionId INT,
@MessageId as [nvarchar](36)
AS
BEGIN 
      SET NOCOUNT ON;
 SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED  -- this is simiar to Nolock. Instead of doing for each table I set this at SP level.


	       --- Get Membership SPED SpecialEnrollment Data
			SELECT DISTINCT ssa.StudentUSI, 
			       ssa.SchoolId						                                                                                                         AS 'SchoolID', 
				   SPEDDM.FiscalYear																														 AS 'FiscalYear', 
				   CAST(ssa.EntryDate AS DATETIME)                                                                                                           AS 'Entrydate',
				   ssase.SpecialEnrollmentStartDate,
				   ssase.SpecialEnrollmentEndDate,
				   sed.CodeValue AS 'SpecialEnrollmentDescriptor',
				   CAST(CASE WHEN ssase.SpecialEnrollmentStartDate <= ISNULL(ssa.ExitWithdrawDate,CAST(CAST(SPEDDM.FiscalYear AS VARCHAR(4))+'-06-30' AS DATE))
				           OR ISNULL(ssase.SpecialEnrollmentEndDate,CAST(CAST(SPEDDM.FiscalYear AS VARCHAR(4)) +'-06-30' AS DATE)) 
						      <= ISNULL(ssa.ExitWithdrawDate,CAST(CAST(SPEDDM.FiscalYear AS VARCHAR(4))+'-06-30' AS DATE))
				      THEN 1 ELSE 0
			     END AS BIT)																																 AS 'IsValidSpecialEnrollment'
		    FROM   leadata.StudentSchoolAssociation ssa 
			    INNER JOIN [integrity].[vw_GetIntegrityHistoryPerExecution] SPEDDM
			         ON ssa.StudentUSI = SPEDDM.StudentUSI
				         AND ssa.SchoolId = SPEDDM.SchoolId
				        -- AND ssa.EntryDate = SPEDDM.SchoolEntryDate 
						  AND SSA.FiscalYear = SPEDDM.FiscalYear						 
					 AND SPEDDM.IntegrityRuleTypeId IN (6, 8)   -- Brings only data for STATE SPED & Fed Sped   
		  	    INNER JOIN leadata.StudentSchoolAssociationSpecialEnrollment ssase 
		  			  ON ssase.StudentUSI = ssa.StudentUSI 
		  				 AND ssase.SchoolId = ssa.SchoolId 
		  				 AND ssase.EntryDate = ssa.EntryDate 
						 AND ssase.Fiscalyear = ssa.FiscalYear
		        LEFT JOIN leadata.[Descriptor] sed 
		  	    	  ON ssase.SpecialEnrollmentDescriptorId = sed.DescriptorId
			WHERE  SPEDDM.Executionid = @ExecutionId and SPEDDM.messageid = @MessageId	
            ORDER BY ssa.StudentUSI, ssa.SchoolId, EntryDate, ssase.SpecialEnrollmentStartDate
END