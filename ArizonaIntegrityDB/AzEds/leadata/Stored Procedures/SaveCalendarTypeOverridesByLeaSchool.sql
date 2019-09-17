

/************************************************************
**Procedure Name: [leadata].[GetCalendarTypeOverrides]
**
**Author: Venugopal Metukuru
**
**Description:  Gets exitsing count CalendarType for given lea/school/Calendartype
**	
**Revision History:
**	Who			When		What
**	VM		 08/05/2019	Initial Creation

***************************************************************/

CREATE PROCEDURE [leadata].[SaveCalendarTypeOverridesByLeaSchool](@FiscalYear      INT,
                                                                 @LeaId           INT,
                                                                 @SchoolId        INT,
                                                                 @CalendarType    VARCHAR(100),
                                                                 @MaxallowedCount INT,
                                                                 @ModifiedBy      VARCHAR(100))
AS
     BEGIN
         DECLARE @retunvalue INT= 1;

         ---------IF  calendarType override for lea and school and 
         -----------calendartype and fiscalyear is same as default Do delete existing entries if any
         IF EXISTS
         (
             SELECT 1
             FROM config.CalendarTypeOverride(nolock)
             WHERE FiscalYear = @FiscalYear
                   AND LocalEducationAgencyId = @LeaId
                   AND SchoolId = @SchoolId
                   AND CalendarType = @CalendarType
         )
             BEGIN
                 IF EXISTS
                 (
                     SELECT 1
                     FROM config.CalendarTypeOverride(nolock)
                     WHERE FiscalYear = @FiscalYear
                           AND LocalEducationAgencyId = 79275
                           AND SchoolId = 79275
                           AND CalendarType = @CalendarType
                           AND counts = @MaxallowedCount
                 )
                     BEGIN
                         IF(@CalendarType = '5DayAllGrades'
                            OR @CalendarType = '4DayAllGrades')
                             BEGIN
                                 DELETE FROM config.CalendarTypeOverride
                                 WHERE FiscalYear = @FiscalYear
                                       AND LocalEducationAgencyId = @LeaId
                                       AND SchoolId = @SchoolId
                                       AND CalendarType IN('5DayAllGrades', '4DayAllGrades');
                                 
                             END;
                         ELSE
                             BEGIN
                                 DELETE FROM config.CalendarTypeOverride
                                 WHERE FiscalYear = @FiscalYear
                                       AND LocalEducationAgencyId = @LeaId
                                       AND SchoolId = @SchoolId
                                       AND CalendarType = @CalendarType;
                             END;
                     END;  
        
                                 ---------IF  calendarType override exists for lea and school and calendartype and fiscalyear and counts changed
                 ELSE
                 IF EXISTS
                 (
                     SELECT 1
                     FROM config.CalendarTypeOverride(nolock)
                     WHERE FiscalYear = @FiscalYear
                           AND LocalEducationAgencyId = @LeaId
                           AND SchoolId = @SchoolId
                           AND CalendarType = @CalendarType
                           AND counts <> @MaxallowedCount
                 )
                     BEGIN
                         IF(@CalendarType = '5DayAllGrades'
                            OR @CalendarType = '4DayAllGrades')
                             BEGIN
                                 UPDATE config.CalendarTypeOverride
                                   SET
                                       Counts = @MaxallowedCount,
                                       LastModifiedDtm = GETUTCDATE(),
                                       LastModifiedBy = @ModifiedBy
                                 WHERE FiscalYear = @FiscalYear
                                       AND LocalEducationAgencyId = @LeaId
                                       AND SchoolId = @SchoolId
                                       AND CalendarType IN('5DayAllGrades', '4DayAllGrades');
                             END;
                         ELSE
                             BEGIN
                                 UPDATE config.CalendarTypeOverride
                                   SET
                                       Counts = @MaxallowedCount,
                                       LastModifiedDtm = GETUTCDATE(),
                                       LastModifiedBy = @ModifiedBy
                                 WHERE FiscalYear = @FiscalYear
                                       AND LocalEducationAgencyId = @LeaId
                                       AND SchoolId = @SchoolId
                                       AND CalendarType = @CalendarType;
                             END;
                     END;
             END;

                             ---------------IF NOT EXIST and Calendar counts not equal to default then insert it.
         ELSE
         IF EXISTS
         (
             SELECT 1
             FROM config.CalendarTypeOverride(nolock)
             WHERE FiscalYear = @FiscalYear
                   AND LocalEducationAgencyId = 79275
                   AND SchoolId = 79275
                   AND CalendarType = @CalendarType
                   AND counts <> @MaxallowedCount
         )
             BEGIN
                 IF(@CalendarType = '5DayAllGrades'
                    OR @CalendarType = '4DayAllGrades')
                     BEGIN
                         ---------------------5DayAllGrades & 4DayAllGrades 

                         INSERT INTO config.CalendarTypeOverride
                         (FiscalYear
                        , LocalEducationAgencyId
                        , SchoolId
                        , Counts
                        , CalendarType
                        , CreatedBy
                        , CreatedDtm
                        , LastModifiedBy
                        , LastModifiedDtm
                         )
                         VALUES
                         (@FiscalYear,
                          @leaid,
                          @SchoolId,
                          @MaxallowedCount,
                          '5DayAllGrades',
                          @ModifiedBy,
                          GETUTCDATE(),
                          @ModifiedBy,
                          GETUTCDATE()
                         );
                         INSERT INTO config.CalendarTypeOverride
                         (FiscalYear
                        , LocalEducationAgencyId
                        , SchoolId
                        , Counts
                        , CalendarType
                        , CreatedBy
                        , CreatedDtm
                        , LastModifiedBy
                        , LastModifiedDtm
                         )
                         VALUES
                         (@FiscalYear,
                          @leaid,
                          @SchoolId,
                          @MaxallowedCount,
                          '4DayAllGrades',
                          @ModifiedBy,
                          GETUTCDATE(),
                          @ModifiedBy,
                          GETUTCDATE()
                         );
                     END;
                 ELSE
                     BEGIN
                         INSERT INTO config.CalendarTypeOverride
                         (FiscalYear
                        , LocalEducationAgencyId
                        , SchoolId
                        , Counts
                        , CalendarType
                        , CreatedBy
                        , CreatedDtm
                        , LastModifiedBy
                        , LastModifiedDtm
                         )
                         VALUES
                         (@FiscalYear,
                          @leaid,
                          @SchoolId,
                          @MaxallowedCount,
                          @CalendarType,
                          @ModifiedBy,
                          GETUTCDATE(),
                          @ModifiedBy,
                          GETUTCDATE()
                         );
                     END;
             END;
         ELSE
             BEGIN
                 SET @retunvalue = 0;
             END;;
         SELECT @retunvalue;
     END;