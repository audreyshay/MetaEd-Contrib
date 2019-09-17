/********************************************************************************************************
**Procedure Name:
**      [integrity].[GetCalendarRuleSChoolData]
**
**Author:
**     Amit Raval
**
**Description:  
**           Get PCCP Membership data for ing  
**               
**Input:
**
**Output:
**           List of Membershiptype C records 
**			 List of Membershiptype M or T for the matching DOR
**
**Returns:
**
**Revision History:
**     Who                           When                    What
**   Amit R                        08/13/2018        Initial SPROC creation
** Harsha Kankanala                04/30/2019        Changed the Stored proc to Improve Performance by Changing the way we fetch Fiscal Year and Included No Locks
****************************************************************************************************************************************************************/

CREATE PROCEDURE [integrity].[GetPCCPMembershipData] @ExecutionId AS INT,
                                                    @MessageId AS   [NVARCHAR](36),
                                                    @FiscalYear AS  INT            = NULL
AS
     BEGIN
         SET NOCOUNT ON;
         SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED;  -- this is simiar to Nolock. Instead of doing for each table I set this at SP level.
         --DROP all the temp table in case the SPROC failed in previous run -- fail safe                        
         DROP TABLE IF EXISTS #PCCPMembership;
         DROP TABLE IF EXISTS #MorTMembership;
         DROP TABLE IF EXISTS #FinalMorT;
         DROP TABLE IF EXISTS #StudentSecList;
		 DECLARE @FYD INT
         IF(@FiscalYear IS NULL)
		 BEGIN
             SET @FYD =  (select [FiscalYear]
             FROM [AzEds].[process].[Execution]
             WHERE ExecutionId = @ExecutionId)
			
		 END
		
         SELECT sca.StudentUSI,
                sca.SchoolId,
                sca.EntryDate,
                sca.EntryGradeLevelDescriptorId,
                sca.ExitWithdrawDate,
                edorg.EducationOrganizationId DOR,
                mtdd.CodeValue AS 'MemberShipType'
         INTO #PCCPMembership
         FROM [integrity].[vw_GetIntegrityHistoryPerExecution](nolock) hist
              JOIN leadata.StudentSchoolAssociation(nolock) sca ON hist.FiscalYear = sca.FiscalYear
                                                           AND hist.StudentUSI = sca.StudentUSI
                                                           AND hist.SchoolId = sca.SchoolId
                                                           AND hist.SchoolEntryDate = sca.EntryDate
              JOIN leadata.StudentSchoolAssociationLocalEducationAgency(nolock) edorg ON sca.StudentUSI = edorg.StudentUSI
                                                                            AND sca.SchoolId = edorg.SchoolId
                                                                            AND sca.EntryDate = edorg.EntryDate
                                                                            AND sca.FiscalYear = edorg.FiscalYear
              LEFT JOIN leadata.Descriptor (nolock) mtdd ON sca.MembershipTypeDescriptorId = mtdd.DescriptorId
                                                   AND @FYD = mtdd.FiscalYear
         WHERE hist.FiscalYear = @FYD 
               AND IntegrityRuleTypeId = 17
               AND MessageId = @MessageId
               AND ExecutionId = @ExecutionId;
         SELECT sca.StudentUSI,
                sca.SchoolId,
                sca.MembershipTypeDescriptorId,
                sca.EntryDate,
                sca.ExitWithdrawDate,
                edorg.EducationOrganizationId DOR
         INTO #MorTMembership
         FROM leadata.StudentSchoolAssociation (nolock) sca
              JOIN leadata.StudentSchoolAssociationLocalEducationAgency (nolock) edorg ON sca.StudentUSI = edorg.StudentUSI
                                                                            AND sca.SchoolId = edorg.SchoolId
                                                                            AND sca.EntryDate = edorg.EntryDate
                                                                            AND sca.FiscalYear = edorg.FiscalYear
              JOIN #PCCPMembership tt ON tt.StudentUSI = sca.StudentUSI
         WHERE sca.FiscalYear = @FYD 
               AND MembershipTypeDescriptorId IN(10217, 10219)
              AND edorg.EducationOrganizationId IN
         (
             SELECT DISTINCT
                    DOR
             FROM #PCCPMembership
         )
         ORDER BY StudentUSI,
                  DOR,
                  SchoolId;
         SET NOCOUNT OFF;
         SELECT mort.StudentUSI,
                mort.SchoolId,
                mort.EntryDate AS 'MemberShipTypeMorTBeginDate',
                mort.ExitWithdrawDate AS 'MembershipTypeMorTEndDate',
                mtdd.CodeValue AS 'MemberShipType',
				mort.DOR
         INTO #FinalMorT
         FROM #MorTMembership mort
              JOIN #PCCPMembership pcm ON pcm.StudentUSI = mort.StudentUSI
                                          AND pcm.DOR = mort.DOR
                                          AND pcm.EntryDate >= mort.EntryDate
                                          AND (mort.ExitWithdrawDate IS NULL
                                               OR (pcm.ExitWithdrawDate <= mort.ExitWithdrawDate))
              LEFT JOIN leadata.Descriptor (nolock) mtdd ON mort.MembershipTypeDescriptorId = mtdd.DescriptorId
                                                   AND @FYD  = mtdd.FiscalYear
         ORDER BY mort.StudentUSI,
                  mort.DOR,
                  mort.SchoolId;
         SELECT DISTINCT
                StudentUSI,
                SchoolId,
                MemberShipTypeMorTBeginDate,
                MembershipTypeMorTEndDate,
                MemberShipType,
				DOR
         FROM #FinalMorT;
         SELECT pc.StudentUSI,
                pc.SchoolId,
                @FYD AS 'FiscalYear',
                pc.DOR,
                pc.EntryDate AS 'MembershipTypeCBeginDate',
                pc.ExitWithdrawDate AS 'MembershipTypeCEndDate',
                pc.EntryGradeLevelDescriptorId,
                glt.GradeLevelTypeId AS 'Grade',
                MemberShipType
         FROM #PCCPMembership pc
              LEFT JOIN entity.GradeLevelType (nolock) glt ON glt.GradeLevelDescriptorId = pc.EntryGradeLevelDescriptorId;
         WITH SecCTE
              AS (
              SELECT ssa.StudentUSI,
                     ssa.SchoolId,
                     ssa.LocalCourseCode,
                     ssa.ClassPeriodName,
                     ssa.BeginDate AS 'StudentSectionBeginDate',
                     ssa.EndDate AS 'StudentSectionEndDate',
                     ss.MemberShipType   -- add MemberhsipType C
              FROM leadata.StudentSectionAssociation(nolock) ssa
                   JOIN #PCCPMembership ss ON ssa.FiscalYear = @FYD
                                              AND ssa.SchoolId = ss.SchoolId
                                              AND ssa.StudentUSI = ss.StudentUSI
                                              AND ((ssa.BeginDate >= ss.EntryDate
                                                    AND ((ssa.EndDate IS NULL)
                                                         OR (ss.ExitWithdrawDate IS NOT NULL
                                                             AND ssa.BeginDate <= ss.ExitWithdrawDate)))
                                                   OR (ssa.BeginDate <= ss.EntryDate
                                                       AND (ssa.EndDate IS NULL
                                                            OR ssa.EndDate >= ss.EntryDate)))
              UNION
              SELECT ssa.StudentUSI,
                     ssa.SchoolId,
                     ssa.LocalCourseCode,
                     ssa.ClassPeriodName,
                     ssa.BeginDate AS 'StudentSectionBeginDate',
                     ssa.EndDate AS 'StudentSectionEndDate',
                     ss.MemberShipType
              FROM leadata.StudentSectionAssociation (nolock)ssa
                   JOIN #FinalMorT ss ON ssa.FiscalYear = @FYD 
                                         AND ssa.SchoolId = ss.SchoolId
                                         AND ssa.StudentUSI = ss.StudentUSI
                                         AND ((ssa.BeginDate >= ss.MemberShipTypeMorTBeginDate
                                               AND ((ssa.EndDate IS NULL)
                                                    OR (ss.MembershipTypeMorTEndDate IS NOT NULL
                                                        AND ssa.BeginDate <= ss.MembershipTypeMorTEndDate)))
                                              OR (ssa.BeginDate <= ss.MemberShipTypeMorTBeginDate
                                                  AND (ssa.EndDate IS NULL
                                                       OR ssa.EndDate >= ss.MemberShipTypeMorTBeginDate))))
              SELECT sc.*,
                     CASE
                         WHEN ct.StudentUSI IS NOT NULL
                         THEN CAST(1 AS BIT)
                         ELSE CAST(0 AS BIT)
                     END AS 'HasCourseTranscript',
                     @FYD AS 'FiscalYear'
              INTO #StudentSecList
              FROM SecCTE sc
                   LEFT JOIN leadata.CourseTranscript (nolock) ct ON ct.StudentUSI = sc.StudentUSI
                                                            AND ct.SchoolId = sc.SchoolId
                                                            AND ct.FiscalYear = @FYD 
                                                            AND ct.LocalCourseCode = sc.LocalCourseCode;
         SELECT *
         FROM #StudentSecList;
         SELECT DISTINCT
                cocs.SchoolId,
                cocs.LocalCourseCode,
                cocs.ScheduleDate,
                cocs.InstructionalMinutesPlanned
         FROM leadata.CourseOfferingCourseSchedule (nolock) cocs
              JOIN #StudentSecList sl ON cocs.FiscalYear = @FYD 
                                         AND cocs.SchoolId = sl.SchoolId
                                         AND cocs.LocalCourseCode = sl.LocalCourseCode;
         DROP TABLE IF EXISTS #PCCPMembership;
         DROP TABLE IF EXISTS #MorTMembership;
         DROP TABLE IF EXISTS #FinalMorT;
         DROP TABLE IF EXISTS #StudentSecList;
     END;