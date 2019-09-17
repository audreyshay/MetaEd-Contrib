/****************************************************************************************
**Procedure Name:
**      report.GetSubCategories
**
**Author:
**      Martez Killens
**
**Description:  
**  Returns a category's subcategories
**   
**Input:
**  @category -  The name of the category
**
**Revision History:
**	M Killens		01/13/2016	Initial creation
**
*****************************************************************************************/

CREATE PROCEDURE [report].[GetSubCategories]
	@category nvarchar(50)
AS
	SELECT 
		sc.Id as Id
		, sc.Name
		, sc.[Description]
	FROM [report].[Category] c
	JOIN [report].[CategorySubCategoryAssociation] csca on c.Id = csca.CategoryId
	JOIN [report].[SubCategory] sc on csca.SubCategoryId = sc.Id
	WHERE c.CategoryId = @category