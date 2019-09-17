/******************************************************************************************  
** Script Name:[integrity].[vw_SectionGradeLevelWithMinAndMaxGrades]   
**   
**  
** Author: Rohith chintamaneni- 
**   
**  
** Description: View to get list of section records with Min and Max Grades 
**               
**  
**  
** Revision History: 
** Rchinta		07/15/2016  Created proc
** Britto		04/10/2017  Removed reference to section table as this was unnecessary and it was causing performance issues in production   
** PKanyar		4/12/2018	Added 2 more fields- UniqueSectionCode, SequenceOfCourse (PKs) to the result set 
** PKanyar		02/20/2019	Added SessionName to the result set for AZEDS 5.0 changes
**             
********************************************************************************************/
CREATE VIEW [integrity].[vw_sectiongradelevelwithminandmaxgrades] 
AS 
  WITH ctesectiongradelevel (Fiscalyear, SchoolId, SchoolYear, ClassPeriodName, 
							 ClassroomIdentificationCode, TermTypeId, LocalCourseCode, 
							 SessionName, UniqueSectionCode, SequenceOfCourse,
							 MinGradeLevel, MaxGradeLevel)
			 
       AS (SELECT sgl.FiscalYear 
                  , sgl.SchoolId 
                  , sgl.SchoolYear 
                  , sgl.ClassPeriodName 
                  , sgl.ClassroomIdentificationCode 
                  , sgl.TermTypeId 
                  , sgl.LocalCourseCode 
				  , sgl.SessionName 
				  , sgl.UniqueSectionCode
				  , sgl.SequenceOfCourse  
                  , MIN(G.GradeLevelTypeId) AS MinGradeLevel 
                  , MAX(G.GradeLevelTypeId) AS MaxGradeLevel 
           FROM   leadata.SectionGradeLevel sgl (NOLOCK) 
                  INNER JOIN [entity].[GradeLevelType] G 
                          ON sgl.GradeLevelDescriptorId = G.GradeLevelDescriptorId 
           GROUP BY sgl.FiscalYear 
                  , sgl.SchoolId 
                  , sgl.SchoolYear 
                  , sgl.ClassPeriodName 
                  , sgl.ClassroomIdentificationCode 
                  , sgl.TermTypeId 
                  , sgl.LocalCourseCode 
				  , sgl.SessionName
				  , sgl.UniqueSectionCode
				  , sgl.SequenceOfCourse ) 

  SELECT FiscalYear 
         , SchoolId 
         , ClassPeriodName 
         , ClassroomIdentificationCode 
         , LocalCourseCode 
		 , SessionName
         , TermTypeId 
         , SchoolYear 
		 , UniqueSectionCode
		 , SequenceOfCourse  
		 , glt.GradeLevelTypeId AS LowestGradeLevelOffered
         , glt.CodeValue		AS LowestGradeLevelOfferedCodeValue 
         , glt.[Description]	AS LowestGradeLevelOfferedDescription 
		 , glt2.GradeLevelTypeId AS HighestGradeLevelOffered
         , glt2.CodeValue		AS HighestGradeLevelOfferedCodeValue 
         , glt2.[Description]	AS HighestGradeLevelOfferedDescription 
  FROM   ctesectiongradelevel cte 
         INNER JOIN [entity].[GradeLevelType] glt 
                 ON glt.GradeLevelTypeId = cte.MinGradeLevel 
         INNER JOIN [entity].[GradeLevelType] glt2 
                 ON glt2.GradeLevelTypeId = cte.MaxGradeLevel