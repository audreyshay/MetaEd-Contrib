/************************************************************  
**  
**Author: Chris Mullert 
**  
**Description:  Insert or update depending if the destination record exists.
**   
**Revision History:  
** Who   When  What  
** CM  01/29/2018 Initial Creation  
** VM   03/25/2019 Azeds 5.0 Calendarcode changes
***************************************************************/

CREATE PROCEDURE [entity].[UpdateADEApprovalTrackStatus] @EducationOrganizationId     INT,
                                                        @TrackLocalEducationAgencyId INT,
                                                        @TrackNumber                 INT,
                                                        @FiscalYear                  INT,
                                                        @IsADEApproved               BIT,
                                                        @ADEApprovedBy               VARCHAR(500),
                                                        @ADEApprovalDate             DATETIME,
                                                        @CalendarCode                VARCHAR(100) = NULL
AS
     BEGIN
         SET NOCOUNT OFF;  -- Need to know how many records were updated.

         IF(@FiscalYear > 2019)
             BEGIN
                 IF EXISTS
                 (
                     SELECT 1
                     FROM [entity].[TrackStatus]
                     WHERE EducationOrganizationId = @EducationOrganizationId
                           AND FiscalYear = @FiscalYear
                           AND CalendarCode = @CalendarCode
                           AND TrackLocalEducationAgencyId = @TrackLocalEducationAgencyId
                 )
                     BEGIN
                         UPDATE [entity].[TrackStatus]
                           SET
                               IsADEApproved = @IsADEApproved,
                               ADEApprovalDate = @ADEApprovalDate,
                               ADEApprovedBy = @ADEApprovedBy
                         WHERE EducationOrganizationId = @EducationOrganizationId
                               AND FiscalYear = @FiscalYear
                                AND CalendarCode = @CalendarCode
                               AND TrackLocalEducationAgencyId = @TrackLocalEducationAgencyId;
                     END;
                 ELSE
                     BEGIN
                         INSERT INTO [entity].[TrackStatus]
                         ([EducationOrganizationId]
                        , [FiscalYear]
                        , [TrackNumber]
                        , [TrackLocalEducationAgencyId]
                        , [IsCertified]
                        , [IsADEApproved]
                        , [IsValid]
                        , [CertificationDate]
                        , [ADEApprovalDate]
                        , [ValidationDate]
                        , [ADEApprovedBy]
                        , [CertifiedBy]
                        , CalendarCode
                         )
                         VALUES
                         (@EducationOrganizationId,
                          @FiscalYear,
                          0,
                          @TrackLocalEducationAgencyId,
                          0, -- [IsCertified]
                          @IsADEApproved,
                          NULL, -- [IsValid]
                          NULL, -- [CertificationDate]
                          @ADEApprovalDate,
                          NULL, -- [ValidationDate] 
                          @ADEApprovedBy,
                          '', -- [CertifiedBy],
                          @CalendarCode
                         );
                     END;
             END;
         ELSE
             BEGIN
                 IF EXISTS
                 (
                     SELECT 1
                     FROM [entity].[TrackStatus]
                     WHERE EducationOrganizationId = @EducationOrganizationId
                           AND FiscalYear = @FiscalYear
                           AND TrackNumber = @TrackNumber
                           AND TrackLocalEducationAgencyId = @TrackLocalEducationAgencyId
                 )
                     BEGIN
                         UPDATE [entity].[TrackStatus]
                           SET
                               IsADEApproved = @IsADEApproved,
                               ADEApprovalDate = @ADEApprovalDate,
                               ADEApprovedBy = @ADEApprovedBy
                         WHERE EducationOrganizationId = @EducationOrganizationId
                               AND FiscalYear = @FiscalYear
                               AND TrackNumber = @TrackNumber
                               AND TrackLocalEducationAgencyId = @TrackLocalEducationAgencyId;
                     END;
                 ELSE
                     BEGIN
                         INSERT INTO [entity].[TrackStatus]
                         ([EducationOrganizationId]
                        , [FiscalYear]
                        , [TrackNumber]
                        , [TrackLocalEducationAgencyId]
                        , [IsCertified]
                        , [IsADEApproved]
                        , [IsValid]
                        , [CertificationDate]
                        , [ADEApprovalDate]
                        , [ValidationDate]
                        , [ADEApprovedBy]
                        , [CertifiedBy]
                         )
                         VALUES
                         (@EducationOrganizationId,
                          @FiscalYear,
                          @TrackNumber,
                          @TrackLocalEducationAgencyId,
                          0, -- [IsCertified]
                          @IsADEApproved,
                          NULL, -- [IsValid]
                          NULL, -- [CertificationDate]
                          @ADEApprovalDate,
                          NULL, -- [ValidationDate] 
                          @ADEApprovedBy,
                          ''		-- [CertifiedBy]
                         );
                     END;
             END;
     END;
GO

