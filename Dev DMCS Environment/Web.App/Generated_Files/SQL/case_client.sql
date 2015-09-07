/****** Object:  Table [dbo].[case_client]    Script Date: 9/7/2015 11:21:56 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[case_client](
  [case_id] int IDENTITY(1,1) NOT NULL,
  [client_id] int NOT NULL,
  [address_id] int NOT NULL,
  [cable_amt_owed_today] money NULL,
  [colessee_name] varchar(50) NULL,
  [child_support] varchar(3) NULL,
  [child_support_memo] text(2147483647) NULL,
  [curr_residence_date] datetime NULL,
  [electric_amt_owed_today] money NULL,
  [employment_memo] text(2147483647) NULL,
  [employment_status] varchar(20) NOT NULL,
  [gas_or_heating_amt_owed_today] money NULL,
  [housing_amt_owed_today] money NULL,
  [housing_status] varchar(10) NOT NULL,
  [income_status] varchar(20) NOT NULL,
  [lease_num_adults] int NULL,
  [lease_start_date] datetime NULL,
  [minor_children] int NOT NULL,
  [monthly_rent_amt] money NULL,
  [Other_help_Sources] varchar(3) NULL,
  [Other_help_Sources_memo] text(2147483647) NULL,
  [prev_address_id] int NULL,
  [prev_residence_date] datetime NULL,
  [relationship_to_head_of_household] varchar(15) NULL,
  [rental_name] varchar(50) NULL,
  [rental_phone] varchar(11) NULL,
  [sewage_amt_owed_today] money NULL,
  [telephone_amt_owed_today] money NULL,
  [trash_removal_amt_owed_today] money NULL,
  [us_status_memo] text(2147483647) NULL,
  [related_ll] char(1) NULL,
  [relation_to_ll] char(1) NULL,
  [mtg_amt_owed_today] money NULL,
  [utilities_list] text(2147483647) NULL,
  [water_amt_owed_today] money NULL,
  [public_asst_app_date] datetime NULL,
  [util_allot_app_date] datetime NULL,
  [util_allot_amt] money NULL,
  [utilities_incl] char(1) NULL,
  [fd_stmps_app_date] datetime NULL,
  [fd_stmps_amt] money NULL,
  [fd_Inc] char(1) NULL,
  [afdc_app_date] datetime NULL,
  [afdc_amt] money NULL,
  [afdc_Inc] char(1) NULL,
  [oth_trustee_app_date] datetime NULL,
  [oth_trustee_amt] money NULL,
  [oth_trustee_Inc] char(1) NULL,
  [ss_app_date] datetime NULL,
  [ss_amt] money NULL,
  [ss_Inc] char(1) NULL,
  [va_app_date] datetime NULL,
  [va_amt] money NULL,
  [va_Inc] char(1) NULL,
  [eap_app_date] datetime NULL,
  [eap_amt] money NULL,
  [eap_Inc] char(1) NULL,
  [fema_app_date] datetime NULL,
  [fema_amt] money NULL,
  [fema_Inc] char(1) NULL,
  [unempl_app_date] datetime NULL,
  [unempl_amt] money NULL,
  [unempl_Inc] char(1) NULL,
  [grants_loans_app_date] datetime NULL,
  [grants_loans_amt] money NULL,
  [grants_Inc] char(1) NULL,
  [other_app_date] datetime NULL,
  [other_amt] money NULL,
  [other_Inc] char(1) NULL,
  [denial_memo] text(2147483647) NULL,
  [welfr_fraud_memo] text(2147483647) NULL,
  [Client_issue_Desc] text(2147483647) NULL,
  [Client_issue_resolved] char(1) NULL,
  [Client_issue_comments] text(2147483647) NULL,
 CONSTRAINT [case_client_case_id_pk] PRIMARY KEY CLUSTERED 
(
	[case_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] 
GO
SET ANSI_PADDING OFF
GO
/*************************************************/
/****** FK TEMPLATE - NEEDS ACCURATE DATA - ******/
/*************************************************/
/**********    ALTER TABLE [dbo].[THIS_tableName]  WITH CHECK ADD  CONSTRAINT [NAME_OF_CONSTRAINT] FOREIGN KEY([FK_ON_THIS_TABLE])    **********/
/**********    REFERENCES [dbo].[OTHER_tableName] ([OTHER_TABLE_FK])    **********/
/**********    GO    **********/
/**********    ALTER TABLE [dbo].[THIS_tableName] CHECK CONSTRAINT [NAME_OF_CONSTRAINT]    **********/
/**********    GO    **********/
/***********************************************************/
/*************************************************/
/****** - SELECT STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_SELECT_CASE_CLIENT]    Script Date: 9/7/2015 11:21:56 AM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_SELECT_CASE_CLIENT]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_SELECT_CASE_CLIENT]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_SELECT_CASE_CLIENT]
           @case_id as int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
SELECT [case_id]
      ,[client_id]
      ,[address_id]
      ,[cable_amt_owed_today]
      ,[colessee_name]
      ,[child_support]
      ,[child_support_memo]
      ,[curr_residence_date]
      ,[electric_amt_owed_today]
      ,[employment_memo]
      ,[employment_status]
      ,[gas_or_heating_amt_owed_today]
      ,[housing_amt_owed_today]
      ,[housing_status]
      ,[income_status]
      ,[lease_num_adults]
      ,[lease_start_date]
      ,[minor_children]
      ,[monthly_rent_amt]
      ,[Other_help_Sources]
      ,[Other_help_Sources_memo]
      ,[prev_address_id]
      ,[prev_residence_date]
      ,[relationship_to_head_of_household]
      ,[rental_name]
      ,[rental_phone]
      ,[sewage_amt_owed_today]
      ,[telephone_amt_owed_today]
      ,[trash_removal_amt_owed_today]
      ,[us_status_memo]
      ,[related_ll]
      ,[relation_to_ll]
      ,[mtg_amt_owed_today]
      ,[utilities_list]
      ,[water_amt_owed_today]
      ,[public_asst_app_date]
      ,[util_allot_app_date]
      ,[util_allot_amt]
      ,[utilities_incl]
      ,[fd_stmps_app_date]
      ,[fd_stmps_amt]
      ,[fd_Inc]
      ,[afdc_app_date]
      ,[afdc_amt]
      ,[afdc_Inc]
      ,[oth_trustee_app_date]
      ,[oth_trustee_amt]
      ,[oth_trustee_Inc]
      ,[ss_app_date]
      ,[ss_amt]
      ,[ss_Inc]
      ,[va_app_date]
      ,[va_amt]
      ,[va_Inc]
      ,[eap_app_date]
      ,[eap_amt]
      ,[eap_Inc]
      ,[fema_app_date]
      ,[fema_amt]
      ,[fema_Inc]
      ,[unempl_app_date]
      ,[unempl_amt]
      ,[unempl_Inc]
      ,[grants_loans_app_date]
      ,[grants_loans_amt]
      ,[grants_Inc]
      ,[other_app_date]
      ,[other_amt]
      ,[other_Inc]
      ,[denial_memo]
      ,[welfr_fraud_memo]
      ,[Client_issue_Desc]
      ,[Client_issue_resolved]
      ,[Client_issue_comments]
  FROM [dbo].[case_client]
 WHERE case_id = @case_id
End
GO
/***********************************************************/
/*************************************************/
/****** - INSERT STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_INSERT_CASE_CLIENT]    Script Date: 9/7/2015 11:21:56 AM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_INSERT_CASE_CLIENT]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_INSERT_CASE_CLIENT]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_INSERT_CASE_CLIENT]
	  @case_id as int,
	  @client_id as int,
	  @address_id as int,
	  @cable_amt_owed_today as money,
	  @colessee_name as varchar(50),
	  @child_support as varchar(3),
	  @child_support_memo as text,
	  @curr_residence_date as datetime,
	  @electric_amt_owed_today as money,
	  @employment_memo as text,
	  @employment_status as varchar(20),
	  @gas_or_heating_amt_owed_today as money,
	  @housing_amt_owed_today as money,
	  @housing_status as varchar(10),
	  @income_status as varchar(20),
	  @lease_num_adults as int,
	  @lease_start_date as datetime,
	  @minor_children as int,
	  @monthly_rent_amt as money,
	  @Other_help_Sources as varchar(3),
	  @Other_help_Sources_memo as text,
	  @prev_address_id as int,
	  @prev_residence_date as datetime,
	  @relationship_to_head_of_household as varchar(15),
	  @rental_name as varchar(50),
	  @rental_phone as varchar(11),
	  @sewage_amt_owed_today as money,
	  @telephone_amt_owed_today as money,
	  @trash_removal_amt_owed_today as money,
	  @us_status_memo as text,
	  @related_ll as char(1),
	  @relation_to_ll as char(1),
	  @mtg_amt_owed_today as money,
	  @utilities_list as text,
	  @water_amt_owed_today as money,
	  @public_asst_app_date as datetime,
	  @util_allot_app_date as datetime,
	  @util_allot_amt as money,
	  @utilities_incl as char(1),
	  @fd_stmps_app_date as datetime,
	  @fd_stmps_amt as money,
	  @fd_Inc as char(1),
	  @afdc_app_date as datetime,
	  @afdc_amt as money,
	  @afdc_Inc as char(1),
	  @oth_trustee_app_date as datetime,
	  @oth_trustee_amt as money,
	  @oth_trustee_Inc as char(1),
	  @ss_app_date as datetime,
	  @ss_amt as money,
	  @ss_Inc as char(1),
	  @va_app_date as datetime,
	  @va_amt as money,
	  @va_Inc as char(1),
	  @eap_app_date as datetime,
	  @eap_amt as money,
	  @eap_Inc as char(1),
	  @fema_app_date as datetime,
	  @fema_amt as money,
	  @fema_Inc as char(1),
	  @unempl_app_date as datetime,
	  @unempl_amt as money,
	  @unempl_Inc as char(1),
	  @grants_loans_app_date as datetime,
	  @grants_loans_amt as money,
	  @grants_Inc as char(1),
	  @other_app_date as datetime,
	  @other_amt as money,
	  @other_Inc as char(1),
	  @denial_memo as text,
	  @welfr_fraud_memo as text,
	  @Client_issue_Desc as text,
	  @Client_issue_resolved as char(1)
	  @Client_issue_comments as text,
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	  IF @client_id = 0
    BEGIN
    SET @client_id = null
    END
	  IF @address_id = 0
    BEGIN
    SET @address_id = null
    END
	  IF @cable_amt_owed_today = 0
    BEGIN
    SET @cable_amt_owed_today = null
    END
	  IF @colessee_name = ''
    BEGIN
    SET @colessee_name = null
    END
	  IF @child_support = ''
    BEGIN
    SET @child_support = null
    END
	  IF @curr_residence_date = '9/9/1900 12:00:00 AM'
    BEGIN
    SET @curr_residence_date = null
    END
	  IF @electric_amt_owed_today = 0
    BEGIN
    SET @electric_amt_owed_today = null
    END
	  IF @employment_status = ''
    BEGIN
    SET @employment_status = null
    END
	  IF @gas_or_heating_amt_owed_today = 0
    BEGIN
    SET @gas_or_heating_amt_owed_today = null
    END
	  IF @housing_amt_owed_today = 0
    BEGIN
    SET @housing_amt_owed_today = null
    END
	  IF @housing_status = ''
    BEGIN
    SET @housing_status = null
    END
	  IF @income_status = ''
    BEGIN
    SET @income_status = null
    END
	  IF @lease_num_adults = 0
    BEGIN
    SET @lease_num_adults = null
    END
	  IF @lease_start_date = '9/9/1900 12:00:00 AM'
    BEGIN
    SET @lease_start_date = null
    END
	  IF @minor_children = 0
    BEGIN
    SET @minor_children = null
    END
	  IF @monthly_rent_amt = 0
    BEGIN
    SET @monthly_rent_amt = null
    END
	  IF @Other_help_Sources = ''
    BEGIN
    SET @Other_help_Sources = null
    END
	  IF @prev_address_id = 0
    BEGIN
    SET @prev_address_id = null
    END
	  IF @prev_residence_date = '9/9/1900 12:00:00 AM'
    BEGIN
    SET @prev_residence_date = null
    END
	  IF @relationship_to_head_of_household = ''
    BEGIN
    SET @relationship_to_head_of_household = null
    END
	  IF @rental_name = ''
    BEGIN
    SET @rental_name = null
    END
	  IF @rental_phone = ''
    BEGIN
    SET @rental_phone = null
    END
	  IF @sewage_amt_owed_today = 0
    BEGIN
    SET @sewage_amt_owed_today = null
    END
	  IF @telephone_amt_owed_today = 0
    BEGIN
    SET @telephone_amt_owed_today = null
    END
	  IF @trash_removal_amt_owed_today = 0
    BEGIN
    SET @trash_removal_amt_owed_today = null
    END
	  IF @related_ll = ''
    BEGIN
    SET @related_ll = null
    END
	  IF @relation_to_ll = ''
    BEGIN
    SET @relation_to_ll = null
    END
	  IF @mtg_amt_owed_today = 0
    BEGIN
    SET @mtg_amt_owed_today = null
    END
	  IF @water_amt_owed_today = 0
    BEGIN
    SET @water_amt_owed_today = null
    END
	  IF @public_asst_app_date = '9/9/1900 12:00:00 AM'
    BEGIN
    SET @public_asst_app_date = null
    END
	  IF @util_allot_app_date = '9/9/1900 12:00:00 AM'
    BEGIN
    SET @util_allot_app_date = null
    END
	  IF @util_allot_amt = 0
    BEGIN
    SET @util_allot_amt = null
    END
	  IF @utilities_incl = ''
    BEGIN
    SET @utilities_incl = null
    END
	  IF @fd_stmps_app_date = '9/9/1900 12:00:00 AM'
    BEGIN
    SET @fd_stmps_app_date = null
    END
	  IF @fd_stmps_amt = 0
    BEGIN
    SET @fd_stmps_amt = null
    END
	  IF @fd_Inc = ''
    BEGIN
    SET @fd_Inc = null
    END
	  IF @afdc_app_date = '9/9/1900 12:00:00 AM'
    BEGIN
    SET @afdc_app_date = null
    END
	  IF @afdc_amt = 0
    BEGIN
    SET @afdc_amt = null
    END
	  IF @afdc_Inc = ''
    BEGIN
    SET @afdc_Inc = null
    END
	  IF @oth_trustee_app_date = '9/9/1900 12:00:00 AM'
    BEGIN
    SET @oth_trustee_app_date = null
    END
	  IF @oth_trustee_amt = 0
    BEGIN
    SET @oth_trustee_amt = null
    END
	  IF @oth_trustee_Inc = ''
    BEGIN
    SET @oth_trustee_Inc = null
    END
	  IF @ss_app_date = '9/9/1900 12:00:00 AM'
    BEGIN
    SET @ss_app_date = null
    END
	  IF @ss_amt = 0
    BEGIN
    SET @ss_amt = null
    END
	  IF @ss_Inc = ''
    BEGIN
    SET @ss_Inc = null
    END
	  IF @va_app_date = '9/9/1900 12:00:00 AM'
    BEGIN
    SET @va_app_date = null
    END
	  IF @va_amt = 0
    BEGIN
    SET @va_amt = null
    END
	  IF @va_Inc = ''
    BEGIN
    SET @va_Inc = null
    END
	  IF @eap_app_date = '9/9/1900 12:00:00 AM'
    BEGIN
    SET @eap_app_date = null
    END
	  IF @eap_amt = 0
    BEGIN
    SET @eap_amt = null
    END
	  IF @eap_Inc = ''
    BEGIN
    SET @eap_Inc = null
    END
	  IF @fema_app_date = '9/9/1900 12:00:00 AM'
    BEGIN
    SET @fema_app_date = null
    END
	  IF @fema_amt = 0
    BEGIN
    SET @fema_amt = null
    END
	  IF @fema_Inc = ''
    BEGIN
    SET @fema_Inc = null
    END
	  IF @unempl_app_date = '9/9/1900 12:00:00 AM'
    BEGIN
    SET @unempl_app_date = null
    END
	  IF @unempl_amt = 0
    BEGIN
    SET @unempl_amt = null
    END
	  IF @unempl_Inc = ''
    BEGIN
    SET @unempl_Inc = null
    END
	  IF @grants_loans_app_date = '9/9/1900 12:00:00 AM'
    BEGIN
    SET @grants_loans_app_date = null
    END
	  IF @grants_loans_amt = 0
    BEGIN
    SET @grants_loans_amt = null
    END
	  IF @grants_Inc = ''
    BEGIN
    SET @grants_Inc = null
    END
	  IF @other_app_date = '9/9/1900 12:00:00 AM'
    BEGIN
    SET @other_app_date = null
    END
	  IF @other_amt = 0
    BEGIN
    SET @other_amt = null
    END
	  IF @other_Inc = ''
    BEGIN
    SET @other_Inc = null
    END
	  IF @Client_issue_resolved = ''
    BEGIN
    SET @Client_issue_resolved = null
    END
	Insert INTO [dbo].[case_client]
           (
            [case_id]
           ,[client_id]
           ,[address_id]
           ,[cable_amt_owed_today]
           ,[colessee_name]
           ,[child_support]
           ,[child_support_memo]
           ,[curr_residence_date]
           ,[electric_amt_owed_today]
           ,[employment_memo]
           ,[employment_status]
           ,[gas_or_heating_amt_owed_today]
           ,[housing_amt_owed_today]
           ,[housing_status]
           ,[income_status]
           ,[lease_num_adults]
           ,[lease_start_date]
           ,[minor_children]
           ,[monthly_rent_amt]
           ,[Other_help_Sources]
           ,[Other_help_Sources_memo]
           ,[prev_address_id]
           ,[prev_residence_date]
           ,[relationship_to_head_of_household]
           ,[rental_name]
           ,[rental_phone]
           ,[sewage_amt_owed_today]
           ,[telephone_amt_owed_today]
           ,[trash_removal_amt_owed_today]
           ,[us_status_memo]
           ,[related_ll]
           ,[relation_to_ll]
           ,[mtg_amt_owed_today]
           ,[utilities_list]
           ,[water_amt_owed_today]
           ,[public_asst_app_date]
           ,[util_allot_app_date]
           ,[util_allot_amt]
           ,[utilities_incl]
           ,[fd_stmps_app_date]
           ,[fd_stmps_amt]
           ,[fd_Inc]
           ,[afdc_app_date]
           ,[afdc_amt]
           ,[afdc_Inc]
           ,[oth_trustee_app_date]
           ,[oth_trustee_amt]
           ,[oth_trustee_Inc]
           ,[ss_app_date]
           ,[ss_amt]
           ,[ss_Inc]
           ,[va_app_date]
           ,[va_amt]
           ,[va_Inc]
           ,[eap_app_date]
           ,[eap_amt]
           ,[eap_Inc]
           ,[fema_app_date]
           ,[fema_amt]
           ,[fema_Inc]
           ,[unempl_app_date]
           ,[unempl_amt]
           ,[unempl_Inc]
           ,[grants_loans_app_date]
           ,[grants_loans_amt]
           ,[grants_Inc]
           ,[other_app_date]
           ,[other_amt]
           ,[other_Inc]
           ,[denial_memo]
           ,[welfr_fraud_memo]
           ,[Client_issue_Desc]
           ,[Client_issue_resolved]
           ,[Client_issue_comments]
            )
     VALUES (
            @case_id
           ,@client_id
           ,@address_id
           ,@cable_amt_owed_today
           ,@colessee_name
           ,@child_support
           ,@child_support_memo
           ,@curr_residence_date
           ,@electric_amt_owed_today
           ,@employment_memo
           ,@employment_status
           ,@gas_or_heating_amt_owed_today
           ,@housing_amt_owed_today
           ,@housing_status
           ,@income_status
           ,@lease_num_adults
           ,@lease_start_date
           ,@minor_children
           ,@monthly_rent_amt
           ,@Other_help_Sources
           ,@Other_help_Sources_memo
           ,@prev_address_id
           ,@prev_residence_date
           ,@relationship_to_head_of_household
           ,@rental_name
           ,@rental_phone
           ,@sewage_amt_owed_today
           ,@telephone_amt_owed_today
           ,@trash_removal_amt_owed_today
           ,@us_status_memo
           ,@related_ll
           ,@relation_to_ll
           ,@mtg_amt_owed_today
           ,@utilities_list
           ,@water_amt_owed_today
           ,@public_asst_app_date
           ,@util_allot_app_date
           ,@util_allot_amt
           ,@utilities_incl
           ,@fd_stmps_app_date
           ,@fd_stmps_amt
           ,@fd_Inc
           ,@afdc_app_date
           ,@afdc_amt
           ,@afdc_Inc
           ,@oth_trustee_app_date
           ,@oth_trustee_amt
           ,@oth_trustee_Inc
           ,@ss_app_date
           ,@ss_amt
           ,@ss_Inc
           ,@va_app_date
           ,@va_amt
           ,@va_Inc
           ,@eap_app_date
           ,@eap_amt
           ,@eap_Inc
           ,@fema_app_date
           ,@fema_amt
           ,@fema_Inc
           ,@unempl_app_date
           ,@unempl_amt
           ,@unempl_Inc
           ,@grants_loans_app_date
           ,@grants_loans_amt
           ,@grants_Inc
           ,@other_app_date
           ,@other_amt
           ,@other_Inc
           ,@denial_memo
           ,@welfr_fraud_memo
           ,@Client_issue_Desc
           ,@Client_issue_resolved
           ,@Client_issue_comments
            )
END
GO
/***********************************************************/
/*************************************************/
/****** - UPDATE STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_UPDATE_CASE_CLIENT]    Script Date: 9/7/2015 11:21:56 AM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_UPDATE_CASE_CLIENT]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_UPDATE_CASE_CLIENT]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_UPDATE_CASE_CLIENT]
	  @case_id as int,
	  @client_id as int,
	  @address_id as int,
	  @cable_amt_owed_today as money,
	  @colessee_name as varchar(50),
	  @child_support as varchar(3),
	  @child_support_memo as text,
	  @curr_residence_date as datetime,
	  @electric_amt_owed_today as money,
	  @employment_memo as text,
	  @employment_status as varchar(20),
	  @gas_or_heating_amt_owed_today as money,
	  @housing_amt_owed_today as money,
	  @housing_status as varchar(10),
	  @income_status as varchar(20),
	  @lease_num_adults as int,
	  @lease_start_date as datetime,
	  @minor_children as int,
	  @monthly_rent_amt as money,
	  @Other_help_Sources as varchar(3),
	  @Other_help_Sources_memo as text,
	  @prev_address_id as int,
	  @prev_residence_date as datetime,
	  @relationship_to_head_of_household as varchar(15),
	  @rental_name as varchar(50),
	  @rental_phone as varchar(11),
	  @sewage_amt_owed_today as money,
	  @telephone_amt_owed_today as money,
	  @trash_removal_amt_owed_today as money,
	  @us_status_memo as text,
	  @related_ll as char(1),
	  @relation_to_ll as char(1),
	  @mtg_amt_owed_today as money,
	  @utilities_list as text,
	  @water_amt_owed_today as money,
	  @public_asst_app_date as datetime,
	  @util_allot_app_date as datetime,
	  @util_allot_amt as money,
	  @utilities_incl as char(1),
	  @fd_stmps_app_date as datetime,
	  @fd_stmps_amt as money,
	  @fd_Inc as char(1),
	  @afdc_app_date as datetime,
	  @afdc_amt as money,
	  @afdc_Inc as char(1),
	  @oth_trustee_app_date as datetime,
	  @oth_trustee_amt as money,
	  @oth_trustee_Inc as char(1),
	  @ss_app_date as datetime,
	  @ss_amt as money,
	  @ss_Inc as char(1),
	  @va_app_date as datetime,
	  @va_amt as money,
	  @va_Inc as char(1),
	  @eap_app_date as datetime,
	  @eap_amt as money,
	  @eap_Inc as char(1),
	  @fema_app_date as datetime,
	  @fema_amt as money,
	  @fema_Inc as char(1),
	  @unempl_app_date as datetime,
	  @unempl_amt as money,
	  @unempl_Inc as char(1),
	  @grants_loans_app_date as datetime,
	  @grants_loans_amt as money,
	  @grants_Inc as char(1),
	  @other_app_date as datetime,
	  @other_amt as money,
	  @other_Inc as char(1),
	  @denial_memo as text,
	  @welfr_fraud_memo as text,
	  @Client_issue_Desc as text,
	  @Client_issue_resolved as char(1)
	  @Client_issue_comments as text,
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	  IF @client_id = 0
    BEGIN
    SET @client_id = null
    END
	  IF @address_id = 0
    BEGIN
    SET @address_id = null
    END
	  IF @cable_amt_owed_today = 0
    BEGIN
    SET @cable_amt_owed_today = null
    END
	  IF @colessee_name = ''
    BEGIN
    SET @colessee_name = null
    END
	  IF @child_support = ''
    BEGIN
    SET @child_support = null
    END
	  IF @curr_residence_date = '9/9/1900 12:00:00 AM'
    BEGIN
    SET @curr_residence_date = null
    END
	  IF @electric_amt_owed_today = 0
    BEGIN
    SET @electric_amt_owed_today = null
    END
	  IF @employment_status = ''
    BEGIN
    SET @employment_status = null
    END
	  IF @gas_or_heating_amt_owed_today = 0
    BEGIN
    SET @gas_or_heating_amt_owed_today = null
    END
	  IF @housing_amt_owed_today = 0
    BEGIN
    SET @housing_amt_owed_today = null
    END
	  IF @housing_status = ''
    BEGIN
    SET @housing_status = null
    END
	  IF @income_status = ''
    BEGIN
    SET @income_status = null
    END
	  IF @lease_num_adults = 0
    BEGIN
    SET @lease_num_adults = null
    END
	  IF @lease_start_date = '9/9/1900 12:00:00 AM'
    BEGIN
    SET @lease_start_date = null
    END
	  IF @minor_children = 0
    BEGIN
    SET @minor_children = null
    END
	  IF @monthly_rent_amt = 0
    BEGIN
    SET @monthly_rent_amt = null
    END
	  IF @Other_help_Sources = ''
    BEGIN
    SET @Other_help_Sources = null
    END
	  IF @prev_address_id = 0
    BEGIN
    SET @prev_address_id = null
    END
	  IF @prev_residence_date = '9/9/1900 12:00:00 AM'
    BEGIN
    SET @prev_residence_date = null
    END
	  IF @relationship_to_head_of_household = ''
    BEGIN
    SET @relationship_to_head_of_household = null
    END
	  IF @rental_name = ''
    BEGIN
    SET @rental_name = null
    END
	  IF @rental_phone = ''
    BEGIN
    SET @rental_phone = null
    END
	  IF @sewage_amt_owed_today = 0
    BEGIN
    SET @sewage_amt_owed_today = null
    END
	  IF @telephone_amt_owed_today = 0
    BEGIN
    SET @telephone_amt_owed_today = null
    END
	  IF @trash_removal_amt_owed_today = 0
    BEGIN
    SET @trash_removal_amt_owed_today = null
    END
	  IF @related_ll = ''
    BEGIN
    SET @related_ll = null
    END
	  IF @relation_to_ll = ''
    BEGIN
    SET @relation_to_ll = null
    END
	  IF @mtg_amt_owed_today = 0
    BEGIN
    SET @mtg_amt_owed_today = null
    END
	  IF @water_amt_owed_today = 0
    BEGIN
    SET @water_amt_owed_today = null
    END
	  IF @public_asst_app_date = '9/9/1900 12:00:00 AM'
    BEGIN
    SET @public_asst_app_date = null
    END
	  IF @util_allot_app_date = '9/9/1900 12:00:00 AM'
    BEGIN
    SET @util_allot_app_date = null
    END
	  IF @util_allot_amt = 0
    BEGIN
    SET @util_allot_amt = null
    END
	  IF @utilities_incl = ''
    BEGIN
    SET @utilities_incl = null
    END
	  IF @fd_stmps_app_date = '9/9/1900 12:00:00 AM'
    BEGIN
    SET @fd_stmps_app_date = null
    END
	  IF @fd_stmps_amt = 0
    BEGIN
    SET @fd_stmps_amt = null
    END
	  IF @fd_Inc = ''
    BEGIN
    SET @fd_Inc = null
    END
	  IF @afdc_app_date = '9/9/1900 12:00:00 AM'
    BEGIN
    SET @afdc_app_date = null
    END
	  IF @afdc_amt = 0
    BEGIN
    SET @afdc_amt = null
    END
	  IF @afdc_Inc = ''
    BEGIN
    SET @afdc_Inc = null
    END
	  IF @oth_trustee_app_date = '9/9/1900 12:00:00 AM'
    BEGIN
    SET @oth_trustee_app_date = null
    END
	  IF @oth_trustee_amt = 0
    BEGIN
    SET @oth_trustee_amt = null
    END
	  IF @oth_trustee_Inc = ''
    BEGIN
    SET @oth_trustee_Inc = null
    END
	  IF @ss_app_date = '9/9/1900 12:00:00 AM'
    BEGIN
    SET @ss_app_date = null
    END
	  IF @ss_amt = 0
    BEGIN
    SET @ss_amt = null
    END
	  IF @ss_Inc = ''
    BEGIN
    SET @ss_Inc = null
    END
	  IF @va_app_date = '9/9/1900 12:00:00 AM'
    BEGIN
    SET @va_app_date = null
    END
	  IF @va_amt = 0
    BEGIN
    SET @va_amt = null
    END
	  IF @va_Inc = ''
    BEGIN
    SET @va_Inc = null
    END
	  IF @eap_app_date = '9/9/1900 12:00:00 AM'
    BEGIN
    SET @eap_app_date = null
    END
	  IF @eap_amt = 0
    BEGIN
    SET @eap_amt = null
    END
	  IF @eap_Inc = ''
    BEGIN
    SET @eap_Inc = null
    END
	  IF @fema_app_date = '9/9/1900 12:00:00 AM'
    BEGIN
    SET @fema_app_date = null
    END
	  IF @fema_amt = 0
    BEGIN
    SET @fema_amt = null
    END
	  IF @fema_Inc = ''
    BEGIN
    SET @fema_Inc = null
    END
	  IF @unempl_app_date = '9/9/1900 12:00:00 AM'
    BEGIN
    SET @unempl_app_date = null
    END
	  IF @unempl_amt = 0
    BEGIN
    SET @unempl_amt = null
    END
	  IF @unempl_Inc = ''
    BEGIN
    SET @unempl_Inc = null
    END
	  IF @grants_loans_app_date = '9/9/1900 12:00:00 AM'
    BEGIN
    SET @grants_loans_app_date = null
    END
	  IF @grants_loans_amt = 0
    BEGIN
    SET @grants_loans_amt = null
    END
	  IF @grants_Inc = ''
    BEGIN
    SET @grants_Inc = null
    END
	  IF @other_app_date = '9/9/1900 12:00:00 AM'
    BEGIN
    SET @other_app_date = null
    END
	  IF @other_amt = 0
    BEGIN
    SET @other_amt = null
    END
	  IF @other_Inc = ''
    BEGIN
    SET @other_Inc = null
    END
	  IF @Client_issue_resolved = ''
    BEGIN
    SET @Client_issue_resolved = null
    END
	UPDATE [dbo].[case_client]
       SET
		   [client_id] = @client_id,
		   [address_id] = @address_id,
		   [cable_amt_owed_today] = @cable_amt_owed_today,
		   [colessee_name] = @colessee_name,
		   [child_support] = @child_support,
		   [child_support_memo] = @child_support_memo,
		   [curr_residence_date] = @curr_residence_date,
		   [electric_amt_owed_today] = @electric_amt_owed_today,
		   [employment_memo] = @employment_memo,
		   [employment_status] = @employment_status,
		   [gas_or_heating_amt_owed_today] = @gas_or_heating_amt_owed_today,
		   [housing_amt_owed_today] = @housing_amt_owed_today,
		   [housing_status] = @housing_status,
		   [income_status] = @income_status,
		   [lease_num_adults] = @lease_num_adults,
		   [lease_start_date] = @lease_start_date,
		   [minor_children] = @minor_children,
		   [monthly_rent_amt] = @monthly_rent_amt,
		   [Other_help_Sources] = @Other_help_Sources,
		   [Other_help_Sources_memo] = @Other_help_Sources_memo,
		   [prev_address_id] = @prev_address_id,
		   [prev_residence_date] = @prev_residence_date,
		   [relationship_to_head_of_household] = @relationship_to_head_of_household,
		   [rental_name] = @rental_name,
		   [rental_phone] = @rental_phone,
		   [sewage_amt_owed_today] = @sewage_amt_owed_today,
		   [telephone_amt_owed_today] = @telephone_amt_owed_today,
		   [trash_removal_amt_owed_today] = @trash_removal_amt_owed_today,
		   [us_status_memo] = @us_status_memo,
		   [related_ll] = @related_ll,
		   [relation_to_ll] = @relation_to_ll,
		   [mtg_amt_owed_today] = @mtg_amt_owed_today,
		   [utilities_list] = @utilities_list,
		   [water_amt_owed_today] = @water_amt_owed_today,
		   [public_asst_app_date] = @public_asst_app_date,
		   [util_allot_app_date] = @util_allot_app_date,
		   [util_allot_amt] = @util_allot_amt,
		   [utilities_incl] = @utilities_incl,
		   [fd_stmps_app_date] = @fd_stmps_app_date,
		   [fd_stmps_amt] = @fd_stmps_amt,
		   [fd_Inc] = @fd_Inc,
		   [afdc_app_date] = @afdc_app_date,
		   [afdc_amt] = @afdc_amt,
		   [afdc_Inc] = @afdc_Inc,
		   [oth_trustee_app_date] = @oth_trustee_app_date,
		   [oth_trustee_amt] = @oth_trustee_amt,
		   [oth_trustee_Inc] = @oth_trustee_Inc,
		   [ss_app_date] = @ss_app_date,
		   [ss_amt] = @ss_amt,
		   [ss_Inc] = @ss_Inc,
		   [va_app_date] = @va_app_date,
		   [va_amt] = @va_amt,
		   [va_Inc] = @va_Inc,
		   [eap_app_date] = @eap_app_date,
		   [eap_amt] = @eap_amt,
		   [eap_Inc] = @eap_Inc,
		   [fema_app_date] = @fema_app_date,
		   [fema_amt] = @fema_amt,
		   [fema_Inc] = @fema_Inc,
		   [unempl_app_date] = @unempl_app_date,
		   [unempl_amt] = @unempl_amt,
		   [unempl_Inc] = @unempl_Inc,
		   [grants_loans_app_date] = @grants_loans_app_date,
		   [grants_loans_amt] = @grants_loans_amt,
		   [grants_Inc] = @grants_Inc,
		   [other_app_date] = @other_app_date,
		   [other_amt] = @other_amt,
		   [other_Inc] = @other_Inc,
		   [denial_memo] = @denial_memo,
		   [welfr_fraud_memo] = @welfr_fraud_memo,
		   [Client_issue_Desc] = @Client_issue_Desc,
		   [Client_issue_resolved] = @Client_issue_resolved,
		   [Client_issue_comments] = @Client_issue_comments
       WHERE case_id = @case_id
END
GO
/***********************************************************/
/*************************************************/
/****** - DELETE STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_DELETE_CASE_CLIENT]    Script Date: 9/7/2015 11:21:56 AM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_DELETE_CASE_CLIENT]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_DELETE_CASE_CLIENT]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_DELETE_CASE_CLIENT]
	@case_id int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	Delete dbo.case_client
	where case_id = @case_id
END
GO
/***********************************************************/
/*************************************************/
/****** - GET STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_GET_CASE_CLIENT]    Script Date: 9/7/2015 11:21:56 AM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_GET_CASE_CLIENT]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_GET_CASE_CLIENT]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_GET_CASE_CLIENT]
	  @client_id as int,
	  @address_id as int,
	  @cable_amt_owed_today as money,
	  @colessee_name as varchar(50),
	  @child_support as varchar(3),
	  @child_support_memo as text,
	  @curr_residence_date as datetime,
	  @electric_amt_owed_today as money,
	  @employment_memo as text,
	  @employment_status as varchar(20),
	  @gas_or_heating_amt_owed_today as money,
	  @housing_amt_owed_today as money,
	  @housing_status as varchar(10),
	  @income_status as varchar(20),
	  @lease_num_adults as int,
	  @lease_start_date as datetime,
	  @minor_children as int,
	  @monthly_rent_amt as money,
	  @Other_help_Sources as varchar(3),
	  @Other_help_Sources_memo as text,
	  @prev_address_id as int,
	  @prev_residence_date as datetime,
	  @relationship_to_head_of_household as varchar(15),
	  @rental_name as varchar(50),
	  @rental_phone as varchar(11),
	  @sewage_amt_owed_today as money,
	  @telephone_amt_owed_today as money,
	  @trash_removal_amt_owed_today as money,
	  @us_status_memo as text,
	  @related_ll as char(1),
	  @relation_to_ll as char(1),
	  @mtg_amt_owed_today as money,
	  @utilities_list as text,
	  @water_amt_owed_today as money,
	  @public_asst_app_date as datetime,
	  @util_allot_app_date as datetime,
	  @util_allot_amt as money,
	  @utilities_incl as char(1),
	  @fd_stmps_app_date as datetime,
	  @fd_stmps_amt as money,
	  @fd_Inc as char(1),
	  @afdc_app_date as datetime,
	  @afdc_amt as money,
	  @afdc_Inc as char(1),
	  @oth_trustee_app_date as datetime,
	  @oth_trustee_amt as money,
	  @oth_trustee_Inc as char(1),
	  @ss_app_date as datetime,
	  @ss_amt as money,
	  @ss_Inc as char(1),
	  @va_app_date as datetime,
	  @va_amt as money,
	  @va_Inc as char(1),
	  @eap_app_date as datetime,
	  @eap_amt as money,
	  @eap_Inc as char(1),
	  @fema_app_date as datetime,
	  @fema_amt as money,
	  @fema_Inc as char(1),
	  @unempl_app_date as datetime,
	  @unempl_amt as money,
	  @unempl_Inc as char(1),
	  @grants_loans_app_date as datetime,
	  @grants_loans_amt as money,
	  @grants_Inc as char(1),
	  @other_app_date as datetime,
	  @other_amt as money,
	  @other_Inc as char(1),
	  @denial_memo as text,
	  @welfr_fraud_memo as text,
	  @Client_issue_Desc as text,
	  @Client_issue_resolved as char(1)
	  @Client_issue_comments as text,
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	  IF @client_id = 0
    BEGIN
    SET @client_id = null
    END
	  IF @address_id = 0
    BEGIN
    SET @address_id = null
    END
	  IF @cable_amt_owed_today = 0
    BEGIN
    SET @cable_amt_owed_today = null
    END
	  IF @colessee_name = ''
    BEGIN
    SET @colessee_name = null
    END
	  IF @child_support = ''
    BEGIN
    SET @child_support = null
    END
	  IF @curr_residence_date = '9/9/1900 12:00:00 AM'
    BEGIN
    SET @curr_residence_date = null
    END
	  IF @electric_amt_owed_today = 0
    BEGIN
    SET @electric_amt_owed_today = null
    END
	  IF @employment_status = ''
    BEGIN
    SET @employment_status = null
    END
	  IF @gas_or_heating_amt_owed_today = 0
    BEGIN
    SET @gas_or_heating_amt_owed_today = null
    END
	  IF @housing_amt_owed_today = 0
    BEGIN
    SET @housing_amt_owed_today = null
    END
	  IF @housing_status = ''
    BEGIN
    SET @housing_status = null
    END
	  IF @income_status = ''
    BEGIN
    SET @income_status = null
    END
	  IF @lease_num_adults = 0
    BEGIN
    SET @lease_num_adults = null
    END
	  IF @lease_start_date = '9/9/1900 12:00:00 AM'
    BEGIN
    SET @lease_start_date = null
    END
	  IF @minor_children = 0
    BEGIN
    SET @minor_children = null
    END
	  IF @monthly_rent_amt = 0
    BEGIN
    SET @monthly_rent_amt = null
    END
	  IF @Other_help_Sources = ''
    BEGIN
    SET @Other_help_Sources = null
    END
	  IF @prev_address_id = 0
    BEGIN
    SET @prev_address_id = null
    END
	  IF @prev_residence_date = '9/9/1900 12:00:00 AM'
    BEGIN
    SET @prev_residence_date = null
    END
	  IF @relationship_to_head_of_household = ''
    BEGIN
    SET @relationship_to_head_of_household = null
    END
	  IF @rental_name = ''
    BEGIN
    SET @rental_name = null
    END
	  IF @rental_phone = ''
    BEGIN
    SET @rental_phone = null
    END
	  IF @sewage_amt_owed_today = 0
    BEGIN
    SET @sewage_amt_owed_today = null
    END
	  IF @telephone_amt_owed_today = 0
    BEGIN
    SET @telephone_amt_owed_today = null
    END
	  IF @trash_removal_amt_owed_today = 0
    BEGIN
    SET @trash_removal_amt_owed_today = null
    END
	  IF @related_ll = ''
    BEGIN
    SET @related_ll = null
    END
	  IF @relation_to_ll = ''
    BEGIN
    SET @relation_to_ll = null
    END
	  IF @mtg_amt_owed_today = 0
    BEGIN
    SET @mtg_amt_owed_today = null
    END
	  IF @water_amt_owed_today = 0
    BEGIN
    SET @water_amt_owed_today = null
    END
	  IF @public_asst_app_date = '9/9/1900 12:00:00 AM'
    BEGIN
    SET @public_asst_app_date = null
    END
	  IF @util_allot_app_date = '9/9/1900 12:00:00 AM'
    BEGIN
    SET @util_allot_app_date = null
    END
	  IF @util_allot_amt = 0
    BEGIN
    SET @util_allot_amt = null
    END
	  IF @utilities_incl = ''
    BEGIN
    SET @utilities_incl = null
    END
	  IF @fd_stmps_app_date = '9/9/1900 12:00:00 AM'
    BEGIN
    SET @fd_stmps_app_date = null
    END
	  IF @fd_stmps_amt = 0
    BEGIN
    SET @fd_stmps_amt = null
    END
	  IF @fd_Inc = ''
    BEGIN
    SET @fd_Inc = null
    END
	  IF @afdc_app_date = '9/9/1900 12:00:00 AM'
    BEGIN
    SET @afdc_app_date = null
    END
	  IF @afdc_amt = 0
    BEGIN
    SET @afdc_amt = null
    END
	  IF @afdc_Inc = ''
    BEGIN
    SET @afdc_Inc = null
    END
	  IF @oth_trustee_app_date = '9/9/1900 12:00:00 AM'
    BEGIN
    SET @oth_trustee_app_date = null
    END
	  IF @oth_trustee_amt = 0
    BEGIN
    SET @oth_trustee_amt = null
    END
	  IF @oth_trustee_Inc = ''
    BEGIN
    SET @oth_trustee_Inc = null
    END
	  IF @ss_app_date = '9/9/1900 12:00:00 AM'
    BEGIN
    SET @ss_app_date = null
    END
	  IF @ss_amt = 0
    BEGIN
    SET @ss_amt = null
    END
	  IF @ss_Inc = ''
    BEGIN
    SET @ss_Inc = null
    END
	  IF @va_app_date = '9/9/1900 12:00:00 AM'
    BEGIN
    SET @va_app_date = null
    END
	  IF @va_amt = 0
    BEGIN
    SET @va_amt = null
    END
	  IF @va_Inc = ''
    BEGIN
    SET @va_Inc = null
    END
	  IF @eap_app_date = '9/9/1900 12:00:00 AM'
    BEGIN
    SET @eap_app_date = null
    END
	  IF @eap_amt = 0
    BEGIN
    SET @eap_amt = null
    END
	  IF @eap_Inc = ''
    BEGIN
    SET @eap_Inc = null
    END
	  IF @fema_app_date = '9/9/1900 12:00:00 AM'
    BEGIN
    SET @fema_app_date = null
    END
	  IF @fema_amt = 0
    BEGIN
    SET @fema_amt = null
    END
	  IF @fema_Inc = ''
    BEGIN
    SET @fema_Inc = null
    END
	  IF @unempl_app_date = '9/9/1900 12:00:00 AM'
    BEGIN
    SET @unempl_app_date = null
    END
	  IF @unempl_amt = 0
    BEGIN
    SET @unempl_amt = null
    END
	  IF @unempl_Inc = ''
    BEGIN
    SET @unempl_Inc = null
    END
	  IF @grants_loans_app_date = '9/9/1900 12:00:00 AM'
    BEGIN
    SET @grants_loans_app_date = null
    END
	  IF @grants_loans_amt = 0
    BEGIN
    SET @grants_loans_amt = null
    END
	  IF @grants_Inc = ''
    BEGIN
    SET @grants_Inc = null
    END
	  IF @other_app_date = '9/9/1900 12:00:00 AM'
    BEGIN
    SET @other_app_date = null
    END
	  IF @other_amt = 0
    BEGIN
    SET @other_amt = null
    END
	  IF @other_Inc = ''
    BEGIN
    SET @other_Inc = null
    END
	  IF @Client_issue_resolved = ''
    BEGIN
    SET @Client_issue_resolved = null
    END
    SELECT [case_id] 
      FROM [dbo].[case_client] 
       WHERE ([client_id] = @client_id)
       AND ([address_id] = @address_id)
       AND ([cable_amt_owed_today] = @cable_amt_owed_today or [cable_amt_owed_today] is null)
       AND ([colessee_name] like @colessee_name or [colessee_name] is null)
       AND ([child_support] like @child_support or [child_support] is null)
       AND ([child_support_memo] like @child_support_memo or [child_support_memo] is null)
       AND ([curr_residence_date] = @curr_residence_date or [curr_residence_date] is null)
       AND ([electric_amt_owed_today] = @electric_amt_owed_today or [electric_amt_owed_today] is null)
       AND ([employment_memo] like @employment_memo or [employment_memo] is null)
       AND ([employment_status] like @employment_status)
       AND ([gas_or_heating_amt_owed_today] = @gas_or_heating_amt_owed_today or [gas_or_heating_amt_owed_today] is null)
       AND ([housing_amt_owed_today] = @housing_amt_owed_today or [housing_amt_owed_today] is null)
       AND ([housing_status] like @housing_status)
       AND ([income_status] like @income_status)
       AND ([lease_num_adults] = @lease_num_adults or [lease_num_adults] is null)
       AND ([lease_start_date] = @lease_start_date or [lease_start_date] is null)
       AND ([minor_children] = @minor_children)
       AND ([monthly_rent_amt] = @monthly_rent_amt or [monthly_rent_amt] is null)
       AND ([Other_help_Sources] like @Other_help_Sources or [Other_help_Sources] is null)
       AND ([Other_help_Sources_memo] like @Other_help_Sources_memo or [Other_help_Sources_memo] is null)
       AND ([prev_address_id] = @prev_address_id or [prev_address_id] is null)
       AND ([prev_residence_date] = @prev_residence_date or [prev_residence_date] is null)
       AND ([relationship_to_head_of_household] like @relationship_to_head_of_household or [relationship_to_head_of_household] is null)
       AND ([rental_name] like @rental_name or [rental_name] is null)
       AND ([rental_phone] like @rental_phone or [rental_phone] is null)
       AND ([sewage_amt_owed_today] = @sewage_amt_owed_today or [sewage_amt_owed_today] is null)
       AND ([telephone_amt_owed_today] = @telephone_amt_owed_today or [telephone_amt_owed_today] is null)
       AND ([trash_removal_amt_owed_today] = @trash_removal_amt_owed_today or [trash_removal_amt_owed_today] is null)
       AND ([us_status_memo] like @us_status_memo or [us_status_memo] is null)
       AND ([related_ll] = @related_ll or [related_ll] is null)
       AND ([relation_to_ll] = @relation_to_ll or [relation_to_ll] is null)
       AND ([mtg_amt_owed_today] = @mtg_amt_owed_today or [mtg_amt_owed_today] is null)
       AND ([utilities_list] like @utilities_list or [utilities_list] is null)
       AND ([water_amt_owed_today] = @water_amt_owed_today or [water_amt_owed_today] is null)
       AND ([public_asst_app_date] = @public_asst_app_date or [public_asst_app_date] is null)
       AND ([util_allot_app_date] = @util_allot_app_date or [util_allot_app_date] is null)
       AND ([util_allot_amt] = @util_allot_amt or [util_allot_amt] is null)
       AND ([utilities_incl] = @utilities_incl or [utilities_incl] is null)
       AND ([fd_stmps_app_date] = @fd_stmps_app_date or [fd_stmps_app_date] is null)
       AND ([fd_stmps_amt] = @fd_stmps_amt or [fd_stmps_amt] is null)
       AND ([fd_Inc] = @fd_Inc or [fd_Inc] is null)
       AND ([afdc_app_date] = @afdc_app_date or [afdc_app_date] is null)
       AND ([afdc_amt] = @afdc_amt or [afdc_amt] is null)
       AND ([afdc_Inc] = @afdc_Inc or [afdc_Inc] is null)
       AND ([oth_trustee_app_date] = @oth_trustee_app_date or [oth_trustee_app_date] is null)
       AND ([oth_trustee_amt] = @oth_trustee_amt or [oth_trustee_amt] is null)
       AND ([oth_trustee_Inc] = @oth_trustee_Inc or [oth_trustee_Inc] is null)
       AND ([ss_app_date] = @ss_app_date or [ss_app_date] is null)
       AND ([ss_amt] = @ss_amt or [ss_amt] is null)
       AND ([ss_Inc] = @ss_Inc or [ss_Inc] is null)
       AND ([va_app_date] = @va_app_date or [va_app_date] is null)
       AND ([va_amt] = @va_amt or [va_amt] is null)
       AND ([va_Inc] = @va_Inc or [va_Inc] is null)
       AND ([eap_app_date] = @eap_app_date or [eap_app_date] is null)
       AND ([eap_amt] = @eap_amt or [eap_amt] is null)
       AND ([eap_Inc] = @eap_Inc or [eap_Inc] is null)
       AND ([fema_app_date] = @fema_app_date or [fema_app_date] is null)
       AND ([fema_amt] = @fema_amt or [fema_amt] is null)
       AND ([fema_Inc] = @fema_Inc or [fema_Inc] is null)
       AND ([unempl_app_date] = @unempl_app_date or [unempl_app_date] is null)
       AND ([unempl_amt] = @unempl_amt or [unempl_amt] is null)
       AND ([unempl_Inc] = @unempl_Inc or [unempl_Inc] is null)
       AND ([grants_loans_app_date] = @grants_loans_app_date or [grants_loans_app_date] is null)
       AND ([grants_loans_amt] = @grants_loans_amt or [grants_loans_amt] is null)
       AND ([grants_Inc] = @grants_Inc or [grants_Inc] is null)
       AND ([other_app_date] = @other_app_date or [other_app_date] is null)
       AND ([other_amt] = @other_amt or [other_amt] is null)
       AND ([other_Inc] = @other_Inc or [other_Inc] is null)
       AND ([denial_memo] like @denial_memo or [denial_memo] is null)
       AND ([welfr_fraud_memo] like @welfr_fraud_memo or [welfr_fraud_memo] is null)
       AND ([Client_issue_Desc] like @Client_issue_Desc or [Client_issue_Desc] is null)
       AND ([Client_issue_resolved] = @Client_issue_resolved or [Client_issue_resolved] is null)
       AND ([Client_issue_comments] like @Client_issue_comments or [Client_issue_comments] is null)
END
GO

