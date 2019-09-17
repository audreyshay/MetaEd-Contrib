/********************************************************************************************************
**Procedure Name: 
**      integrity.GetSTCYearEnd 
** 
**Author: 
**     Rohith Chintamaneni 
** 
**Description:   
**     Get STC Cource RuleData 
**                
**Input: 
** 
**Output: 
**     Current STC YearEndData 
** 
**Returns: 
** 
**Revision History: 
**     Who                 When         What 
**  Rohith CHintamaneni 6/20/2016    Initial Creation 
**	Rohith Chintamaneni	7/18/2016	 Adding Lowest and highestgrades offered
**	Rohith CHintamaneni	7/26/2016    Adding the Edorg ID in join condition instead of SchoolId in CT
**	Amit Verma			3/28/2017	 Added the missing Join Predicate in studentsectionassociation to Descriptor Table
**	PKanyar				4/18/2017	 Made changes for 2 new columns added to SectionCourseCharacteristic  
**										 and StudentSectionAssociation table
**	PKanyar				4/12/2018	 Added 2 missing PKs in the join of vw_sectiongradelevelwithminandmaxgrades,  
**										 changed the order of joins to go with the order of PKs
---------------------------------------------------------------------------------------------------------
**	PKanyar				02/20/2019	Added new PKey SessionName in the joins for AZEDS 5.0 changes
**	Vinoth K			08/08/2019	Added new PKey SessionName in the join WITH SSECA and added in select 
**
**********************************************************************************************************/
--declare 	@ExecutionId AS INT = 15472
--   ,@MessageId AS [NVARCHAR](36)= 56442

CREATE PROCEDURE [integrity].[GetSTCYearEnd] 
	@ExecutionId AS INT 
   ,@MessageId AS [NVARCHAR](36) 

AS 
BEGIN 
      SET nocount ON; 
      SET TRANSACTION isolation level READ uncommitted 
      -- this is simiar to Nolock. Instead of doing for each table I set this at SP level.   

      SELECT DISTINCT SSECA.StudentUSI 
                      , SSECA.SchoolId                             AS SchoolId 
                      , LOWER(SSECA.LocalCourseCode)			   AS LocalCourseCode
                      , LOWER(TT.CodeValue)                        AS TermType 
                      , SSECA.SchoolYear 
                      , SSECA.ClassPeriodName 
                      , SSECA.ClassroomIdentificationCode 
                      , SSECA.BeginDate                            AS StudentSectionBeginDate
                      , SSECA.EndDate                              AS StudentSectionEndDate 
                      , SSECA.HomeroomIndicator 
                      , SSECA.DualCredit 
                      , D1.CodeValue                               AS CourseEntryDescriptor 
                      , D2.CodeValue                               AS CourseExitDescriptor 
                      , SCC.CourseLevelCharacteristicTypeCodeValue AS CourseLevelCharactersticType
                      , CTRAN.CourseAttemptResultTypeCodeValue     AS CourseAttemptResultType
                      , CTRAN.AttemptedCreditTypeCodeValue         AS AttemptedCreditType 
                      , CTRAN.AttemptedCreditConversion 
                      , CTRAN.AttemptedCredit 
                      , SEC.AvailableCredit 
                      , CTRAN.EarnedCreditTypeCodeValue            AS EarnedCreditType 
                      , CTRAN.EarnedCreditConversion 
                      , CTRAN.EarnedCredit 
                      , CTRAN.GradeLevelDescriptor                 AS GradeLevelDescriptor 
                      , CTRAN.MethodCreditEarnedTypeCodeValue      AS MethodCreditEarned 
                      , CTRAN.FinalLetterGradeEarned 
                      , CTRAN.FinalNumericGradeEarned 
                      , C.HighSchoolCourseRequirement 
                      , CTRAN.[CourseRepeatCodeTypeCodeValue]      AS CourseRepeatCodeType 
                      , vwsec.LowestGradeLevelOffered	
                      , vwsec.HighestGradeLevelOffered 
					  , SSECA.SessionName
      FROM   [integrity].[vw_getintegrityhistoryperexecution] ih 

             INNER JOIN leadata.StudentSectionAssociation SSECA 
                     ON	ih.FiscalYear = SSECA.FiscalYear				 
                        AND ih.StudentUSI = SSECA.StudentUSI
                        AND ih.SchoolId = SSECA.Schoolid 
                        AND ih.LocalCourseCode = SSECA.LocalCourseCode 
                        AND ih.TermTypeId = SSECA.TermTypeId 
                        AND ih.SchoolYear = SSECA.SchoolYear 
                        AND Ih.SectionBeginDate = SSECA.BeginDate 
                        AND ih.IntegrityRuleTypeId = 13 
						AND ih.SessionName = SSECA.SessionName

             INNER JOIN leadata.Section SEC 
                     ON	SSECA.FiscalYear = Sec.FiscalYear 				
						AND SSECA.SchoolId = SEC.SchoolId 
                        AND SSECA.ClassPeriodName = SEC.ClassPeriodName 
                        AND SSECA.ClassroomIdentificationCode = SEC.ClassroomIdentificationCode
                        AND SSECA.LocalCourseCode = SEC.LocalCourseCode
						AND SSECA.TermTypeId = SEC.TermTypeId						 
                        AND SSECA.SchoolYear = SEC.SchoolYear 
						AND SSECA.UniqueSectionCode = SEC.UniqueSectionCode			 
						AND SSECA.SequenceOfCourse = SEC.SequenceOfCourse
						AND SSECA.SessionName = SEC.SessionName				

             INNER JOIN leadata.CourseOffering CO 
                     ON	SSECA.FiscalYear = CO.FiscalYear			
						AND SSECA.SchoolId = CO.SchoolId 
                        AND SSECA.TermTypeId = CO.TermTypeId 
                        AND SSECA.SchoolYear = CO.SchoolYear 
                        AND SSECA.LocalCourseCode = CO.LocalCourseCode
						AND SSECA.SessionName = CO.SessionName		

             INNER JOIN entity.Course C 
                     ON CO.EducationOrganizationId = C.EducationOrganizationId 
                        AND CO.FiscalYear = C.FiscalYear      
                        AND CO.CourseCode = C.CourseCode

             INNER JOIN leadata.CourseTranscript CTRAN 
                     ON	CTRAN.FiscalYear = SSECA.FiscalYear				 
                        AND CTRAN.StudentUSI = SSECA.StudentUSI 
                        AND CTRAN.SchoolYear = SSECA.SchoolYear 
                        AND CTRAN.TermTypeId = SSECA.TermTypeId 
                        AND CTRAN.EducationOrganizationId = SSECA.SchoolId 
                        AND CTRAN.CourseCode = CO.CourseCode	

             INNER JOIN integrity.vw_Sectiongradelevelwithminandmaxgrades vwsec 
                     ON sec.fiscalyear = vwsec.fiscalyear 
                        AND sec.schoolid = vwsec.schoolid 
                        AND sec.classperiodname = vwsec.classperiodname 
                        AND sec.classroomidentificationcode = vwsec.classroomidentificationcode
                        AND sec.localcoursecode = vwsec.localcoursecode 
                        AND sec.termtypeid = vwsec.termtypeid 
                        AND sec.schoolyear = vwsec.schoolyear 
						AND sec.UniqueSectionCode = vwsec.UniqueSectionCode    
						AND sec.SequenceOfCourse = vwsec.SequenceOfCourse	 
						AND sec.SessionName = vwsec.SessionName		    

             LEFT JOIN entity.TermType TT 
                    ON SSECA.TermTypeId = TT.TermTypeId 

             LEFT JOIN leadata.SectionCourseCharacteristic SCC 
                    ON SCC.FiscalYear = SSECA.FiscalYear
					   AND SCC.SchoolId = SSECA.SchoolId 
                       AND SCC.ClassPeriodName = SSECA.ClassPeriodName 
                       AND SCC.ClassroomIdentificationCode = SSECA.ClassroomIdentificationCode
                       AND SCC.LocalCourseCode = SSECA.LocalCourseCode 
                       AND SCC.TermTypeId = SSECA.TermTypeId 
                       AND SCC.SchoolYear = SSECA.SchoolYear 
					   AND SCC.SessionName = SSECA.SessionName		
					   AND SCC.UniqueSectionCode = SSECA.UniqueSectionCode	 
					   AND SCC.SequenceOfCourse = SSECA.SequenceOfCourse
			           
             LEFT JOIN leadata.Descriptor D1 
                    ON D1.DescriptorId = SSECA.CourseEntryDescriptorId 

             LEFT JOIN leadata.Descriptor D2 
                    ON D2.DescriptorId = SSECA.CourseExitDescriptorId 

      WHERE  ih.ExecutionId = @ExecutionId 
             AND ih.MessageId = @MessageId 
  END
