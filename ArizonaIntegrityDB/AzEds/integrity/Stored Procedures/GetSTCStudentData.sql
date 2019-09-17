/********************************************************************************************************
**Procedure Name:
**      integrity.GetSTCStudentData
**
**Author:
**      PSharma
**
**Description:  
**     Get STC StudentData
**               
**Input:
**
**Output:
**     Current STC Student Data for integrity processing
**
**Returns:
**
**Revision History:
**     Who                  When            What
**    Venugopal Metukuru	6/20/2016		Initial Creation
**	  Psharma				6/23/2016		Added SchoolYear to Select AND the Joins
**	  Amit Verma			3/27/2017		Added the missing Join Predicate in CourceOffering to Course Table
**	  PKanyar				4/18/2017		Made changes for 2 new columns added to SectionCourseCharacteristic  
**											and StudentSectionAssociation table
**	  PKanyar				02/20/2019		Added new column SessionName in the joins for AZEDS 5.0 changes
**	  Vinoth K				08/08/2019		Added new column SessionName as part of select
**
**********************************************************************************************************/
--declare    @ExecutionId as int = 15624, @MessageId as [nvarchar](36) = 56683

CREATE PROCEDURE [integrity].[GetSTCStudentData]
       @ExecutionId as int,
	   @MessageId as [nvarchar](36)
AS
BEGIN 
      SET NOCOUNT ON;
         SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED  -- this is simiar to Nolock. Instead of doing for each table I set this at SP level.      
            	
			SELECT Distinct SSECA.StudentUSI, 
			                SSECA.SchoolId                                      AS SchoolID,  
							SSECA.ClassPeriodName,				                
						    Lower(SSECA.LocalCourseCode)						AS LocalCourseCode,				                
						    SSECA.ClassroomIdentificationCode,	                
							SEC.EducationalEnvironmentTypeCodeValue             AS EducationEnvironmentType,			                
							0													AS 'IsStudentNotRegistered',				                
							----process.IsStudentNotRegistered (SECA.StudentUSI, SSECA.SchoolId, SSECA.SchoolYear)
							Lower(TT.CodeValue)                                  AS TermType, 
							SSECA.FiscalYear								     AS FiscalYear,
							SSECA.SchoolYear									 AS SchoolYear, 	                
							SSECA.BeginDate                                      AS StudentSectionBeginDate,
							SSECA.EndDate						                 AS StudentSectionEndDate,
							SS.BeginDate						                 AS CourseBeginDate,
							SS.EndDate							                 AS CourseEndDate,
							SSECA.HomeroomIndicator,			                
							SSECA.DualCredit,					                
							D1.CodeValue	                                     AS CourseEntryDescriptor,
						    D2.CodeValue					                     AS CourseExitDescriptor,
							SSECA.ConcurrentEnrollment,
							0 as 'IsConcurrentlyEnrolled',
					  --      --process.IsConcurrentlyEnrolled  (SSECA.StudentUSI, SSECA.SchoolYear, Getdate()) function
							----lSCC.CourseLevelCharacteristicTypeCodeValue			 AS 'CourseLevelCharacteristicType',
							C.HighSchoolCourseRequirement,
							COALESCE(iscc.Iscoursesimultaneouslyenrolled,0)      AS 'IsCourseSimultaneouslyEnrolled',
							Lower(ss.SessionName)								 AS SessionName

	        FROM [integrity].[vw_GetIntegrityHistoryPerExecution] ih 
			       
				   JOIN leadata.StudentSectionAssociation SSECA
                     ON	ih.FiscalYear = SSECA.FiscalYear				 
                        AND ih.StudentUSI = SSECA.StudentUSI
                        AND ih.SchoolId = SSECA.Schoolid 
                        AND ih.LocalCourseCode = SSECA.LocalCourseCode 
                        AND ih.TermTypeId = SSECA.TermTypeId 
                        AND ih.SchoolYear = SSECA.SchoolYear 
                        AND Ih.SectionBeginDate = SSECA.BeginDate 
						AND ih.integrityruleTypeid = 12
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

				   INNER JOIN entity.TermType TT 
                     ON SSECA. TermTypeId = TT.TermTypeId 
				   
				   INNER JOIN leadata.[Session] SS 
                     ON SS.FiscalYear = SSECA.FiscalYear    
						AND SS.SchoolId = SSECA.SchoolId 
                        AND SS.TermTypeId = SSECA.TermTypeId 
                        AND SS.SchoolYear = SSECA.SchoolYear
						AND SS.SessionName = SSECA.SessionName			
			       
				   LEFT JOIN leadata.CourseOffering CO 
					 ON	SSECA.FiscalYear = CO.FiscalYear			
						AND SSECA.SchoolId = CO.SchoolId 
                        AND SSECA.TermTypeId = CO.TermTypeId 
                        AND SSECA.SchoolYear = CO.SchoolYear 
                        AND SSECA.LocalCourseCode = CO.LocalCourseCode
						AND SSECA.SessionName = CO.SessionName			    
				   
				   LEFT JOIN entity.Course C 
                     ON CO.EducationOrganizationId = C.EducationOrganizationId 
                        AND CO.FiscalYear = C.FiscalYear      
                        AND CO.CourseCode = C.CourseCode									        
				   
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
					 ON SSECA.CourseEntryDescriptorId = D1.DescriptorId		
				  
				  LEFT JOIN leadata.Descriptor D2 
					 ON SSECA.CourseExitDescriptorId = D2.DescriptorId       
                  
				  LEFT JOIN [integrity].[vw_IsCourseSimultaneouslyEnrolled] iscc  -- SessionName not added inside this view
				     ON iscc.fiscalyear = SSECA.FiscalYear
						AND iscc.StudentUSI = SSECA.StudentUSI
						AND iscc.SchoolId   = SSECA.SchoolId
						AND iscc.SchoolYear = SSECA.SchoolYear
						AND iscc.LocalCourseCode = SSECA.LocalCourseCode
						AND iscc.TermTypeId = SSECA.TermTypeId						
							 
			      WHERE ih.ExecutionId = @ExecutionId AND ih.MessageId = @MessageId 									 
               
END
