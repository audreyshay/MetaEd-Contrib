/********************************************************************************************************
**Procedure Name:
**      integrity.GetSTCCourseLevelCharacteristics
**
**Author:
**      PSharma
**
**Description:  
**     Get STC CourceLevelCharacteristics
**               
**Input:
**
**Output:
**     Current STC CourceLevelCharacteristics Data for integrity processing
**
**Returns:
**
**Revision History:
**     Who          When        What
**  PSharma		09/08/2016	Initial Creation
**	PKanyar		4/13/2017	Made changes for 2 new columns added to SectionCourseCharacteristic  
**							and StudentSectionAssociation table
**	PKanyar		02/20/2019	Added SessionName in the join with SectionCourseCharacteristic for AZEDS 5.0 changes
**	PKanyar		09/03/2019	Added SessionName in the join with StudentSectionAssociation after adding SessionName in IntegrityNeed table
**
**********************************************************************************************************/
--declare @ExecutionId as int = 15472 , @MessageId as [nvarchar](36) = 56442

CREATE PROCEDURE [integrity].[GetSTCCourseLevelCharacteristics]
       @ExecutionId as int,
	   @MessageId as [nvarchar](36)
AS
BEGIN 
      SET NOCOUNT ON;
         SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED  -- this is simiar to Nolock. Instead of doing for each table I set this at SP level.      
            	
			SELECT Distinct                
						    LOWER(SSECA.LocalCourseCode)						AS LocalCourseCode,				                
							SCC.CourseLevelCharacteristicTypeCodeValue			AS 'CourseCharacteristicType'

	        FROM   [integrity].[vw_GetIntegrityHistoryPerExecution] ih 
		       
				   JOIN leadata.StudentSectionAssociation SSECA
					   ON ih.Fiscalyear = SSECA.FiscalYear                     
						  and ih.StudentUSI  = SSECA.StudentUSI
						  and ih.Schoolid = SSECA.Schoolid 
						  and ih.SchoolYear = SSECA.SchoolYear
						  and ih.localcoursecode = SSECA.localcoursecode
						  AND ih.SessionName = SSECA.SessionName
						  AND Ih.SectionBeginDate = SSECA.BeginDate
						  AND ih.TermTypeId = SSECA.TermTypeId
						  AND ih.integrityruleTypeid = 12  
						        
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
							                   		 
			       WHERE ih.Executionid = @ExecutionId AND ih.messageid = @MessageId 									 
               
END
