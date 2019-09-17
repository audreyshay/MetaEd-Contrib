/************************************************************
**Procedure Name: [Integrity].[GetStudentELLAssessmentInfo] 
**
**Author: Rohith Chintamaneni
**
**Description: GET ELL data from Datamart
**					
**Revision History: 
** Rchinta 8/21/2018- Creating Proc
** Vinoth  8/31/2018 -- Changed the logic for the Not provided should have an classficiation as "ELL Status Undetermined"
** Vinoth  8/31/2018 -- Changed the order of check the performance level
** Sucharita 9/11/2018 ---Changed Performance to Proficiency as Inrule has the field 'Proficiency'
** Sucharita 9/19/2018  ---Removed Checking for azellaperformanceleveldescription = NULL as it is a not NULL field.Added order by condition
** Sucharita 11/27/2018  ---Changed Schema and table name as per new schema and table name change in AZEDSDatamart
**************************************************************************************************************************************************/ 
CREATE PROCEDURE [integrity].[GetStudentELLAssessmentInfo] 
@StudentList AS [Integrity].[AZEDSELLSTUDENTLIST] readonly, 
@FiscalYear  AS INT 
AS 
  BEGIN 
   
      SET NOCOUNT ON;
	  SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED  
	     
      SELECT ASSA.studentassessmentkey, 
             ASSA.statestudentid AS StudentUniqueId, 
             ASSA.fiscalyear, 
             ASSA.TestSchoolKey  AS SchoolID,
             ASSA.ResponsibleLEAKey  AS Districtid, 
             ASSA.AdministrationDate   AS AssessmentDate, 
             APLT.PerformanceLevelDescription AS Proficiency, 
             CASE 
				WHEN aplt.PerformanceLevelDescription = 'Not provided' 
				THEN 
					'ELL Status Undetermined' 
               WHEN aplt.PerformanceLevelDescription <> 'Proficient' THEN 
					'Eligible for ELL Services' 
              
               ELSE 'Not Eligible for ELL Services' 
             END                                    AS ELLClassification 
      FROM   @StudentList SL 
             INNER JOIN AzEDSDatamart.AZELLA.StudentAssessment ASSA 
                     ON SL.[publicsaisid] = ASSA.StateStudentID 

             INNER JOIN AzEDSDatamart.AZELLA.StudentAssessmentScoreResult AOSR 
                     ON ASSA.studentassessmentkey = AOSR.studentassessmentkey  
					          
             INNER JOIN AzEDSDatamart.assessment.assessmentreportingmethodtype ARMT 
                     ON ARMT.assessmentreportingmethodtypekey = AOSR.assessmentreportingmethodtypekey 
                        AND ARMT.assessmentreportingmethoddescription = 'Scale score' 

               INNER JOIN AzEDSDatamart.AZELLA.StudentAssessmentPerformanceLevel ASPL
			         ON AOSR.StudentAssessmentKey = ASPL.StudentAssessmentKey

             INNER JOIN AzEDSDatamart.Assessment.PerformanceLevelType APLT 
                     ON APLT.performanceleveltypekey = ASPL.performanceleveltypekey 

      WHERE  ASSA.fiscalyear IN ( @FiscalYear, @FiscalYear - 1 ) 
	  order by  ASSA.statestudentid,ASSA.AdministrationDate desc
  END 
