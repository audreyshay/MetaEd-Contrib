/************************************************************
**Procedure Name: ace.GetFundingType
**
**Author: Chris Mullert 
**
**Description:  Returns all funding type records.
**	
**Revision History:
**	Who					When		What
**	Chris Mullert 					created
**
***************************************************************/
CREATE PROCEDURE [ace].[GetFundingType]
AS 
BEGIN

SELECT 
	FundingTypeId, [Description], IsFundable
FROM 
	ace.FundingType

END