SET DATEFORMAT dmy
GO
SET ANSI_WARNINGS ON
GO

CREATE TABLE [Bondville_PeelbondTests]
(
		[Year]  [varchar](10) COLLATE Latin1_General_CI_AS NULL,
		[Month]  [varchar](20) COLLATE Latin1_General_CI_AS NULL,
		[Date]  [varchar](20) COLLATE Latin1_General_CI_AS NULL,
		[Time]  [varchar](20) COLLATE Latin1_General_CI_AS NULL,
		[Auditor]  [varchar](20) COLLATE Latin1_General_CI_AS NULL,
		[Style]  [varchar](20) COLLATE Latin1_General_CI_AS NULL,
		[Roll_No]  [varchar](50) COLLATE Latin1_General_CI_AS NULL,
		[Batch_No]  [varchar](50) COLLATE Latin1_General_CI_AS NULL,
		[Color]  [varchar](50) COLLATE Latin1_General_CI_AS NULL,
		[Req_Peel_Strength]  [varchar](50) COLLATE Latin1_General_CI_AS NULL,
		[Act_Peel_Strength]  [varchar](50) COLLATE Latin1_General_CI_AS NULL,
		[PB_Specimen_Ref_No]  [varchar](20) COLLATE Latin1_General_CI_AS NULL,
		[Status]  [varchar](10) COLLATE Latin1_General_CI_AS NULL
)
GO

CREATE TABLE [logindata]
(
		[username]  [varchar](30) COLLATE Latin1_General_CI_AS NOT NULL,
		[password]  [varchar](30) COLLATE Latin1_General_CI_AS NULL,
		[type]  [varchar](30) COLLATE Latin1_General_CI_AS NULL
)
GO

CREATE TABLE [sysdiagrams]
(
		[name]  [sysname] NOT NULL,
		[principal_id]  [int] NOT NULL,
		[diagram_id]  [int] IDENTITY (1, 1) NOT NULL,
		[version]  [int] NULL,
		[definition]  [varbinary](max) NULL
)
GO

CREATE TABLE [Printer]
(
		[Emb_Id]  [float] NOT NULL,
		[Emb_Cat]  [varchar](100) COLLATE Latin1_General_CI_AS NULL,
		[Emb_Name]  [varchar](max) COLLATE Latin1_General_CI_AS NULL,
		[Emb_Add1]  [varchar](max) COLLATE Latin1_General_CI_AS NULL,
		[Emb_Add2]  [varchar](max) COLLATE Latin1_General_CI_AS NULL,
		[Emb_Add3]  [varchar](max) COLLATE Latin1_General_CI_AS NULL,
		[Emb_Tel]  [varchar](10) COLLATE Latin1_General_CI_AS NULL,
		[Emb_Email]  [varchar](100) COLLATE Latin1_General_CI_AS NULL,
		[Emb_Join_Date]  [varchar](50) COLLATE Latin1_General_CI_AS NULL
)
GO

CREATE TABLE [LastPrinterId]
(
		[Emb_Id]  [float] NULL,
		[Status]  [varchar](50) COLLATE Latin1_General_CI_AS NULL
)
GO

CREATE TABLE [Auditor]
(
		[Aud_Id]  [float] NOT NULL,
		[Aud_Type]  [varchar](50) COLLATE Latin1_General_CI_AS NULL,
		[Aud_Name]  [varchar](max) COLLATE Latin1_General_CI_AS NULL,
		[Aud_Plant]  [varchar](100) COLLATE Latin1_General_CI_AS NULL,
		[Aud_Tp]  [varchar](10) COLLATE Latin1_General_CI_AS NULL,
		[Aud_Email]  [varchar](100) COLLATE Latin1_General_CI_AS NULL
)
GO

CREATE TABLE [LastAuditorId]
(
		[Aud_Id]  [float] NOT NULL,
		[Status]  [varchar](50) COLLATE Latin1_General_CI_AS NULL
)
GO

CREATE TABLE [InsWash]
(
		[Ins_Id]  [float] NOT NULL,
		[Wash_SbStatus]  [varchar](50) COLLATE Latin1_General_CI_AS NULL,
		[Wash_Result]  [varchar](50) COLLATE Latin1_General_CI_AS NULL,
		[Wash_Comment]  [varchar](max) COLLATE Latin1_General_CI_AS NULL,
		[Wash_Ref_No]  [varchar](50) COLLATE Latin1_General_CI_AS NULL
)
GO

CREATE TABLE [LastInsId]
(
		[Last_InsId]  [float] NOT NULL,
		[Status]  [varchar](10) COLLATE Latin1_General_CI_AS NULL
)
GO

CREATE TABLE [InsSbqaDet]
(
		[Ins_Id]  [float] NOT NULL,
		[SQA_Aud]  [varchar](100) COLLATE Latin1_General_CI_AS NULL,
		[SQA_No_Aud]  [int] NULL,
		[SQA_PassAd]  [int] NULL,
		[SQA_PassPt]  [float] NULL,
		[SQA_FailAd]  [int] NULL,
		[SQA_FailPt]  [float] NULL,
		[SQA_LotS]  [int] NULL,
		[SQA_SampleS]  [int] NULL,
		[SQA_Damage]  [int] NULL,
		[SQA_DefPt]  [float] NULL,
		[SQA_Comment]  [varchar](max) COLLATE Latin1_General_CI_AS NULL,
		[SQA_Rep_St]  [varchar](10) COLLATE Latin1_General_CI_AS NULL
)
GO

CREATE TABLE [InsEcaDet]
(
		[Ins_Id]  [float] NOT NULL,
		[Eca_Aud]  [varchar](100) COLLATE Latin1_General_CI_AS NULL,
		[Eca_No_Aud]  [int] NULL,
		[Eca_PassAd]  [int] NULL,
		[Eca_PassPt]  [float] NULL,
		[Eca_FailAd]  [int] NULL,
		[Eca_FailPt]  [float] NULL,
		[Eca_LotS]  [int] NULL,
		[Eca_SampleS]  [int] NULL,
		[Eca_Damage]  [int] NULL,
		[Eca_DefPt]  [float] NULL,
		[Eca_Comment]  [varchar](max) COLLATE Latin1_General_CI_AS NULL,
		[Eca_Rep_St]  [varchar](10) COLLATE Latin1_General_CI_AS NULL
)
GO

CREATE TABLE [InsIhqaDet]
(
		[Ins_Id]  [float] NOT NULL,
		[IHQA_Aud]  [varchar](100) COLLATE Latin1_General_CI_AS NULL,
		[IHQA_No_Aud]  [int] NULL,
		[IHQA_PassAd]  [int] NULL,
		[IHQA_PassPt]  [float] NULL,
		[IHQA_FailAd]  [int] NULL,
		[IHQA_FailPt]  [float] NULL,
		[IHQA_LotS]  [int] NULL,
		[IHQA_SampleS]  [int] NULL,
		[IHQA_Damage]  [int] NULL,
		[IHQA_DefPt]  [float] NULL,
		[IHQA_Comment]  [varchar](max) COLLATE Latin1_General_CI_AS NULL
)
GO

CREATE TABLE [LastCusId]
(
		[Cus_Id]  [int] NULL,
		[Status]  [varchar](10) COLLATE Latin1_General_CI_AS NULL
)
GO

CREATE TABLE [Customer]
(
		[Cus_Id]  [int] NULL,
		[Cus_Name]  [varchar](50) COLLATE Latin1_General_CI_AS NULL,
		[Cus_Add_Date]  [varchar](10) COLLATE Latin1_General_CI_AS NULL
)
GO

CREATE TABLE [InsGeneralDet]
(
		[Ins_Id]  [float] NOT NULL,
		[Ins_Year]  [varchar](4) COLLATE Latin1_General_CI_AS NULL,
		[Ins_Month]  [varchar](20) COLLATE Latin1_General_CI_AS NULL,
		[Ins_Week]  [varchar](2) COLLATE Latin1_General_CI_AS NULL,
		[Ins_Date]  [varchar](50) COLLATE Latin1_General_CI_AS NULL,
		[Ins_Printer]  [varchar](100) COLLATE Latin1_General_CI_AS NULL,
		[Ins_Customer]  [varchar](50) COLLATE Latin1_General_CI_AS NULL,
		[Ins_Style]  [varchar](50) COLLATE Latin1_General_CI_AS NULL,
		[Ins_SO]  [varchar](50) COLLATE Latin1_General_CI_AS NULL,
		[Ins_LI]  [varchar](2) COLLATE Latin1_General_CI_AS NULL,
		[Ins_GpQTY]  [int] NULL,
		[Ins_Graphic]  [varchar](50) COLLATE Latin1_General_CI_AS NULL,
		[Ins_Combo]  [varchar](50) COLLATE Latin1_General_CI_AS NULL,
		[Ins_Time]  [varchar](10) COLLATE Latin1_General_CI_AS NULL,
		[Ins_User]  [varchar](20) COLLATE Latin1_General_CI_AS NULL,
		[Ins_Prd_Feedback]  [varchar](max) COLLATE Latin1_General_CI_AS NULL,
		[Ins_Module]  [varchar](10) COLLATE Latin1_General_CI_AS NULL
)
GO

CREATE TABLE [Test_Date]
(
		[FromD]  [date] NULL,
		[Remarks]  [varchar](max) COLLATE Latin1_General_CI_AS NULL
)
GO

CREATE TABLE [Bondville_LaminationAudits]
(
		[Year]  [varchar](10) COLLATE Latin1_General_CI_AS NULL,
		[Month]  [varchar](20) COLLATE Latin1_General_CI_AS NULL,
		[Date]  [varchar](20) COLLATE Latin1_General_CI_AS NULL,
		[Shift]  [varchar](10) COLLATE Latin1_General_CI_AS NULL,
		[Time]  [varchar](20) COLLATE Latin1_General_CI_AS NULL,
		[Auditor]  [varchar](50) COLLATE Latin1_General_CI_AS NULL,
		[Style]  [varchar](20) COLLATE Latin1_General_CI_AS NULL,
		[Color]  [varchar](50) COLLATE Latin1_General_CI_AS NULL,
		[Lot_Size]  [float] NULL,
		[Sam_Size]  [float] NULL,
		[Def_Panel_QTY]  [float] NULL,
		[Defect_Pec]  [float] NULL
)
GO

CREATE TABLE [MAS_HS_Audits]
(
		[Year]  [varchar](10) COLLATE Latin1_General_CI_AS NULL,
		[Month]  [varchar](20) COLLATE Latin1_General_CI_AS NULL,
		[Date]  [varchar](20) COLLATE Latin1_General_CI_AS NULL,
		[Time]  [varchar](20) COLLATE Latin1_General_CI_AS NULL,
		[Shift]  [varchar](10) COLLATE Latin1_General_CI_AS NULL,
		[Auditor]  [varchar](50) COLLATE Latin1_General_CI_AS NULL,
		[Customer]  [varchar](50) COLLATE Latin1_General_CI_AS NULL,
		[Style]  [varchar](20) COLLATE Latin1_General_CI_AS NULL,
		[Graphic]  [varchar](20) COLLATE Latin1_General_CI_AS NULL,
		[Combo]  [varchar](20) COLLATE Latin1_General_CI_AS NULL,
		[Lot_Size]  [float] NULL,
		[Sam_Size]  [float] NULL,
		[Def_QTY]  [float] NULL,
		[Def_Type]  [varchar](50) COLLATE Latin1_General_CI_AS NULL,
		[Def_Pec]  [float] NULL,
		[Aud_Comment]  [varchar](max) COLLATE Latin1_General_CI_AS NULL
)
GO

CREATE TABLE [MAS_HS_WashR]
(
		[Hs_Wash_Id]  [float] NOT NULL,
		[Year]  [varchar](10) COLLATE Latin1_General_CI_AS NULL,
		[Month]  [varchar](20) COLLATE Latin1_General_CI_AS NULL,
		[Date]  [varchar](20) COLLATE Latin1_General_CI_AS NULL,
		[Time]  [varchar](20) COLLATE Latin1_General_CI_AS NULL,
		[Shift]  [varchar](10) COLLATE Latin1_General_CI_AS NULL,
		[Auditor]  [varchar](50) COLLATE Latin1_General_CI_AS NULL,
		[Customer]  [varchar](50) COLLATE Latin1_General_CI_AS NULL,
		[Style]  [varchar](20) COLLATE Latin1_General_CI_AS NULL,
		[Graphic]  [varchar](20) COLLATE Latin1_General_CI_AS NULL,
		[Combo]  [varchar](20) COLLATE Latin1_General_CI_AS NULL,
		[Machine_No]  [varchar](50) COLLATE Latin1_General_CI_AS NULL,
		[Submission]  [varchar](10) COLLATE Latin1_General_CI_AS NULL,
		[Result]  [varchar](10) COLLATE Latin1_General_CI_AS NULL,
		[Ref_No]  [varchar](50) COLLATE Latin1_General_CI_AS NULL,
		[Wash_Comment]  [varchar](max) COLLATE Latin1_General_CI_AS NULL
)
GO

CREATE TABLE [LastHsWashId]
(
		[Last_Hs_Wash_Id]  [float] NOT NULL,
		[Status]  [varchar](10) COLLATE Latin1_General_CI_AS NULL
)
GO

