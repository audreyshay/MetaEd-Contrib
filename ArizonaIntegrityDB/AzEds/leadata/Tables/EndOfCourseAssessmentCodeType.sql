CREATE TABLE [leadata].[EndOfCourseAssessmentCodeType]
(
       [EndOfCourseAssessmentCodeTypeId] [int] IDENTITY(1,1) NOT NULL,
       [CodeValue] [nvarchar](50) NOT NULL,
       [ShortDescription] [nvarchar](450) NOT NULL,
       [Description] [nvarchar](1024) NOT NULL,

CONSTRAINT [PK_EndOfCourseAssessmentCodeType] PRIMARY KEY CLUSTERED 
(
    [EndOfCourseAssessmentCodeTypeId] ASC
))