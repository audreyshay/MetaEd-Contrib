--========================================================================================== 
--Author: rchinta      
--Create date: 7/09/2015  
--Description:  Gets grades offered at school  
-- to run SP    :  exec [Integrity].[GetGradesOfferedAtSchool]   
--Revision History:
--	Who						When		What
--	Britto Augustine		06/07/2017	Added @Fiscalyear parameter, because this proc should bring records by fy
--========================================================================================== 
CREATE PROCEDURE [integrity].[GetGradesOfferedAtSchool]
	@fiscalyear as int  = null 
AS 
  BEGIN 
	  IF @fiscalyear IS NULL
	  BEGIN
		SELECT TOP 1 @fiscalyear = FiscalYear 
		FROM [config].[FiscalYear] (nolock)
		WHERE IsCurrent = 1
	  END

      SELECT sgl.schoolid as 'SchoolId',
             glt.gradeleveltypeid       as 'SchoollevelTypeId'   
      FROM   entity.schoolgradelevel sgl             
             INNER JOIN entity.gradeleveltype glt 
                     ON glt.gradeleveltypeid = sgl.gradeleveltypeid			
                    AND sgl.FiscalYear = @fiscalyear
      ORDER  BY sgl.schoolid 
  END