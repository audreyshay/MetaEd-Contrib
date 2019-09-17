/********************************************************************************************************
**Procedure Name: 
**      integrity.GetSupportProgramAssociationData 
** 
**Author: 
**      Amit Verma 
** 
**Description:   
**  Get Student Support Program Participation Data for integrity processing   
**                
**Input: 
** 
**Output: 
**  Student Support Program Participation Data for integrity processing 
** 
**Returns: 
** 
**Implementation: 
**  Used to get Student Support Program Participation Data for integrity processing   
** 
**Revision History: 
**  Who      When    What 
**  Jeff Stokes  09/09/2016  Initial Creation 
**  PSharma    09/10/2016  Removed the Inner Join with StudentSchoolAssociation because I do not see a need of that table here
**  PSharma    09/16/2016  Joined the table entity.ProgramNeedCodeMapping to return only the valid Need Combination. Also Used the
**              view StudentProgramNeedAssociation instead of StudentNeeds table 
**  PSharma    10/17/2016  Replaced the view StudentSchoolAssociation_IsStudentEnrolledInTwoMainSchools with vw_ConcurrentSupportProgramAssociation
**  PSharma    11/7/2016   Accounted for NULL 
**  PSharma     12/22/2016  Removing the Enrollment from ProgramAssociation... 
              ..three things in one Program, Enrollment and Need are resulting in multiple combinations in case of bad data
              which is affecting Rule App performance 
**  Amit Verma  01/23/2017  Updated the Stored Procedure to accomodate the ProgramNeedCodeMapping Changes
**  Amit Verma  07/11/2017  Updated the Stored Procedure to fix Bug 190039: -50020 Rule 
**  Sucharita   07/20/2018  Joined with view [integrity].[vw_HasOutOfRangeEventDates]  to get the flag HasOutOfRangeEventDates and changed join to left join on table entity.programService and
**                          leadata.Descriptor as there is no service descriptor for CCLC program 
** Sucharita   10/05/2018   Added extra join conditon on program begin date and Program Enddate while joining with view vw_HasOutOfRangeEventDates 
** Sucharita   10/11/2018   Removed join on Program Enddate and added join on ProgramEducationOrganizationId while joining with view vw_HasOutOfRangeEventDates 
** Sucharita   03/1/2019    Added IntegrityRuleTypeId = 14 and changed inner join to left join with config.DataSubmissionWindow table
** Rchintta    5/24/2019 Rewriting to improve performance but no realluy focusing on logic. I think logic also has to be re-written to get max performance. 
******************************************************************************************************************************************************************************/
CREATE PROCEDURE [integrity].[Getsupportprogramassociationdata] @ExecutionId INT, 
                                                                @MessageId NVARCHAR(36) 
AS 
    SET nocount ON; 
    SET TRANSACTION isolation level READ uncommitted 

  BEGIN 
      SET nocount ON; 
      SET TRANSACTION isolation level READ uncommitted 

      DECLARE @FiscalYear INT 

      SELECT @FiscalYear = fiscalyear 
      FROM   process.execution (nolock) 
      WHERE  executionid = @ExecutionId 

      CREATE TABLE #temp_studentprogramneedassociation 
        ( 
           fiscalyear                     INT, 
           studentusi                     INT, 
           schoolid                       INT, 
           programeducationorganizationid INT, 
           programtypeid                  INT, 
           programname                    NVARCHAR(60), 
           programbegindate               DATE, 
           programenddate                 DATE, 
           exitcode                       NVARCHAR(60), 
           programcode                    NVARCHAR(60), 
           needdescriptorid               INT, 
           needcode                       NVARCHAR(50), 
           needstartdate                  DATE, 
           needenddate                    DATE, 
           primarystudentneedindicator    BIT, 
           spasourceid                    UNIQUEIDENTIFIER, 
           snsourceid                     UNIQUEIDENTIFIER 
        ) 

      INSERT INTO #temp_studentprogramneedassociation 
                  (fiscalyear, 
                   studentusi, 
                   schoolid, 
                   programeducationorganizationid, 
                   programtypeid, 
                   programname, 
                   programbegindate, 
                   programenddate, 
                   exitcode, 
                   programcode, 
                   needdescriptorid, 
                   needcode, 
                   needstartdate, 
                   needenddate, 
                   primarystudentneedindicator, 
                   spasourceid, 
                   snsourceid) 
      SELECT fiscalyear, 
             studentusi, 
             schoolid, 
             programeducationorganizationid, 
             programtypeid, 
             programname, 
             programbegindate, 
             programenddate, 
             exitcode, 
             programcode, 
             needdescriptorid, 
             needcode, 
             needstartdate, 
             needenddate, 
             primarystudentneedindicator, 
             spasourceid, 
             snsourceid 
      FROM 
[integrity].[Udfstudentprogramneedassociationperexecutionmessage](@ExecutionId, 
       @MessageId, @FiscalYear) 

    SELECT * 
    INTO   #temp_concurrentsupportprogramassociation 
    FROM 
integrity.Udfconcurrentsupportprogramassociationperexecutionmessage(@ExecutionId, @MessageId, @FiscalYear)

    SELECT * 
    INTO   #temp_hasoutofrangeeventdates 
    FROM   integrity.UdfHasoutofrangeeventdatesperexecutionmessage(@ExecutionId, 
           @MessageId, 
                  @FiscalYear) 

    --Get Student SPED Program Participation Data 
    SELECT DISTINCT SPA.studentusi, 
                    SPA.educationorganizationid AS SchoolID, 
                    SPA.programtypeid           AS ProgramType, 
                    SPA.programname             AS ProgramName, 
                    SPA.educationorganizationid, 
                    SPA.begindate               AS ProgramBeginDate, 
                    SPA.enddate                 AS ProgramEndDate, 
                    RED.codevalue               AS ResonDescriptor, 
                    SND.codevalue               AS NeedCode, 
                    ( CASE 
                        WHEN ssaisetms.isconcurrentlyenrolled = 1 THEN 1 
                        ELSE 0 
                      END )                     AS ConcurrentProgramATAnotherLEA 
                    , 
                    P.isapproved                AS 
                    LEAIsApprovedForThisProgram, 
                    CASE 
                      WHEN ORED.programname IS NOT NULL THEN 1 
                      ELSE 0 
                    END                         AS HavingOutOfRangeEventDates 
    FROM   [integrity].[vw_getintegrityhistoryperexecution] SPEDDM 
           JOIN leadata.studentprogramassociation SPA 
             ON ( SPEDDm.fiscalyear = SPA.fiscalyear 
                  AND SPEDDM.studentusi = SPA.studentusi 
                  AND SPEDDM.schoolid = SPA.educationorganizationid 
                  AND SPEDDM.integrityruletypeid = 14 
                 ------ Brings only data for Support Program 
                 ) 
           JOIN entity.program P 
             ON ( SPA.fiscalyear = P.fiscalyear 
                  AND SPA.programeducationorganizationid = 
                      P.educationorganizationid 
                  AND SPA.programtypeid = P.programtypeid 
                  AND SPA.programname = P.programname 
                  AND SPA.programtypeid = 59 ) 
           LEFT JOIN config.datasubmissionwindow DSW 
                  ON SPA.fiscalyear = DSW.fiscalyear 
                     AND DSW.requesttypeid = 3 
           LEFT JOIN entity.programservice PS 
                  ON ( SPA.fiscalyear = PS.fiscalyear 
                       AND SPA.programeducationorganizationid = 
                           PS.educationorganizationid 
                       AND SPA.programtypeid = PS.programtypeid 
                       AND SPA.programname = PS.programname 
                       AND SPA.programtypeid = 59 ) 
           LEFT JOIN leadata.descriptor SD 
                  ON PS.fiscalyear = SD.fiscalyear 
                     AND PS.servicedescriptorid = SD.descriptorid 
           LEFT JOIN leadata.descriptor RED 
                  ON ( SPA.fiscalyear = RED.fiscalyear 
                       AND SPA.reasonexiteddescriptorid = RED.descriptorid ) 
           LEFT JOIN #temp_studentprogramneedassociation SN 
                  ON ( SPA.fiscalyear = SN.fiscalyear 
                       AND SPA.studentusi = SN.studentusi 
                       AND SPA.educationorganizationid = sn.schoolid 
                       AND SPA.programeducationorganizationid = 
                           SN.programeducationorganizationid 
                       AND SPA.programtypeid = SN.programtypeid 
                       AND SPA.programname = sn.programname 
                       AND SPA.begindate = sn.programbegindate ) 
           LEFT JOIN leadata.descriptor SND 
                  ON ( SN.fiscalyear = SND.fiscalyear 
                       AND SN.needdescriptorid = SND.descriptorid ) 
           LEFT JOIN entity.programneedcodemapping PN 
                  ON ( PN.fiscalyear = SPA.fiscalyear 
                       AND PN.[needdescriptorid] = SND.descriptorid 
                       AND PN.[servicedescriptorid] = SD.descriptorid ) 
           LEFT JOIN #temp_concurrentsupportprogramassociation ssaisetms 
                  ON ( SPEDDM.studentusi = ssaisetms.studentusi 
                       AND SPEDDM.fiscalyear = ssaisetms.fiscalyear 
                       AND SPA.programtypeid = ssaisetms.programtypeid 
                       AND SPA.programeducationorganizationid = 
                           ssaisetms.programeducationorganizationid ) 
           LEFT JOIN #temp_hasoutofrangeeventdates ORED 
                  ON ( SPA.fiscalyear = ORED.fiscalyear 
                       AND SPA.studentusi = ORED.studentusi 
                       AND SPA.programname = ORED.programname 
                       AND SPA.begindate = ORED.begindate 
                       AND SPA.programeducationorganizationid = 
                           ORED.programeducationorganizationid 
                       AND SPA.educationorganizationid = 
                           ORED.educationorganizationid ) 
    WHERE  SPEDDM.executionid = @ExecutionId 
           AND SPEDDM.messageid = @MessageId 
    ORDER  BY SPA.studentusi, 
              SPA.educationorganizationid, 
              SPA.begindate 

    DROP TABLE #temp_concurrentsupportprogramassociation 

    DROP TABLE #temp_studentprogramneedassociation 

    DROP TABLE #temp_hasoutofrangeeventdates 
END 
