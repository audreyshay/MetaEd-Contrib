/********************************************************************************************************
**Procedure Name:
**      integrity.GetSTCCourseRuleData
**
**Author:
**      Amit Verma
**
**Description:  
**     Get STC Cource RuleData
**               
**Input:
**
**Output:
**     Current STC Course Data for integrity processing
**
**Returns:
**
**Revision History:
**     Who                 When          What
**    Rohith		6/13/2016		Initial Creation
**	  PSharma		6/23/2016		Added SchoolYear
**    Vmetukuru		6/26/2016       CountOfStudents Enabled (no of students enrolled in that course)
**	  Amit Verma	3/27/2017		Added the missing Join Predicate in CourceOffering to Course Table
**	  PKanyar		4/18/2017		Made changes for 2 new columns added to SectionCourseCharacteristic  
**									and StudentSectionAssociation table
**	  Rchinta		5/23/2017		removing the currentFiscalyear from Inrule and getting it from Execution Table
**	  PKanyar		02/20/2019		Added new column SessionName in the joins for AZEDS 5.0 changes
**	  PKanyar		09/03/2019		Added SessionName in the join with CourseOffering after adding SessionName in IntegrityNeed table
**
**********************************************************************************************************/
--declare @ExecutionId as int = 15624, @MessageId as [nvarchar](36) = 56682

CREATE PROCEDURE [integrity].[GetSTCCourseRuleData]
       @ExecutionId as int,
	   @MessageId as [nvarchar](36)
AS
BEGIN 
      SET NOCOUNT ON;
         SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED  -- this is simiar to Nolock. Instead of doing for each table I set this at SP level.      
                 
				DECLARE @CurrentFiscalYear INT          
				 
				SELECT @CurrentFiscalYear = FiscalYear 
				FROM	process.Execution (nolock)
				WHERE	ExecutionId = @ExecutionId	 
				 	
				   -- Get Course Data for inrules - XML generation will happen on C-sharp side 
               SELECT DISTINCT 
			     s.SchoolId, 
                 LOWER(T.CodeValue)                                     AS TermType, 
				 S.SessionTypeDescriptorCodeValue                       AS SessionType,
                 s.FiscalYear                                           AS FiscalYear,			
				 s.SchoolYear											AS SchoolYear,		
				 @CurrentFiscalYear										AS CurrentFiscalYear, 
                 co.EducationOrganizationId                             AS EducationOrganizastion, 
                 LOWER(co.LocalCourseCode)								AS LocalCourseCode,
                 co.CourseCode                                          AS StateCourseCode, 
                 s.SessionName, 
                 s.BeginDate                                            AS CourseBeginDate,		
                 s.EndDate                                              AS CourseEndDate,	
                 sec.EducationalEnvironmentTypeCodeValue                AS EducationalEnvironmentType, 
                 sec.AvailableCreditTypeCodeValue                       AS AvailableCreditType, 					 	
                 sec.UniqueSectionCode, 
                 sec.AvailableCredit,
                 sec.TimeTableDayIdentifier, 				 															
                 sec.ClassroomIdentificationCode, 
                 sec.ClassPeriodName, 
                 (SELECT COUNT(ssa.StudentUSI) 
                  FROM leadata.StudentSectionAssociation ssa 
                  WHERE ssa.FiscalYear = sec.FiscalYear    
					AND ssa.SchoolId = sec.SchoolId 
                    AND ssa.ClassPeriodName = sec.ClassPeriodName 
                    AND ssa.ClassroomIdentificationCode = sec.ClassroomIdentificationCode
                    AND ssa.LocalCourseCode = sec.LocalCourseCode
                    AND ssa.TermTypeId = sec.TermTypeId 
                    AND ssa.SchoolYear = sec.SchoolYear 
					AND ssa.SessionName = sec.SessionName		
					AND ssa.UniqueSectionCode = sec.UniqueSectionCode
					AND ssa.SequenceOfCourse = sec.SequenceOfCourse)	AS CountOfStudentsInCourse,		
				 c.HighSchoolCourseRequirement, 														
                 scc.CourseLevelCharacteristicTypeCodeValue			  AS CourseLevelCharacteristicType -- disabled in ruleapp

         FROM [integrity].[vw_GetIntegrityHistoryPerExecution] ih
		 
		 INNER JOIN  leadata.CourseOffering co
			ON co.FiscalYear = ih.FiscalYear   
				AND co.SchoolId = ih.SchoolId   
				AND co.TermTypeId = ih.TermTypeId
				AND co.SchoolYear = ih.SchoolYear 
				AND co.LocalCourseCode = ih.LocalCoursecode	
				AND co.SessionName = ih.SessionName
				AND ih.integrityruleTypeid = 10	   
		
		INNER JOIN leadata.[Session] s 
			ON s.FiscalYear = co.FiscalYear    
				AND S.Schoolid = co.SchoolId
				AND S.TermTypeId = co.TermTypeId 
				AND s.SchoolYear = co.SchoolYear  
				AND s.SessionName = co.SessionName		       
		
		INNER JOIN entity.TermType T 
            ON T.TermTypeId = s.TermTypeId 				        
        
		INNER JOIN entity.Course c 
            ON c.EducationOrganizationId = co.EducationOrganizationId			
				AND c.FiscalYear = co.FiscalYear   					
				AND c.CourseCode = co.CourseCode 								    			
        
		INNER JOIN leadata.Section sec 
            ON sec.FiscalYear = co.FiscalYear     
                AND sec.SchoolId = co.SchoolId 
                AND sec.TermTypeId = co.TermTypeId 
                AND sec.LocalCourseCode = co.LocalCourseCode 
				AND sec.SchoolYear = co.SchoolYear
				AND sec.SessionName = co.SessionName						
        
		LEFT JOIN leadata.SectionCourseCharacteristic scc 
            ON scc.Fiscalyear = sec.FiscalYear
				AND scc.SchoolId = sec.SchoolId 
                AND scc.classPeriodName = sec.classPeriodName 
                AND scc.ClassroomIdentificationCode = sec.ClassroomIdentificationCode 
                AND scc.LocalCourseCode = sec.LocalCourseCode 
                AND scc.TermTypeId = sec.TermTypeId 
				AND scc.SchoolYear = sec.SchoolYear  
				AND scc.SessionName = sec.SessionName					              
		        AND scc.UniqueSectionCode = sec.UniqueSectionCode
				AND scc.SequenceOfCourse = sec.SequenceOfCourse

		WHERE ih.ExecutionId = @ExecutionId AND ih.MessageId = @MessageId										 
               
END
