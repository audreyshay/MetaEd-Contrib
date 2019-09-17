
/********************************************************************************************************
**Implementation:
**	Used by AzEDS ACE
**
**********************************************************************************************************/
CREATE PROCEDURE [config].[GetTuitionPayerCodeFundingTypes]
AS
BEGIN
	SELECT TuitionPayerCodeFundingTypeId
	, TuitionPayerCodeDescriptorId
	, FundingTypeId
	, StartingFiscalYear
	, EndingFiscalYear
	FROM [config].[TuitionPayerCodeFundingType]
	
END