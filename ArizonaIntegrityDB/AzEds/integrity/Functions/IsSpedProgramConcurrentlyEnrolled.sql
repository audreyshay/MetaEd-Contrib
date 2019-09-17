/**************************************************************************
** Script Name:IsSPEDProgramConcurrentlyEnrolled
** 
**
** Author: Amit Verma
** 
**
** Description: Retrieves a bit indicating whether or not the identified 
**				Student is concurrently enrolled in 2 Program based on the 
**              StudentUSI and ProgramType.
**
** Input: @StudentUSI			    INT
**        @NeedCategoryType	        INT
**        @FiscalYear               INT
** 
** Output: BIT
**
** Returns: BIT
**
** Implementation:
** 
**
** Revision History: Created - Amit Verma - 04/08/2015
** Amit Verma    12/16/2015    Updated the Join condition (Added FiscalYear)
** 
**
**************************************************************************/

CREATE FUNCTION [Integrity].[IsSPEDProgramConcurrentlyEnrolled] 
(
	@StudentUSI			    INT
   ,@NeedCategoryType	    INT
   ,@FiscalYear             INT
)
RETURNS BIT
AS
	BEGIN

		-- Test Data -------------------------------
		--DECLARE @StudentUSI			INT
		--DECLARE @NeedCategoryType		INT
		--DECLARE @FiscalYear           INT
		--SET @StudentUSI =	46602106		
		--SET @NeedCategoryType = 1	
		--SET @FiscalYear = 2015
		--------------------------------------------

		DECLARE @ISSPEDCONCURRENTLYENROLLED	BIT

		IF((SELECT COUNT(*) 
			  FROM leadata.StudentNeed SN1
			      INNER JOIN leadata.StudentNeed SN2
				     ON (SN2.StudentNeedEntryDate >= SN1.StudentNeedEntryDate 
                         AND  SN2.StudentNeedEntryDate <= ISNULL(SN1.StudentNeedExitDate,CAST(CAST(@FiscalYear AS VARCHAR(4))+'-06-30' AS DATE))
				       OR (SN1.StudentNeedEntryDate >= SN2.StudentNeedEntryDate 
                         AND  SN1.StudentNeedEntryDate <= ISNULL(SN2.StudentNeedExitDate,CAST(CAST(@FiscalYear AS VARCHAR(4))+'-06-30' AS DATE))))
			             AND  SN1.StudentUSI = SN2.StudentUSI
						 AND  SN1.FiscalYear = SN2.FiscalYear
						 AND  SN1.PrimaryStudentNeedIndicator = 1
				         AND  SN1.ReportingEducationOrganizationID <> SN2.ReportingEducationOrganizationID
				  INNER JOIN leadata.StudentNeedDescriptor SND
				  ON SN1.StudentNeedDescriptorId = SND.StudentNeedDescriptorId
			  WHERE SN1.StudentUSI = @StudentUSI
				    AND SND.StudentNeedCategoryTypeId = @NeedCategoryType
					AND SN1.FiscalYear = @FiscalYear)>=1)

			BEGIN
				SET @ISSPEDCONCURRENTLYENROLLED = 1
			END
		ELSE
			BEGIN
				SET @ISSPEDCONCURRENTLYENROLLED = 0
			END

		RETURN @ISSPEDCONCURRENTLYENROLLED

	END