/********************************************************************************************************
**Procedure Name:
**      integrity.GetSTCStaffRuleData
**
**Author:
**      Rohith Chintamaneni
**
**Description:  
**     Get STC Staff RuleData
**               
**Input:
**
**Output:
**     Current STC Staff Data for integrity processing
**
**Returns:
**
**Revision History:
**     Who          When        What
**    Rohith		6/13/2016	Initial Creation
**	  Psharma		6/23/2016	Added SchoolYear to Select and the Joins
**	  PKanyar		4/18/2017	Made changes for 2 new columns added to SectionExternalProviderTeacher  
**								and StaffSectionAssociation table
**	  PKanyar		02/20/2019	Added new column SessionName in the joins for AZEDS 5.0 changes
**	  PKanyar		09/03/2019	Added SessionName in the join with Section after adding SessionName in IntegrityNeed table
**
**********************************************************************************************************/
--declare @ExecutionId as int = 15624,@MessageId as [nvarchar](36) = 56682

CREATE PROCEDURE [integrity].[GetSTCStaffRuleData]
       @ExecutionId as int,
	   @MessageId as [nvarchar](36)
AS
BEGIN 
      SET NOCOUNT ON;
         SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED  -- this is simiar to Nolock. Instead of doing for each table I set this at SP level.      
            	
			SELECT DISTINCT 
			 S.StaffUSI, 
			 S.FirstName, 
             S.LastSurName                                   AS LastName, 
             S.BirthDate, 
             ST.CodeValue                                    AS SexType, 
             S.HighlyQualifiedTeacher,													
             S.StaffUniqueId,
             SSECA.SchoolId									 AS SchoolID, 
             SSECA.ClassPeriodName, 
             SSECA.ClassroomIdentificationCode, 
             Lower(SSECA.LocalCourseCode)					 AS LocalCourseCode, 
             Lower(TT.CodeValue)                             AS TermType, 
             SSECA.FiscalYear								 AS FiscalYear,
			 SSECA.SchoolYear								 AS SchoolYear,
             SSECA.BeginDate                                 AS StaffSectionBeginDate, 
             SSECA.EndDate									 AS StaffSectionEndDate,	
             SSECA.PercentageContribution,												
             SS.SessionName, 
             SS.BeginDate                                    AS CourseBeginDate,		
             SS.EndDate                                      AS CourseEndDate,			
             SS.TotalInstructionalDays, 
             SEPT.ExternalProviderName, 
             SEPT.ProviderTeacherLastName, 
             SEPT.ProviderTeacherFirstName, 
             SEPT.ClassroomPositionDescriptorCodeValue       AS ClassroomPositionDescriptor, 
             SEPT.BeginDate                                  AS ProviderTeacherBeginDate, 
             SEPT.EndDate                                    AS ProviderTeacherEndDate,  
             (SELECT COUNT(*) 
              FROM leadata.StaffSectionAssociation SSECA1 
              WHERE SSECA1.FiscalYear = SEC.FiscalYear    
                AND SSECA1.StaffUSI = S.StaffUSI         
                AND SSECA1.SchoolId = SEC.SchoolId                
				AND SSECA1.ClassPeriodName = SEC.ClassPeriodName 
                AND SSECA1.ClassroomIdentificationCode = SEC.ClassroomIdentificationCode 
                AND SSECA1.LocalCourseCode = SEC.LocalCourseCode 
                AND SSECA1.TermTypeId = SEC.TermTypeId 
				AND SSECA1.SchoolYear = SEC.SchoolYear
				AND SSECA1.SessionName = SEC.SessionName							
				AND SSECA1.UniqueSectionCode = SEC.UniqueSectionCode
				AND SSECA1.SequenceOfCourse = SEC.SequenceOfCourse
				)											AS CountOfCourseAssigned 

      FROM   [integrity].[vw_GetIntegrityHistoryPerExecution] ih  		
	  	
             INNER JOIN leadata.Section SEC 
				ON SEC.FiscalYear = IH.FiscalYear      
                    AND SEC.SchoolId = Ih.SchoolId    
                    AND SEC.LocalCourseCode = Ih.LocalCourseCode      
                    AND SEC.TermTypeId = Ih.TermTypeId
					AND SEC.SchoolYear = IH.SchoolYear
					AND SEC.SessionName = IH.SessionName
					AND ih.IntegrityRuleTypeId = 11
			 
			 INNER JOIN leadata.Staff S 
					 ON  S.StaffUSI = ih.StaffUSI 
            
			 INNER JOIN leadata.StaffSectionAssociation SSECA 
                     ON SEC.FiscalYear  =SSECA.Fiscalyear      
						AND S.StaffUSI = SSECA.StaffUSI 
						AND SEC.SchoolId = SSECA.SchoolId 
                        AND SEC.LocalCourseCode = SSECA.LocalCourseCode 
                        AND SEC.TermTypeId = SSECA.TermTypeId 
						AND SEC.ClassPeriodName = SSECA.ClassPeriodName
						AND SEC.ClassroomIdentificationCode = SSECA.ClassroomIdentificationCode
						AND SEC.SchoolYear = SSECA.SchoolYear
						AND SEC.SessionName = SSECA.SessionName		
						AND SEC.UniqueSectionCode = SSECA.UniqueSectionCode
						AND SEC.SequenceOfCourse = SSECA.SequenceOfCourse
			 
			 INNER JOIN entity.TermType TT 
                     ON SSECA. TermTypeId = TT.TermTypeId 
             
			 INNER JOIN leadata.[Session] SS 
                     ON SS.FiscalYear = SSECA.FiscalYear   
						AND SS.SchoolId = SSECA.SchoolId 
                        AND SS.TermTypeId = SSECA.TermTypeId 
                        AND SS.SchoolYear = SSECA.SchoolYear 
						AND SS.SessionName = SSECA.SessionName		    
			
			 LEFT JOIN leadata.SectionExternalProviderTeacher SEPT 
                     ON SEC.FiscalYear = SEPT.Fiscalyear    
						AND SEC.SchoolId = SEPT.SchoolId 
                        AND SEC.ClassPeriodName = SEPT.ClassPeriodName 
                        AND SEC.ClassroomIdentificationCode = SEPT.ClassroomIdentificationCode 
                        AND SEC.LocalCourseCode = SEPT.LocalCourseCode 
                        AND SEC.TermTypeId = SEPT.TermTypeId 
                        AND SEC.SchoolYear = SEPT.SchoolYear
						AND SEC.SessionName = SEPT.SessionName		 	
						AND SEC.UniqueSectionCode = SEPT.UniqueSectionCode
						AND SEC.SequenceOfCourse = SEPT.SequenceOfCourse						                     
             
			 LEFT JOIN leadata.SexType ST 
                     ON S.SexTypeID = ST.SexTypeID            
			 
			 WHERE ih.ExecutionId = @ExecutionId AND ih.MessageId = @MessageId 									 
               
END