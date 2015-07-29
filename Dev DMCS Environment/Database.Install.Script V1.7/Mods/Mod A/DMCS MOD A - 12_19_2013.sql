
/****DMCS Mod****/
/****AUTHOR: James MIller****/
/****CREATED: 8/30/2013****/

/****DESCRIPTION:****/
/*This script contains all the changes from the Spring 2013 Semester to 8/30/2013*/
/*Encounter table adds Pet_Record_id*/
/*Droping warehouse_encounter_products*/
/*Adding warehouse_product_location*/
/*All changes discussed about warehouse_product_location and products tables*/
/*All changes discussed regarding Pets (adding picture on pets table, */
/*Deleteing image form pet missing, and all new stored procedures)*/
/*This also adds some new stored procedures for resource allocation*/
/**/


    BEGIN TRANSACTION 

/******Drilling down to encounter******/
DROP TABLE [dbo].[disaster_encounter]

DROP TABLE [dbo].[encounter_client_vaccine]

DROP TABLE [dbo].[encounter_services]

DROP TABLE [dbo].[Order_Product]

DROP TABLE [dbo].[requestor_Order]

DROP TABLE [dbo].[requestor]

DROP TABLE [dbo].[warehouse_encounter_products]

DROP TABLE [dbo].[warehouse_product_Location]

DROP TABLE [dbo].[encounter]


/****Drilling down to resource****/
DROP TABLE [dbo].[case_client]

DROP TABLE [dbo].[ClientWPets]

DROP TABLE [dbo].[debt]

DROP TABLE [dbo].[medical_assistance]

DROP TABLE [dbo].[emergency_medical]

DROP TABLE [dbo].[employee_clients]

DROP TABLE [dbo].[employer]

DROP TABLE [dbo].[expense]

DROP TABLE [dbo].[income_source]

DROP TABLE [dbo].[military]

DROP TABLE [dbo].[property]

DROP TABLE [dbo].[relative]

DROP TABLE [dbo].[transportation]

DROP TABLE [dbo].[mobile_employees]

DROP TABLE [dbo].[Mobile_Product]

DROP TABLE [dbo].[mobile_unit]

DROP TABLE [dbo].[vehicle]

DROP TABLE [dbo].[client]

DROP TABLE [dbo].[deceased]

DROP TABLE [dbo].[Donor_Product]

DROP TABLE [dbo].[donation]

DROP TABLE [dbo].[Donor]

DROP TABLE [dbo].[house_choice]

DROP TABLE [dbo].[agency_employees]

DROP TABLE [dbo].[call_center_employee]

DROP TABLE [dbo].[employee]

DROP TABLE [dbo].[person]

/*DROP TABLE [dbo].[warehouse_product_Location]*/

DROP TABLE [dbo].[food]

DROP TABLE [dbo].[lot]

DROP TABLE [dbo].[tier_req]

DROP TABLE [dbo].[tier]

DROP TABLE [dbo].[campaign]

DROP TABLE [dbo].[vaccine]

DROP TABLE [dbo].[medicine]

DROP TABLE [dbo].[vendor_products]

DROP TABLE [dbo].[Vendor_Products_shipments]

DROP TABLE [dbo].[Shipment]

DROP TABLE [dbo].[warehouse]

DROP TABLE [dbo].[products]

DROP TABLE [dbo].[services]

DROP TABLE [dbo].[resource]

DROP TABLE [dbo].[FEMA]

/****Drilling down to the rest of pets****/


DROP TABLE [dbo].[Pet_Vaccine]

DROP TABLE [dbo].[Pet]

DROP TABLE [dbo].[Pet_Deceased]

DROP TABLE [dbo].[Pet_Missing]

DROP TABLE [dbo].[Pet_type]

DROP TABLE [dbo].[location]

  





/***********INSERTS**********************//***********INSERTS**********************/
/***********INSERTS**********************//***********INSERTS**********************/
/***********INSERTS**********************//***********INSERTS**********************/
/***********INSERTS**********************//***********INSERTS**********************/
/***********INSERTS**********************//***********INSERTS**********************/

GO

/****** Object:  Table [dbo].[disaster_encounter]    Script Date: 8/30/2013 3:47:24 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[disaster_encounter](
	[disaster_encounter_id] [int] IDENTITY(1,1) NOT NULL,
	[disaster_id] [int] NOT NULL,
	[encounter_id] [int] NOT NULL,
	[address_id] [int] NOT NULL,
 CONSTRAINT [dis_enc_id_pk] PRIMARY KEY CLUSTERED 
(
	[disaster_encounter_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO


GO

/****** Object:  Table [dbo].[encounter_client_vaccine]    Script Date: 8/30/2013 5:40:42 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[encounter_client_vaccine](
	[encounter_id] [int] NOT NULL,
	[vaccine_id] [int] NOT NULL,
	[medicine] [varchar](30) NULL,
	[assistance] [char](1) NOT NULL,
	[quantity] [int] NULL,
	[under6m] [char](1) NOT NULL,
	[pregnant] [char](1) NOT NULL,
	[children] [int] NOT NULL,
	[occupation] [varchar](30) NULL,
	[chronic_disease] [varchar](50) NULL,
	[qualify] [char](1) NOT NULL,
	[dose_date1] [datetime] NOT NULL,
	[dose_date2] [datetime] NULL,
	[adult_consent] [image] NULL,
	[guardian_consent] [image] NULL,
	[vaccine_admin] [datetime] NOT NULL,
	[guardian_f_name] [varchar](20) NULL,
	[guardian_l_name] [varchar](20) NULL,
	[guardian_mi] [char](1) NULL,
	[guardian_phone] [varchar](11) NULL,
	[adult_consent_date] [datetime] NULL,
	[guard_consent_date] [datetime] NULL,
	[dose_form1] [char](1) NOT NULL,
	[dose_form2] [char](1) NULL,
 CONSTRAINT [encntr_clnt_vac_encounter_id_pk] PRIMARY KEY CLUSTERED 
(
	[encounter_id] ASC,
	[vaccine_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO




GO

/****** Object:  Table [dbo].[encounter_services]    Script Date: 8/30/2013 5:43:07 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[encounter_services](
	[encounter_serv_id] [int] IDENTITY(1,1) NOT NULL,
	[encounter_id] [int] NULL,
	[mobile_unit_id] [int] NULL,
	[service_id] [int] NOT NULL,
	[service_date] [datetime] NOT NULL,
	[service_completed] [datetime] NULL,
 CONSTRAINT [enctr_serv_encounter_serv_id_pk] PRIMARY KEY CLUSTERED 
(
	[encounter_serv_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO


GO

/****** Object:  Table [dbo].[Order_Product]    Script Date: 8/30/2013 5:43:54 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Order_Product](
	[order_Product_ID] [int] IDENTITY(1,1) NOT NULL,
	[orderID] [int] NOT NULL,
	[ProductID] [int] NOT NULL,
	[Quantity] [int] NOT NULL,
	[warehouseid] [int] NOT NULL,
	[DatePicked] [date] NULL,
	[Qtypicked] [int] NULL,
 CONSTRAINT [order_Product_ID_pk] PRIMARY KEY CLUSTERED 
(
	[order_Product_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO


GO

/****** Object:  Table [dbo].[requestor_Order]    Script Date: 8/30/2013 5:44:27 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[requestor_Order](
	[OrderID] [int] IDENTITY(1,1) NOT NULL,
	[Requestor_ID] [int] NULL,
	[EncounterID] [int] NULL,
	[OrderPriority] [int] NULL,
	[OrderNum] [int] NULL,
	[ShipToAddressID] [int] NULL,
	[OrderDeliveryType] [varchar](20) NULL,
	[OrderPickUpDate] [date] NULL,
	[Call_In_Order_Qty] [varchar](8000) NULL,
	[Call_In_Order_Description] [varchar](8000) NULL

 CONSTRAINT [OrderID_pk] PRIMARY KEY CLUSTERED 
(
	[OrderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO


GO

/****** Object:  Table [dbo].[requestor]    Script Date: 8/30/2013 5:44:57 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[requestor](
	[RequestorID] [int] IDENTITY(1,1) NOT NULL,
	[EncounterID] [int] NOT NULL,
	[Requestor_Type] [char](1) NOT NULL,
	[MobilUnitID] [int] NULL,
	[PersonID] [int] NULL,
	[AgencyID] [int] NULL,
 CONSTRAINT [RequestorID_pk] PRIMARY KEY CLUSTERED 
(
	[RequestorID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO


GO

/****** Object:  Table [dbo].[encounter]    Script Date: 8/30/2013 5:45:47 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[encounter](
	[encounter_id] [int] IDENTITY(1,1) NOT NULL,
	[case_id] [int] NULL,
	[agency_id] [int] NULL,
	[call_center_id] [int] NULL,
	[client_id] [int] NULL,
	[create_date] [datetime] NOT NULL,
	[close_date] [datetime] NULL,
	[disaster_id] [int] NOT NULL,
	[Location_ID] [int] NULL,
	[Pet_Record_ID] [int] NULL,
 CONSTRAINT [enctr_encounter_id_pk] PRIMARY KEY CLUSTERED 
(
	[encounter_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

/************/


GO

/****** Object:  Table [dbo].[case_client]    Script Date: 8/30/2013 5:46:55 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[case_client](
	[case_id] [int] NOT NULL,
	[client_id] [int] NOT NULL,
	[address_id] [int] NOT NULL,
	[cable_amt_owed_today] [money] NULL,
	[colessee_name] [varchar](50) NULL,
	[child_support] [varchar](3) NOT NULL,
	[child_support_memo] [text] NULL,
	[curr_residence_date] [datetime] NULL,
	[electric_amt_owed_today] [money] NULL,
	[employment_memo] [text] NULL,
	[employment_status] [varchar](20) NOT NULL,
	[gas_or_heating_amt_owed_today] [money] NULL,
	[housing_amt_owed_today] [money] NULL,
	[housing_status] [varchar](10) NOT NULL,
	[income_status] [varchar](20) NOT NULL,
	[lease_num_adults] [int] NULL,
	[lease_start_date] [datetime] NULL,
	[minor_children] [int] NOT NULL,
	[monthly_rent_amt] [money] NULL,
	[Other_help_Sources] [varchar](3) NULL,
	[Other_help_Sources_memo] [text] NULL,
	[prev_address_id] [int] NULL,
	[prev_residence_date] [datetime] NULL,
	[relationship_to_head_of_household] [varchar](15) NOT NULL,
	[rental_name] [varchar](50) NULL,
	[rental_phone] [varchar](11) NULL,
	[sewage_amt_owed_today] [money] NULL,
	[telephone_amt_owed_today] [money] NULL,
	[trash_removal_amt_owed_today] [money] NULL,
	[us_status_memo] [text] NULL,
	[related_ll] [char](1) NOT NULL,
	[relation_to_ll] [char](1) NOT NULL,
	[mtg_amt_owed_today] [money] NULL,
	[utilities_list] [text] NULL,
	[water_amt_owed_today] [money] NULL,
	[public_asst_app_date] [datetime] NULL,
	[util_allot_app_date] [datetime] NULL,
	[util_allot_amt] [money] NULL,
	[utilities_incl] [char](1) NULL,
	[fd_stmps_app_date] [datetime] NULL,
	[fd_stmps_amt] [money] NULL,
	[fd_Inc] [char](1) NULL,
	[afdc_app_date] [datetime] NULL,
	[afdc_amt] [money] NULL,
	[afdc_Inc] [char](1) NULL,
	[oth_trustee_app_date] [datetime] NULL,
	[oth_trustee_amt] [money] NULL,
	[oth_trustee_Inc] [char](1) NULL,
	[ss_app_date] [datetime] NULL,
	[ss_amt] [money] NULL,
	[ss_Inc] [char](1) NULL,
	[va_app_date] [datetime] NULL,
	[va_amt] [money] NULL,
	[va_Inc] [char](1) NULL,
	[eap_app_date] [datetime] NULL,
	[eap_amt] [money] NULL,
	[eap_Inc] [char](1) NULL,
	[fema_app_date] [datetime] NULL,
	[fema_amt] [money] NULL,
	[fema_Inc] [char](1) NULL,
	[unempl_app_date] [datetime] NULL,
	[unempl_amt] [money] NULL,
	[unempl_Inc] [char](1) NULL,
	[grants_loans_app_date] [datetime] NULL,
	[grants_loans_amt] [money] NULL,
	[grants_Inc] [char](1) NULL,
	[other_app_date] [datetime] NULL,
	[other_amt] [money] NULL,
	[other_Inc] [char](1) NULL,
	[denial_memo] [text] NULL,
	[welfr_fraud_memo] [text] NULL,
	[Client_issue_Desc] [text] NULL,
	[Client_issue_resolved] [char](1) NULL,
	[Client_issue_comments] [text] NULL,
 CONSTRAINT [case_client_pk] PRIMARY KEY CLUSTERED 
(
	[case_id] ASC,
	[client_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO



GO

/****** Object:  Table [dbo].[ClientWPets]    Script Date: 8/30/2013 5:47:26 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING OFF
GO

CREATE TABLE [dbo].[ClientWPets](
	[CLIENTWPETS_ID] [int] IDENTITY(1,1) NOT NULL,
	[Pet_Record_ID] [int] NOT NULL,
	[Client_id] [int] NULL,
	[Location_ID] [int] NOT NULL,
	[cp_Date] [date] NOT NULL,
	[ownership] [char](1) NULL,
 CONSTRAINT [PK_clientwpets_id] PRIMARY KEY CLUSTERED 
(
	[CLIENTWPETS_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO


GO

/****** Object:  Table [dbo].[debt]    Script Date: 8/30/2013 5:47:53 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[debt](
	[debt_id] [int] IDENTITY(1,1) NOT NULL,
	[amt_paid] [money] NOT NULL,
	[case_id] [int] NOT NULL,
	[client_id] [int] NOT NULL,
	[creditor_name] [varchar](50) NOT NULL,
	[debt_amt] [money] NOT NULL,
	[item_purchased] [varchar](30) NOT NULL,
	[last_payment_date] [datetime] NOT NULL,
	[purchase_date] [datetime] NOT NULL,
	[value_amt] [money] NOT NULL,
 CONSTRAINT [dbt_cs_clt_debt_id_pk] PRIMARY KEY CLUSTERED 
(
	[debt_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO


GO

/****** Object:  Table [dbo].[medical_assistance]    Script Date: 8/30/2013 5:48:18 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[medical_assistance](
	[medical_assist_order_id] [int] IDENTITY(1,1) NOT NULL,
	[em_id] [int] NOT NULL,
	[medical_assist_date] [datetime] NOT NULL,
	[medical_assist_doctor_id] [int] NULL,
	[medical_assist_hosp_price] [money] NULL,
	[medical_assist_hospital_name] [varchar](50) NULL,
	[medical_assist_script_meds] [varchar](30) NULL,
	[medical_assist_script_price] [money] NULL,
	[medical_assist_script_quantity] [int] NULL,
 CONSTRAINT [med_ass_med_ass_ord_id_pk] PRIMARY KEY CLUSTERED 
(
	[medical_assist_order_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO


GO

/****** Object:  Table [dbo].[emergency_medical]    Script Date: 8/30/2013 5:50:59 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[emergency_medical](
	[em_id] [int] IDENTITY(1,1) NOT NULL,
	[client_id] [int] NOT NULL,
	[ambulance_company_name] [varchar](50) NOT NULL,
	[ambulance_identification] [varchar](30) NOT NULL,
	[appointment_date] [datetime] NULL,
	[area_of_specialty] [varchar](30) NULL,
	[assistance_order] [varchar](50) NULL,
	[date_of_service] [datetime] NOT NULL,
	[degree_certifications] [text] NULL,
	[doctor_appointments] [varchar](30) NULL,
	[doctor_id] [int] NULL,
	[doctor_start_date] [datetime] NULL,
	[driver_id] [int] NULL,
	[educational_institution_name] [varchar](50) NULL,
	[external_examination] [text] NULL,
	[hospital_name] [varchar](50) NULL,
	[internal_examination] [text] NULL,
	[lights_sirens_to_scene] [varchar](3) NULL,
	[location_type] [varchar](3) NULL,
	[number_of_days_admitted] [int] NULL,
	[office_location] [varchar](30) NULL,
	[other_remarks] [text] NULL,
	[prescription_medicines] [text] NULL,
	[time_of_service] [datetime] NULL,
	[total_cost] [money] NULL,
	[deceased_id] [int] NULL,
 CONSTRAINT [emer_med_em_id_pk] PRIMARY KEY CLUSTERED 
(
	[em_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO



GO

/****** Object:  Table [dbo].[employee_clients]    Script Date: 8/30/2013 5:51:29 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[employee_clients](
	[emp_client_id] [int] IDENTITY(1,1) NOT NULL,
	[client_id] [int] NOT NULL,
	[employee_id] [int] NOT NULL,
 CONSTRAINT [empl_cli_empl_id_cli_id_pk] PRIMARY KEY CLUSTERED 
(
	[emp_client_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO



GO

/****** Object:  Table [dbo].[employer]    Script Date: 8/30/2013 5:51:51 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[employer](
	[emplr_id] [int] IDENTITY(1,1) NOT NULL,
	[case_id] [int] NOT NULL,
	[client_id] [int] NOT NULL,
	[address_id] [int] NOT NULL,
	[emplr_name] [varchar](50) NOT NULL,
	[emplr_phone] [varchar](11) NOT NULL,
	[end_date] [datetime] NULL,
	[strt_date] [datetime] NOT NULL,
	[term_reason] [text] NULL,
 CONSTRAINT [case_id_clt_id_emlr_id_pk] PRIMARY KEY CLUSTERED 
(
	[emplr_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO



GO

/****** Object:  Table [dbo].[expense]    Script Date: 8/30/2013 5:52:10 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[expense](
	[expense_id] [int] IDENTITY(1,1) NOT NULL,
	[case_id] [int] NOT NULL,
	[client_id] [int] NOT NULL,
	[date_paid] [datetime] NOT NULL,
	[expense_amt_paid] [money] NOT NULL,
	[expense_amt_paid_to] [varchar](30) NOT NULL,
 CONSTRAINT [expenseid_caseid_clientid_pk] PRIMARY KEY CLUSTERED 
(
	[expense_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO


GO

/****** Object:  Table [dbo].[income_source]    Script Date: 8/30/2013 5:52:28 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[income_source](
	[income_source_id] [int] IDENTITY(1,1) NOT NULL,
	[case_id] [int] NOT NULL,
	[cash_amt] [money] NULL,
	[cash_on_hand] [char](1) NOT NULL,
	[wages_stopped] [char](1) NOT NULL,
	[waiting_on_income] [char](1) NOT NULL,
	[recieving_income] [char](1) NOT NULL,
	[no_income] [char](1) NOT NULL,
	[currently_working] [char](1) NOT NULL,
	[laid_off] [char](1) NOT NULL,
	[never_worked] [char](1) NOT NULL,
	[quit] [char](1) NOT NULL,
	[fired] [char](1) NOT NULL,
	[sick_leave] [char](1) NOT NULL,
	[maternity_leave] [char](1) NOT NULL,
	[on_strike] [char](1) NOT NULL,
	[trying_to_find_work] [char](1) NOT NULL,
	[ckg_acct] [char](1) NOT NULL,
	[ckg_balance] [money] NULL,
	[ckg_bank] [varchar](30) NULL,
	[claims] [char](1) NOT NULL,
	[claims_memo] [text] NULL,
	[client_id] [int] NULL,
	[gifts_amt] [money] NULL,
	[gifts_inc] [char](1) NOT NULL,
	[investments] [char](1) NOT NULL,
	[life_ins] [char](1) NOT NULL,
	[other_ins] [char](1) NOT NULL,
	[pension_amt] [money] NULL,
	[pension_inc] [char](1) NOT NULL,
	[strike_benefits_amt] [money] NULL,
	[strike_benefits_inc] [char](1) NOT NULL,
	[support_amt] [money] NULL,
	[support_inc] [char](1) NOT NULL,
	[SSI_Amt] [money] NOT NULL,
	[SSI_Inc] [char](1) NULL,
	[svgs_acct] [char](1) NOT NULL,
	[svgs_balance] [money] NULL,
	[svgs_bank] [varchar](30) NULL,
	[wages_amt] [money] NULL,
	[wages_inc] [char](1) NOT NULL,
 CONSTRAINT [incsrcid_caseid_clientid_pk] PRIMARY KEY CLUSTERED 
(
	[income_source_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO


GO

/****** Object:  Table [dbo].[military]    Script Date: 8/30/2013 5:52:47 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[military](
	[military_id] [int] IDENTITY(1,1) NOT NULL,
	[case_id] [int] NOT NULL,
	[client_id] [int] NOT NULL,
	[discharge_date] [datetime] NULL,
	[enlistment_date] [datetime] NOT NULL,
	[military_branch] [varchar](30) NOT NULL,
	[serial_num] [int] NOT NULL,
 CONSTRAINT [mil_case_cli_mil_id_pk] PRIMARY KEY CLUSTERED 
(
	[military_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO


GO

/****** Object:  Table [dbo].[property]    Script Date: 8/30/2013 5:53:05 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[property](
	[property_id] [int] IDENTITY(1,1) NOT NULL,
	[approx_mrkt_value] [money] NULL,
	[address_id] [int] NOT NULL,
	[case_id] [int] NOT NULL,
	[client_id] [int] NOT NULL,
	[Homeowners_Insurance _Payment] [money] NOT NULL,
	[monthly_property_payment] [money] NOT NULL,
	[mortg_comp] [varchar](30) NULL,
	[Property_Tax _Payment] [money] NOT NULL,
	[own_prop] [char](1) NULL,
	[rent_prop] [char](1) NULL,
	[date_purchased] [int] NULL,
 CONSTRAINT [ppty_caseid_cltid_pptyid_pk] PRIMARY KEY CLUSTERED 
(
	[property_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO


GO

/****** Object:  Table [dbo].[relative]    Script Date: 8/30/2013 5:53:33 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[relative](
	[relative_id] [int] IDENTITY(1,1) NOT NULL,
	[case_id] [int] NOT NULL,
	[client_id] [int] NOT NULL,
	[address_id] [int] NULL,
	[relative_help_memo] [text] NULL,
	[will_help] [char](1) NOT NULL,
 CONSTRAINT [relative_relative_id_pk] PRIMARY KEY CLUSTERED 
(
	[relative_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO


GO

/****** Object:  Table [dbo].[transportation]    Script Date: 8/30/2013 5:53:52 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[transportation](
	[transport_id] [int] NOT NULL,
	[location_from] [varchar](30) NOT NULL,
	[location_to] [varchar](30) NOT NULL,
	[no_of_passangers] [int] NOT NULL,
	[pickup_date] [datetime] NOT NULL,
	[trans_type] [varchar](3) NOT NULL,
	[Vehicle_id] [int] NOT NULL,
 CONSTRAINT [trans_transport_id_pk] PRIMARY KEY CLUSTERED 
(
	[transport_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO


GO

/****** Object:  Table [dbo].[mobile_employees]    Script Date: 8/30/2013 5:54:20 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[mobile_employees](
	[mobile_employee_id] [int] IDENTITY(1,1) NOT NULL,
	[mobile_unit_id] [int] NOT NULL,
	[employee_id] [int] NOT NULL,
 CONSTRAINT [mei_pk] PRIMARY KEY CLUSTERED 
(
	[mobile_employee_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO


GO

/****** Object:  Table [dbo].[Mobile_Product]    Script Date: 8/30/2013 5:54:50 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Mobile_Product](
	[Mobile_Product_id] [int] IDENTITY(1,1) NOT NULL,
	[Mobile_Unit_id] [int] NOT NULL,
	[Product_id] [int] NOT NULL,
	[Case_id] [int] NULL,
	[Lot_id] [int] NULL,
	[Min_inv] [int] NULL,
	[Quantity] [int] NULL,
	[Experiation_Date] [datetime] NULL,
 CONSTRAINT [PK_Mobile_Product] PRIMARY KEY CLUSTERED 
(
	[Mobile_Product_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO


GO

/****** Object:  Table [dbo].[mobile_unit]    Script Date: 8/30/2013 5:55:09 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[mobile_unit](
	[mobile_unit_id] [int] IDENTITY(1,1) NOT NULL,
	[vehicle_id] [int] NOT NULL,
	[mobile_desc] [varchar](50) NOT NULL,
	[call_center_id] [int] NULL,
 CONSTRAINT [mobile_unit_mobile_unit_id_pk] PRIMARY KEY CLUSTERED 
(
	[mobile_unit_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO


GO

/****** Object:  Table [dbo].[vehicle]    Script Date: 8/30/2013 5:55:29 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[vehicle](
	[vehicle_id] [int] IDENTITY(1,1) NOT NULL,
	[case_id] [int] NULL,
	[client_id] [int] NULL,
	[vehicle_make] [varchar](15) NOT NULL,
	[vehicle_model] [varchar](30) NOT NULL,
	[vehicle_type] [varchar](15) NOT NULL,
	[vehicle_year] [int] NOT NULL,
	[vehicle_desc] [varchar](50) NULL,
	[vin] [varchar](17) NULL,
	[start_mileage] [int] NULL,
	[first_service_date] [datetime] NULL,
	[last_service_date] [datetime] NULL,
	[PLATENUMBER] [varchar](10) NOT NULL,
	[FUELTYPE] [char](1) NOT NULL,
	[MPH] [int] NOT NULL,
	[INSURED] [char](1) NULL,
 CONSTRAINT [vcl_case_cli_vcl_id_pk] PRIMARY KEY CLUSTERED 
(
	[vehicle_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO


GO

/****** Object:  Table [dbo].[client]    Script Date: 8/30/2013 5:55:48 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[client](
	[client_id] [int] NOT NULL,
	[client_status] [char](1) NOT NULL,
	[ethnicity] [varchar](15) NULL,
	[eye_color] [varchar](10) NULL,
	[hair_color] [varchar](10) NULL,
	[height] [varchar](10) NULL,
	[picture] [image] NULL,
	[weight] [int] NULL,
	[skin_color] [varchar](15) NULL,
	[Info_Field] [text] NULL,
 CONSTRAINT [client_client_id_pk] PRIMARY KEY CLUSTERED 
(
	[client_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO


GO

/****** Object:  Table [dbo].[deceased]    Script Date: 8/30/2013 5:56:31 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[deceased](
	[deceased_id] [int] NOT NULL,
	[coroner_id] [int] NOT NULL,
	[date_of_autopsy] [datetime] NOT NULL,
	[external_exam] [text] NULL,
	[identifying_marks] [text] NOT NULL,
	[internal_exam] [text] NULL,
	[reason_of_death] [text] NULL,
	[time_of_death] [datetime] NULL,
 CONSTRAINT [deceased_deceased_id_pk] PRIMARY KEY CLUSTERED 
(
	[deceased_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO


GO

/****** Object:  Table [dbo].[Donor_Product]    Script Date: 8/30/2013 5:56:47 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[Donor_Product](
	[DonorProductID] [int] IDENTITY(1,1) NOT NULL,
	[DonorID] [int] NOT NULL,
	[ProductID] [int] NOT NULL,
	[quantity] [int] NULL,
	[other_info] [varchar](50) NULL,
	[Product_rec_date] [datetime] NOT NULL,
	[AmountOfProdDonated] [varchar](1) NULL,
 CONSTRAINT [donor_product_id_pk] PRIMARY KEY CLUSTERED 
(
	[DonorProductID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO


GO

/****** Object:  Table [dbo].[donation]    Script Date: 8/30/2013 5:57:10 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[donation](
	[Donation_ID] [int] IDENTITY(1,1) NOT NULL,
	[Receipt_ID] [int] NULL,
	[Resource_ID] [int] NOT NULL,
	[Donor_ID] [int] NOT NULL,
	[Date] [datetime] NOT NULL,
	[Quantity] [int] NULL,
	[Agency_ID] [int] NULL,
	[Is_Monetary] [bit] NOT NULL,
	[Is_FEMA] [bit] NOT NULL,
 CONSTRAINT [pk_donation_Donation_ID] PRIMARY KEY CLUSTERED 
(
	[Donation_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO


GO

/****** Object:  Table [dbo].[Donor]    Script Date: 8/30/2013 5:57:26 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[Donor](
	[donor_id] [int] IDENTITY(1,1) NOT NULL,
	[PersonID] [int] NULL,
	[Status] [varchar](30) NULL,
	[DonorType] [char](1) NULL,
	[AgencyID] [int] NULL,
	[Phone] [int] NULL,
 CONSTRAINT [donor_id_pk] PRIMARY KEY CLUSTERED 
(
	[donor_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO


GO

/****** Object:  Table [dbo].[house_choice]    Script Date: 8/30/2013 5:57:54 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[house_choice](
	[house_choice_id] [int] IDENTITY(1,1) NOT NULL,
	[house_id] [int] NOT NULL,
	[address_id] [int] NOT NULL,
	[house_choice_bathrooms] [int] NOT NULL,
	[house_choice_comments] [varchar](30) NULL,
	[house_choice_contact_person_id] [int] NULL,
	[house_choice_laundry] [varchar](15) NOT NULL,
	[house_choice_no_floors] [int] NOT NULL,
	[house_choice_parking] [varchar](15) NOT NULL,
	[house_choice_rent] [money] NOT NULL,
	[house_choice_type] [varchar](30) NOT NULL,
	[house_choice_units_avail] [int] NOT NULL,
 CONSTRAINT [house_choice_id_pk] PRIMARY KEY CLUSTERED 
(
	[house_choice_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO


GO

/****** Object:  Table [dbo].[agency_employees]    Script Date: 8/30/2013 5:58:12 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[agency_employees](
	[agency_empl_id] [int] IDENTITY(1,1) NOT NULL,
	[agency_id] [int] NOT NULL,
	[employee_id] [int] NOT NULL,
 CONSTRAINT [ag_empl_ag_empl_id_pk] PRIMARY KEY CLUSTERED 
(
	[agency_empl_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO


GO

/****** Object:  Table [dbo].[call_center_employee]    Script Date: 8/30/2013 5:58:32 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[call_center_employee](
	[call_center_employee_id] [int] IDENTITY(1,1) NOT NULL,
	[call_center_id] [int] NOT NULL,
	[employee_id] [int] NOT NULL,
 CONSTRAINT [cce_pk] PRIMARY KEY CLUSTERED 
(
	[call_center_employee_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO


GO

/****** Object:  Table [dbo].[employee]    Script Date: 8/30/2013 5:58:56 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[employee](
	[employee_id] [int] NOT NULL,
	[employee_date_hired] [datetime] NOT NULL,
	[employee_department] [varchar](15) NOT NULL,
	[employee_hours_worked] [int] NULL,
	[employee_leadership] [varchar](30) NOT NULL,
	[employee_motivation] [varchar](30) NULL,
	[employee_notes] [text] NULL,
	[employee_overall] [varchar](30) NULL,
	[employee_payrate] [money] NOT NULL,
	[employee_performance] [varchar](30) NULL,
	[employee_quality] [varchar](30) NULL,
	[employee_timeliness] [varchar](30) NULL,
	[username] [varchar](50) NULL,
	[pswd] [varchar](15) NULL,
 CONSTRAINT [employee_id_pk] PRIMARY KEY CLUSTERED 
(
	[employee_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO


GO

/****** Object:  Table [dbo].[person]    Script Date: 8/30/2013 5:59:18 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[person](
	[person_id] [int] IDENTITY(1,1) NOT NULL,
	[Resource_ID] [int] NULL,
	[address_id] [int] NOT NULL,
	[address_id2] [int] NULL,
	[birthdate] [datetime] NULL,
	[certification_number] [varchar](50) NULL,
	[f_name] [varchar](20) NOT NULL,
	[m_initial] [char](1) NULL,
	[l_name] [varchar](20) NOT NULL,
	[gender] [char](1) NULL,
	[person_type] [char](1) NOT NULL,
	[phone_primary] [varchar](11) NULL,
	[phone_secondary] [varchar](11) NULL,
	[email] [varchar](50) NULL,
	[ssn] [int] NULL,
	[Maiden_Name] [varchar](50) NULL,
	[Visa_Issue_Date] [datetime] NULL,
	[Visa_Expire_Date] [datetime] NULL,
	[Visa_Selected_Value_B1] [int] NULL,
	[Visa_Selected_Value_B2] [int] NULL,
	[Visa_Selected_Value_K1] [int] NULL,
	[Visa_Selected_Value_K3] [int] NULL,
	[Visa_Selected_Value_L1] [int] NULL,
	[Visa_Selected_Value_L2] [int] NULL,
	[Visa_Selected_Value_H4] [int] NULL,
	[Visa_Selected_Value_F1] [int] NULL,
	[Visa_Selected_Value_J1] [int] NULL,
	[Visa_Selected_Value_M1] [int] NULL,
	[Visa_Selected_Value_H-1B] [int] NULL,
	[Visa_Selected_Value_H-2B] [int] NULL,
	[Visa_Selected_Value_B-2] [int] NULL,
	[Visa_Selected_Value_Schengen] [int] NULL,
	[Perm_Resident_Alien_Resid_Date] [datetime] NULL,
	[Perm_Resident_Alien_Expire_Date] [datetime] NULL,
	[Perm_Resident_Alien_A_number] [int] NULL,
	[Perm_Resident_Alien_USCIS_number] [int] NULL,
	[Perm_Resident_Alien_Birth_Country] [varchar](50) NULL,
	[Perm_Resident_Alien_Category] [varchar](50) NULL,
	[Driver_State_ID] [varchar](15) NULL,
	[Citizenship] [varchar](3) NULL,
	[Marital_Status] [char](1) NULL,
	[Minor_Children] [int] NULL,
 CONSTRAINT [per_per_id_pk] PRIMARY KEY CLUSTERED 
(
	[person_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO


GO

/****** Object:  Table [dbo].[warehouse_product_Location]    Script Date: 8/30/2013 5:59:40 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING OFF
GO

CREATE TABLE [dbo].[warehouse_product_Location](
	[warehouse_product_location_id] [int] IDENTITY(1,1) NOT NULL,
	[warehouse_id] [int] NOT NULL,
	[product_id] [int] NOT NULL,
	[Location_ID] [int] NULL,
	[service_id] [int] NULL,
	[Time_Date_MIA] [datetime] NULL,
	[Experiation_Date] [datetime] NULL,
	[min_inv] [int] NULL,
	[status] [varchar](1) NOT NULL,
	[Exp_delivery_date] [datetime] NULL,
	[qty_onhand] [int] NOT NULL,
	[qty_commit] [int] NOT NULL,
	[qty_order] [int] NOT NULL,
	[encounter_id] [int] NULL,
 CONSTRAINT [warehouse_product_pk] PRIMARY KEY CLUSTERED 
(
	[warehouse_product_location_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO


GO

/****** Object:  Table [dbo].[food]    Script Date: 8/30/2013 6:00:04 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[food](
	[food_voucher_id] [int] NOT NULL,
	[clients_served] [int] NOT NULL,
	[food_voucher_number] [int] NOT NULL,
	[date_issued] [datetime] NOT NULL,
	[Product_id] [int] NOT NULL,
 CONSTRAINT [food_food_voucher_id_pk] PRIMARY KEY CLUSTERED 
(
	[food_voucher_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO


GO

/****** Object:  Table [dbo].[lot]    Script Date: 8/30/2013 6:00:29 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[lot](
	[lot_id] [int] IDENTITY(1,1) NOT NULL,
	[product_id] [int] NOT NULL,
	[manufactured_date] [datetime] NULL,
	[expiration_date] [datetime] NULL,
	[manufacture_name] [varchar](50) NULL,
 CONSTRAINT [lot_id_pk] PRIMARY KEY CLUSTERED 
(
	[lot_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO


GO

/****** Object:  Table [dbo].[tier_req]    Script Date: 8/30/2013 6:00:49 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[tier_req](
	[tier_req_id] [int] IDENTITY(1,1) NOT NULL,
	[req_id] [int] NOT NULL,
	[tier_id] [int] NOT NULL,
 CONSTRAINT [tier_req_pk] PRIMARY KEY CLUSTERED 
(
	[tier_req_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO


GO

/****** Object:  Table [dbo].[tier]    Script Date: 8/30/2013 6:01:02 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[tier](
	[tier_id] [int] IDENTITY(1,1) NOT NULL,
	[include_req] [char](1) NOT NULL,
	[campaign_id] [int] NOT NULL,
	[Tier_Age_Begin_Month] [int] NULL,
	[Tier_Age_Begin_Year] [int] NULL,
	[Tier_Age_End_Month] [int] NULL,
	[Tier_Age_End_Year] [int] NULL,
 CONSTRAINT [tier_pk] PRIMARY KEY CLUSTERED 
(
	[tier_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO


GO

/****** Object:  Table [dbo].[campaign]    Script Date: 8/30/2013 6:01:23 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[campaign](
	[campaign_id] [int] IDENTITY(1,1) NOT NULL,
	[campaign_name] [varchar](50) NULL,
	[campaign_start_date] [datetime] NULL,
	[campaign_end_date] [datetime] NULL,
	[medicine_id] [int] NOT NULL,
 CONSTRAINT [campaign_campaign_id_pk] PRIMARY KEY CLUSTERED 
(
	[campaign_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO


GO

/****** Object:  Table [dbo].[vaccine]    Script Date: 8/30/2013 6:01:43 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[vaccine](
	[vaccine_id] [int] IDENTITY(1,1) NOT NULL,
	[medicine_id] [int] NOT NULL,
	[Num_of_reg_doses] [int] NULL,
	[vaccine_name] [varchar](50) NOT NULL,
 CONSTRAINT [vaccine_vaccine_id_pk] PRIMARY KEY CLUSTERED 
(
	[vaccine_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO


GO

/****** Object:  Table [dbo].[medicine]    Script Date: 8/30/2013 6:02:06 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[medicine](
	[Medicine_Id] [int] IDENTITY(1,1) NOT NULL,
	[Medication_type] [varchar](30) NOT NULL,
	[Medication_name] [varchar](50) NOT NULL,
	[Clients_Served] [int] NULL,
 CONSTRAINT [Medicine_id_pk] PRIMARY KEY CLUSTERED 
(
	[Medicine_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO


GO

/****** Object:  Table [dbo].[vendor_products]    Script Date: 8/30/2013 6:02:23 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING OFF
GO

CREATE TABLE [dbo].[vendor_products](
	[vendor_prod_id] [int] IDENTITY(1,1) NOT NULL,
	[vendor_id] [int] NOT NULL,
	[product_id] [int] NOT NULL,
	[product_qty] [int] NOT NULL,
	[Product_exp_date] [char](1) NULL,
	[lot_id] [int] NULL,
	[Department] [varchar](100) NULL,
 CONSTRAINT [vndr_prds_vndrprodid_pk] PRIMARY KEY CLUSTERED 
(
	[vendor_prod_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO


GO

/****** Object:  Table [dbo].[Vendor_Products_shipments]    Script Date: 8/30/2013 6:02:56 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[Vendor_Products_shipments](
	[PO_Order_no] [int] IDENTITY(1,1) NOT NULL,
	[ShipmentID] [int] NOT NULL,
	[VendorID] [int] NOT NULL,
	[ProductID] [int] NOT NULL,
	[Expect_Delivery_Date] [datetime] NULL,
	[orderdate] [datetime] NULL,
	[quantity] [int] NOT NULL,
	[OtherInfo] [varchar](100) NULL,
	[DateReceived] [datetime] NULL,
	[AmountReceived] [int] NULL,
 CONSTRAINT [PO_Order_no_pk] PRIMARY KEY CLUSTERED 
(
	[PO_Order_no] ASC,
	[ProductID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO


GO

/****** Object:  Table [dbo].[Shipment]    Script Date: 8/30/2013 6:04:30 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[Shipment](
	[ShipmentID] [int] IDENTITY(1,1) NOT NULL,
	[WarehouseID] [int] NOT NULL,
	[Tracking_Num] [varchar](128) NOT NULL,
	[Ship_Method] [varchar](30) NOT NULL,
	[Other] [text] NULL,
	[OrderRecByID] [int] NULL,
	[FullOrderReceived] [char](1) NULL,
 CONSTRAINT [ShipmentID_pk] PRIMARY KEY CLUSTERED 
(
	[ShipmentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO


GO

/****** Object:  Table [dbo].[warehouse]    Script Date: 8/30/2013 6:04:50 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[warehouse](
	[warehouse_id] [int] IDENTITY(1,1) NOT NULL,
	[warehouse_name] [varchar](50) NOT NULL,
	[address_id] [int] NOT NULL,
	[warehouse_type] [int] NOT NULL,
 CONSTRAINT [warehouse_pk] PRIMARY KEY CLUSTERED 
(
	[warehouse_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO


GO

/****** Object:  Table [dbo].[products]    Script Date: 8/30/2013 6:05:14 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[products](
	[product_id] [int] IDENTITY(1,1) NOT NULL,
	[Resource_ID] [int] NULL,
	[product_name] [varchar](50) NOT NULL,
	[product_type] [varchar](50) NOT NULL,
	[product_qty] [int] NOT NULL,
	[product_desc] [text] NOT NULL,
	[product_color] [varchar](10) NULL,
	[product_size] [varchar](50) NULL,
	[product_cost] [money] NULL,
	[Product_exp_date] [char](1) NULL,
	[Product_Alergy_info] [varchar](50) NULL,
	[Product_refrigde] [char](1) NULL,
	[Product_Flammable] [char](1) NULL,
	[Product_Hazard] [char](1) NULL,
	[Product_Other] [varchar](1) NULL,
	[Product_Min_Inv] [int] NULL,
	[Product_Barcode] [char](1) NULL,
	[FEMA_ID] [int] NULL,
	[Product_subtype] [varchar](50) NULL,
	[Make] [varchar](50) NULL,
	[Model] [varchar](50) NULL,
	[FEMA_Description] [varchar](2000) NULL,
	[Year] [varchar](20) NULL,
	[RFID] [varchar](20) NULL,
	[GPS] [decimal](2, 2) NULL,
	[Serial_Number] [varchar](20) NULL,
	[Height] [varchar](20) NULL,
	[Length] [varchar](20) NULL,
	[Depth] [varchar](20) NULL,
	[Weight] [varchar](20) NULL,
	[OAI] [varchar](20) NULL,
	[OAI_Type] [varchar](20) NULL,
	[Use] [varchar](50) NULL,
	[Brand] [varchar](50) NULL,
	[Power_Supply] [varchar](20) NULL,
	[Gas_Type] [varchar](20) NULL,
	[Needs_Gas] [bit] NULL,
	[Needs_Electricity] [bit] NULL,
	[Availability] [varchar](1) NULL,
	[Datetime] [datetime] NULL,
	[OpenStatus] [varchar](1) NULL,
 CONSTRAINT [products_product_id_pk] PRIMARY KEY CLUSTERED 
(
	[product_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO


GO

/****** Object:  Table [dbo].[services]    Script Date: 8/30/2013 6:05:38 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[services](
	[service_id] [int] IDENTITY(1,1) NOT NULL,
	[Company] [varchar](15) NOT NULL,
	[service_type] [char](1) NOT NULL,
	[Estimated_Time] [date] NOT NULL,
	[Email] [varchar](1) NULL,
	[Phone_Number] [int] NOT NULL,
	[Full_Cost] [int] NULL,
	[Estimated_Cost] [int] NOT NULL,
 CONSTRAINT [service_service_id_pk] PRIMARY KEY CLUSTERED 
(
	[service_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO


GO

/****** Object:  Table [dbo].[resource]    Script Date: 8/30/2013 6:06:02 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[resource](
	[Resource_ID] [int] IDENTITY(1,1) NOT NULL,
	[Location_ID] [int] NULL,
	[Resource_Type] [varchar](150) NOT NULL,
	[Date_Requested] [datetime] NULL,
 CONSTRAINT [pk_resource_Resource_ID] PRIMARY KEY CLUSTERED 
(
	[Resource_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO


GO

/****** Object:  Table [dbo].[FEMA]    Script Date: 8/30/2013 6:03:23 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[FEMA](
	[FEMA_ID] [int] IDENTITY(1,1) NOT NULL,
	[Cost_Code] [int] NOT NULL,
	[Equipment] [varchar](50) NOT NULL,
	[Specification] [varchar](50) NOT NULL,
	[Capacity_Size] [varchar](50) NOT NULL,
	[HP] [varchar](50) NOT NULL,
	[Notes] [varchar](100) NOT NULL,
	[Unit] [varchar](50) NOT NULL,
	[Rate] [varchar](50) NOT NULL,
 CONSTRAINT [pk_FEMA_FEMA_ID] PRIMARY KEY CLUSTERED 
(
	[FEMA_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO


/****************/


GO

/****** Object:  Table [dbo].[Pet_Vaccine]    Script Date: 8/30/2013 6:06:46 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Pet_Vaccine](
	[Pet_Vaccine_ID] [int] IDENTITY(1,1) NOT NULL,
	[Last_Vaccine_Given] [datetime] NULL,
	[Pet_Record_ID] [int] NOT NULL,
	[Datetime] [datetime] NULL,
	[Vaccine_Type_ID] [int] NOT NULL,
 CONSTRAINT [Pet_vaccine_id_pk] PRIMARY KEY CLUSTERED 
(
	[Pet_Vaccine_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO


GO

/****** Object:  Table [dbo].[Pet]    Script Date: 8/30/2013 6:07:10 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[Pet](
	[Pet_Record_ID] [int] IDENTITY(1,1) NOT NULL,
	[Pet_Medical_ID] [int] NULL,
	[Pet_Deceased_ID] [int] NULL,
	[Pet_Name] [varchar](50) NOT NULL,
	[Pet_Age] [int] NULL,
	[Pet_RFID] [int] NULL,
	[Date_Modified] [datetime] NOT NULL,
	[Date_Created] [datetime] NOT NULL,
	[Pet_Description] [varchar](50) NOT NULL,
	[Pet_Type_ID] [int] NULL,
	[Pet_Gender] [char](1) NOT NULL,
	[Pet_Color] [varchar](50) NOT NULL,
	[Pet_Vet_ID] [varchar](50) NULL,
	[Pet_License_Tag] [varchar](50) NULL,
	[Pet_Tatoo_No] [varchar](50) NULL,
	[Pet_Spay_Neuter] [char](1) NULL,
	[Pet_Missing_ID] [int] NULL,
	[Pet_Weight] [int] NULL,
	[Pet_Vaccine_ID] [int] NULL,
	[Picture] [varbinary](max) NULL,
 CONSTRAINT [Peta_Pet_Record_id_pk] PRIMARY KEY CLUSTERED 
(
	[Pet_Record_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO


GO

/****** Object:  Table [dbo].[Pet_Deceased]    Script Date: 8/30/2013 6:07:35 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[Pet_Deceased](
	[Pet_Deceased_ID] [int] IDENTITY(1,1) NOT NULL,
	[Pet_Name] [varchar](50) NOT NULL,
	[Date_Deceased] [datetime] NOT NULL,
	[Funeral] [varchar](50) NULL,
	[Cemetary_Name] [varchar](50) NULL,
	[Deceased_Type] [varchar](50) NOT NULL,
	[Date_Created] [datetime] NULL,
	[Date_Modified] [datetime] NULL,
 CONSTRAINT [Pet_Deceased_id_pk] PRIMARY KEY CLUSTERED 
(
	[Pet_Deceased_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO


GO

/****** Object:  Table [dbo].[Pet_Missing]    Script Date: 8/30/2013 6:07:46 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[Pet_Missing](
	[Pet_Missing_ID] [int] IDENTITY(1,1) NOT NULL,
	[Date_Missing] [datetime] NULL,
	[Date_Reported] [datetime] NULL,
	[Collar_Description] [varchar](50) NULL,
	[Time_Lost] [datetime] NULL,
	[Lost_Explanation] [varchar](50) NULL,
	[Length_Owned] [int] NULL,
	[Reward_Amt] [money] NULL,
	[Pet_Height] [int] NULL,
	[Breeder] [varchar](50) NULL,
	[Pet_Sold] [varchar](50) NULL,
	[Bill_Of_Sale] [varchar](50) NULL,
	[Date_Created] [datetime] NULL,
	[Date_Modified] [datetime] NULL,
 CONSTRAINT [Pet_missing_id_pk] PRIMARY KEY CLUSTERED 
(
	[Pet_Missing_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO


GO

/****** Object:  Table [dbo].[Pet_type]    Script Date: 8/30/2013 6:07:58 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING OFF
GO

CREATE TABLE [dbo].[Pet_type](
	[Pet_Type_ID] [int] IDENTITY(1,1) NOT NULL,
	[Pet_Species] [varchar](50) NULL,
	[Pet_Type] [varchar](50) NULL,
	[Pet_Breed] [varchar](50) NULL,
 CONSTRAINT [Pet_Type_id_pk] PRIMARY KEY CLUSTERED 
(
	[Pet_Type_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO


GO

/****** Object:  Table [dbo].[location]    Script Date: 8/30/2013 6:08:10 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[location](
	[Location_ID] [int] IDENTITY(1,1) NOT NULL,
	[type] [varchar](30) NOT NULL,
	[city] [varchar](30) NOT NULL,
	[state] [varchar](2) NOT NULL,
	[zip] [int] NOT NULL,
	[county] [varchar](15) NULL,
	[location_desc] [varchar](3000) NULL,
	[n_long] [decimal](18, 12) NULL,
	[s_long] [decimal](18, 12) NULL,
	[e_long] [decimal](18, 12) NULL,
	[w_long] [decimal](18, 12) NULL,
	[n_lat] [decimal](18, 12) NULL,
	[s_lat] [decimal](18, 12) NULL,
	[e_lat] [decimal](18, 12) NULL,
	[w_lat] [decimal](18, 12) NULL,
 CONSTRAINT [Location_ID_pk] PRIMARY KEY CLUSTERED 
(
	[Location_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

ALTER TABLE [dbo].[location] ADD  CONSTRAINT [DF_tblocation_Longitude]  DEFAULT ((0)) FOR [n_long]
GO

ALTER TABLE [dbo].[location] ADD  CONSTRAINT [DF_tblLocation_Latitude]  DEFAULT ((0)) FOR [n_lat]
GO






/**************FK'S***********************//**************FK'S***********************/
/**************FK'S***********************//**************FK'S***********************/
/**************FK'S***********************//**************FK'S***********************/
/**************FK'S***********************//**************FK'S***********************/
/**************FK'S***********************//**************FK'S***********************/



ALTER TABLE [dbo].[disaster_encounter]  WITH CHECK ADD  CONSTRAINT [dis_addr_id_fk] FOREIGN KEY([address_id])
REFERENCES [dbo].[address] ([address_id])
GO

ALTER TABLE [dbo].[disaster_encounter] CHECK CONSTRAINT [dis_addr_id_fk]
GO

ALTER TABLE [dbo].[disaster_encounter]  WITH CHECK ADD  CONSTRAINT [dis_dis_id_fk] FOREIGN KEY([disaster_id])
REFERENCES [dbo].[disaster] ([disaster_id])
GO

ALTER TABLE [dbo].[disaster_encounter] CHECK CONSTRAINT [dis_dis_id_fk]
GO

ALTER TABLE [dbo].[disaster_encounter]  WITH CHECK ADD  CONSTRAINT [dis_enc_id_fk] FOREIGN KEY([encounter_id])
REFERENCES [dbo].[encounter] ([encounter_id])
GO

ALTER TABLE [dbo].[disaster_encounter] CHECK CONSTRAINT [dis_enc_id_fk]
GO

ALTER TABLE [dbo].[encounter_client_vaccine]  WITH CHECK ADD  CONSTRAINT [encntr_clnt_vac_encounter_id_fk] FOREIGN KEY([encounter_id])
REFERENCES [dbo].[encounter] ([encounter_id])
GO

ALTER TABLE [dbo].[encounter_client_vaccine] CHECK CONSTRAINT [encntr_clnt_vac_encounter_id_fk]
GO

ALTER TABLE [dbo].[encounter_client_vaccine]  WITH CHECK ADD  CONSTRAINT [encntr_clnt_vac_vaccine_id_fk] FOREIGN KEY([vaccine_id])
REFERENCES [dbo].[vaccine] ([vaccine_id])
GO

ALTER TABLE [dbo].[encounter_client_vaccine] CHECK CONSTRAINT [encntr_clnt_vac_vaccine_id_fk]
GO
ALTER TABLE [dbo].[encounter_services]  WITH CHECK ADD  CONSTRAINT [enctr_serv_encounter_id_fk] FOREIGN KEY([encounter_id])
REFERENCES [dbo].[encounter] ([encounter_id])
GO

ALTER TABLE [dbo].[encounter_services] CHECK CONSTRAINT [enctr_serv_encounter_id_fk]
GO

ALTER TABLE [dbo].[encounter_services]  WITH CHECK ADD  CONSTRAINT [enctr_serv_mobile_unit_id_fk] FOREIGN KEY([mobile_unit_id])
REFERENCES [dbo].[mobile_unit] ([mobile_unit_id])
GO

ALTER TABLE [dbo].[encounter_services] CHECK CONSTRAINT [enctr_serv_mobile_unit_id_fk]
GO

ALTER TABLE [dbo].[encounter_services]  WITH CHECK ADD  CONSTRAINT [enctr_serv_service_id_fk] FOREIGN KEY([service_id])
REFERENCES [dbo].[services] ([service_id])
GO

ALTER TABLE [dbo].[encounter_services] CHECK CONSTRAINT [enctr_serv_service_id_fk]
GO


ALTER TABLE [dbo].[Order_Product]  WITH CHECK ADD  CONSTRAINT [order_product_Order_id_fk] FOREIGN KEY([orderID])
REFERENCES [dbo].[requestor_Order] ([OrderID])
GO

ALTER TABLE [dbo].[Order_Product] CHECK CONSTRAINT [order_product_Order_id_fk]
GO

ALTER TABLE [dbo].[Order_Product]  WITH CHECK ADD  CONSTRAINT [order_product_product_id_fk] FOREIGN KEY([ProductID])
REFERENCES [dbo].[products] ([product_id])
GO

ALTER TABLE [dbo].[Order_Product] CHECK CONSTRAINT [order_product_product_id_fk]
GO

ALTER TABLE [dbo].[Order_Product]  WITH CHECK ADD  CONSTRAINT [order_product_warehouse_id_fk] FOREIGN KEY([warehouseid])
REFERENCES [dbo].[warehouse] ([warehouse_id])
GO

ALTER TABLE [dbo].[Order_Product] CHECK CONSTRAINT [order_product_warehouse_id_fk]
GO


ALTER TABLE [dbo].[requestor_Order]  WITH CHECK ADD  CONSTRAINT [order_add_id_fk] FOREIGN KEY([ShipToAddressID])
REFERENCES [dbo].[address] ([address_id])
GO

ALTER TABLE [dbo].[requestor_Order] CHECK CONSTRAINT [order_add_id_fk]
GO

ALTER TABLE [dbo].[requestor_Order]  WITH CHECK ADD  CONSTRAINT [order_Encounter_id_fk] FOREIGN KEY([EncounterID])
REFERENCES [dbo].[encounter] ([encounter_id])
GO

ALTER TABLE [dbo].[requestor_Order] CHECK CONSTRAINT [order_Encounter_id_fk]
GO

ALTER TABLE [dbo].[requestor_Order]  WITH CHECK ADD  CONSTRAINT [order_requestor_id_fk] FOREIGN KEY([Requestor_ID])
REFERENCES [dbo].[requestor] ([RequestorID])
GO

ALTER TABLE [dbo].[requestor_Order] CHECK CONSTRAINT [order_requestor_id_fk]
GO

ALTER TABLE [dbo].[requestor]  WITH CHECK ADD  CONSTRAINT [requestor_agency_id_fk] FOREIGN KEY([AgencyID])
REFERENCES [dbo].[agency] ([agency_id])
GO

ALTER TABLE [dbo].[requestor] CHECK CONSTRAINT [requestor_agency_id_fk]
GO

ALTER TABLE [dbo].[requestor]  WITH CHECK ADD  CONSTRAINT [requestor_Encounter_id_fk] FOREIGN KEY([EncounterID])
REFERENCES [dbo].[encounter] ([encounter_id])
GO

ALTER TABLE [dbo].[requestor] CHECK CONSTRAINT [requestor_Encounter_id_fk]
GO

ALTER TABLE [dbo].[requestor]  WITH CHECK ADD  CONSTRAINT [requestor_mobile_unit_id_fk] FOREIGN KEY([MobilUnitID])
REFERENCES [dbo].[mobile_unit] ([mobile_unit_id])
GO

ALTER TABLE [dbo].[requestor] CHECK CONSTRAINT [requestor_mobile_unit_id_fk]
GO

ALTER TABLE [dbo].[requestor]  WITH CHECK ADD  CONSTRAINT [requestor_person_id_fk] FOREIGN KEY([PersonID])
REFERENCES [dbo].[person] ([person_id])
GO

ALTER TABLE [dbo].[requestor] CHECK CONSTRAINT [requestor_person_id_fk]
GO



ALTER TABLE [dbo].[encounter]  WITH CHECK ADD  CONSTRAINT [enctr_agency_id_fk] FOREIGN KEY([agency_id])
REFERENCES [dbo].[agency] ([agency_id])
GO

ALTER TABLE [dbo].[encounter] CHECK CONSTRAINT [enctr_agency_id_fk]
GO

ALTER TABLE [dbo].[encounter]  WITH CHECK ADD  CONSTRAINT [enctr_call_center_id_fk] FOREIGN KEY([call_center_id])
REFERENCES [dbo].[call_center] ([call_center_id])
GO

ALTER TABLE [dbo].[encounter] CHECK CONSTRAINT [enctr_call_center_id_fk]
GO

ALTER TABLE [dbo].[encounter]  WITH CHECK ADD  CONSTRAINT [enctr_case_id_fk] FOREIGN KEY([case_id])
REFERENCES [dbo].[case_intake] ([case_id])
GO

ALTER TABLE [dbo].[encounter] CHECK CONSTRAINT [enctr_case_id_fk]
GO

ALTER TABLE [dbo].[encounter]  WITH CHECK ADD  CONSTRAINT [enctr_client_id_fk] FOREIGN KEY([client_id])
REFERENCES [dbo].[client] ([client_id])
GO

ALTER TABLE [dbo].[encounter] CHECK CONSTRAINT [enctr_client_id_fk]
GO

ALTER TABLE [dbo].[encounter]  WITH CHECK ADD  CONSTRAINT [enctr_disaster_ID_fk] FOREIGN KEY([disaster_id])
REFERENCES [dbo].[disaster] ([disaster_id])
GO

ALTER TABLE [dbo].[encounter] CHECK CONSTRAINT [enctr_disaster_ID_fk]
GO

ALTER TABLE [dbo].[encounter]  WITH CHECK ADD  CONSTRAINT [enctr_Location_ID_fk] FOREIGN KEY([Location_ID])
REFERENCES [dbo].[location] ([Location_ID])
GO

ALTER TABLE [dbo].[encounter] CHECK CONSTRAINT [enctr_Location_ID_fk]
GO

ALTER TABLE [dbo].[encounter]  WITH CHECK ADD  CONSTRAINT [enctr_Pet_Record_ID_fk] FOREIGN KEY([Pet_Record_ID])
REFERENCES [dbo].[Pet] ([Pet_Record_ID])
GO

ALTER TABLE [dbo].[encounter] CHECK CONSTRAINT [enctr_Pet_Record_ID_fk]
GO

ALTER TABLE [dbo].[case_client]  WITH CHECK ADD  CONSTRAINT [case_address_id_fk] FOREIGN KEY([address_id])
REFERENCES [dbo].[address] ([address_id])
GO

ALTER TABLE [dbo].[case_client] CHECK CONSTRAINT [case_address_id_fk]
GO

ALTER TABLE [dbo].[case_client]  WITH CHECK ADD  CONSTRAINT [case_case_id_fk] FOREIGN KEY([case_id])
REFERENCES [dbo].[case_intake] ([case_id])
GO

ALTER TABLE [dbo].[case_client] CHECK CONSTRAINT [case_case_id_fk]
GO

ALTER TABLE [dbo].[case_client]  WITH CHECK ADD  CONSTRAINT [case_client_id_fk] FOREIGN KEY([client_id])
REFERENCES [dbo].[client] ([client_id])
GO

ALTER TABLE [dbo].[case_client] CHECK CONSTRAINT [case_client_id_fk]
GO

ALTER TABLE [dbo].[case_client]  WITH CHECK ADD  CONSTRAINT [case_prev_address_id_fk] FOREIGN KEY([prev_address_id])
REFERENCES [dbo].[address] ([address_id])
GO

ALTER TABLE [dbo].[case_client] CHECK CONSTRAINT [case_prev_address_id_fk]
GO

ALTER TABLE [dbo].[case_client]  WITH CHECK ADD  CONSTRAINT [FK_case_client_case_client] FOREIGN KEY([case_id], [client_id])
REFERENCES [dbo].[case_client] ([case_id], [client_id])
GO

ALTER TABLE [dbo].[case_client] CHECK CONSTRAINT [FK_case_client_case_client]
GO

ALTER TABLE [dbo].[ClientWPets]  WITH CHECK ADD  CONSTRAINT [ClientWPets_Location_ID_FK] FOREIGN KEY([Location_ID])
REFERENCES [dbo].[location] ([Location_ID])
GO

ALTER TABLE [dbo].[ClientWPets] CHECK CONSTRAINT [ClientWPets_Location_ID_FK]
GO

ALTER TABLE [dbo].[ClientWPets]  WITH CHECK ADD  CONSTRAINT [FK_ClientWPets_client] FOREIGN KEY([Client_id])
REFERENCES [dbo].[client] ([client_id])
GO

ALTER TABLE [dbo].[ClientWPets] CHECK CONSTRAINT [FK_ClientWPets_client]
GO

ALTER TABLE [dbo].[ClientWPets]  WITH CHECK ADD  CONSTRAINT [FK_ClientWPets_Pets] FOREIGN KEY([Pet_Record_ID])
REFERENCES [dbo].[Pet] ([Pet_Record_ID])
GO

ALTER TABLE [dbo].[ClientWPets] CHECK CONSTRAINT [FK_ClientWPets_Pets]
GO

ALTER TABLE [dbo].[debt]  WITH CHECK ADD  CONSTRAINT [debt_case_id_fk] FOREIGN KEY([case_id])
REFERENCES [dbo].[case_intake] ([case_id])
GO

ALTER TABLE [dbo].[debt] CHECK CONSTRAINT [debt_case_id_fk]
GO

ALTER TABLE [dbo].[debt]  WITH CHECK ADD  CONSTRAINT [debt_client_id_fk] FOREIGN KEY([client_id])
REFERENCES [dbo].[client] ([client_id])
GO

ALTER TABLE [dbo].[debt] CHECK CONSTRAINT [debt_client_id_fk]
GO

ALTER TABLE [dbo].[medical_assistance]  WITH CHECK ADD  CONSTRAINT [med_ass_doc_id_fk] FOREIGN KEY([medical_assist_doctor_id])
REFERENCES [dbo].[person] ([person_id])
GO

ALTER TABLE [dbo].[medical_assistance] CHECK CONSTRAINT [med_ass_doc_id_fk]
GO

ALTER TABLE [dbo].[medical_assistance]  WITH CHECK ADD  CONSTRAINT [med_ass_em_id_fk] FOREIGN KEY([em_id])
REFERENCES [dbo].[emergency_medical] ([em_id])
GO

ALTER TABLE [dbo].[medical_assistance] CHECK CONSTRAINT [med_ass_em_id_fk]
GO

ALTER TABLE [dbo].[emergency_medical]  WITH CHECK ADD  CONSTRAINT [emer_med_client_id_fk] FOREIGN KEY([client_id])
REFERENCES [dbo].[client] ([client_id])
GO

ALTER TABLE [dbo].[emergency_medical] CHECK CONSTRAINT [emer_med_client_id_fk]
GO

ALTER TABLE [dbo].[emergency_medical]  WITH CHECK ADD  CONSTRAINT [emer_med_deceased_id_fk] FOREIGN KEY([deceased_id])
REFERENCES [dbo].[deceased] ([deceased_id])
GO

ALTER TABLE [dbo].[emergency_medical] CHECK CONSTRAINT [emer_med_deceased_id_fk]
GO

ALTER TABLE [dbo].[emergency_medical]  WITH CHECK ADD  CONSTRAINT [emer_med_doctor_id_fk] FOREIGN KEY([doctor_id])
REFERENCES [dbo].[person] ([person_id])
GO

ALTER TABLE [dbo].[emergency_medical] CHECK CONSTRAINT [emer_med_doctor_id_fk]
GO

ALTER TABLE [dbo].[emergency_medical]  WITH CHECK ADD  CONSTRAINT [emer_med_driver_id_fk] FOREIGN KEY([driver_id])
REFERENCES [dbo].[person] ([person_id])
GO

ALTER TABLE [dbo].[emergency_medical] CHECK CONSTRAINT [emer_med_driver_id_fk]
GO

ALTER TABLE [dbo].[employee_clients]  WITH CHECK ADD  CONSTRAINT [empl_cli_cli_id_fk] FOREIGN KEY([client_id])
REFERENCES [dbo].[client] ([client_id])
GO

ALTER TABLE [dbo].[employee_clients] CHECK CONSTRAINT [empl_cli_cli_id_fk]
GO

ALTER TABLE [dbo].[employee_clients]  WITH CHECK ADD  CONSTRAINT [empl_cli_empl_id_fk] FOREIGN KEY([employee_id])
REFERENCES [dbo].[employee] ([employee_id])
GO

ALTER TABLE [dbo].[employee_clients] CHECK CONSTRAINT [empl_cli_empl_id_fk]
GO

ALTER TABLE [dbo].[employer]  WITH CHECK ADD  CONSTRAINT [employer_address_id_fk] FOREIGN KEY([address_id])
REFERENCES [dbo].[address] ([address_id])
GO

ALTER TABLE [dbo].[employer] CHECK CONSTRAINT [employer_address_id_fk]
GO

ALTER TABLE [dbo].[employer]  WITH CHECK ADD  CONSTRAINT [employer_case_id_fk] FOREIGN KEY([case_id])
REFERENCES [dbo].[case_intake] ([case_id])
GO

ALTER TABLE [dbo].[employer] CHECK CONSTRAINT [employer_case_id_fk]
GO

ALTER TABLE [dbo].[employer]  WITH CHECK ADD  CONSTRAINT [employer_client_id_fk] FOREIGN KEY([client_id])
REFERENCES [dbo].[client] ([client_id])
GO

ALTER TABLE [dbo].[employer] CHECK CONSTRAINT [employer_client_id_fk]
GO

ALTER TABLE [dbo].[expense]  WITH CHECK ADD  CONSTRAINT [expense_case_id_fk] FOREIGN KEY([case_id])
REFERENCES [dbo].[case_intake] ([case_id])
GO

ALTER TABLE [dbo].[expense] CHECK CONSTRAINT [expense_case_id_fk]
GO

ALTER TABLE [dbo].[expense]  WITH CHECK ADD  CONSTRAINT [expense_client_id_fk] FOREIGN KEY([client_id])
REFERENCES [dbo].[client] ([client_id])
GO

ALTER TABLE [dbo].[expense] CHECK CONSTRAINT [expense_client_id_fk]
GO

ALTER TABLE [dbo].[income_source]  WITH CHECK ADD  CONSTRAINT [incomesource_case_id_fk] FOREIGN KEY([case_id])
REFERENCES [dbo].[case_intake] ([case_id])
GO

ALTER TABLE [dbo].[income_source] CHECK CONSTRAINT [incomesource_case_id_fk]
GO

ALTER TABLE [dbo].[income_source]  WITH CHECK ADD  CONSTRAINT [incomesource_client_id_fk] FOREIGN KEY([client_id])
REFERENCES [dbo].[client] ([client_id])
GO

ALTER TABLE [dbo].[income_source] CHECK CONSTRAINT [incomesource_client_id_fk]
GO

ALTER TABLE [dbo].[military]  WITH CHECK ADD  CONSTRAINT [mil_case_id_fk] FOREIGN KEY([case_id])
REFERENCES [dbo].[case_intake] ([case_id])
GO

ALTER TABLE [dbo].[military] CHECK CONSTRAINT [mil_case_id_fk]
GO

ALTER TABLE [dbo].[military]  WITH CHECK ADD  CONSTRAINT [mil_client_id_fk] FOREIGN KEY([client_id])
REFERENCES [dbo].[client] ([client_id])
GO

ALTER TABLE [dbo].[military] CHECK CONSTRAINT [mil_client_id_fk]
GO

ALTER TABLE [dbo].[property]  WITH CHECK ADD  CONSTRAINT [property_address_id_fk] FOREIGN KEY([address_id])
REFERENCES [dbo].[address] ([address_id])
GO

ALTER TABLE [dbo].[property] CHECK CONSTRAINT [property_address_id_fk]
GO

ALTER TABLE [dbo].[property]  WITH CHECK ADD  CONSTRAINT [property_case_id_fk] FOREIGN KEY([case_id])
REFERENCES [dbo].[case_intake] ([case_id])
GO

ALTER TABLE [dbo].[property] CHECK CONSTRAINT [property_case_id_fk]
GO

ALTER TABLE [dbo].[property]  WITH CHECK ADD  CONSTRAINT [property_client_id_fk] FOREIGN KEY([client_id])
REFERENCES [dbo].[client] ([client_id])
GO

ALTER TABLE [dbo].[property] CHECK CONSTRAINT [property_client_id_fk]
GO

ALTER TABLE [dbo].[relative]  WITH CHECK ADD  CONSTRAINT [relative_address_id_fk] FOREIGN KEY([address_id])
REFERENCES [dbo].[address] ([address_id])
GO

ALTER TABLE [dbo].[relative] CHECK CONSTRAINT [relative_address_id_fk]
GO

ALTER TABLE [dbo].[relative]  WITH CHECK ADD  CONSTRAINT [relative_case_id_fk] FOREIGN KEY([case_id])
REFERENCES [dbo].[case_intake] ([case_id])
GO

ALTER TABLE [dbo].[relative] CHECK CONSTRAINT [relative_case_id_fk]
GO

ALTER TABLE [dbo].[relative]  WITH CHECK ADD  CONSTRAINT [relative_client_id_fk] FOREIGN KEY([client_id])
REFERENCES [dbo].[client] ([client_id])
GO

ALTER TABLE [dbo].[relative] CHECK CONSTRAINT [relative_client_id_fk]
GO

ALTER TABLE [dbo].[transportation]  WITH CHECK ADD  CONSTRAINT [FK_transportation_vehicle] FOREIGN KEY([Vehicle_id])
REFERENCES [dbo].[vehicle] ([vehicle_id])
GO

ALTER TABLE [dbo].[transportation] CHECK CONSTRAINT [FK_transportation_vehicle]
GO

ALTER TABLE [dbo].[mobile_employees]  WITH CHECK ADD  CONSTRAINT [mei_employee_fk] FOREIGN KEY([employee_id])
REFERENCES [dbo].[employee] ([employee_id])
GO

ALTER TABLE [dbo].[mobile_employees] CHECK CONSTRAINT [mei_employee_fk]
GO

ALTER TABLE [dbo].[mobile_employees]  WITH CHECK ADD  CONSTRAINT [mei_unit_fk] FOREIGN KEY([mobile_unit_id])
REFERENCES [dbo].[mobile_unit] ([mobile_unit_id])
GO

ALTER TABLE [dbo].[mobile_employees] CHECK CONSTRAINT [mei_unit_fk]
GO

ALTER TABLE [dbo].[Mobile_Product]  WITH CHECK ADD  CONSTRAINT [FK_Mobile_Product_case_intake] FOREIGN KEY([Case_id])
REFERENCES [dbo].[case_intake] ([case_id])
GO

ALTER TABLE [dbo].[Mobile_Product] CHECK CONSTRAINT [FK_Mobile_Product_case_intake]
GO

ALTER TABLE [dbo].[Mobile_Product]  WITH CHECK ADD  CONSTRAINT [FK_Mobile_Product_lot] FOREIGN KEY([Lot_id])
REFERENCES [dbo].[lot] ([lot_id])
GO

ALTER TABLE [dbo].[Mobile_Product] CHECK CONSTRAINT [FK_Mobile_Product_lot]
GO

ALTER TABLE [dbo].[Mobile_Product]  WITH CHECK ADD  CONSTRAINT [FK_Mobile_Product_mobile_unit] FOREIGN KEY([Mobile_Unit_id])
REFERENCES [dbo].[mobile_unit] ([mobile_unit_id])
GO

ALTER TABLE [dbo].[Mobile_Product] CHECK CONSTRAINT [FK_Mobile_Product_mobile_unit]
GO

ALTER TABLE [dbo].[Mobile_Product]  WITH CHECK ADD  CONSTRAINT [FK_Mobile_Product_products] FOREIGN KEY([Product_id])
REFERENCES [dbo].[products] ([product_id])
GO

ALTER TABLE [dbo].[Mobile_Product] CHECK CONSTRAINT [FK_Mobile_Product_products]
GO

ALTER TABLE [dbo].[mobile_unit]  WITH CHECK ADD  CONSTRAINT [mobile_unit_call_center_id_fk] FOREIGN KEY([call_center_id])
REFERENCES [dbo].[call_center] ([call_center_id])
GO

ALTER TABLE [dbo].[mobile_unit] CHECK CONSTRAINT [mobile_unit_call_center_id_fk]
GO

ALTER TABLE [dbo].[mobile_unit]  WITH CHECK ADD  CONSTRAINT [mobile_unit_mobile_v_id_fk] FOREIGN KEY([vehicle_id])
REFERENCES [dbo].[vehicle] ([vehicle_id])
GO

ALTER TABLE [dbo].[mobile_unit] CHECK CONSTRAINT [mobile_unit_mobile_v_id_fk]
GO

ALTER TABLE [dbo].[vehicle]  WITH CHECK ADD  CONSTRAINT [vcl_case_id_fk] FOREIGN KEY([case_id])
REFERENCES [dbo].[case_intake] ([case_id])
GO

ALTER TABLE [dbo].[vehicle] CHECK CONSTRAINT [vcl_case_id_fk]
GO

ALTER TABLE [dbo].[vehicle]  WITH CHECK ADD  CONSTRAINT [vcl_client_id_fk] FOREIGN KEY([client_id])
REFERENCES [dbo].[client] ([client_id])
GO

ALTER TABLE [dbo].[vehicle] CHECK CONSTRAINT [vcl_client_id_fk]
GO

ALTER TABLE [dbo].[client]  WITH CHECK ADD  CONSTRAINT [client_person_id_fk] FOREIGN KEY([client_id])
REFERENCES [dbo].[person] ([person_id])
GO

ALTER TABLE [dbo].[client] CHECK CONSTRAINT [client_person_id_fk]
GO

ALTER TABLE [dbo].[deceased]  WITH CHECK ADD  CONSTRAINT [deceased_coroner_id_fk] FOREIGN KEY([coroner_id])
REFERENCES [dbo].[person] ([person_id])
GO

ALTER TABLE [dbo].[deceased] CHECK CONSTRAINT [deceased_coroner_id_fk]
GO

ALTER TABLE [dbo].[Donor_Product]  WITH CHECK ADD  CONSTRAINT [donprod_donor_fk] FOREIGN KEY([DonorID])
REFERENCES [dbo].[Donor] ([donor_id])
GO

ALTER TABLE [dbo].[Donor_Product] CHECK CONSTRAINT [donprod_donor_fk]
GO

ALTER TABLE [dbo].[Donor_Product]  WITH CHECK ADD  CONSTRAINT [donprod_prod_fk] FOREIGN KEY([ProductID])
REFERENCES [dbo].[products] ([product_id])
GO

ALTER TABLE [dbo].[Donor_Product] CHECK CONSTRAINT [donprod_prod_fk]
GO

ALTER TABLE [dbo].[donation]  WITH CHECK ADD  CONSTRAINT [fk_donation_Donor_ID] FOREIGN KEY([Donor_ID])
REFERENCES [dbo].[Donor] ([donor_id])
GO

ALTER TABLE [dbo].[donation] CHECK CONSTRAINT [fk_donation_Donor_ID]
GO

ALTER TABLE [dbo].[donation]  WITH CHECK ADD  CONSTRAINT [fk_donation_Receipt_ID] FOREIGN KEY([Receipt_ID])
REFERENCES [dbo].[receipt] ([Receipt_ID])
GO

ALTER TABLE [dbo].[donation] CHECK CONSTRAINT [fk_donation_Receipt_ID]
GO

ALTER TABLE [dbo].[donation]  WITH CHECK ADD  CONSTRAINT [fk_donation_Resource_ID] FOREIGN KEY([Resource_ID])
REFERENCES [dbo].[resource] ([Resource_ID])
GO

ALTER TABLE [dbo].[donation] CHECK CONSTRAINT [fk_donation_Resource_ID]
GO

ALTER TABLE [dbo].[Donor]  WITH CHECK ADD  CONSTRAINT [agency_personid_fk] FOREIGN KEY([AgencyID])
REFERENCES [dbo].[agency] ([agency_id])
GO

ALTER TABLE [dbo].[Donor] CHECK CONSTRAINT [agency_personid_fk]
GO

ALTER TABLE [dbo].[Donor]  WITH CHECK ADD  CONSTRAINT [Donor_personid_fk] FOREIGN KEY([PersonID])
REFERENCES [dbo].[person] ([person_id])
GO

ALTER TABLE [dbo].[Donor] CHECK CONSTRAINT [Donor_personid_fk]
GO

ALTER TABLE [dbo].[house_choice]  WITH CHECK ADD  CONSTRAINT [house_c_id_fk] FOREIGN KEY([house_id])
REFERENCES [dbo].[house] ([house_id])
GO

ALTER TABLE [dbo].[house_choice] CHECK CONSTRAINT [house_c_id_fk]
GO

ALTER TABLE [dbo].[house_choice]  WITH CHECK ADD  CONSTRAINT [house_choice_address_id_fk] FOREIGN KEY([address_id])
REFERENCES [dbo].[address] ([address_id])
GO

ALTER TABLE [dbo].[house_choice] CHECK CONSTRAINT [house_choice_address_id_fk]
GO

ALTER TABLE [dbo].[house_choice]  WITH CHECK ADD  CONSTRAINT [house_choice_con_per_id_fk] FOREIGN KEY([house_choice_contact_person_id])
REFERENCES [dbo].[person] ([person_id])
GO

ALTER TABLE [dbo].[house_choice] CHECK CONSTRAINT [house_choice_con_per_id_fk]
GO

ALTER TABLE [dbo].[agency_employees]  WITH CHECK ADD  CONSTRAINT [ag_empl_ag_id_fk] FOREIGN KEY([agency_id])
REFERENCES [dbo].[agency] ([agency_id])
GO

ALTER TABLE [dbo].[agency_employees] CHECK CONSTRAINT [ag_empl_ag_id_fk]
GO

ALTER TABLE [dbo].[agency_employees]  WITH CHECK ADD  CONSTRAINT [ag_empl_empl_id_fk] FOREIGN KEY([employee_id])
REFERENCES [dbo].[employee] ([employee_id])
GO

ALTER TABLE [dbo].[agency_employees] CHECK CONSTRAINT [ag_empl_empl_id_fk]
GO

ALTER TABLE [dbo].[call_center_employee]  WITH CHECK ADD  CONSTRAINT [cce_call_center_fk] FOREIGN KEY([call_center_id])
REFERENCES [dbo].[call_center] ([call_center_id])
GO

ALTER TABLE [dbo].[call_center_employee] CHECK CONSTRAINT [cce_call_center_fk]
GO

ALTER TABLE [dbo].[call_center_employee]  WITH CHECK ADD  CONSTRAINT [cce_employee_fk] FOREIGN KEY([employee_id])
REFERENCES [dbo].[employee] ([employee_id])
GO

ALTER TABLE [dbo].[call_center_employee] CHECK CONSTRAINT [cce_employee_fk]
GO

ALTER TABLE [dbo].[employee]  WITH CHECK ADD  CONSTRAINT [employee_id_fk] FOREIGN KEY([employee_id])
REFERENCES [dbo].[person] ([person_id])
GO

ALTER TABLE [dbo].[employee] CHECK CONSTRAINT [employee_id_fk]
GO

ALTER TABLE [dbo].[person]  WITH CHECK ADD  CONSTRAINT [fk_person_Resource_ID] FOREIGN KEY([Resource_ID])
REFERENCES [dbo].[resource] ([Resource_ID])
GO

ALTER TABLE [dbo].[person] CHECK CONSTRAINT [fk_person_Resource_ID]
GO

ALTER TABLE [dbo].[person]  WITH CHECK ADD  CONSTRAINT [person_address_id_fk] FOREIGN KEY([address_id])
REFERENCES [dbo].[address] ([address_id])
GO

ALTER TABLE [dbo].[person] CHECK CONSTRAINT [person_address_id_fk]
GO

ALTER TABLE [dbo].[person]  WITH CHECK ADD  CONSTRAINT [person_address_id2_fk] FOREIGN KEY([address_id2])
REFERENCES [dbo].[address] ([address_id])
GO

ALTER TABLE [dbo].[person] CHECK CONSTRAINT [person_address_id2_fk]
GO

ALTER TABLE [dbo].[warehouse_product_Location]  WITH CHECK ADD  CONSTRAINT [w_p_Encounter_id_fk] FOREIGN KEY([encounter_id])
REFERENCES [dbo].[encounter] ([encounter_id])
GO

ALTER TABLE [dbo].[warehouse_product_Location] CHECK CONSTRAINT [w_p_Encounter_id_fk]
GO

ALTER TABLE [dbo].[warehouse_product_Location]  WITH CHECK ADD  CONSTRAINT [w_p_Location_id_fk] FOREIGN KEY([Location_ID])
REFERENCES [dbo].[location] ([Location_ID])
GO

ALTER TABLE [dbo].[warehouse_product_Location] CHECK CONSTRAINT [w_p_Location_id_fk]
GO

ALTER TABLE [dbo].[warehouse_product_Location]  WITH CHECK ADD  CONSTRAINT [w_p_product_id_fk] FOREIGN KEY([product_id])
REFERENCES [dbo].[products] ([product_id])
GO

ALTER TABLE [dbo].[warehouse_product_Location] CHECK CONSTRAINT [w_p_product_id_fk]
GO

ALTER TABLE [dbo].[warehouse_product_Location]  WITH CHECK ADD  CONSTRAINT [w_p_service_id_fk] FOREIGN KEY([service_id])
REFERENCES [dbo].[services] ([service_id])
GO

ALTER TABLE [dbo].[warehouse_product_Location] CHECK CONSTRAINT [w_p_service_id_fk]
GO

ALTER TABLE [dbo].[warehouse_product_Location]  WITH CHECK ADD  CONSTRAINT [w_p_warehouse_id_fk] FOREIGN KEY([warehouse_id])
REFERENCES [dbo].[warehouse] ([warehouse_id])
GO

ALTER TABLE [dbo].[warehouse_product_Location] CHECK CONSTRAINT [w_p_warehouse_id_fk]
GO

ALTER TABLE [dbo].[food]  WITH CHECK ADD  CONSTRAINT [Food_Product_id_fk] FOREIGN KEY([Product_id])
REFERENCES [dbo].[products] ([product_id])
GO

ALTER TABLE [dbo].[food] CHECK CONSTRAINT [Food_Product_id_fk]
GO

ALTER TABLE [dbo].[lot]  WITH CHECK ADD  CONSTRAINT [product_id_fk] FOREIGN KEY([product_id])
REFERENCES [dbo].[products] ([product_id])
GO

ALTER TABLE [dbo].[lot] CHECK CONSTRAINT [product_id_fk]
GO

ALTER TABLE [dbo].[tier_req]  WITH CHECK ADD  CONSTRAINT [t_req_id_fk] FOREIGN KEY([req_id])
REFERENCES [dbo].[requirements] ([req_id])
GO

ALTER TABLE [dbo].[tier_req] CHECK CONSTRAINT [t_req_id_fk]
GO

ALTER TABLE [dbo].[tier_req]  WITH CHECK ADD  CONSTRAINT [tier_id_fk] FOREIGN KEY([tier_id])
REFERENCES [dbo].[tier] ([tier_id])
GO

ALTER TABLE [dbo].[tier_req] CHECK CONSTRAINT [tier_id_fk]
GO

ALTER TABLE [dbo].[tier]  WITH CHECK ADD  CONSTRAINT [tier_campaign_id] FOREIGN KEY([campaign_id])
REFERENCES [dbo].[campaign] ([campaign_id])
GO

ALTER TABLE [dbo].[tier] CHECK CONSTRAINT [tier_campaign_id]
GO

ALTER TABLE [dbo].[campaign]  WITH CHECK ADD  CONSTRAINT [campaign_vaccine_id_fk] FOREIGN KEY([medicine_id])
REFERENCES [dbo].[medicine] ([Medicine_Id])
GO

ALTER TABLE [dbo].[campaign] CHECK CONSTRAINT [campaign_vaccine_id_fk]
GO


ALTER TABLE [dbo].[vaccine]  WITH CHECK ADD  CONSTRAINT [vaccine_medicine_id_fk] FOREIGN KEY([medicine_id])
REFERENCES [dbo].[medicine] ([Medicine_Id])
GO

ALTER TABLE [dbo].[vaccine] CHECK CONSTRAINT [vaccine_medicine_id_fk]
GO

ALTER TABLE [dbo].[medicine]  WITH CHECK ADD  CONSTRAINT [fk_medicine_Medicine_Id] FOREIGN KEY([Medicine_Id])
REFERENCES [dbo].[products] ([product_id])
GO

ALTER TABLE [dbo].[medicine] CHECK CONSTRAINT [fk_medicine_Medicine_Id]
GO

ALTER TABLE [dbo].[vendor_products]  WITH CHECK ADD  CONSTRAINT [vndr_prds_prodid_fk] FOREIGN KEY([product_id])
REFERENCES [dbo].[products] ([product_id])
GO

ALTER TABLE [dbo].[vendor_products] CHECK CONSTRAINT [vndr_prds_prodid_fk]
GO

ALTER TABLE [dbo].[vendor_products]  WITH CHECK ADD  CONSTRAINT [vndr_prds_vndrid_fk] FOREIGN KEY([vendor_id])
REFERENCES [dbo].[vendor] ([vendor_id])
GO

ALTER TABLE [dbo].[vendor_products] CHECK CONSTRAINT [vndr_prds_vndrid_fk]
GO

ALTER TABLE [dbo].[Vendor_Products_shipments]  WITH CHECK ADD  CONSTRAINT [vndr_prds_ship_prodid_fk] FOREIGN KEY([ProductID])
REFERENCES [dbo].[products] ([product_id])
GO

ALTER TABLE [dbo].[Vendor_Products_shipments] CHECK CONSTRAINT [vndr_prds_ship_prodid_fk]
GO

ALTER TABLE [dbo].[Vendor_Products_shipments]  WITH CHECK ADD  CONSTRAINT [vndr_prds_ship_shipmntsid_fk] FOREIGN KEY([ShipmentID])
REFERENCES [dbo].[Shipment] ([ShipmentID])
GO

ALTER TABLE [dbo].[Vendor_Products_shipments] CHECK CONSTRAINT [vndr_prds_ship_shipmntsid_fk]
GO

ALTER TABLE [dbo].[Vendor_Products_shipments]  WITH CHECK ADD  CONSTRAINT [vndr_prds_ship_vndrid_fk] FOREIGN KEY([VendorID])
REFERENCES [dbo].[vendor] ([vendor_id])
GO

ALTER TABLE [dbo].[Vendor_Products_shipments] CHECK CONSTRAINT [vndr_prds_ship_vndrid_fk]
GO


ALTER TABLE [dbo].[Shipment]  WITH CHECK ADD  CONSTRAINT [shipment_warehouse_id_fk] FOREIGN KEY([WarehouseID])
REFERENCES [dbo].[warehouse] ([warehouse_id])
GO

ALTER TABLE [dbo].[Shipment] CHECK CONSTRAINT [shipment_warehouse_id_fk]
GO

ALTER TABLE [dbo].[warehouse]  WITH CHECK ADD  CONSTRAINT [warehouse_address_id_fk] FOREIGN KEY([address_id])
REFERENCES [dbo].[address] ([address_id])
GO

ALTER TABLE [dbo].[warehouse] CHECK CONSTRAINT [warehouse_address_id_fk]
GO

ALTER TABLE [dbo].[products]  WITH CHECK ADD  CONSTRAINT [fk_products_FEMA_ID] FOREIGN KEY([FEMA_ID])
REFERENCES [dbo].[FEMA] ([FEMA_ID])
GO

ALTER TABLE [dbo].[products] CHECK CONSTRAINT [fk_products_FEMA_ID]
GO

ALTER TABLE [dbo].[products]  WITH CHECK ADD  CONSTRAINT [fk_products_Resource_ID] FOREIGN KEY([Resource_ID])
REFERENCES [dbo].[resource] ([Resource_ID])
GO

ALTER TABLE [dbo].[products] CHECK CONSTRAINT [fk_products_Resource_ID]
GO

ALTER TABLE [dbo].[services]  WITH CHECK ADD  CONSTRAINT [fk_services_service_id] FOREIGN KEY([service_id])
REFERENCES [dbo].[resource] ([Resource_ID])
GO

ALTER TABLE [dbo].[services] CHECK CONSTRAINT [fk_services_service_id]
GO

ALTER TABLE [dbo].[resource]  WITH CHECK ADD  CONSTRAINT [fk_recource_Location_ID] FOREIGN KEY([Location_ID])
REFERENCES [dbo].[location] ([Location_ID])
GO

ALTER TABLE [dbo].[resource] CHECK CONSTRAINT [fk_recource_Location_ID]
GO

ALTER TABLE [dbo].[Pet_Vaccine]  WITH CHECK ADD  CONSTRAINT [Pets_pet_record_id_fk] FOREIGN KEY([Pet_Record_ID])
REFERENCES [dbo].[Pet] ([Pet_Record_ID])
GO

ALTER TABLE [dbo].[Pet_Vaccine] CHECK CONSTRAINT [Pets_pet_record_id_fk]
GO

ALTER TABLE [dbo].[Pet_Vaccine]  WITH CHECK ADD  CONSTRAINT [Pets_vaccine_type_id_fk] FOREIGN KEY([Vaccine_Type_ID])
REFERENCES [dbo].[Pvaccine] ([Vaccine_Type_ID])
GO

ALTER TABLE [dbo].[Pet_Vaccine] CHECK CONSTRAINT [Pets_vaccine_type_id_fk]
GO

ALTER TABLE [dbo].[Pet]  WITH CHECK ADD  CONSTRAINT [Pets_pet_missing_id_fk] FOREIGN KEY([Pet_Missing_ID])
REFERENCES [dbo].[Pet_Missing] ([Pet_Missing_ID])
GO

ALTER TABLE [dbo].[Pet] CHECK CONSTRAINT [Pets_pet_missing_id_fk]
GO

ALTER TABLE [dbo].[Pet]  WITH CHECK ADD  CONSTRAINT [Pets_Pet_Type_id_fk] FOREIGN KEY([Pet_Type_ID])
REFERENCES [dbo].[Pet_type] ([Pet_Type_ID])
GO

ALTER TABLE [dbo].[Pet] CHECK CONSTRAINT [Pets_Pet_Type_id_fk]
GO

ALTER TABLE [dbo].[Pet]  WITH CHECK ADD  CONSTRAINT [Pets_pets_deceased_id_fk] FOREIGN KEY([Pet_Deceased_ID])
REFERENCES [dbo].[Pet_Deceased] ([Pet_Deceased_ID])
GO

ALTER TABLE [dbo].[Pet] CHECK CONSTRAINT [Pets_pets_deceased_id_fk]
GO





/*************STORED PROCEDURES**************************//*************STORED PROCEDURES**************************/
/*************STORED PROCEDURES**************************//*************STORED PROCEDURES**************************/
/*************STORED PROCEDURES**************************//*************STORED PROCEDURES**************************/
/*************STORED PROCEDURES**************************//*************STORED PROCEDURES**************************/

GO

/****** Object:  StoredProcedure [dbo].[SP_DMCS_Location_Person]    Script Date: 11/11/2013 5:23:28 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO




CREATE PROCEDURE [dbo].[SP_DMCS_Location_Person]
    (
        @dmlLat decimal(18, 12),
        @dmlLng decimal(18, 12),
        @intRadius int
    )
    As
 
SET NOCOUNT ON
 
DECLARE @intMilesModifier int
SET @intMilesModifier = 3959  -- If using kilometers, use 6371 instead of 3959
 
-- Select locations that are near the parameters based on distance formula on a sphere
SELECT        
 


dbo.resource.Resource_ID,  
dbo.person.person_id, 
dbo.employee.employee_id,


dbo.person.address_id as homeAddress1_ID, 
dbo.person.address_id2 as homeAddress2_ID, 
dbo.person.birthdate, 
dbo.person.certification_number, 
dbo.person.f_name, 
dbo.person.m_initial, 
dbo.person.l_name, 
dbo.person.gender, 
dbo.person.person_type,
dbo.person.phone_primary, 
dbo.person.phone_secondary, 
dbo.person.email, 


dbo.employee.employee_department, 
dbo.employee.employee_leadership,
dbo.employee.employee_motivation, 
dbo.employee.employee_notes, 
dbo.employee.employee_overall, 
dbo.employee.employee_payrate,
dbo.employee.employee_performance, 
dbo.employee.employee_quality, 
dbo.employee.employee_timeliness, 

dbo.agency.agency_name,
 
dbo.address.address_id, 
dbo.address.address_type_id, 
dbo.address.city, 
dbo.address.country, 
dbo.address.County_Township, 
dbo.address.longitude, 
dbo.address.latitude, 
dbo.address.state, 
dbo.address.str_add, 
dbo.address.str_add2, 
dbo.address.zip_plus_four,
 
 
	  (@intMilesModifier*acos(cos(radians(@dmlLat))*cos(radians(latitude))*cos(radians(longitude)-
       radians(@dmlLng))+sin(radians(@dmlLat))*sin(radians(latitude)))) AS distance

FROM            dbo.resource,dbo.person, dbo.employee, dbo.agency_employees, dbo.agency, dbo.address
WHERE			dbo.resource.Resource_ID = dbo.person.Resource_ID
                AND dbo.person.person_id = dbo.employee.employee_id
				AND dbo.agency_employees.employee_id = dbo.employee.employee_id
				AND dbo.agency.agency_id = dbo.agency_employees.agency_id
				AND dbo.agency.address_id = dbo.address.address_id
	and (@intMilesModifier*acos(cos(radians(@dmlLat))*cos(radians(latitude))*cos(radians(longitude)-
       radians(@dmlLng))+sin(radians(@dmlLat))*sin(radians(latitude)))) < @intRadius
 
-- Return XML for formatting results
FOR XML RAW('marker'),ROOT('markers')
 
SET NOCOUNT OFF





GO




GO

/****** Object:  StoredProcedure [dbo].[SP_DMCS_Location_Pet]    Script Date: 11/11/2013 5:24:20 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



CREATE PROCEDURE [dbo].[SP_DMCS_Location_Pet]
    (
        @dmlLat decimal(18, 12),
        @dmlLng decimal(18, 12),
        @intRadius int
    )
    As
 
SET NOCOUNT ON
 
DECLARE @intMilesModifier int
SET @intMilesModifier = 3959  -- If using kilometers, use 6371 instead of 3959
 
-- Select locations that are near the parameters based on distance formula on a sphere
SELECT        

dbo.person.person_id, 
dbo.person.f_name, 
dbo.person.m_initial, 
dbo.person.l_name, 
dbo.person.phone_primary, 
dbo.person.phone_secondary, 
dbo.person.email, 
dbo.person.address_id, 
dbo.address.address_id, 
dbo.address.city, 
dbo.address.country, 
dbo.address.state, 
dbo.address.zip_plus_four, 
dbo.address.str_add, 
dbo.client.client_id, 
dbo.ClientWPets.Client_id, 
dbo.ClientWPets.Location_ID, 
dbo.ClientWPets.Pet_Record_ID, 
dbo.Pet.Pet_Record_ID, 
dbo.Pet.Pet_Name, 
dbo.Pet.Pet_Age, 
dbo.Pet.Pet_Color, 
dbo.Pet.Picture, 
dbo.Pet_type.Pet_Species, 
dbo.Pet_type.Pet_Type, 
dbo.Pet_type.Pet_Breed, 
dbo.Pet_type.Pet_Type_ID, 
dbo.Pet.Pet_Type_ID,
dbo.location.n_long, 
dbo.location.n_lat, 
dbo.location.type, 
dbo.location.city, 
dbo.location.state, 
dbo.location.zip, 
dbo.location.county, 
dbo.location.location_desc, 
dbo.location.Location_ID



      
	  (@intMilesModifier*acos(cos(radians(@dmlLat))*cos(radians(n_lat))*cos(radians(n_long)-
       radians(@dmlLng))+sin(radians(@dmlLat))*sin(radians(n_lat)))) AS distance

FROM  dbo.person, dbo.client, dbo.ClientWPets, dbo.location, dbo.Pet, dbo.address, dbo.Pet_type
WHERE	  dbo.Pet.Pet_Record_ID = dbo.ClientWPets.Pet_Record_ID AND
          dbo.ClientWPets.Client_id = dbo.client.client_id AND
          dbo.client.client_id = dbo.person.person_id AND
          dbo.ClientWPets.Location_ID = dbo.location.Location_ID AND
          dbo.Pet.Pet_Type_ID = dbo.Pet_type.Pet_Type_ID AND
          dbo.person.address_id = dbo.address.address_id AND 
		  dbo.person.address_id2 = dbo.address.address_id

		and (@intMilesModifier*acos(cos(radians(@dmlLat))*cos(radians(n_lat))*cos(radians(n_long)-
       radians(@dmlLng))+sin(radians(@dmlLat))*sin(radians(n_lat)))) < @intRadius
 ORDER BY distance
-- Return XML for formatting results
FOR XML RAW('marker'),ROOT('markers')
 
SET NOCOUNT OFF


GO




GO

/****** Object:  StoredProcedure [dbo].[SP_DMCS_Location_Warehouse]    Script Date: 11/11/2013 5:24:49 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO




Create PROCEDURE [dbo].[SP_DMCS_Location_Warehouse]
    (
        @dmlLat decimal(18, 12),
        @dmlLng decimal(18, 12),
        @intRadius int
    )
    As
 
SET NOCOUNT ON
 
DECLARE @intMilesModifier int
SET @intMilesModifier = 3959  -- If using kilometers, use 6371 instead of 3959
 
-- Select locations that are near the parameters based on distance formula on a sphere
SELECT        

warehouse_id,
warehouse_name,
address.latitude,
address.longitude,



      
	  (@intMilesModifier*acos(cos(radians(@dmlLat))*cos(radians(address.latitude))*cos(radians(address.longitude)-
       radians(@dmlLng))+sin(radians(@dmlLat))*sin(radians(address.latitude)))) AS distance

FROM  warehouse, address
WHERE	 warehouse.address_id = address.address_id

		and (@intMilesModifier*acos(cos(radians(@dmlLat))*cos(radians(address.latitude))*cos(radians(address.longitude)-
       radians(@dmlLng))+sin(radians(@dmlLat))*sin(radians(address.latitude)))) < @intRadius
 ORDER BY distance



GO



GO

/****** Object:  StoredProcedure [dbo].[SP_DMCS_Location_Warehouse_XML]    Script Date: 11/11/2013 5:25:13 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



Create PROCEDURE [dbo].[SP_DMCS_Location_Warehouse_XML]
    (
        @dmlLat decimal(18, 12),
        @dmlLng decimal(18, 12),
        @intRadius int
    )
    As
 
SET NOCOUNT ON
 
DECLARE @intMilesModifier int
SET @intMilesModifier = 3959  -- If using kilometers, use 6371 instead of 3959
 
-- Select locations that are near the parameters based on distance formula on a sphere
SELECT        

warehouse_id,
warehouse_name,
address.latitude,
address.longitude,



      
	  (@intMilesModifier*acos(cos(radians(@dmlLat))*cos(radians(address.latitude))*cos(radians(address.longitude)-
       radians(@dmlLng))+sin(radians(@dmlLat))*sin(radians(address.latitude)))) AS distance

FROM  warehouse, address
WHERE	 warehouse.address_id = address.address_id

		and (@intMilesModifier*acos(cos(radians(@dmlLat))*cos(radians(address.latitude))*cos(radians(address.longitude)-
       radians(@dmlLng))+sin(radians(@dmlLat))*sin(radians(address.latitude)))) < @intRadius
 ORDER BY distance

-- Return XML for formatting results
FOR XML RAW('marker'),ROOT('markers')
 
SET NOCOUNT OFF



GO


GO

/****** Object:  StoredProcedure [dbo].[SP_DMCS_Location_Warehouse2]    Script Date: 11/11/2013 5:25:35 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO










CREATE PROCEDURE [dbo].[SP_DMCS_Location_Warehouse2]
    (
        @dmlLat decimal(18, 12),
        @dmlLng decimal(18, 12),
        @intRadius int
    )
    As
 
SET NOCOUNT ON
 
DECLARE @intMilesModifier int
SET @intMilesModifier = 3959  -- If using kilometers, use 6371 instead of 3959
 
-- Select locations that are near the parameters based on distance formula on a sphere
SELECT        
warehouse.warehouse_id,
warehouse.warehouse_name,
warehouse.warehouse_type,
warehouse.address_id,

address.address_type_id,
address.city,
address.country,
address.latitude,
address.longitude,
address.state,
address.str_add,
address.str_add2,
address.zip_plus_four,


      
	  (@intMilesModifier*acos(cos(radians(@dmlLat))*cos(radians(latitude))*cos(radians(longitude)-
       radians(@dmlLng))+sin(radians(@dmlLat))*sin(radians(latitude)))) AS distance

FROM   dbo.warehouse, dbo.address
WHERE	warehouse.address_id = address.address_id

	and (@intMilesModifier*acos(cos(radians(@dmlLat))*cos(radians(latitude))*cos(radians(longitude)-
       radians(@dmlLng))+sin(radians(@dmlLat))*sin(radians(latitude)))) < @intRadius
 
-- Return XML for formatting results
FOR XML RAW('marker'),ROOT('markers')
 
SET NOCOUNT OFF












GO




GO

/****** Object:  StoredProcedure [dbo].[SP_DMCS_Delete_Encounter]    Script Date: 8/30/2013 6:21:02 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Edward Sobanski
-- Create date: 4/21/2012
-- Description:Delete Encounter record
-- =============================================
ALTER PROCEDURE [dbo].[SP_DMCS_Delete_Encounter]
	@encounter_id integer = 0
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	Delete dbo.encounter
	where encounter_id = @encounter_id
	 
	
END

GO


GO

/****** Object:  StoredProcedure [dbo].[SP_DMCS_get_EncounterID]    Script Date: 8/30/2013 6:21:20 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Edward Sobanski
-- Create date: 6/2/2012
-- Description:	Select Row on Encounter table
-- =============================================
ALTER PROCEDURE [dbo].[SP_DMCS_get_EncounterID]
	-- Add the parameters for the stored procedure here

      @case_id as int,
      @agency_id as int,
      @call_center_id as int,
      @client_id as int,
      @create_date as datetime,
      @close_date as datetime,
	  @disaster_id as int,
	  @Location_ID as int,
	  @Pet_Record_ID as int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
   SELECT [encounter_id] 
     FROM [disaster_mngt_test].[dbo].[encounter] 
    where [create_date] = @create_date
      and [close_date] = @close_date
      and ([case_id] = @case_id or [case_id] is null) 
      and ([agency_id] = @agency_id or [agency_id] is null) 
      and ([call_center_id] = @call_center_id or [call_center_id] is null)
      and ([client_id] = @client_id or [client_id] is null)
	  and ([Location_ID] = @Location_ID or [Location_ID] is null)
	  and ([Pet_Record_ID] = @Pet_Record_ID or [Pet_Record_ID] is null)
End

GO


GO

/****** Object:  StoredProcedure [dbo].[SP_DMCS_Insert_Encounter]    Script Date: 8/30/2013 6:21:30 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Edward Sobanski
-- Create date: 5/22/2012
-- Description:	Insert Row on Encounter table
-- =============================================
ALTER PROCEDURE [dbo].[SP_DMCS_Insert_Encounter]
	-- Add the parameters for the stored procedure here
      @case_id as int,
      @agency_id as int,
      @call_center_id as int,
      @client_id  as int,
      @create_date as datetime,
      @close_date as datetime,
	  @disaster_id as int,
	  @Location_ID as int,
	  @Pet_Record_ID as int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
if @case_id = 0
begin
   set @case_id = null
end

if @client_id = 0
begin
   set @client_id = null
end

if @agency_id = 0
begin
   set @agency_id = null
end

if @call_center_id = 0
begin
   set @call_center_id = null
end

if @Location_ID = 0
begin
   set @Location_ID = null
end

if @Pet_Record_ID = 0
begin
   set @Pet_Record_ID = null
end


    -- Insert statements for procedure here
INSERT INTO [disaster_mngt_test].[dbo].[encounter]
           ([case_id]
           ,[agency_id]
           ,[call_center_id]
           ,[client_id]
           ,[create_date]
           ,[close_date]
		   ,[disaster_id]
		   ,[Location_ID]
	       ,[Pet_Record_ID])
     VALUES
           (@case_id, 
            @agency_id,
            @call_center_id,
            @client_id, 
            @create_date,
            @close_date,
			@disaster_id,
			@Location_ID,
			@Pet_Record_ID)
           
End

GO


GO

/****** Object:  StoredProcedure [dbo].[SP_DMCS_Select_Encounter_WC]    Script Date: 8/30/2013 6:21:49 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Edward Sobanski
-- Create date: 5/22/2012
-- Description:	Select Row on Encounter table
-- =============================================
ALTER PROCEDURE [dbo].[SP_DMCS_Select_Encounter_WC]
	-- Add the parameters for the stored procedure here

           @wareclause as char(100)
AS
BEGIN
							    
    Declare @string as varchar(300)
	Set @string = 'Select * from Encounter where ' + @wareclause
	Exec(@string)
           
End

GO


GO

/****** Object:  StoredProcedure [dbo].[SP_DMCS_Select_Encounter]    Script Date: 8/30/2013 6:21:57 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Edward Sobanski
-- Create date: 5/22/2012
-- Description:	Select Row on Encounter table
-- =============================================
ALTER PROCEDURE [dbo].[SP_DMCS_Select_Encounter]
	-- Add the parameters for the stored procedure here

           @encounter_id as int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
SELECT [encounter_id]
      ,[case_id]
      ,[agency_id]
      ,[call_center_id]
      ,[client_id]
      ,[create_date]
      ,[close_date]
	  ,[disaster_id]
	  ,[Location_ID]
	  ,[Pet_Record_ID]
  FROM [disaster_mngt_test].[dbo].[encounter]
where encounter_id = @encounter_id
End

GO


GO

/****** Object:  StoredProcedure [dbo].[SP_DMCS_Update_Encounter]    Script Date: 8/30/2013 6:22:18 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Edward Sobanski
-- Create date: 5/22/2012
-- Description:	Update Row on Encounter table
-- =============================================
ALTER PROCEDURE [dbo].[SP_DMCS_Update_Encounter]
	-- Add the parameters for the stored procedure here

      @encounter_id as int,
      @case_id as int,
      @agency_id as int,
      @call_center_id as int,
      @client_id  as int,
      @create_date as datetime,
      @close_date as datetime,
	  @disaster_id as int,
	  @Location_ID as int,
	  @Pet_Record_ID as int

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
IF @case_id = 0
BEGIN
  SET @case_id = NULL
END
   
   IF @client_id = 0
BEGIN
  SET @client_id = NULL
END
   
   IF @agency_id = 0
BEGIN
  SET @agency_id = NULL
END
   
   IF @call_center_id = 0
BEGIN
  SET @call_center_id = NULL
END

   IF @Location_ID = 0
BEGIN
  SET @Location_ID = NULL
END

   IF @Pet_Record_ID = 0
BEGIN
  SET @Pet_Record_ID = NULL
END
   
   	SET NOCOUNT ON;

    -- Insert statements for procedure here
UPDATE [disaster_mngt_test].[dbo].[encounter]
   SET [case_id] = @case_id,
       [agency_id] = @agency_id,
       [call_center_id] = @call_center_id,
       [client_id] = @client_id, 
       [create_date] = @create_date,
       [close_date] = @close_date,
	   [disaster_id] = @disaster_id,
	   [Location_ID] = @Location_ID,
	   [Pet_Record_ID] = @Pet_Record_ID 
where encounter_id = @encounter_id
End

GO


GO

/****** Object:  StoredProcedure [dbo].[SP_DMCS_Delete_ClientWPets]    Script Date: 8/30/2013 6:24:03 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Jianwang Xing
-- Create date: 4/22/2013
-- Description:	Delete clientWPets record
-- =============================================
ALTER PROCEDURE [dbo].[SP_DMCS_Delete_ClientWPets]
	@clientwpets_id integer = 0
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	Delete dbo.ClientWPets
    WHERE clientwpets_id = @clientwpets_id
	
END

GO


GO

/****** Object:  StoredProcedure [dbo].[SP_DMCS_GET_ClientWPets_ID]    Script Date: 8/30/2013 6:24:22 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO




-- =============================================
-- Author:		Jianwang Xing
-- Create date: 3/29/2013
-- Description:	select Row from pet table
-- =============================================
CREATE PROCEDURE [dbo].[SP_DMCS_GET_ClientWPets_ID]
	-- Add the parameters for the stored procedure here

AS
BEGIN

          
    SELECT max([CLIENTWPETS_ID])
      FROM [disaster_mngt_test].[dbo].[ClientWPets] 

     
      
END




GO


GO

/****** Object:  StoredProcedure [dbo].[SP_DMCS_Insert_ClientWPets]    Script Date: 8/30/2013 6:24:53 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO




-- =============================================
-- Author:		Jianwang Xing
-- Create date: 4/22/2013
-- Description:	Insert Row to client pet table
-- =============================================
ALTER PROCEDURE [dbo].[SP_DMCS_Insert_ClientWPets]
	-- Add the parameters for the stored procedure here
      @Pet_Record_ID as int, 
      @Client_id as int,
	  @Location_ID as int,
	  @cp_Date as date,
	  @ownership as char
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	Insert INTO [disaster_mngt_test].[dbo].[ClientWPets]
           ([Pet_Record_ID]  
           ,[client_id]
		   ,[Location_ID]
		   ,[cp_Date]
		   ,[ownership])
	   
     VALUES (@Pet_Record_ID,
		   @client_id,
		   @Location_ID,
		   @cp_Date,
		   @ownership)
END




GO


GO

/****** Object:  StoredProcedure [dbo].[SP_DMCS_Select_ClientWPets]    Script Date: 8/30/2013 6:25:16 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO





-- =============================================
-- Author:		Jianwang Xing
-- Create date: 4/22/2013
-- Description:	select Row from ClientWPets table
-- =============================================
ALTER PROCEDURE [dbo].[SP_DMCS_Select_ClientWPets]
	-- Add the parameters for the stored procedure
	  @Pet_Record_ID as int


AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT [CLIENTWPETS_ID]
	      ,[Pet_Record_ID]
          ,[Client_id]
		  ,[Location_ID]
		  ,[cp_Date]
		  ,[ownership]

		  
     FROM [disaster_mngt_test].[dbo].[ClientWPets]
    WHERE Pet_Record_ID = @Pet_Record_ID


	  
	  
	  
END





GO


GO

/****** Object:  StoredProcedure [dbo].[SP_DMCS_Select_ClientWPets_WC]    Script Date: 8/30/2013 6:25:22 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Edward Sobanski
-- Create date: 5/21/2012
-- Description:	select Row from ClientWPets table
-- =============================================
ALTER PROCEDURE [dbo].[SP_DMCS_Select_ClientWPets_WC]
	-- Add the parameters for the stored procedure here
	 @wareclause as char(100)
AS
BEGIN
											    
    Declare @string as varchar(300)
	Set @string = 'Select * from ClientWPets where ' + @wareclause
	Exec(@string)
 
END

GO


GO

/****** Object:  StoredProcedure [dbo].[SP_DMCS_Update_ClientWPets]    Script Date: 8/30/2013 6:25:34 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO




-- =============================================
-- Author:		Jianwang Xing
-- Create date: 4/22/2013
-- Description:	update Row on ClientWPets table
-- =============================================
ALTER PROCEDURE [dbo].[SP_DMCS_Update_ClientWPets]
	-- Add the parameters for the stored procedure here
	  @clientwpets_id as int,
	  @Pet_Record_ID as int,
      @Client_Id as int,
	  @Location_ID as char,
	  @cp_Date as date,
	  @ownership as char
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	UPDATE [disaster_mngt_test].[dbo].[ClientWPets]
       SET [Pet_Record_ID] = @Pet_Record_ID,
           [Client_id] = @Client_id,
		   [Location_ID] =@Location_ID,
		   [cp_Date] = @cp_Date,
		   [ownership] =@ownership
   
    WHERE Pet_Record_ID = @Pet_Record_ID
      


END




GO


GO

/****** Object:  StoredProcedure [dbo].[SP_DMCS_Delete_Mobile_Unit]    Script Date: 8/30/2013 6:27:16 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Edward Sobanski
-- Create date: 4/21/2012
-- Description:Delete Mobile_Unit record
-- =============================================
ALTER PROCEDURE [dbo].[SP_DMCS_Delete_Mobile_Unit]
	@mobile_unit_id integer = 0
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	Delete dbo.mobile_unit
	where mobile_unit_id = @mobile_unit_id	 
	
END

GO


GO

/****** Object:  StoredProcedure [dbo].[SP_DMCS_get_Mobile_UnitID]    Script Date: 8/30/2013 6:27:31 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Edward Sobanski
-- Create date: 6/3/2012
-- Description:	Select row on mobile Unit table
-- =============================================
ALTER PROCEDURE [dbo].[SP_DMCS_get_Mobile_UnitID]
	-- Add the parameters for the stored procedure here
           
           @vehicle_id as int,
           @mobile_desc as varchar,
           @call_center_id as int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    SELECT [mobile_unit_id] FROM [disaster_mngt_test].[dbo].[mobile_unit] 
     WHERE [mobile_desc] = @mobile_desc
       and ([vehicle_id] = @vehicle_id or [vehicle_id] is null)
       and ([call_center_id] = @call_center_id or [call_center_id] is null)
      
End

GO


GO

/****** Object:  StoredProcedure [dbo].[SP_DMCS_Insert_Mobile_Unit]    Script Date: 8/30/2013 6:27:55 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Edward Sobanski
-- Create date: 5/22/2012
-- Description:	Insert row on mobile Unit table
-- =============================================
ALTER PROCEDURE [dbo].[SP_DMCS_Insert_Mobile_Unit]
	-- Add the parameters for the stored procedure here
           
           @vehicle_id as int,
           @mobile_desc as varchar(50),
           @call_center_id as int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
if @vehicle_id = 0
begin
   set @vehicle_id = null
end

if @call_center_id = 0
begin
   set @call_center_id = null
end

    -- Insert statements for procedure here
INSERT INTO [disaster_mngt_test].[dbo].[mobile_unit]
           ([vehicle_id]
           ,[mobile_desc]
           ,[call_center_id])
     VALUES
           (@vehicle_id,
            @mobile_desc, 
            @call_center_id)
        
End

GO


GO

/****** Object:  StoredProcedure [dbo].[SP_DMCS_Select_Mobile_Unit]    Script Date: 8/30/2013 6:28:29 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Edward Sobanski
-- Create date: 5/22/2012
-- Description:	Select row on mobile Unit table
-- =============================================
ALTER PROCEDURE [dbo].[SP_DMCS_Select_Mobile_Unit]
	-- Add the parameters for the stored procedure here
           
           @mobile_unit_id as int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
SELECT [mobile_unit_id]
      ,[vehicle_id]
      ,[mobile_desc]
      ,[call_center_id]
  FROM [disaster_mngt_test].[dbo].[mobile_unit]
 WHERE mobile_unit_id = @mobile_unit_id
        
End

GO


GO

/****** Object:  StoredProcedure [dbo].[SP_DMCS_Select_Mobile_Unit_WC]    Script Date: 8/30/2013 6:28:35 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Edward Sobanski
-- Create date: 5/22/2012
-- Description:	Select row on mobile Unit table
-- =============================================
ALTER PROCEDURE [dbo].[SP_DMCS_Select_Mobile_Unit_WC]
	-- Add the parameters for the stored procedure here
           
           @wareclause as char(100)
AS
BEGIN
			
	Declare @string as varchar(300)
	Set @string = 'Select * from Mobile_Unit where ' + @wareclause
	Exec(@string)
        
        
End

GO


GO

/****** Object:  StoredProcedure [dbo].[SP_DMCS_Update_Mobile_Unit]    Script Date: 8/30/2013 6:28:49 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Edward Sobanski
-- Create date: 5/22/2012
-- Description:	Update row on mobile Unit table
-- =============================================
ALTER PROCEDURE [dbo].[SP_DMCS_Update_Mobile_Unit]
	-- Add the parameters for the stored procedure here
           
           @mobile_unit_id as int,
           @vehicle_id as int,
           @mobile_desc as varchar(50),
           @call_center_id as int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
IF @vehicle_id = 0
BEGIN
  SET @vehicle_id = NULL
END
   
IF @call_center_id = 0
BEGIN
  SET @call_center_id = NULL
END
   
    -- Insert statements for procedure here
UPDATE [disaster_mngt_test].[dbo].[mobile_unit]
   SET [vehicle_id] = @vehicle_id, 
       [mobile_desc] = @mobile_desc, 
       [call_center_id] = @call_center_id
 WHERE mobile_unit_id = @mobile_unit_id
        
End

GO


GO

/****** Object:  StoredProcedure [dbo].[SP_DMCS_Delete_Client]    Script Date: 8/30/2013 6:29:20 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Edward Sobanski
-- Create date: 4/21/2012
-- Description:Delete Client record
-- =============================================
ALTER PROCEDURE [dbo].[SP_DMCS_Delete_Client]
	@client_id integer = 0
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	Delete dbo.client
	where client_id = @client_id
	 
	
END

GO


GO

/****** Object:  StoredProcedure [dbo].[SP_DMCS_Delete_Person]    Script Date: 8/30/2013 6:29:35 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Edward Sobanski
-- Create date: 4/21/2012
-- Description:Delete Person record
-- =============================================
ALTER PROCEDURE [dbo].[SP_DMCS_Delete_Person]
	@person_id integer = 0
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	Delete dbo.person
	where person_id  = @person_id 	 
	
END

GO


GO

/****** Object:  StoredProcedure [dbo].[SP_DMCS_Delete_Warehouse_Product_Location]    Script Date: 8/30/2013 6:29:47 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Edward Sobanski
-- Create date: 4/21/2012
-- Description:Delete Warehouse_Products record
-- =============================================
ALTER PROCEDURE [dbo].[SP_DMCS_Delete_Warehouse_Product_Location]
	@warehouse_product_location_id integer = 0
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	Delete dbo.warehouse_product_Location 
	where warehouse_product_location_id  = @warehouse_product_location_id	 
	
END

GO


GO

/****** Object:  StoredProcedure [dbo].[SP_DMCS_Delete_Warehouse]    Script Date: 8/30/2013 6:30:01 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Edward Sobanski
-- Create date: 4/21/2012
-- Description:Delete Warehouse record
-- =============================================
ALTER PROCEDURE [dbo].[SP_DMCS_Delete_Warehouse]
	@warehouse_id integer = 0
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	Delete dbo.warehouse
	where warehouse_id  = @warehouse_id	 
	
END

GO


GO

/****** Object:  StoredProcedure [dbo].[SP_DMCS_Delete_Products]    Script Date: 8/30/2013 6:30:14 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Edward Sobanski
-- Create date: 4/21/2012
-- Description:Delete Products record
-- =============================================
ALTER PROCEDURE [dbo].[SP_DMCS_Delete_Products]
	@product_id integer = 0
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	Delete dbo.products
	where product_id  = @product_id 	 
	
END

GO


GO

/****** Object:  StoredProcedure [dbo].[SP_DMCS_Delete_Resource]    Script Date: 8/30/2013 6:30:33 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		James Miller
-- Create date: 2/26/2013
-- Description:	Delete Resource Record
-- =============================================
ALTER PROCEDURE [dbo].[SP_DMCS_Delete_Resource]
	@Resource_ID integer = 0
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	Delete dbo.resource
	where Resource_ID = @Resource_ID
	
END


GO


GO

/****** Object:  StoredProcedure [dbo].[SP_DMCS_get_PersonID]    Script Date: 8/30/2013 6:31:21 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Edward Sobanski
-- Create date: 6/3/2012
-- Description:	Select row on person table
-- =============================================
ALTER PROCEDURE [dbo].[SP_DMCS_get_PersonID]
	-- Add the parameters for the stored procedure here
           
      @address_id as int,
      @address_id2 as int,
      @f_name as varchar(50),
      @m_initial as varchar(1) = null,
      @l_name as varchar(50),
      @person_type as varchar(1),
      @ssn as int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

SELECT max([person_id]) FROM [disaster_mngt_test].[dbo].[person]
 WHERE [f_name] = @f_name 
   and ([m_initial] =  @m_initial  or [m_initial] is null)
   and [l_name] =   @l_name
   and [person_type] =  @person_type 
   and ([ssn] =  @ssn  or [ssn] is null)
   and ([address_id] = @address_id  or [address_id] is null)
   and ([address_id2] = @address_id2  or [address_id2] is null)
   
End

GO


GO

/****** Object:  StoredProcedure [dbo].[SP_DMCS_get_Warehouse_ProductsID]    Script Date: 8/30/2013 6:31:38 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Edward Sobanski
-- Create date: 6/3/2012
-- Description:	Select row on warehouse products table
-- =============================================
ALTER PROCEDURE [dbo].[SP_DMCS_get_Warehouse_ProductsID]
	-- Add the parameters for the stored procedure here
            
    @warehouse_product_location_id as int, 
	@warehouse_id as int,
	@product_id as int,
	@Location_ID as int,
	@service_id as int,
	@Time_Date_MIA as datetime,
	@Experiation_Date as datetime,
	@min_inv as int,
	@status as varchar,
	@Exp_delivery_date as datetime,
	@qty_onhand as int,
	@qty_commit as int,
	@qty_order as int,
	@encounter_id as int
            
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    SELECT [warehouse_product_location_id] 
      FROM [disaster_mngt_test].[dbo].[warehouse_product_Location]
     WHERE [product_id] = @product_id
       and [Location_ID] = @Location_ID
       and [Time_Date_MIA] = @Time_Date_MIA
       and [Experiation_Date] = @Experiation_Date
       and [min_inv]  =  @min_inv
       and [status] = @status
       and [Exp_delivery_date] = @Exp_delivery_date
	   and [qty_onhand] = @qty_onhand
	   and [qty_onhand] = @qty_commit
	   and [qty_onhand] = @qty_order
	   and [encounter_id] = @encounter_id
       and ([warehouse_id] = @warehouse_id or [warehouse_id] is null) 
       and ([product_id] = @product_id or [product_id] is null) 
       and ([service_id] =  @service_id or [service_id] is null) 
         

End

GO


GO

/****** Object:  StoredProcedure [dbo].[SP_DMCS_get_WarehouseID]    Script Date: 8/30/2013 6:31:49 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Edward Sobanski
-- Create date: 5/22/2012
-- Description:	Select row on warehouse table
-- =============================================
ALTER PROCEDURE [dbo].[SP_DMCS_get_WarehouseID]
	-- Add the parameters for the stored procedure here
             
       @warehouse_name as varchar,
       @address_id as int,
       @warehouse_type as int
            
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    SELECT [warehouse_id] 
      FROM [disaster_mngt_test].[dbo].[warehouse]
     WHERE [warehouse_name] = @warehouse_name
       and [warehouse_type] = @warehouse_type
       and ([address_id] = @address_id or [address_id] is null) 
           
End

GO


GO

/****** Object:  StoredProcedure [dbo].[SP_DMCS_get_Productsid]    Script Date: 8/30/2013 6:32:02 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Edward Sobanski
-- Create date: 6/3/2012
-- Description:	Select row on products table
-- =============================================
ALTER PROCEDURE [dbo].[SP_DMCS_get_Productsid]
	-- Add the parameters for the stored procedure here
           
      @Resource_ID as int,
	  @product_name as varchar,
      @product_type as varchar,
      @product_qty as int,
      @product_color as varchar,
      @product_size as varchar,
      @product_cost as decimal,
      @Product_exp_date as bit,
      @Product_Alergy_info as varchar,
      @Product_refrigde as varchar,
      @Product_Flammable as varchar,
      @Product_Hazard as varchar,
	  @Product_Other as varchar,
      @Product_Min_Inv as int,
      @Product_Barcode as char,
	  @FEMA_ID as int,
	  @Product_subtype as varchar,
	@Make as varchar,
	@Model as varchar,
	@FEMA_Description as varchar,
	@Year as varchar,
	@RFID as varchar,
	@GPS as numeric,
	@Serial_Number as varchar,
	@Height as varchar,
	@Length as varchar,
	@Depth as varchar,
	@Weight as varchar,
	@OAI as varchar,
	@OAI_Type as varchar,
	@Use as varchar,
	@Brand as varchar,
	@Power_Supply as varchar,
	@Gas_Type as varchar,
	@Needs_Gas as bit,
	@Needs_Electricity as bit,
	@Availability as varchar,
	@Datetime as datetime,
	@OpenStatus as varchar 

	  
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
SELECT [product_id]
  FROM [disaster_mngt_test].[dbo].[products]
 WHERE [Resource_ID] = @Resource_ID
   and [product_name] = @product_name
   and [product_type] = @product_type
   and [product_qty] = @product_qty
   and [product_color] = @product_color
   and [product_size] = @product_size
   and [product_cost] = @product_cost
   and [Product_exp_date] = @Product_exp_date
   and [Product_Alergy_info] = @Product_Alergy_info
   and [Product_refrigde] = @Product_refrigde
   and [Product_Flammable] = @Product_Flammable
   and [Product_Hazard] = @Product_Hazard
   and [Product_Other] = @Product_Other
   and [Product_Min_Inv] = @Product_Min_Inv
   and [Product_Barcode] = @Product_Barcode
   and [FEMA_ID] = @FEMA_ID
   and [Product_subtype] = @Product_subtype
   and [Make] = @Make
       and [Model] = @Model
       and [FEMA_Description] = @FEMA_Description
       and [Year] = @Year
       and [RFID] = @RFID
       and [GPS] = @GPS
       and [Serial_Number] = @Serial_Number
       and [Height] = @Height
       and [Length] = @Length
       and [Depth] = @Depth
       and [Weight] = @Weight
       and [OAI] = @OAI
       and [OAI_Type] = @OAI_type
       and [Use] = @Use
       and [Brand] = @Brand
       and [Power_Supply] = @Power_Supply
       and [Gas_Type] = @Gas_Type
       and [Needs_Gas] = @Needs_Gas
       and [Needs_Electricity] = @Needs_Electricity
       and [Availability] = @Availability
       and [Datetime]= @Datetime
       and [OpenStatus] = @OpenStatus
        
End

GO


GO

/****** Object:  StoredProcedure [dbo].[SP_DMCS_get_Resource_ID]    Script Date: 8/30/2013 6:32:13 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		James Miller
-- Create date: 2/26/2013
-- Description:	get a Resource ID after insert
-- =============================================
ALTER PROCEDURE [dbo].[SP_DMCS_get_Resource_ID]
	-- Add the parameters for the stored procedure here
           
			@Location_ID as int,
			@Resource_Type as varchar(30),
			@date_Requested as datetime
       
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
SELECT [Resource_ID]
  FROM [disaster_mngt_test].[dbo].[resource]
 WHERE [Location_ID] = @Location_ID 
   and [Resource_Type] = @Resource_Type
   and [date_Requested] = @date_Requested
        
End

GO


GO

/****** Object:  StoredProcedure [dbo].[SP_DMCS_Insert_Client]    Script Date: 8/30/2013 6:32:29 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Edward Sobanski
-- Create date: 5/21/2012
-- Description:	Insert Row in Client table
-- =============================================
ALTER PROCEDURE [dbo].[SP_DMCS_Insert_Client]
	-- Add the parameters for the stored procedure here
     
            @client_id as int,
            @client_status as char(1) = null,
            @ethnicity as varchar(15) = null,
            @eye_color as varchar(10) = null,
            @hair_color as varchar(10) = null,
            @height as varchar(10)= null,
            @picture as image = Null,
            @weight as int,
            @skin_color as varchar(15)= null,
            @Info_Field as text = Null
      
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

if @client_id = 0
begin 
   set @client_id = null
end

    -- Insert statements for procedure here
INSERT INTO [disaster_mngt_test].[dbo].[client]
           ([client_id]
           ,[client_status]
           ,[ethnicity]
           ,[eye_color]
           ,[hair_color]
           ,[height]
           ,[picture]
           ,[weight]
           ,[skin_color]
           ,[Info_Field])
     VALUES
           (@client_id,
            @client_status, 
            @ethnicity, 
            @eye_color, 
            @hair_color,
            @height, 
            @picture, 
            @weight, 
            @skin_color,
            @Info_Field)

 End

GO


GO

/****** Object:  StoredProcedure [dbo].[SP_DMCS_Insert_Person]    Script Date: 8/30/2013 6:32:43 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Edward Sobanski
-- Create date: 5/22/2012
-- Description:	Insert row on person table
-- =============================================
ALTER PROCEDURE [dbo].[SP_DMCS_Insert_Person]
	-- Add the parameters for the stored procedure here
           

           @address_id as int,
           @address_id2 as int,
           @birthdate as datetime,
           @certification_number as varchar(50) = null,
           @f_name as varchar(20)= null,
           @m_initial as char(1)= null,
           @l_name as varchar(20)= null,
           @gender as char(1)= null,
           @person_type as char(1)= null,
           @phone_primary as varchar(11)= null,
           @phone_secondary as varchar(11)= null,
           @email as varchar(50)= null,
           @ssn as int,
           @Maiden_Name as varchar(50)= null,
           @Visa_Issue_Date as datetime,
           @Visa_Expire_Date as datetime,
           @Visa_Selected_Value_B1 as int,
           @Visa_Selected_Value_B2 as int,
           @Visa_Selected_Value_K1 as int,
           @Visa_Selected_Value_K3 as int,
           @Visa_Selected_Value_L1 as int,
           @Visa_Selected_Value_L2 as int,
           @Visa_Selected_Value_H4 as int,
           @Visa_Selected_Value_F1 as int,
           @Visa_Selected_Value_J1 as int,
           @Visa_Selected_Value_M1 as int,
           @Visa_Selected_Value_H1B as int,
           @Visa_Selected_Value_H2B as int,
           @Visa_Selected_Value_B_2 as int,
           @Visa_Selected_Value_Schengen as int,
           @Perm_Resident_Alien_Resid_Date as datetime,
           @Perm_Resident_Alien_Expire_Date as datetime,
           @Perm_Resident_Alien_A_number as int,
           @Perm_Resident_Alien_USCIS_number as int,
           @Perm_Resident_Alien_Birth_Country as varchar(50)= null,
           @Perm_Resident_Alien_Category as varchar(50)= null,
           @Driver_State_ID as varchar(15)= null,
           @Citizenship as varchar = null,
           @Marital_Status as varchar = null,
           @Minor_Children as int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
if @address_id = 0
begin
   set @address_id = null
end

if @address_id2 = 0
begin
   set @address_id2 = null
end

    -- Insert statements for procedure here
INSERT INTO [disaster_mngt_test].[dbo].[person]
           ([address_id]
           ,[address_id2]
           ,[birthdate]
           ,[certification_number]
           ,[f_name]
           ,[m_initial]
           ,[l_name]
           ,[gender]
           ,[person_type]
           ,[phone_primary]
           ,[phone_secondary]
           ,[email]
           ,[ssn]
           ,[Maiden_Name]
           ,[Visa_Issue_Date]
           ,[Visa_Expire_Date]
           ,[Visa_Selected_Value_B1]
           ,[Visa_Selected_Value_B2]
           ,[Visa_Selected_Value_K1]
           ,[Visa_Selected_Value_K3]
           ,[Visa_Selected_Value_L1]
           ,[Visa_Selected_Value_L2]
           ,[Visa_Selected_Value_H4]
           ,[Visa_Selected_Value_F1]
           ,[Visa_Selected_Value_J1]
           ,[Visa_Selected_Value_M1]
           ,[Visa_Selected_Value_H-1B]
           ,[Visa_Selected_Value_H-2B]
           ,[Visa_Selected_Value_B-2]
           ,[Visa_Selected_Value_Schengen]
           ,[Perm_Resident_Alien_Resid_Date]
           ,[Perm_Resident_Alien_Expire_Date]
           ,[Perm_Resident_Alien_A_number]
           ,[Perm_Resident_Alien_USCIS_number]
           ,[Perm_Resident_Alien_Birth_Country]
           ,[Perm_Resident_Alien_Category]
           ,[Driver_State_ID]
           ,[Citizenship]
           ,[Marital_Status]
           ,[Minor_Children])
     VALUES
           (@address_id,
           @address_id2, 
           @birthdate, 
           @certification_number,
           @f_name, 
           @m_initial,
           @l_name,
           @gender,
           @person_type, 
           @phone_primary, 
           @phone_secondary, 
           @email, 
           @ssn, 
           @Maiden_Name, 
           @Visa_Issue_Date, 
           @Visa_Expire_Date, 
           @Visa_Selected_Value_B1, 
           @Visa_Selected_Value_B2, 
           @Visa_Selected_Value_K1, 
           @Visa_Selected_Value_K3, 
           @Visa_Selected_Value_L1, 
           @Visa_Selected_Value_L2,
           @Visa_Selected_Value_H4, 
           @Visa_Selected_Value_F1, 
           @Visa_Selected_Value_J1, 
           @Visa_Selected_Value_M1, 
           @Visa_Selected_Value_H1B, 
           @Visa_Selected_Value_H2B,
           @Visa_Selected_Value_B_2, 
           @Visa_Selected_Value_Schengen,
           @Perm_Resident_Alien_Resid_Date,
           @Perm_Resident_Alien_Expire_Date, 
           @Perm_Resident_Alien_A_number,
           @Perm_Resident_Alien_USCIS_number, 
           @Perm_Resident_Alien_Birth_Country,
           @Perm_Resident_Alien_Category, 
           @Driver_State_ID,
           @Citizenship,
           @Marital_Status,
           @Minor_Children)
        
End

GO


GO

/****** Object:  StoredProcedure [dbo].[SP_DMCS_Insert_Warehouse_Products]    Script Date: 8/30/2013 6:32:57 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Edward Sobanski
-- Create date: 5/22/2012
-- Description:	Insert row on warehouse products table
-- =============================================
ALTER PROCEDURE [dbo].[SP_DMCS_Insert_Warehouse_Products]
	-- Add the parameters for the stored procedure here
             
    @warehouse_product_location_id as int, 
	@warehouse_id as int,
	@product_id as int,
	@Location_ID as int,
	@product_qty as int,
	@service_id as int,
	@Time_Date_MIA as datetime,
	@Experiation_Date as datetime,
	@min_inv as int,
	@status as varchar,
	@Exp_delivery_date as datetime,
	@Type as varchar,
	@qty_onhand as int,
	@qty_commit as int,
	@qty_order as int,
	@encounter_id as int
    
            
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

if @warehouse_id = 0
begin
   set @warehouse_id = null
end

if @product_id = 0
begin
   set @product_id = null
end

if @warehouse_product_location_id = 0
begin
   set @warehouse_product_location_id = null
end

if @service_id = 0
begin
   set @service_id = null
end

    -- Insert statements for procedure here            
INSERT INTO [disaster_mngt_test].[dbo].[warehouse_product_Location]
           ([warehouse_id]
           ,[product_id]
           ,[Location_ID]
           ,[service_id]
           ,[Time_Date_MIA]
           ,[Experiation_Date]
           ,[min_inv]
           ,[status]
           ,[Exp_delivery_date]
		   ,[qty_onhand]
		   ,[qty_commit]
		   ,[qty_order]
		   ,[encounter_id])
     VALUES
           (@warehouse_id
           ,@product_id
           ,@Location_ID
           ,@service_id
           ,@Time_Date_MIA
           ,@Experiation_Date
           ,@min_inv
           ,@status
           ,@Exp_delivery_date
		   ,@qty_onhand
		   ,@qty_commit
		   ,@qty_onhand
		   ,@encounter_id)        
End

GO


GO

/****** Object:  StoredProcedure [dbo].[SP_DMCS_Insert_Warehouse]    Script Date: 8/30/2013 6:33:05 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Edward Sobanski
-- Create date: 5/22/2012
-- Description:	Insert row on warehouse table
-- =============================================
ALTER PROCEDURE [dbo].[SP_DMCS_Insert_Warehouse]
	-- Add the parameters for the stored procedure here
             
            @warehouse_name as varchar(50),
            @address_id as int,
            @warehouse_type as int
            
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
if @address_id = 0
begin
   set @address_id = null
end

    -- Insert statements for procedure here
INSERT INTO [disaster_mngt_test].[dbo].[warehouse]
           ([warehouse_name]
           ,[address_id]
           ,[warehouse_type])
     VALUES
           (@warehouse_name,
            @address_id,
            @warehouse_type)
           
End

GO


GO

/****** Object:  StoredProcedure [dbo].[SP_DMCS_Insert_Products]    Script Date: 8/30/2013 6:33:19 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Edward Sobanski
-- Create date: 5/22/2012
-- Description:	Insert row on products table
-- =============================================
ALTER PROCEDURE [dbo].[SP_DMCS_Insert_Products]
	-- Add the parameters for the stored procedure here
           
         
		 @Resource_ID as int,
		 @product_name as varchar,
		 @product_type as varchar,
		 @product_qty as int,
		 @product_desc as text,
		 @product_color as varchar,
		 @product_size as varchar,
		 @product_cost as decimal,
		 @Product_exp_date as bit,
		 @Product_Alergy_info as varchar,
		 @Product_refrigde as varchar,
		 @Product_Flammable as varchar,
		 @Product_Hazard as varchar,
		 @Product_Other as varchar,
		 @Product_Min_Inv as int,
		 @Product_Barcode as char,
		 @FEMA_ID as int,
		 @Product_subtype as varchar,
		 @Make as varchar,
	@Model as varchar,
	@FEMA_Description as varchar,
	@Year as varchar,
	@RFID as varchar,
	@GPS as numeric,
	@Serial_Number as varchar,
	@Height as varchar,
	@Length as varchar,
	@Depth as varchar,
	@Weight as varchar,
	@OAI as varchar,
	@OAI_Type as varchar,
	@Use as varchar,
	@Brand as varchar,
	@Power_Supply as varchar,
	@Gas_Type as varchar,
	@Needs_Gas as bit,
	@Needs_Electricity as bit,
	@Availability as varchar,
	@Datetime as datetime,
	@OpenStatus as varchar
         
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
INSERT INTO [disaster_mngt_test].[dbo].[products]
           ([Resource_ID]
		   ,[product_name]
           ,[product_type]
           ,[product_qty]
           ,[product_desc]
           ,[product_color]
           ,[product_size]
           ,[product_cost]
           ,[Product_exp_date]
           ,[Product_Alergy_info]
           ,[Product_refrigde]
           ,[Product_Flammable]
           ,[Product_Hazard]
           ,[Product_Other]
           ,[Product_Min_Inv]
           ,[Product_Barcode]
		   ,[FEMA_ID]
		   ,[Product_subtype]
		   ,[Make]
           ,[Model]
           ,[FEMA_Description]
           ,[Year]
           ,[RFID]
           ,[GPS]
           ,[Serial_Number]
           ,[Height]
           ,[Length]
           ,[Depth]
           ,[Weight]
           ,[OAI]
           ,[OAI_Type]
           ,[Use]
           ,[Brand]
           ,[Power_Supply]
           ,[Gas_Type]
           ,[Needs_Gas]
           ,[Needs_Electricity]
           ,[Availability]
           ,[Datetime]
           ,[OpenStatus])
     VALUES
           (@Resource_ID,
		    @product_name, 
            @product_type, 
            @product_qty, 
            @product_desc, 
            @product_color, 
            @product_size, 
            @product_cost, 
            @Product_exp_date, 
            @Product_Alergy_info, 
            @Product_refrigde, 
            @Product_Flammable, 
            @Product_Hazard, 
            @Product_Other, 
            @Product_Min_Inv,
            @Product_Barcode,
			@FEMA_ID,
			@Product_subtype,	
			@Make,
	@Model,
	@FEMA_Description,
	@Year,
	@RFID,
	@GPS,
	@Serial_Number,
	@Height,
	@Length,
	@Depth,
	@Weight,
	@OAI,
	@OAI_Type,
	@Use,
	@Brand,
	@Power_Supply,
	@Gas_Type,
	@Needs_Gas,
	@Needs_Electricity,
	@Availability,
	@Datetime,
	@OpenStatus)
        
End

GO


GO

/****** Object:  StoredProcedure [dbo].[SP_DMCS_Insert_Resource]    Script Date: 8/30/2013 6:33:29 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		James Miller
-- Create date: 2/26/2013
-- Description:	Insert Row in Resource table
-- =============================================
ALTER PROCEDURE [dbo].[SP_DMCS_Insert_Resource]
	-- Add the parameters for the stored procedure here
     
			@Resource_ID as int,
			@Location_ID as int,
			@Resource_Type as varchar(30),
			@date_Requested as datetime
      
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

if @Resource_ID  = 0
begin 
   set @Resource_ID = null
end

    -- Insert statements for procedure here
INSERT INTO [disaster_mngt_test].[dbo].[resource]
           ([Resource_ID]
           ,[Location_ID]
           ,[Resource_Type]
           ,[date_Requested])
     VALUES
           (@Resource_ID,
            @Location_ID,
			@Resource_Type,
			@date_Requested)

 End


GO


GO

/****** Object:  StoredProcedure [dbo].[SP_DMCS_Select_Client]    Script Date: 8/30/2013 6:34:10 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Edward Sobanski
-- Create date: 5/21/2012
-- Description:	Select Row from Client table
-- =============================================
ALTER PROCEDURE [dbo].[SP_DMCS_Select_Client]
	-- Add the parameters for the stored procedure here
     
            @client_id as int
      
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
SELECT [client_id]
      ,[client_status]
      ,[ethnicity]
      ,[eye_color]
      ,[hair_color]
      ,[height]
      ,[picture]
      ,[weight]
      ,[skin_color]
      ,[Info_Field]
  FROM [disaster_mngt_test].[dbo].[client]
  where client_id = @client_id
  
End

GO


GO

/****** Object:  StoredProcedure [dbo].[SP_DMCS_Select_Client_WC]    Script Date: 8/30/2013 6:34:17 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Edward Sobanski
-- Create date: 5/21/2012
-- Description:	Select Row from Client table
-- =============================================
ALTER PROCEDURE [dbo].[SP_DMCS_Select_Client_WC]
	-- Add the parameters for the stored procedure here
     
            @wareclause as char(100)
      
AS
BEGIN
								    
    Declare @string as varchar(300)
	Set @string = 'Select * from Client where ' + @wareclause
	Exec(@string)
 
  
  
End

GO


GO

/****** Object:  StoredProcedure [dbo].[SP_DMCS_Select_Person]    Script Date: 8/30/2013 6:34:31 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Edward Sobanski
-- Create date: 5/22/2012
-- Description:	Select row on person table
-- =============================================
ALTER PROCEDURE [dbo].[SP_DMCS_Select_Person]
	-- Add the parameters for the stored procedure here
           
           @person_id as int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
SELECT [person_id]
      ,[address_id]
      ,[address_id2]
      ,[birthdate]
      ,[certification_number]
      ,[f_name]
      ,[m_initial]
      ,[l_name]
      ,[gender]
      ,[person_type]
      ,[phone_primary]
      ,[phone_secondary]
      ,[email]
      ,[ssn]
      ,[Maiden_Name]
      ,[Visa_Issue_Date]
      ,[Visa_Expire_Date]
      ,[Visa_Selected_Value_B1]
      ,[Visa_Selected_Value_B2]
      ,[Visa_Selected_Value_K1]
      ,[Visa_Selected_Value_K3]
      ,[Visa_Selected_Value_L1]
      ,[Visa_Selected_Value_L2]
      ,[Visa_Selected_Value_H4]
      ,[Visa_Selected_Value_F1]
      ,[Visa_Selected_Value_J1]
      ,[Visa_Selected_Value_M1]
      ,[Visa_Selected_Value_H-1B]
      ,[Visa_Selected_Value_H-2B]
      ,[Visa_Selected_Value_B-2]
      ,[Visa_Selected_Value_Schengen]
      ,[Perm_Resident_Alien_Resid_Date]
      ,[Perm_Resident_Alien_Expire_Date]
      ,[Perm_Resident_Alien_A_number]
      ,[Perm_Resident_Alien_USCIS_number]
      ,[Perm_Resident_Alien_Birth_Country]
      ,[Perm_Resident_Alien_Category]
      ,[Driver_State_ID]
      ,[Citizenship]
      ,[Marital_Status]
      ,[Minor_Children]
  FROM [disaster_mngt_test].[dbo].[person]
 WHERE person_id = @person_id
        
End

GO


GO

/****** Object:  StoredProcedure [dbo].[SP_DMCS_Select_Person_WC]    Script Date: 8/30/2013 6:34:37 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Edward Sobanski
-- Create date: 5/22/2012
-- Description:	Select row on person table
-- =============================================
ALTER PROCEDURE [dbo].[SP_DMCS_Select_Person_WC]
	-- Add the parameters for the stored procedure here
           
           @wareclause as char(100)
AS
BEGIN
		
	Declare @string as varchar(300)
	Set @string = 'Select * from Person where ' + @wareclause
	Exec(@string)
        
End

GO


GO

/****** Object:  StoredProcedure [dbo].[SP_DMCS_Select_warehouse_product_location_WC]    Script Date: 8/30/2013 6:34:59 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



-- =============================================
-- Author:		Edward Sobanski
-- Create date: 5/22/2012
-- Description:	Select row on warehouse products table 
-- =============================================
CREATE PROCEDURE [dbo].[SP_DMCS_Select_warehouse_product_location_WC]
	-- Add the parameters for the stored procedure here
            
            @wareclause as char(100)
            
AS
BEGIN
  
    declare @string as varchar(300)
    set @string = 'Select * from warehouse_product_Location where ' + @wareclause
    exec(@string)
           
End



GO


GO

/****** Object:  StoredProcedure [dbo].[SP_DMCS_Select_warehouse_product_location]    Script Date: 8/30/2013 6:35:07 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



-- =============================================
-- Author:		Edward Sobanski
-- Create date: 5/22/2012
-- Description:	Select row on warehouse products table
-- =============================================
CREATE PROCEDURE [dbo].[SP_DMCS_Select_warehouse_product_location]
	-- Add the parameters for the stored procedure here
            
            @warehouse_product_location_id as int
            
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
SELECT [warehouse_product_location_id]
      ,[warehouse_id]
      ,[product_id]
      ,[Location_ID]
      ,[service_id]
      ,[Time_Date_MIA]
      ,[Experiation_Date]
      ,[min_inv]
      ,[status]
	  ,[Exp_delivery_date]
      ,[qty_onhand]
	  ,[qty_commit]
	  ,[qty_order]
	  ,[encounter_id]

  FROM [disaster_mngt_test].[dbo].[warehouse_product_Location]
 WHERE warehouse_product_location_id = @warehouse_product_location_id
           
End



GO


GO

/****** Object:  StoredProcedure [dbo].[SP_DMCS_Select_Warehouse_WC]    Script Date: 8/30/2013 6:35:30 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Edward Sobanski
-- Create date: 5/22/2012
-- Description:	Select row on warehouse table
-- =============================================
ALTER PROCEDURE [dbo].[SP_DMCS_Select_Warehouse_WC]
	-- Add the parameters for the stored procedure here
             
            @wareclause as char(100)
            
AS
BEGIN
	
	declare @string as varchar(300)
    set @string = 'Select * from warehouse where ' + @wareclause
    exec(@string)

End

GO


GO

/****** Object:  StoredProcedure [dbo].[SP_DMCS_Select_Warehouse]    Script Date: 8/30/2013 6:35:38 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Edward Sobanski
-- Create date: 5/22/2012
-- Description:	Select row on warehouse table
-- =============================================
ALTER PROCEDURE [dbo].[SP_DMCS_Select_Warehouse]
	-- Add the parameters for the stored procedure here
             
            @warehouse_id as int
            
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
SELECT [warehouse_id]
      ,[warehouse_name]
      ,[address_id]
      ,[warehouse_type]
  FROM [disaster_mngt_test].[dbo].[warehouse]
 WHERE warehouse_id = @warehouse_id
End

GO


GO

/****** Object:  StoredProcedure [dbo].[SP_DMCS_Select_Products]    Script Date: 8/30/2013 6:35:49 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Edward Sobanski
-- Create date: 5/22/2012
-- Description:	Select row on products table
-- =============================================
ALTER PROCEDURE [dbo].[SP_DMCS_Select_Products]
	-- Add the parameters for the stored procedure here
           
           @product_id as int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
SELECT [product_id]
	  ,[Resource_ID]
      ,[product_name]
      ,[product_type]
      ,[product_qty]
      ,[product_desc]
      ,[product_color]
      ,[product_size]
      ,[product_cost]
      ,[Product_exp_date]
      ,[Product_Alergy_info]
      ,[Product_refrigde]
      ,[Product_Flammable]
      ,[Product_Hazard]
      ,[Product_Other]
      ,[Product_Min_Inv]
      ,[Product_Barcode]
	  ,[FEMA_ID]
	  ,[Product_subtype]
	  ,[Make]
      ,[Model]
      ,[FEMA_Description]
      ,[Year]
      ,[RFID]
      ,[GPS]
      ,[Serial_Number]
      ,[Height]
      ,[Length]
      ,[Depth]
      ,[Weight]
      ,[OAI]
      ,[OAI_Type]
      ,[Use]
      ,[Brand]
      ,[Power_Supply]
      ,[Gas_Type]
      ,[Needs_Gas]
      ,[Needs_Electricity]
      ,[Availability]
      ,[Datetime]
      ,[OpenStatus]


  FROM [disaster_mngt_test].[dbo].[products]
 WHERE product_id = @product_id
        
End

GO


GO

/****** Object:  StoredProcedure [dbo].[SP_DMCS_Select_Products_WC]    Script Date: 8/30/2013 6:35:56 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Edward Sobanski
-- Create date: 5/22/2012
-- Description:	Select row on products table
-- =============================================
ALTER PROCEDURE [dbo].[SP_DMCS_Select_Products_WC]
	-- Add the parameters for the stored procedure here
           
          @wareclause as char(100)
AS
BEGIN
	
	Declare @string as varchar(300)
	Set @string = 'Select * from Products where ' + @wareclause
	Exec(@string)
        
End

GO


GO

/****** Object:  StoredProcedure [dbo].[SP_DMCS_Select_resource]    Script Date: 8/30/2013 6:36:10 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		James Miller
-- Create date: 2/26/2013
-- Description:	Select row on Resource table
-- =============================================
ALTER PROCEDURE [dbo].[SP_DMCS_Select_resource]
	-- Add the parameters for the stored procedure here
           
           @Resource_ID as int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
SELECT [Resource_ID]
      ,[Location_ID]
      ,[Resource_Type]
      ,[Date_Requested]
  FROM [disaster_mngt_test].[dbo].[resource]
  WHERE Resource_ID = @Resource_ID
  
 END

GO


GO

/****** Object:  StoredProcedure [dbo].[SP_DMCS_Update_Client]    Script Date: 8/30/2013 6:36:43 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Edward Sobanski
-- Create date: 5/21/2012
-- Description:	Update Row from Client table
-- =============================================
ALTER PROCEDURE [dbo].[SP_DMCS_Update_Client]
	-- Add the parameters for the stored procedure here
     
            @client_id as int,
            @client_status as varchar = null,
            @ethnicity as varchar = null,
            @eye_color as varchar = null,
            @hair_color as varchar = null,
            @height as varchar = null,
            @picture as image = Null,
            @weight as int,
            @skin_color as varchar = null,
            @Info_Field as Text = Null
      
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Update statements for procedure here
Update [disaster_mngt_test].[dbo].[client]
   Set [client_status] = @client_status,
       [ethnicity] = @ethnicity,
       [eye_color] = @eye_color,
       [hair_color] = @hair_color,
       [height] = @hair_color,
       [picture] = @picture,
       [weight] = @weight,
       [skin_color] = @skin_color,
       [Info_field] = @Info_Field
  FROM [disaster_mngt_test].[dbo].[client]
  where client_id = @client_id
  
End

GO


GO

/****** Object:  StoredProcedure [dbo].[SP_DMCS_Update_Person]    Script Date: 8/30/2013 6:36:57 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Edward Sobanski
-- Create date: 5/22/2012
-- Description:	Update row on person table
-- =============================================
ALTER PROCEDURE [dbo].[SP_DMCS_Update_Person]
	-- Add the parameters for the stored procedure here
           
           @person_id as int,
           @address_id as int,
           @address_id2 as int,
           @birthdate as datetime,
           @certification_number as varchar(50) = null,
           @f_name as varchar(20) = null,
           @m_initial as char(1) = null,
           @l_name as varchar(20) = null,
           @gender as char(1) = null,
           @person_type as char(1) = null,
           @phone_primary as varchar(11) = null,
           @phone_secondary as varchar(11) = null,
           @email as varchar(50) = null,
           @ssn as int,
           @Maiden_Name as varchar(50) = null,
           @Visa_Issue_Date as datetime,
           @Visa_Expire_Date as datetime,
           @Visa_Selected_Value_B1 as int,
           @Visa_Selected_Value_B2 as int,
           @Visa_Selected_Value_K1 as int,
           @Visa_Selected_Value_K3 as int,
           @Visa_Selected_Value_L1 as int,
           @Visa_Selected_Value_L2 as int,
           @Visa_Selected_Value_H4 as int,
           @Visa_Selected_Value_F1 as int,
           @Visa_Selected_Value_J1 as int,
           @Visa_Selected_Value_M1 as int,
           @Visa_Selected_Value_H1B as int,
           @Visa_Selected_Value_H2B as int,
           @Visa_Selected_Value_B_2 as int,
           @Visa_Selected_Value_Schengen as int,
           @Perm_Resident_Alien_Resid_Date as datetime,
           @Perm_Resident_Alien_Expire_Date as datetime,
           @Perm_Resident_Alien_A_number as int,
           @Perm_Resident_Alien_USCIS_number as int,
           @Perm_Resident_Alien_Birth_Country as varchar(50) = null,
           @Perm_Resident_Alien_Category as varchar(50) = null,
           @Driver_State_ID as varchar(15) = null,
           @Citizenship as varchar = null,
           @Marital_Status as varchar = null,
           @Minor_Children as int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
IF @address_id = 0
BEGIN
  SET @address_id = NULL
END
   
   IF @address_id2 = 0
BEGIN
  SET @address_id2 = NULL
END
   
    -- Insert statements for procedure here
UPDATE [disaster_mngt_test].[dbo].[person]
   SET [address_id] = @address_id, 
      [address_id2] = @address_id2, 
      [birthdate] = @birthdate, 
      [certification_number] = @certification_number, 
      [f_name] = @f_name, 
      [m_initial] = @m_initial, 
      [l_name] = @l_name, 
      [gender] = @gender, 
      [person_type] = @person_type, 
      [phone_primary] = @phone_primary, 
      [phone_secondary] = @phone_secondary, 
      [email] = @email, 
      [ssn] = @ssn, 
      [Maiden_Name] = @Maiden_Name, 
      [Visa_Issue_Date] = @Visa_Issue_Date, 
      [Visa_Expire_Date] = @Visa_Expire_Date,
      [Visa_Selected_Value_B1] = @Visa_Selected_Value_B1, 
      [Visa_Selected_Value_B2] = @Visa_Selected_Value_B2, 
      [Visa_Selected_Value_K1] = @Visa_Selected_Value_K1,
      [Visa_Selected_Value_K3] = @Visa_Selected_Value_K3, 
      [Visa_Selected_Value_L1] = @Visa_Selected_Value_L1, 
      [Visa_Selected_Value_L2] = @Visa_Selected_Value_L2, 
      [Visa_Selected_Value_H4] = @Visa_Selected_Value_H4, 
      [Visa_Selected_Value_F1] = @Visa_Selected_Value_F1, 
      [Visa_Selected_Value_J1] = @Visa_Selected_Value_J1, 
      [Visa_Selected_Value_M1] = @Visa_Selected_Value_M1,
      [Visa_Selected_Value_H-1B] = @Visa_Selected_Value_H1B, 
      [Visa_Selected_Value_H-2B] = @Visa_Selected_Value_H2B, 
      [Visa_Selected_Value_B-2] = @Visa_Selected_Value_B_2,
      [Visa_Selected_Value_Schengen] = @Visa_Selected_Value_Schengen, 
      [Perm_Resident_Alien_Resid_Date] = @Perm_Resident_Alien_Resid_Date, 
      [Perm_Resident_Alien_Expire_Date] = @Perm_Resident_Alien_Expire_Date, 
      [Perm_Resident_Alien_A_number] = @Perm_Resident_Alien_A_number,
      [Perm_Resident_Alien_USCIS_number] = @Perm_Resident_Alien_USCIS_number, 
      [Perm_Resident_Alien_Birth_Country] = @Perm_Resident_Alien_Birth_Country, 
      [Perm_Resident_Alien_Category] = @Perm_Resident_Alien_Category,
      [Driver_State_ID] = @Driver_State_ID,
      [Citizenship] = @Citizenship,
      [Marital_Status] = @Marital_Status,
      [Minor_Children] = @Minor_Children
 WHERE person_id = @person_id
        
End

GO


GO

/****** Object:  StoredProcedure [dbo].[SP_DMCS_Update_Warehouse_Products]    Script Date: 8/30/2013 6:37:07 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Edward Sobanski
-- Create date: 5/22/2012
-- Description:	Update row on warehouse products table
-- =============================================
ALTER PROCEDURE [dbo].[SP_DMCS_Update_Warehouse_Products]
	-- Add the parameters for the stored procedure here
            
    @warehouse_product_location_id as int, 
	@warehouse_id as int,
	@product_id as int,
	@Location_ID as int,
	@product_qty as int,
	@service_id as int,
	@Time_Date_MIA as datetime,
	@Experiation_Date as datetime,
	@min_inv as int,
	@status as varchar,
	@Exp_delivery_date as datetime,
	@qty_onhand as int,
	@qty_commit as int,
	@qty_order as int,
	@encounter_id as int
            
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
IF @warehouse_id = 0
BEGIN
  SET @warehouse_id = NULL
END
   
IF @product_id = 0
BEGIN
  SET @product_id = NULL
END
   

IF @service_id = 0
BEGIN
  SET @service_id = NULL
END   
    -- Insert statements for procedure here
UPDATE [disaster_mngt_test].[dbo].[warehouse_product_Location]
   SET [product_id] = @product_id
	   ,[Location_ID] = @Location_ID
       ,[Time_Date_MIA] = @Time_Date_MIA
       ,[Experiation_Date] = @Experiation_Date
       ,[min_inv]  =  @min_inv
       ,[status] = @status
       ,[Exp_delivery_date] = @Exp_delivery_date
       ,[warehouse_id] = @warehouse_id   
       ,[service_id] =  @service_id
	   ,[qty_onhand] = @qty_onhand
	   ,[qty_commit] = @qty_commit
	   ,[qty_order] = @qty_order
	   ,[encounter_id] = @encounter_id 
 WHERE warehouse_product_location_id = @warehouse_product_location_id
           
End

GO


GO

/****** Object:  StoredProcedure [dbo].[SP_DMCS_Update_Warehouse]    Script Date: 8/30/2013 6:37:13 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Edward Sobanski
-- Create date: 5/22/2012
-- Description:	Update row on warehouse table
-- =============================================
ALTER PROCEDURE [dbo].[SP_DMCS_Update_Warehouse]
	-- Add the parameters for the stored procedure here
             
            @warehouse_id as int,
            @warehouse_name as varchar(50),
            @address_id as int,
            @warehouse_type as int
            
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
IF @address_id = 0
BEGIN
  SET @address_id = NULL
END
       -- Insert statements for procedure here
UPDATE [disaster_mngt_test].[dbo].[warehouse]
   SET [warehouse_name] = @warehouse_name, 
       [address_id] = @address_id,
       [warehouse_type]	= @warehouse_type
 WHERE warehouse_id = @warehouse_id
End

GO


GO

/****** Object:  StoredProcedure [dbo].[SP_DMCS_Update_Products]    Script Date: 8/30/2013 6:37:25 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Edward Sobanski
-- Create date: 5/22/2012
-- Description:	Update row on products table
-- =============================================
ALTER PROCEDURE [dbo].[SP_DMCS_Update_Products]
	-- Add the parameters for the stored procedure here
           
          @product_id as int,
		  @Resource_ID as int,
          @product_name as varchar(50),
          @product_type as varchar(20),
          @product_qty as int,
          @product_desc as text,
          @product_color as varchar(20),
          @product_size as varchar(20),
          @product_cost as money,
          @Product_exp_date as bit,
          @Product_Alergy_info as varchar(20),
          @Product_refrigde as char(1),
          @Product_Flammable as char(1),
          @Product_Hazard as char(1),
          @Product_Other as varchar,
          @Product_Min_Inv as int,
          @Product_Barcode as char(1),
		  @FEMA_ID as int,
		  @Product_subtype as varchar,
	@Make as varchar,
	@Model as varchar,
	@FEMA_Description as varchar,
	@Year as varchar,
	@RFID as varchar,
	@GPS as numeric,
	@Serial_Number as varchar,
	@Height as varchar,
	@Length as varchar,
	@Depth as varchar,
	@Weight as varchar,
	@OAI as varchar,
	@OAI_Type as varchar,
	@Use as varchar,
	@Brand as varchar,
	@Power_Supply as varchar,
	@Gas_Type as varchar,
	@Needs_Gas as bit,
	@Needs_Electricity as bit,
	@Availability as varchar,
	@Datetime as datetime,
	@OpenStatus as varchar

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
UPDATE [disaster_mngt_test].[dbo].[products]
   SET [Resource_ID] = @Resource_ID,
	   [product_name] = @product_name,
       [product_type] = @product_type,
       [product_qty] = @product_qty, 
       [product_desc] = @product_desc, 
       [product_color] = @product_color, 
       [product_size] = @product_size, 
       [product_cost] = @product_cost, 
       [Product_exp_date] = @Product_exp_date, 
       [Product_Alergy_info] = @Product_Alergy_info, 
       [Product_refrigde] = @Product_refrigde, 
       [Product_Flammable] = @Product_Flammable, 
       [Product_Hazard] = @Product_Hazard, 
       [Product_Other] = @Product_Other,
       [Product_Min_Inv] = @Product_Min_Inv, 
       [Product_Barcode] = @Product_Barcode,
	   [FEMA_ID] = @FEMA_ID,
	   [Product_subtype] = @Product_subtype,
	   [Make] = @Make,
       [Model] = @Model,
       [FEMA_Description] = @FEMA_Description,
       [Year] = @Year,
       [RFID] = @RFID,
       [GPS] = @GPS,
       [Serial_Number] = @Serial_Number,
       [Height] = @Height,
       [Length] = @Length,
       [Depth] = @Depth,
       [Weight] = @Weight,
       [OAI] = @OAI,
       [OAI_Type] = @OAI_type,
       [Use] = @Use,
       [Brand] = @Brand,
       [Power_Supply] = @Power_Supply,
       [Gas_Type] = @Gas_Type,
       [Needs_Gas] = @Needs_Gas,
       [Needs_Electricity] = @Needs_Electricity,
       [Availability] = @Availability,
       [Datetime]= @Datetime,
       [OpenStatus] = @OpenStatus

 WHERE product_id = @product_id
        
End

GO


GO

/****** Object:  StoredProcedure [dbo].[SP_DMCS_Update_Resource]    Script Date: 8/30/2013 6:37:33 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		James Miller
-- Create date: 2/26/2013
-- Description:	update Rows on Resource table
-- =============================================
ALTER PROCEDURE [dbo].[SP_DMCS_Update_Resource]
	-- Add the parameters for the stored procedure here
	  @Resource_ID as int,
	  @Location_ID as int,
      @Resource_Type as varchar(30),
      @date_Requested as datetime
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
if @Resource_ID = 0
begin
   set @Resource_ID = null
end

 -- Insert statements for procedure here
UPDATE [disaster_mngt_test].[dbo].[resource]
   SET [Location_ID] = @Location_ID,
      [Resource_Type] = @Resource_Type,
      [date_Requested] = @date_Requested 
 WHERE Resource_ID = @Resource_ID
 END

GO


GO

/****** Object:  StoredProcedure [dbo].[SP_DMCS_Delete_pet]    Script Date: 8/30/2013 6:38:11 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Jianwang Xing
-- Create date: 3/29/2013
-- Description:	Delete pet record
-- =============================================
ALTER PROCEDURE [dbo].[SP_DMCS_Delete_pet] 
	@Pet_Record_ID integer = 0
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	Delete dbo.Pet
	where Pet_Record_ID = @Pet_Record_ID
	
	
	
END

GO


GO

/****** Object:  StoredProcedure [dbo].[SP_DMCS_Delete_Pet_Deceased]    Script Date: 8/30/2013 6:38:17 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Mike Phillips
-- Create date: 3/29/2013
-- Description:Delete pet deceased record
-- =============================================
ALTER PROCEDURE [dbo].[SP_DMCS_Delete_Pet_Deceased]
	@Pet_Deceased_ID integer = 0
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	Delete dbo.Pet_Deceased
	where Pet_Deceased_ID = @Pet_Deceased_ID	 
	
END

GO


GO

/****** Object:  StoredProcedure [dbo].[SP_DMCS_Delete_Pet_missing]    Script Date: 8/30/2013 6:38:25 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Jianwang Xing
-- Create date: 3/29/2013
-- Description:Delete Pet missing record
-- =============================================
ALTER PROCEDURE [dbo].[SP_DMCS_Delete_Pet_missing]
	@Pet_Missing_ID integer = 0
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	Delete dbo.Pet_Missing
	where Pet_Missing_ID = @Pet_Missing_ID	 
	
END

GO


GO

/****** Object:  StoredProcedure [dbo].[SP_DMCS_Delete_Pet_Type]    Script Date: 8/30/2013 6:38:32 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Jianwang Xing
-- Create date: 3/29/2013
-- Description:	Delete pet type record
-- =============================================
ALTER PROCEDURE [dbo].[SP_DMCS_Delete_Pet_Type] 
	@Pet_Type_ID integer = 0
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	Delete dbo.Pet_type
	where Pet_Type_ID = @Pet_Type_ID
	
END

GO


GO

/****** Object:  StoredProcedure [dbo].[SP_DMCS_Delete_location]    Script Date: 8/30/2013 6:38:48 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		Justin Gamble
-- Create date: 2/26/2013
-- Description:	Delete Location Record
-- =============================================
ALTER PROCEDURE [dbo].[SP_DMCS_Delete_location]
	@Location_ID int = 0
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	Delete dbo.location
	where Location_ID = @Location_ID
	
END


GO


GO

/****** Object:  StoredProcedure [dbo].[SP_DMCS_get_Location_ID]    Script Date: 8/30/2013 6:39:00 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Justin Gamble
-- Create date: 2/26/2013
-- Description:	get a Location ID after insert
-- =============================================
ALTER PROCEDURE [dbo].[SP_DMCS_get_Location_ID]
	-- Add the parameters for the stored procedure here
           
			@Location_ID as int,
			@type as varchar,
			@city as varchar,
			@state as varchar,
			@zip as int,
			@county as varchar,
			@location_desc as varchar,
			@n_long as int,
			@s_long as int,
			@e_long as int,
			@w_long as int,
			@n_lat as int,
			@s_lat as int,
			@e_lat as int,
			@w_lat as int
       
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
SELECT [Location_ID]
  FROM [disaster_mngt_test].[dbo].[location]
 WHERE [Location_ID] = @Location_ID
   and [type] = @type
   and [city] = @city
   and [state] = @state
   and [zip] = @zip
   and [county] = @county
   and [location_desc] = @location_desc
   and [n_long] = @n_long
   and [s_long] = @s_long
   and [e_long] = @e_long
   and [w_long] = @w_long
   and [n_lat] = @n_lat
   and [s_lat] = @s_lat
   and [e_lat] = @e_lat
   and [w_lat] = @w_lat
   
End

GO


GO

/****** Object:  StoredProcedure [dbo].[SP_DMCS_get_Location_ID_MAX]    Script Date: 8/30/2013 6:39:07 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



-- =============================================
-- Author:		Justin Gamble
-- Create date: 2/26/2013
-- Description:	get a Location ID after insert
-- =============================================
CREATE PROCEDURE [dbo].[SP_DMCS_get_Location_ID_MAX]
	-- Add the parameters for the stored procedure here

       
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
SELECT max([Location_ID])
  FROM [disaster_mngt_test].[dbo].[location]

   
End



GO


GO

/****** Object:  StoredProcedure [dbo].[SP_DMCS_get_Pet_Deceased_ID]    Script Date: 8/30/2013 6:39:21 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Mike Phillips
-- Create date: 3/29/2013
-- Description:	get pet deceased id after insert
-- =============================================
ALTER PROCEDURE [dbo].[SP_DMCS_get_Pet_Deceased_ID]
	-- Add the parameters for the stored procedure here
            @Pet_Deceased_ID as int,
			@Pet_Name as varchar,
            @Date_Deceased AS DateTime,
            @Location AS varchar,
			@Funeral as varchar,
            @Cemetary_Name as varchar,
			@Deceased_Type as varchar,
            @Date_Created AS DateTime,
            @Date_Modified AS DateTime
       
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
SELECT [pet_deceased_id]
  FROM [disaster_mngt_test].[dbo].[Pet_Deceased]
 WHERE [Pet_Deceased_ID]= @Pet_Deceased_ID
   and [Pet_Name] = @Pet_Name
   and [Date_Deceased] = @Date_Deceased 
   and [Funeral] = @Funeral
   and [Cemetary_Name] = @Cemetary_Name
   and [Deceased_Type] =@Deceased_Type
   and [Date_Created] = @Date_Created
   and [Date_Modified] = @Date_Modified
        
End

GO


GO

/****** Object:  StoredProcedure [dbo].[SP_DMCS_get_Pet_Deceased_ID_MAX]    Script Date: 8/30/2013 6:39:28 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



-- =============================================
-- Author:		Mike Phillips
-- Create date: 3/29/2013
-- Description:	get pet deceased id after insert
-- =============================================
CREATE PROCEDURE [dbo].[SP_DMCS_get_Pet_Deceased_ID_MAX]

       
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
SELECT MAX([pet_deceased_id])
  FROM [disaster_mngt_test].[dbo].[Pet_Deceased]
 
        
End



GO


GO

/****** Object:  StoredProcedure [dbo].[SP_DMCS_get_pet_missingID]    Script Date: 8/30/2013 6:39:34 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Mike Phillips
-- Create date: 3/29/2012
-- Description:	get missing pet id after insert
-- =============================================
ALTER PROCEDURE [dbo].[SP_DMCS_get_pet_missingID]
	-- Add the parameters for the stored procedure here
            @Date_Missing AS DateTime = NULL,
            @Date_Reported AS DateTime = NULL,
            @Collar_Description as varchar (50) = NULL,
            @Time_Lost as DateTime = NULL,
            @Lost_Explanation as varchar (50) = NULL,
            @Length_Owned as int = NULL,
            @Reward_Amt as decimal = NULL,
            @Pet_Height as int = NULL,
            @Breeder as varchar (50) = NULL,
            @Pet_Sold as varchar (50) = NULL,
            @Bill_Of_Sale as varchar (50) = NULL,
            @Date_Created AS DateTime = NULL,
            @Date_Modified AS DateTime = NULL
       
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
SELECT [pet_missing_id]
  FROM [disaster_mngt_test].[dbo].[Pet_Missing]
 WHERE [Date_Missing] = @Date_Missing 
   or [Date_Reported] = @Date_Reported
   or [Collar_Description] = @Collar_Description
   or [Time_Lost] = @Time_Lost
   or [Length_Owned] = @Length_Owned
   or [Reward_Amt] = @Reward_Amt
   or [Pet_Height] = @Pet_Height
   or [Breeder] = @Breeder
   or [Pet_Sold] = @Pet_Sold
   or [Date_Created] = @Date_Created
   or [Date_Modified] = @Date_Modified 
        
End

GO


GO

/****** Object:  StoredProcedure [dbo].[SP_DMCS_get_pet_missingID_MAX]    Script Date: 8/30/2013 6:39:40 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



-- =============================================
-- Author:		Mike Phillips
-- Create date: 3/29/2012
-- Description:	get missing pet id after insert
-- =============================================
CREATE PROCEDURE [dbo].[SP_DMCS_get_pet_missingID_MAX]

       
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
SELECT max([pet_missing_id])
  FROM [disaster_mngt_test].[dbo].[Pet_Missing]

        
End



GO


GO

/****** Object:  StoredProcedure [dbo].[SP_DMCS_get_Pet_typeID]    Script Date: 8/30/2013 6:39:46 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Jianwang Xing
-- Create date: 3/29/2013
-- Description:	get pet type id after insert
-- =============================================
ALTER PROCEDURE [dbo].[SP_DMCS_get_Pet_typeID]
	-- Add the parameters for the stored procedure here
           
       @Pet_Species as Varchar,
       @Pet_Breed as Varchar,
	   @Pet_Type as Varchar
       
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
SELECT [pet_type_id]
  FROM [disaster_mngt_test].[dbo].[Pet_type]
 WHERE [Pet_Species] like @Pet_Species
   and [Pet_Breed] like @Pet_Breed
End

GO


GO

/****** Object:  StoredProcedure [dbo].[SP_DMCS_get_Pet_typeID_MAX]    Script Date: 8/30/2013 6:39:53 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



-- =============================================
-- Author:		Jianwang Xing
-- Create date: 3/29/2013
-- Description:	get pet type id after insert
-- =============================================
CREATE PROCEDURE [dbo].[SP_DMCS_get_Pet_typeID_MAX]
	-- Add the parameters for the stored procedure here

       
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
SELECT max([pet_type_id])
  FROM [disaster_mngt_test].[dbo].[Pet_type]

End



GO


GO

/****** Object:  StoredProcedure [dbo].[SP_DMCS_Get_Pet_Types_ddl]    Script Date: 8/30/2013 6:40:00 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Jianwang Xing
-- Create date: 3/29/2013
-- Description:	Get pet types for ddl
-- =============================================
ALTER PROCEDURE [dbo].[SP_DMCS_Get_Pet_Types_ddl] 
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	select '' as pet_type_id, '' as pet_type
	union
	select Pet_Type_ID,convert(varchar,Pet_Breed) + '(' + Convert(varchar,Pet_Species) + ')' as pet_type 
	from Pet_type
END

GO


GO

/****** Object:  StoredProcedure [dbo].[SP_DMCS_get_petsID]    Script Date: 8/30/2013 6:40:12 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Jianwang Xing
-- Create date: 3/29/2013
-- Description:	select Row from pet table
-- =============================================
ALTER PROCEDURE [dbo].[SP_DMCS_get_petsID]
	-- Add the parameters for the stored procedure here
	        @Pet_Record_ID as int = 0,
			@Pet_Medical_ID as int = 0,
			@Pet_Deceased_ID as int = 0,
			@Pet_Name as varchar(100) = Null,
            @Pet_Age as int = 0,
			@Date_Modified as DateTime = Null,
            @Date_Created as DateTime = Null,
            @Pet_Description as varchar(100) = Null,
            @Pet_Type_ID as int = 0,
            @Pet_Gender as varchar(1) = Null,
            @Pet_Color as varchar(50) = Null,
			@Pet_Vet_ID as varchar(50) = Null,
            @Pet_License_Tag as varchar(50) = Null,
            @Pet_Tatoo_No as varchar(50) = Null,
            @Pet_Spay_Neuter as varchar(1) = Null,
			@Pet_Weight as int = 0, 
            @Pet_Missing_ID as int = 0,
			@Picture as varbinary(max) = NULL

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
    if @Pet_Type_ID = 0
    begin
      set @Pet_Type_ID = null
    end

          
    SELECT [pet_record_id] 
      FROM [disaster_mngt_test].[dbo].[Pet] 
     WHERE [Pet_Name] like @Pet_Name
	  and [Pet_Record_ID] = @Pet_Record_ID
      and [Pet_Medical_ID] = @Pet_Medical_ID
	  and [Pet_Deceased_ID] = @Pet_Deceased_ID
      and [Pet_Age] = @Pet_Age
	  and [Date_Modified] =@Date_Modified
	  and [Date_Created] = @Date_Created
      and [Pet_Description] like @Pet_Description
      and [Pet_Gender] = @Pet_Gender
      and [Pet_Color] like @Pet_Color
      and [Pet_License_Tag] like @Pet_License_Tag
      and [Pet_Tatoo_No] like @Pet_Tatoo_No
      and [Pet_Spay_Neuter] = @Pet_Spay_Neuter
      and ([Pet_Type_ID] = @Pet_Type_ID or [Pet_Type_ID] is null) 
      and ([Pet_Weight] = @Pet_Weight) 
      and ([Pet_Vet_ID] = @Pet_Vet_ID)
	  and ([Pet_Missing_ID] = @Pet_Missing_ID)
	  and ([Picture] = @Picture)
     
      
END

GO


GO

/****** Object:  StoredProcedure [dbo].[SP_DMCS_get_petsID_MAX]    Script Date: 8/30/2013 6:40:17 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO




-- =============================================
-- Author:		Jianwang Xing
-- Create date: 3/29/2013
-- Description:	select Row from pet table
-- =============================================
CREATE PROCEDURE [dbo].[SP_DMCS_get_petsID_MAX]
	-- Add the parameters for the stored procedure here

AS
BEGIN

          
    SELECT max([Pet_Record_ID])
      FROM [disaster_mngt_test].[dbo].[Pet] 

     
      
END




GO


GO

/****** Object:  StoredProcedure [dbo].[SP_DMCS_Insert_location]    Script Date: 8/30/2013 6:40:30 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO




-- =============================================
-- Author:		Justin Gamble
-- Create date: 2/26/2013
-- Description:	Insert Row in Location table
-- =============================================
ALTER PROCEDURE [dbo].[SP_DMCS_Insert_location]
	-- Add the parameters for the stored procedure here
     
			
			@type as varchar (50),
			@city as varchar (50),
			@state as varchar (2),
			@zip as int,
			@county as varchar (50),
			@location_desc as varchar (3000),
			@n_long as decimal (21,18),
			@s_long as decimal (21,18),
			@e_long as decimal (21,18),
			@w_long as decimal (21,18),
			@n_lat as decimal (21,18),
			@s_lat as decimal (21,18),
			@e_lat as decimal (21,18),
			@w_lat as decimal (21,18)
      
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;


    -- Insert statements for procedure here
INSERT INTO [disaster_mngt_test].[dbo].[location]
           ([type]
           ,[city]
           ,[state]
           ,[zip]
           ,[county]
           ,[location_desc]
           ,[n_long]
           ,[s_long]
           ,[e_long]
           ,[w_long]
           ,[n_lat]
           ,[s_lat]
           ,[e_lat]
           ,[w_lat])
		   
     VALUES
           (@type, 
			@city, 
			@state,
			@zip, 
			@county,
			@location_desc,
			@n_long,
			@s_long,
			@e_long,
			@w_long,
			@n_lat,
			@s_lat,
			@e_lat,
			@w_lat)

 End




GO


GO

/****** Object:  StoredProcedure [dbo].[SP_DMCS_Insert_pet]    Script Date: 8/30/2013 6:40:43 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO






-- =============================================
-- Author:		Jianwang Xing
-- Create date: 3/29/2013
-- Description:	Insert Row on pet table
-- =============================================
ALTER PROCEDURE [dbo].[SP_DMCS_Insert_pet]
	-- Add the parameters for the stored procedure here
			@Pet_Medical_ID as int = 0,
			@Pet_Deceased_ID as int = 0,
	        @Pet_Name as varchar(100) = Null,
            @Pet_Age as int = 0,
			@Pet_RFID as int = 0,
            @Date_Modified as DateTime = Null,
            @Date_Created as DateTime = Null,
            @Pet_Description as Text = Null,
			@Pet_Type_ID as int = 0,
            @Pet_Gender as char(1) = Null,
            @Pet_Color as varchar(50) = Null,
			@Pet_Vet_ID as varchar(50) = Null,
            @Pet_License_Tag as varchar(50) = Null,
            @Pet_Tatoo_No as varchar(50) = Null,
            @Pet_Spay_Neuter as char(1) = Null, 
            @Pet_Missing_ID as int = 0,
			@Pet_Weight as int = 0,
            @pet_vaccine_id as int = 0,
			@Picture as varbinary(max) = NULL
 
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
if @Pet_Type_ID = 0
   set @Pet_Type_ID = null


if @Pet_deceased_ID = 0
   set @Pet_deceased_ID = null


if @Pet_Missing_ID = 0
   set @Pet_Missing_ID = null


IF @Pet_Vaccine_ID = 0
BEGIN
  SET @Pet_Vaccine_ID = NULL
END

IF @Picture = 0
BEGIN
  SET @Picture = NULL
END

IF @Pet_Medical_ID = 0
BEGIN
  SET @Pet_Medical_ID = NULL
END

    -- Insert statements for procedure here
	INSERT INTO [disaster_mngt_test].[dbo].[Pet]
           ([Pet_Medical_ID],
		    [Pet_Deceased_ID],
		    [Pet_Name],
            [Pet_Age],
			[Pet_RFID],
            [Date_Modified],
            [Date_Created],
            [Pet_Description],
            [Pet_Type_ID],
            [Pet_Gender],
            [Pet_Color],
			[Pet_Vet_ID],
            [Pet_License_Tag],
            [Pet_Tatoo_No],
            [Pet_Spay_Neuter],  
            [Pet_Missing_ID],
			[Pet_Weight],
            [Pet_Vaccine_ID],
			[Picture])
		 
          
     VALUES
           (@Pet_Medical_ID,
		    @Pet_Deceased_ID,
		    @Pet_Name,
            @Pet_Age,
			@Pet_RFID,
            @Date_Modified,
            @Date_Created,
            @Pet_Description,
            @Pet_Type_ID,
            @Pet_Gender,
            @Pet_Color,
            @Pet_Vet_ID,
			@Pet_License_Tag,
            @Pet_Tatoo_No,
            @Pet_Spay_Neuter,  
            @Pet_Missing_ID,
			@Pet_Weight,
            @pet_vaccine_id,
			@Picture)
END






GO


GO

/****** Object:  StoredProcedure [dbo].[SP_DMCS_Insert_Pet_Deceased]    Script Date: 8/30/2013 6:40:49 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO




-- =============================================
-- Author:		Mike Phillips
-- Create date: 3/29/2013
-- Description:	Insert Row in pet deceased table
-- =============================================
ALTER PROCEDURE [dbo].[SP_DMCS_Insert_Pet_Deceased]
	-- Add the parameters for the stored procedure here
		
			@Pet_Name AS varchar (50),
            @Date_Deceased AS DateTime,
			@Funeral as varchar (50),
            @Cemetary_Name as varchar (50),
			@Deceased_Type as varchar (50),
            @Date_Created AS DateTime,
            @Date_Modified AS DateTime
			
			 
      
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
INSERT INTO [disaster_mngt_test].[dbo].[Pet_Deceased]
           ([Pet_Name]
		   ,[Date_Deceased]
           ,[Funeral]
           ,[Cemetary_Name]
           ,[Deceased_Type]
           ,[Date_Created]
           ,[Date_Modified])

     VALUES
           (@Pet_Name,
            @Date_Deceased,
            @Funeral,
            @Cemetary_Name,
            @Deceased_Type,
            @Date_Created,
            @Date_Modified)

 End




GO


GO

/****** Object:  StoredProcedure [dbo].[SP_DMCS_Insert_Pet_Missing]    Script Date: 8/30/2013 6:40:54 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



-- =============================================
-- Author:		Jianwang Xing
-- Create date: 3/29/2013
-- Description:	Insert Row in missing pet table
-- =============================================
ALTER PROCEDURE [dbo].[SP_DMCS_Insert_Pet_Missing]
	-- Add the parameters for the stored procedure here
	        @Date_Missing AS DateTime,
            @Date_Reported AS DateTime,
            @Collar_Description as varchar (50),
            @Time_Lost as DateTime,
            @Lost_Explanation as varchar (50),
            @Length_Owned as int,
            @Reward_Amt as decimal,
            @Pet_Height as int,
            @Breeder as varchar (50),
            @Pet_Sold as varchar (50),
            @Bill_Of_Sale as varchar (50),
            @Date_Created AS DateTime,
            @Date_Modified AS DateTime
			
			 
      
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	IF @Reward_Amt = 0
BEGIN
  SET @Reward_Amt = NULL
END

    -- Insert statements for procedure here
INSERT INTO [disaster_mngt_test].[dbo].[Pet_Missing]
           ([Date_Missing]
           ,[Date_Reported]
           ,[Collar_Description]
           ,[Time_Lost]
           ,[Lost_Explanation]
           ,[Length_Owned]
           ,[Reward_Amt]
           ,[Pet_Height]
           ,[Breeder]
           ,[Pet_Sold]
           ,[Bill_Of_Sale]
           ,[Date_Created]
           ,[Date_Modified])

     VALUES
           (@Date_Missing,
            @Date_Reported,
            @Collar_Description,
            @Time_Lost,
            @Lost_Explanation,
            @Length_Owned,
            @Reward_Amt,
            @Pet_Height,
            @Breeder,
            @Pet_Sold,
            @Bill_Of_Sale,
            @Date_Created,
            @Date_Modified)

 End



GO


GO

/****** Object:  StoredProcedure [dbo].[SP_DMCS_Insert_Pet_type]    Script Date: 8/30/2013 6:41:02 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Jianwang Xing
-- Create date: 3/29/2013
-- Description:	Insert Row on pet type table
-- =============================================
ALTER PROCEDURE [dbo].[SP_DMCS_Insert_Pet_type]
	-- Add the parameters for the stored procedure here
       @Pet_Species as varchar (50),
       @Pet_Breed as varchar (50),
	   @Pet_Type as varchar (50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
INSERT INTO [disaster_mngt_test].[dbo].[Pet_type]
           ([Pet_Species]
           ,[Pet_Breed]
		   ,[Pet_Type])
     VALUES
           (@Pet_Species, 
            @Pet_Breed,
			@Pet_Type)
End

GO


GO

/****** Object:  StoredProcedure [dbo].[SP_DMCS_Select_location]    Script Date: 8/30/2013 6:41:30 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Justin Gamble
-- Create date: 2/26/2013
-- Description:	Select row on location table
-- =============================================
ALTER PROCEDURE [dbo].[SP_DMCS_Select_location]
	-- Add the parameters for the stored procedure here
           
           @Location_ID as int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
SELECT [Location_ID]
      ,[type]
      ,[city]
      ,[state]
      ,[zip]
      ,[county]
      ,[location_desc]
      ,[n_long]
      ,[s_long]
      ,[e_long]
      ,[w_long]
      ,[n_lat]
      ,[s_lat]
      ,[e_lat]
      ,[w_lat]
  FROM [disaster_mngt_test].[dbo].[location]
  WHERE Location_ID = @Location_ID
  
 END

GO


GO

/****** Object:  StoredProcedure [dbo].[SP_DMCS_Select_Location_WC]    Script Date: 8/30/2013 6:41:40 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		jim  
-- Create date: 7/8/2013
-- Description:	Select Row on disaster table
-- =============================================
CREATE PROCEDURE [dbo].[SP_DMCS_Select_Location_WC]
	-- Add the parameters for the stored procedure here
     
          @wareclause as char(100)
                
AS
BEGIN
									    
    Declare @string as varchar(300)
	Set @string = 'Select * from Location where ' + @wareclause
	Exec(@string)
 
  
End


GO


GO

/****** Object:  StoredProcedure [dbo].[SP_DMCS_Select_Pet]    Script Date: 8/30/2013 6:41:50 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



-- =============================================
-- Author:		Jim
-- Create date: 7/4/2013
-- Description:	Select row on person table
-- =============================================
CREATE PROCEDURE [dbo].[SP_DMCS_Select_Pet]
	-- Add the parameters for the stored procedure here
           
           @Pet_Record_ID as int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
SELECT [Pet_Record_ID]
      ,[Pet_Medical_ID]
      ,[Pet_Deceased_ID]
      ,[Pet_Name]
      ,[Pet_Age]
      ,[Pet_RFID]
      ,[Date_Modified]
      ,[Date_Created]
      ,[Pet_Description]
      ,[Pet_Type_ID]
      ,[Pet_Gender]
      ,[Pet_Color]
      ,[Pet_Vet_ID]
      ,[Pet_License_Tag]
      ,[Pet_Tatoo_No]
      ,[Pet_Spay_Neuter]
      ,[Pet_Missing_ID]
      ,[Pet_Weight]
      ,[Pet_Vaccine_ID]
      ,[Picture]
  FROM [disaster_mngt_test].[dbo].[Pet]
 WHERE Pet_Record_ID = @Pet_Record_ID
        
End



GO


GO

/****** Object:  StoredProcedure [dbo].[SP_DMCS_Select_pet_WC]    Script Date: 8/30/2013 6:42:00 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Edward Sobanski
-- Create date: 6/12/2012
-- Description:	select Row from pets table
-- =============================================
CREATE PROCEDURE [dbo].[SP_DMCS_Select_pet_WC]
	-- Add the parameters for the stored procedure here
	 @wareclause as char(100)
AS
BEGIN
											    
    Declare @string as varchar(300)
	Set @string = 'Select * from pet where ' + @wareclause
	Exec(@string)
 
END

GO


GO

/****** Object:  StoredProcedure [dbo].[SP_DMCS_Select_Pet_Deceased]    Script Date: 8/30/2013 6:42:08 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		James Miller
-- Create date: 7/8/2013
-- Description:	Select Row on pet_missing table
-- =============================================
CREATE PROCEDURE [dbo].[SP_DMCS_Select_Pet_Deceased]
	-- Add the parameters for the stored procedure here
     
          @Pet_Deceased_ID as int	  
                
AS
BEGIN
				SET NOCOUNT ON;
				SELECT 	[Pet_Deceased_ID]
						,[Pet_Name]
						,[Date_Deceased]
						,[Funeral]
						,[Cemetary_Name]
						,[Deceased_Type]
						,[Date_Created]
						,[Date_Modified]
						
	FROM [disaster_mngt_test].[dbo].[Pet_Deceased]
	WHERE Pet_Deceased_ID = @Pet_Deceased_ID
 
End


GO


GO

/****** Object:  StoredProcedure [dbo].[SP_DMCS_Select_Pet_Deceased_WC]    Script Date: 8/30/2013 6:42:14 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		Jim
-- Create date: 3/29/2013
-- Description:	Select Row on disaster table
-- =============================================
CREATE PROCEDURE [dbo].[SP_DMCS_Select_Pet_Deceased_WC]
	-- Add the parameters for the stored procedure here
     
          @wareclause as char(100)
                
AS
BEGIN
									    
    Declare @string as varchar(300)
	Set @string = 'Select * from Pet_Deceased where ' + @wareclause
	Exec(@string)
 
  
End


GO


GO

/****** Object:  StoredProcedure [dbo].[SP_DMCS_Select_Pet_missing]    Script Date: 8/30/2013 6:42:20 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Jianwang Xing
-- Create date: 3/29/2013
-- Description:	Select Row on pet_missing table
-- =============================================
ALTER PROCEDURE [dbo].[SP_DMCS_Select_Pet_missing]
	-- Add the parameters for the stored procedure here
     
          @Pet_Missing_Id as int	  
                
AS
BEGIN
				SET NOCOUNT ON;
				SELECT 	[Pet_Missing_Id],
						[Date_Missing],
						[Date_Reported],
						[Collar_Description],
						[Time_Lost],
						[Lost_Explanation],
						[Length_Owned],
						[Reward_Amt],
						[Pet_Height],
						[Breeder],
						[Pet_Sold],
						[Bill_Of_Sale],
						[Date_Created],
						[Date_Modified]
						
	FROM [disaster_mngt_test].[dbo].[Pet_Missing]
	WHERE Pet_Missing_Id = @Pet_Missing_ID
 
End

GO


GO

/****** Object:  StoredProcedure [dbo].[SP_DMCS_Select_Pet_missing_WC]    Script Date: 8/30/2013 6:42:27 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Jianwang Xing
-- Create date: 3/29/2013
-- Description:	Select Row on disaster table
-- =============================================
ALTER PROCEDURE [dbo].[SP_DMCS_Select_Pet_missing_WC]
	-- Add the parameters for the stored procedure here
     
          @wareclause as char(100)
                
AS
BEGIN
									    
    Declare @string as varchar(300)
	Set @string = 'Select * from Pets_Missing where ' + @wareclause
	Exec(@string)
 
  
End

GO


GO

/****** Object:  StoredProcedure [dbo].[SP_DMCS_Select_Pet_Type]    Script Date: 8/30/2013 6:42:33 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



-- =============================================
-- Author:		Jianwang Xing
-- Create date: 3/29/2013
-- Description:	select Row from pet type table
-- =============================================
ALTER PROCEDURE [dbo].[SP_DMCS_Select_Pet_Type]
	-- Add the parameters for the stored procedure here
	   @Pet_Type_ID as int

	   

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT [Pet_Type_Id]
          ,[Pet_Species]
          ,[Pet_Type]
		  ,[Pet_Breed]
		  
    FROM [disaster_mngt_test].[dbo].[Pet_type]
    WHERE Pet_Type_Id = @Pet_Type_Id
END



GO


GO

/****** Object:  StoredProcedure [dbo].[SP_DMCS_Select_Pet_Type_WC]    Script Date: 8/30/2013 6:42:39 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Jianwang Xing
-- Create date: 3/29/2013
-- Description:	select Row from pet type table
-- =============================================
ALTER PROCEDURE [dbo].[SP_DMCS_Select_Pet_Type_WC]
	-- Add the parameters for the stored procedure here
	 @wareclause as char(100)
AS
BEGIN
											    
    Declare @string as varchar(300)
	Set @string = 'Select * from pet_type where ' + @wareclause
	Exec(@string)
 
END

GO


GO

/****** Object:  StoredProcedure [dbo].[SP_DMCS_Select_PetAndPetType_WC]    Script Date: 8/30/2013 6:42:46 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO




-- =============================================
-- Author:		jim
-- Create date: 6/12/2012
-- Description:	select Row from pets table
-- =============================================
CREATE PROCEDURE [dbo].[SP_DMCS_Select_PetAndPetType_WC]
	-- Add the parameters for the stored procedure here
	 @wareclause as char(100)
AS
BEGIN
											    
    Declare @string as varchar(300)
	Set @string = 'select distinct * from pet, Pet_type where pet.Pet_Record_ID = Pet_type.Pet_Type_ID and  ' + @wareclause
	Exec(@string)
 
END




GO


GO

/****** Object:  StoredProcedure [dbo].[SP_DMCS_Update_location]    Script Date: 8/30/2013 6:43:20 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO




-- =============================================
-- Author:		Justin Gamble
-- Create date: 2/26/2013
-- Description:	update Rows on Location table
-- =============================================
ALTER PROCEDURE [dbo].[SP_DMCS_Update_location]
	-- Add the parameters for the stored procedure here
			@Location_ID as int,
			@type as varchar (50),
			@city as varchar (50),
			@state as varchar (2),
			@zip as int,
			@county as varchar (50),
			@location_desc as varchar (3000),
			@n_long as decimal (21,18),
			@s_long as decimal (21,18),
			@e_long as decimal (21,18),
			@w_long as decimal (21,18),
			@n_lat as decimal (21,18),
			@s_lat as decimal (21,18),
			@e_lat as decimal (21,18),
			@w_lat as decimal (21,18)
			
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
if @Location_ID = 0
begin
   set @Location_ID = null
end

IF @s_long = 0
BEGIN
  SET @s_long = NULL
END

IF @e_long = 0
BEGIN
  SET @e_long = NULL
END

IF @w_long = 0
BEGIN
  SET @w_long = NULL
END

IF @s_lat = 0
BEGIN
  SET @s_lat = NULL
END

IF @e_lat = 0
BEGIN
  SET @e_lat = NULL
END

IF @w_lat = 0
BEGIN
  SET @w_lat = NULL
END


 -- Insert statements for procedure here
UPDATE [disaster_mngt_test].[dbo].[location]
   SET [type] = @type,
     [city] = @city,
     [state] = @state,
     [zip] = @zip,
     [county] = @county,
     [location_desc] = @location_desc,
     [n_long] = @n_long,
     [s_long] = @s_long,
     [e_long] = @e_long,
     [w_long] = @w_long,
     [n_lat] = @n_lat,
     [s_lat] = @s_lat,
     [e_lat] = @e_lat,
     [w_lat] = @w_lat 
 WHERE Location_ID = @Location_ID
 END




GO


GO

/****** Object:  StoredProcedure [dbo].[SP_DMCS_Update_pet]    Script Date: 8/30/2013 6:43:27 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO




-- =============================================
-- Author:		Jianwang Xing
-- Create date: 3/29/2013
-- Description:	update Row on pet table
-- =============================================
ALTER PROCEDURE [dbo].[SP_DMCS_Update_pet]
	-- Add the parameters for the stored procedure here
	        @Pet_Record_ID as int,
			@Pet_Medical_ID as int,
			@Pet_Deceased_ID as int,
            @Pet_Name as varchar(50),
            @Pet_Age as int,
			@Pet_RFID as int,
            @Date_Modified as DateTime,
            @Date_Created as DateTime,
            @Pet_Description as Text,
            @Pet_Type_ID as int,
            @Pet_Gender as varchar(50),
            @Pet_Color as varchar(50),
            @Pet_Vet_ID as varchar(50),
            @Pet_License_Tag as varchar(50),
            @Pet_Tatoo_No as varchar(50),
            @Pet_Spay_Neuter as varchar(50),
			@Pet_Missing_ID as int,
			@Pet_Weight as int,
			@Pet_Vaccine_ID as int,
			@Picture as varbinary(max)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

IF @Pet_Type_ID = 0
BEGIN
  SET @Pet_Type_ID = NULL
END

IF @Pet_Deceased_ID = 0
BEGIN
  SET @Pet_Deceased_ID = NULL
END

IF @Pet_Vet_ID = 0
BEGIN
  SET @Pet_Vet_ID = NULL
END

IF @Pet_Missing_ID = 0
BEGIN
  SET @Pet_Missing_ID = NULL
END

IF @Pet_Vaccine_ID = 0
BEGIN
  SET @Pet_Vaccine_ID = NULL
END

IF @Picture = 0
BEGIN
  SET @Picture = NULL
END
   
    -- Insert statements for procedure here
	UPDATE [disaster_mngt_test].[dbo].[Pet]
       SET [Pet_Medical_ID] =@Pet_Medical_ID,
		   [Pet_Deceased_ID] = @Pet_Deceased_ID,
	       [Pet_Name] = @Pet_Name,
           [Pet_Age] = @Pet_Age,
		   [Pet_RFID] = @Pet_RFID,
           [Date_Modified] = @Date_Modified,
           [Date_Created] = @Date_Created,
           [Pet_Description] = @Pet_Description,
           [Pet_Type_ID] = @Pet_Type_ID,
           [Pet_Gender] = @Pet_Gender,
           [Pet_Color] = @Pet_Color,
           [Pet_Vet_ID] = @Pet_Vet_ID,
           [Pet_License_Tag] = @Pet_License_Tag,
           [Pet_Tatoo_No] = @Pet_Tatoo_No,
           [Pet_Spay_Neuter] = @Pet_Spay_Neuter,
           [Pet_Missing_ID] = @Pet_Missing_ID,
		   [Pet_Weight] = @Pet_Weight,
		   [Pet_Vaccine_ID] = @Pet_Vaccine_ID,
		   [Picture] = @Picture 
    WHERE Pet_Record_ID = @Pet_Record_ID
END




GO


GO

/****** Object:  StoredProcedure [dbo].[SP_DMCS_Update_Pet_Deceased]    Script Date: 8/30/2013 6:43:32 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO




-- =============================================
-- Author:		Mike Phillips
-- Create date: 3/29/2013
-- Description:	Update Row on pet deceased table
-- =============================================
ALTER PROCEDURE [dbo].[SP_DMCS_Update_Pet_Deceased]
	-- Add the parameters for the stored procedure here
			
			@Pet_Deceased_ID as int,
			@Pet_Name AS varchar(50),
            @Date_Deceased AS DateTime,
			@Funeral as varchar(50),
            @Cemetary_Name as varchar(50),
			@Deceased_Type as varchar(50),
            @Date_Modified AS DateTime
       
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
  UPDATE [disaster_mngt_test].[dbo].[Pet_Deceased]
   SET [Pet_Name] = @Pet_Name
      ,[Date_Deceased] = @Date_Deceased
      ,[Funeral] = @Funeral
      ,[Cemetary_Name] = @Cemetary_Name
      ,[Deceased_Type] = @Deceased_Type
      ,[Date_Modified] = @Date_Modified
 WHERE Pet_Deceased.Pet_Deceased_ID = @Pet_Deceased_ID
        
End




GO


GO

/****** Object:  StoredProcedure [dbo].[SP_DMCS_Update_Pet_Missing]    Script Date: 8/30/2013 6:43:39 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



-- =============================================
-- Author:		Jianwang Xing
-- Create date:3/29/2013
-- Description:	Update Row on missing pet table
-- =============================================
ALTER PROCEDURE [dbo].[SP_DMCS_Update_Pet_Missing]
	-- Add the parameters for the stored procedure here
			@Pet_Missing_ID as int,
            @Date_Missing AS DateTime,
            @Collar_Description as varchar (50),
            @Time_Lost as DateTime,
            @Lost_Explanation as varchar (50),
            @Length_Owned as int,
            @Reward_Amt as decimal,
            @Pet_Height as int,
            @Breeder as varchar (50),
            @Pet_Sold as varchar (50),
            @Bill_Of_Sale as varchar (50),
            @Date_Modified AS DateTime
       
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;



    -- Insert statements for procedure here
  UPDATE [disaster_mngt_test].[dbo].[Pet_Missing]
   SET [Date_Missing] = @Date_Missing
      ,[Collar_Description] = @Collar_Description
      ,[Time_Lost] = @Time_Lost
      ,[Lost_Explanation] = @Lost_Explanation
      ,[Length_Owned] = @Length_Owned
      ,[Reward_Amt] = @Reward_Amt
      ,[Pet_Height] = @Pet_Height
      ,[Breeder] = @Breeder
      ,[Pet_Sold] = @Pet_Sold
      ,[Bill_Of_Sale] = @Bill_Of_Sale
      ,[Date_Modified] = @Date_Modified
 WHERE Pet_Missing.Pet_Missing_ID = @Pet_Missing_ID
        
End



GO


GO

/****** Object:  StoredProcedure [dbo].[SP_DMCS_Update_Pet_Type]    Script Date: 8/30/2013 6:43:44 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		Jianwang Xing
-- Create date: 3/29/2013
-- Description:	update Row on pet type table
-- =============================================
ALTER PROCEDURE [dbo].[SP_DMCS_Update_Pet_Type]
	-- Add the parameters for the stored procedure here
	   @Pet_Type_ID as int,
       @Pet_Species as varchar(30),
       @Pet_Breed as varchar(30),
	   @Pet_Type as varchar(30)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	UPDATE [disaster_mngt_test].[dbo].[Pet_type]
       SET [Pet_Species] = @Pet_Species,
           [Pet_Breed] = @Pet_Breed,
		   [Pet_Type] = @Pet_Type
    WHERE Pet_Type_ID = @Pet_Type_ID
END


GO










GO

/****** Object:  StoredProcedure [dbo].[SP_DMCS_Location_Person_Mobileunit]    Script Date: 11/11/2013 5:30:53 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[SP_DMCS_Location_Person_Mobileunit]
    (
        @dmlLat decimal(18, 12),
        @dmlLng decimal(18, 12),
        @intRadius int
    )
    As
 
SET NOCOUNT ON
 
DECLARE @intMilesModifier int
SET @intMilesModifier = 3959  -- If using kilometers, use 6371 instead of 3959
 
-- Select locations that are near the parameters based on distance formula on a sphere
SELECT        
resource.Resource_ID, 
resource.Location_ID, 
person.person_id, 
employee.employee_id,
mobile_unit.mobile_unit_id, 
mobile_unit.vehicle_id, 
mobile_unit.call_center_id,
type, 
city, 
state, 
zip, 
county, 
location_desc,
n_long, 
n_lat,  
address_id, 
address_id2, 
birthdate, 
certification_number, 
f_name, 
m_initial, 
l_name, 
gender, 
person_type,
phone_primary, 
phone_secondary, 
email, 
employee_department, 
employee_leadership,
employee_motivation, 
employee_notes, 
employee_overall, 
employee_payrate,
employee_performance, 
employee_quality, 
employee_timeliness, 
 
mobile_desc,
vehicle_desc,
vin,
client_id,
vehicle_make,
vehicle_model,
vehicle_type,
vehicle_year,
FUELTYPE,
PLATENUMBER,
      
	  (@intMilesModifier*acos(cos(radians(@dmlLat))*cos(radians(n_lat))*cos(radians(n_long)-
       radians(@dmlLng))+sin(radians(@dmlLat))*sin(radians(n_lat)))) AS distance
FROM            location, resource, person, employee, mobile_employees, mobile_unit, vehicle
WHERE			location.Location_ID = resource.Location_ID 
				AND resource.Resource_ID = person.Resource_ID
                AND person.person_id = employee.employee_id 
                AND employee.employee_id = mobile_employees.employee_id 
                AND mobile_employees.mobile_unit_id = mobile_unit.mobile_unit_id
				AND mobile_unit.vehicle_id = vehicle.vehicle_id
	and (@intMilesModifier*acos(cos(radians(@dmlLat))*cos(radians(n_lat))*cos(radians(n_long)-
       radians(@dmlLng))+sin(radians(@dmlLat))*sin(radians(n_lat)))) < @intRadius
 ORDER BY distance
-- Return XML for formatting results
FOR XML RAW('marker'),ROOT('markers')
 
SET NOCOUNT OFF

GO




GO

/****** Object:  StoredProcedure [dbo].[SP_DMCS_Location_Resources_In_Warehouse]    Script Date: 11/11/2013 5:31:21 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO









CREATE PROCEDURE [dbo].[SP_DMCS_Location_Resources_In_Warehouse]
    (
        @dmlLat decimal(18, 12),
        @dmlLng decimal(18, 12),
        @intRadius int
    )
    As
 
SET NOCOUNT ON
 
DECLARE @intMilesModifier int
SET @intMilesModifier = 3959  -- If using kilometers, use 6371 instead of 3959
 
-- Select locations that are near the parameters based on distance formula on a sphere
SELECT        
resource.Resource_ID, 
products.product_id,  
resource.Location_ID, 

product_name, 
product_desc, 
product_type, 
products.product_qty,
products.FEMA_ID,

location.type,
location.location_desc,
location.city,
location.county,
location.state,
location.zip,
location.n_lat,
location.n_long,

FEMA_Description,
Make,
Model,
Weight,
Equipment,

      
	  (@intMilesModifier*acos(cos(radians(@dmlLat))*cos(radians(n_lat))*cos(radians(n_long)-
       radians(@dmlLng))+sin(radians(@dmlLat))*sin(radians(n_lat)))) AS distance

FROM  dbo.resource, dbo.products, dbo.warehouse_product_Location, dbo.location, dbo.warehouse, dbo.address, FEMA
WHERE	resource.Resource_ID = products.Resource_ID
		AND products.product_id = warehouse_product_Location.product_id
		AND products.FEMA_ID = FEMA.FEMA_ID
		AND warehouse_product_Location.warehouse_id = warehouse.warehouse_id
		AND location.Location_ID =warehouse_product_Location.Location_ID
		AND warehouse.address_id =address.address_id
		

	and (@intMilesModifier*acos(cos(radians(@dmlLat))*cos(radians(n_lat))*cos(radians(n_long)-
       radians(@dmlLng))+sin(radians(@dmlLat))*sin(radians(n_lat)))) < @intRadius
 Order By distance
-- Return XML for formatting results
FOR XML RAW('marker'),ROOT('markers')
 
SET NOCOUNT OFF






GO


GO

/****** Object:  StoredProcedure [dbo].[SP_DMCS_Location_Resources_In_Warehouse_Non_FEMA]    Script Date: 11/11/2013 5:31:55 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO










CREATE PROCEDURE [dbo].[SP_DMCS_Location_Resources_In_Warehouse_Non_FEMA]
    (
        @dmlLat decimal(18, 12),
        @dmlLng decimal(18, 12),
        @intRadius int
    )
    As
 
SET NOCOUNT ON
 
DECLARE @intMilesModifier int
SET @intMilesModifier = 3959  -- If using kilometers, use 6371 instead of 3959
 
-- Select locations that are near the parameters based on distance formula on a sphere
SELECT        
resource.Resource_ID, 
products.product_id,  
resource.Location_ID, 

product_name, 
product_desc, 
product_type, 
products.product_qty,
products.FEMA_ID,
products.Product_subtype,

location.type,
location.location_desc,
location.city,
location.county,
location.state,
location.zip,
location.n_lat,
location.n_long,

FEMA_Description,
Make,
Model,
Weight,


      
	  (@intMilesModifier*acos(cos(radians(@dmlLat))*cos(radians(n_lat))*cos(radians(n_long)-
       radians(@dmlLng))+sin(radians(@dmlLat))*sin(radians(n_lat)))) AS distance

FROM  dbo.resource, dbo.products, dbo.warehouse_product_Location, dbo.location, dbo.warehouse, dbo.address
WHERE	resource.Resource_ID = products.Resource_ID
		AND products.product_id = warehouse_product_Location.product_id
		AND warehouse_product_Location.warehouse_id = warehouse.warehouse_id
		AND location.Location_ID = warehouse_product_Location.Location_ID
		AND warehouse.address_id = address.address_id
		AND products.FEMA_ID IS NULL
		

	and (@intMilesModifier*acos(cos(radians(@dmlLat))*cos(radians(n_lat))*cos(radians(n_long)-
       radians(@dmlLng))+sin(radians(@dmlLat))*sin(radians(n_lat)))) < @intRadius
 Order BY distance
-- Return XML for formatting results
FOR XML RAW('marker'),ROOT('markers')
 
SET NOCOUNT OFF





GO





GO

/****** Object:  StoredProcedure [dbo].[SP_DMCS_Location_Resources_Not_In_Warehouse]    Script Date: 11/11/2013 5:32:12 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO






CREATE PROCEDURE [dbo].[SP_DMCS_Location_Resources_Not_In_Warehouse]
    (
        @dmlLat decimal(18, 12),
        @dmlLng decimal(18, 12),
        @intRadius int
    )
    As
 
SET NOCOUNT ON
 
DECLARE @intMilesModifier int
SET @intMilesModifier = 3959  -- If using kilometers, use 6371 instead of 3959
 
-- Select locations that are near the parameters based on distance formula on a sphere
SELECT 
resource.Resource_ID, 
products.product_id,  
resource.Location_ID, 

product_name, 
product_desc, 
product_type, 
product_qty,
FEMA_ID,

location.type,
location.location_desc,
location.city,
location.county,
location.state,
location.zip,
location.n_lat,
location.n_long,

      
	  (@intMilesModifier*acos(cos(radians(@dmlLat))*cos(radians(n_lat))*cos(radians(n_long)-
       radians(@dmlLng))+sin(radians(@dmlLat))*sin(radians(n_lat)))) AS distance

FROM dbo.location, dbo.resource, dbo.products
WHERE products.Resource_ID = resource.Resource_ID
	and  resource.Location_ID = location.Location_ID
	and (@intMilesModifier*acos(cos(radians(@dmlLat))*cos(radians(n_lat))*cos(radians(n_long)-
       radians(@dmlLng))+sin(radians(@dmlLat))*sin(radians(n_lat)))) < @intRadius
 
-- Return XML for formatting results
FOR XML RAW('marker'),ROOT('markers')
 
SET NOCOUNT OFF








GO



GO

/****** Object:  StoredProcedure [dbo].[SP_DMCS_WC_Location_Resources_Not_In_Warehouse]    Script Date: 11/11/2013 5:35:06 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[SP_DMCS_WC_Location_Resources_Not_In_Warehouse]
    (
        @dmlLat decimal(18, 12),
        @dmlLng decimal(18, 12),
        @intRadius int,
		@wcType1 as char(100),
		@wcType2 as char(100),
		@wcType3 as char(100),
		@wcType4 as char(100),
		@wcType5 as char(100),
		@wcType6 as char(100),
		@wcType7 as char(100),
		@wcType8 as char(100),
		@wcType9 as char(100),
		@wcType10 as char(100)
    )
    As
 
SET NOCOUNT ON
 
DECLARE @intMilesModifier int
SET @intMilesModifier = 3959  -- If using kilometers, use 6371 instead of 3959
 
-- Select locations that are near the parameters based on distance formula on a sphere
SELECT 
resource.Resource_ID, 
products.product_id,  
resource.Location_ID, 
product_name, 
product_desc, 
product_type, 
product_qty,
FEMA_ID,
location.type,
location.location_desc,
location.city,
location.county,
location.state,
location.zip,
location.n_lat,
location.n_long,
      
	  (@intMilesModifier*acos(cos(radians(@dmlLat))*cos(radians(n_lat))*cos(radians(n_long)-
       radians(@dmlLng))+sin(radians(@dmlLat))*sin(radians(n_lat)))) AS distance
FROM dbo.location, dbo.resource, dbo.products
WHERE products.Resource_ID = resource.Resource_ID
	and  resource.Location_ID = location.Location_ID
	and product_type in (COALESCE(@wcType1,null), COALESCE(@wcType2,null), COALESCE(@wcType3,null), 
	COALESCE(@wcType4,null),COALESCE(@wcType5,null), COALESCE(@wcType6,null), COALESCE(@wcType7,null), 
	COALESCE(@wcType8,null),COALESCE(@wcType9,null), COALESCE(@wcType10,null) )
	and (@intMilesModifier*acos(cos(radians(@dmlLat))*cos(radians(n_lat))*cos(radians(n_long)-
       radians(@dmlLng))+sin(radians(@dmlLat))*sin(radians(n_lat)))) < @intRadius
ORDER BY distance
-- Return XML for formatting results
FOR XML RAW('marker'),ROOT('markers')
 
SET NOCOUNT OFF

GO



GO

/****** Object:  StoredProcedure [dbo].[SP_DMCS_Location_Resources_Warehouse_Inventory]    Script Date: 11/11/2013 5:35:47 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO





CREATE PROCEDURE [dbo].[SP_DMCS_Location_Resources_Warehouse_Inventory]
    (
        @dmlLat decimal(18, 12),
        @dmlLng decimal(18, 12),
        @intRadius int
    )
    As
 
SET NOCOUNT ON
 
DECLARE @intMilesModifier int
SET @intMilesModifier = 3959  -- If using kilometers, use 6371 instead of 3959
 
-- Select locations that are near the parameters based on distance formula on a sphere
SELECT        
resource.Resource_ID, 
products.product_id, 
warehouse_product_Location.warehouse_product_location_id, 
warehouse_product_Location.Location_ID,
warehouse_product_Location.qty_commit,
warehouse_product_Location.qty_onhand,
warehouse_product_Location.qty_order, 
warehouse.warehouse_name,
warehouse.warehouse_type,
address.str_add,
address.city,
address.state, 
address.zip_plus_four,
products.product_name,
products.Make,
products.Model,
products.FEMA_Description,
products.Availability,
products.product_type,
products.Product_subtype,
products.product_desc,
location.n_lat,
location.n_long,
      
	  (@intMilesModifier*acos(cos(radians(@dmlLat))*cos(radians(n_lat))*cos(radians(n_long)-
       radians(@dmlLng))+sin(radians(@dmlLat))*sin(radians(n_lat)))) AS distance
FROM  dbo.resource, dbo.products, dbo.warehouse_product_Location, dbo.location, dbo.warehouse, dbo.address
WHERE	resource.Resource_ID = products.Resource_ID
		AND products.product_id = warehouse_product_Location.product_id
		AND warehouse_product_Location.warehouse_id = warehouse.warehouse_id
		AND location.Location_ID =warehouse_product_Location.Location_ID
		AND warehouse.address_id =address.address_id
		And products.product_id < 100
	and (@intMilesModifier*acos(cos(radians(@dmlLat))*cos(radians(n_lat))*cos(radians(n_long)-
       radians(@dmlLng))+sin(radians(@dmlLat))*sin(radians(n_lat)))) < @intRadius
ORDER BY distance
 
SET NOCOUNT OFF





GO



GO

/****** Object:  StoredProcedure [dbo].[SP_DMCS_WC_Location_Resources_Warehouse_Inventory]    Script Date: 11/11/2013 5:36:08 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[SP_DMCS_WC_Location_Resources_Warehouse_Inventory]
    (
        @dmlLat decimal(18, 12),
        @dmlLng decimal(18, 12),
        @intRadius int,
		@wcType1 as char(100),
		@wcType2 as char(100),
		@wcType3 as char(100),
		@wcType4 as char(100),
		@wcType5 as char(100),
		@wcType6 as char(100),
		@wcType7 as char(100),
		@wcType8 as char(100),
		@wcType9 as char(100),
		@wcType10 as char(100)
    )
    As
 
SET NOCOUNT ON
 
DECLARE @intMilesModifier int
SET @intMilesModifier = 3959  -- If using kilometers, use 6371 instead of 3959
 
-- Select locations that are near the parameters based on distance formula on a sphere
SELECT        
resource.Resource_ID, 
products.product_id, 
warehouse_product_Location.warehouse_product_location_id, 
warehouse_product_Location.Location_ID, 
warehouse.warehouse_name,
warehouse.warehouse_type,
address.str_add,
address.city,
address.state, 
address.zip_plus_four,
products.product_name,
products.Make,
products.Model,
products.FEMA_Description,
products.Availability,
location.n_lat,
location.n_long,
      
	  (@intMilesModifier*acos(cos(radians(@dmlLat))*cos(radians(n_lat))*cos(radians(n_long)-
       radians(@dmlLng))+sin(radians(@dmlLat))*sin(radians(n_lat)))) AS distance
FROM  dbo.resource, dbo.products, dbo.warehouse_product_Location, dbo.location, dbo.warehouse, dbo.address
WHERE	resource.Resource_ID = products.Resource_ID
		AND products.product_id = warehouse_product_Location.product_id
		AND warehouse_product_Location.warehouse_id = warehouse.warehouse_id
		AND location.Location_ID =warehouse_product_Location.Location_ID
		AND warehouse.address_id =address.address_id
	and Product_subtype in (COALESCE(@wcType1,null), COALESCE(@wcType2,null), COALESCE(@wcType3,null), 
	COALESCE(@wcType4,null),COALESCE(@wcType5,null), COALESCE(@wcType6,null), COALESCE(@wcType7,null), 
	COALESCE(@wcType8,null),COALESCE(@wcType9,null), COALESCE(@wcType10,null) )
	and (@intMilesModifier*acos(cos(radians(@dmlLat))*cos(radians(n_lat))*cos(radians(n_long)-
       radians(@dmlLng))+sin(radians(@dmlLat))*sin(radians(n_lat)))) < @intRadius
ORDER BY distance
 
SET NOCOUNT OFF


GO



GO

/****** Object:  StoredProcedure [dbo].[SP_DMCS_WC_Location_Resources]    Script Date: 11/11/2013 5:38:36 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO








CREATE PROCEDURE [dbo].[SP_DMCS_WC_Location_Resources]
    (
        @dmlLat decimal(18, 12),
        @dmlLng decimal(18, 12),
        @intRadius int,
		@wcType1 as varchar(100),
		@wcType2 as varchar(100),
		@wcType3 as varchar(100),
		@wcType4 as varchar(100),
		@wcType5 as varchar(100),
		@wcType6 as varchar(100),
		@wcType7 as varchar(100),
		@wcType8 as varchar(100),
		@wcType9 as varchar(100),
		@wcType10 as varchar(100)
    )
    As
 
SET NOCOUNT ON
 
DECLARE @intMilesModifier int
SET @intMilesModifier = 3959  -- If using kilometers, use 6371 instead of 3959
 
-- Select locations that are near the parameters based on distance formula on a sphere
SELECT        
resource.Resource_ID, 
products.product_id,  
resource.Location_ID, 

product_name, 
product_desc, 
product_type,
Product_subtype, 
products.product_qty,
products.FEMA_ID,

Products.FEMA_Description,
Products.Make,
Products.Model,
Products.Weight,

location.type,
location.location_desc,
location.city,
location.county,
location.state,
location.zip,
location.n_lat,
location.n_long,

FEMA.Equipment,



      
	  (@intMilesModifier*acos(cos(radians(@dmlLat))*cos(radians(n_lat))*cos(radians(n_long)-
       radians(@dmlLng))+sin(radians(@dmlLat))*sin(radians(n_lat)))) AS distance

FROM  dbo.resource, dbo.products, dbo.warehouse_product_Location, dbo.location, dbo.warehouse, dbo.address, dbo.FEMA
WHERE	resource.Resource_ID = products.Resource_ID
		AND products.product_id = warehouse_product_Location.product_id
		AND products.FEMA_ID = FEMA.FEMA_ID
		AND warehouse_product_Location.warehouse_id = warehouse.warehouse_id
		AND location.Location_ID =warehouse_product_Location.Location_ID
		AND warehouse.address_id =address.address_id

	and FEMA_Description in (COALESCE(@wcType1,null), COALESCE(@wcType2,null), COALESCE(@wcType3,null), 
	COALESCE(@wcType4,null),COALESCE(@wcType5,null), COALESCE(@wcType6,null), COALESCE(@wcType7,null), 
	COALESCE(@wcType8,null),COALESCE(@wcType9,null), COALESCE(@wcType10,null) )
	and (@intMilesModifier*acos(cos(radians(@dmlLat))*cos(radians(n_lat))*cos(radians(n_long)-
       radians(@dmlLng))+sin(radians(@dmlLat))*sin(radians(n_lat)))) < @intRadius
ORDER BY distance
 


-- Return XML for formatting results
FOR XML RAW('marker'),ROOT('markers')
 
SET NOCOUNT OFF






GO








GO

/****** Object:  StoredProcedure [dbo].[SP_DMCS_WC_Location_Resources_nonFEMA]    Script Date: 11/11/2013 5:38:58 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO








CREATE PROCEDURE [dbo].[SP_DMCS_WC_Location_Resources_nonFEMA]
    (
        @dmlLat decimal(18, 12),
        @dmlLng decimal(18, 12),
        @intRadius int,
		@wcType1 as varchar(100),
		@wcType2 as varchar(100),
		@wcType3 as varchar(100),
		@wcType4 as varchar(100),
		@wcType5 as varchar(100),
		@wcType6 as varchar(100),
		@wcType7 as varchar(100),
		@wcType8 as varchar(100),
		@wcType9 as varchar(100),
		@wcType10 as varchar(100)
    )
    As
 
SET NOCOUNT ON
 
DECLARE @intMilesModifier int
SET @intMilesModifier = 3959  -- If using kilometers, use 6371 instead of 3959
 
-- Select locations that are near the parameters based on distance formula on a sphere
SELECT        
resource.Resource_ID, 
products.product_id,  
resource.Location_ID, 

product_name, 
product_desc, 
product_type, 
products.product_qty,
products.FEMA_ID,
products.Product_subtype,

location.type,
location.location_desc,
location.city,
location.county,
location.state,
location.zip,
location.n_lat,
location.n_long,

FEMA_Description,
Make,
Model,
Weight,



      
	  (@intMilesModifier*acos(cos(radians(@dmlLat))*cos(radians(n_lat))*cos(radians(n_long)-
       radians(@dmlLng))+sin(radians(@dmlLat))*sin(radians(n_lat)))) AS distance


FROM  dbo.resource, dbo.products, dbo.warehouse_product_Location, dbo.location, dbo.warehouse, dbo.address
WHERE	resource.Resource_ID = products.Resource_ID
		AND products.product_id = warehouse_product_Location.product_id
		AND warehouse_product_Location.warehouse_id = warehouse.warehouse_id
		AND location.Location_ID = warehouse_product_Location.Location_ID
		AND warehouse.address_id = address.address_id
		AND products.FEMA_ID IS NULL

	and product_type in (COALESCE(@wcType1,null), COALESCE(@wcType2,null), COALESCE(@wcType3,null), 
	COALESCE(@wcType4,null),COALESCE(@wcType5,null), COALESCE(@wcType6,null), COALESCE(@wcType7,null), 
	COALESCE(@wcType8,null),COALESCE(@wcType9,null), COALESCE(@wcType10,null) )
	and (@intMilesModifier*acos(cos(radians(@dmlLat))*cos(radians(n_lat))*cos(radians(n_long)-
       radians(@dmlLng))+sin(radians(@dmlLat))*sin(radians(n_lat)))) < @intRadius
ORDER BY distance
 


-- Return XML for formatting results
FOR XML RAW('marker'),ROOT('markers')
 
SET NOCOUNT OFF






GO


GO

/****** Object:  StoredProcedure [dbo].[SP_DMCS_Update_Warehouse_Product_Location_QTY]    Script Date: 11/11/2013 5:40:01 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO




-- =============================================
-- Author:		Edward Sobanski
-- Create date: 5/22/2012
-- Description:	Update row on warehouse products table
-- =============================================
CREATE PROCEDURE [dbo].[SP_DMCS_Update_Warehouse_Product_Location_QTY]
	-- Add the parameters for the stored procedure here
            
    @warehouse_product_location_id as int, 
	@qty_onhand as int,
	@qty_commit as int
            
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
UPDATE [disaster_mngt_test].[dbo].[warehouse_product_Location]
   SET [qty_onhand] = @qty_onhand
	   ,[qty_commit] = @qty_commit



 WHERE warehouse_product_location_id = @warehouse_product_location_id
           
End




GO


GO

/****** Object:  StoredProcedure [dbo].[SP_DMCS_Update_Warehouse_Product_Location]    Script Date: 11/11/2013 5:40:10 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



-- =============================================
-- Author:		Edward Sobanski
-- Create date: 5/22/2012
-- Description:	Update row on warehouse products table
-- =============================================
CREATE PROCEDURE [dbo].[SP_DMCS_Update_Warehouse_Product_Location]
	-- Add the parameters for the stored procedure here
            
    @warehouse_product_location_id as int, 
	@warehouse_id as int,
	@product_id as int,
	@Location_ID as int,
	@service_id as int,
	@Time_Date_MIA as datetime,
	@Experiation_Date as datetime,
	@min_inv as int,
	@status as varchar,
	@Exp_delivery_date as datetime,
	@qty_onhand as int,
	@qty_commit as int,
	@qty_order as int,
	@encounter_id as int
            
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
IF @warehouse_id = 0
BEGIN
  SET @warehouse_id = NULL
END
   
IF @product_id = 0
BEGIN
  SET @product_id = NULL
END
   

IF @service_id = 0
BEGIN
  SET @service_id = NULL
END   
    -- Insert statements for procedure here
UPDATE [disaster_mngt_test].[dbo].[warehouse_product_Location]
   SET [warehouse_id] = @warehouse_id 
	   ,[product_id] = @product_id
	   ,[Location_ID] = @Location_ID
	   ,[service_id] =  @service_id
       ,[Time_Date_MIA] = @Time_Date_MIA
       ,[Experiation_Date] = @Experiation_Date
       ,[min_inv]  =  @min_inv
       ,[status] = @status
       ,[Exp_delivery_date] = @Exp_delivery_date  
	   ,[qty_onhand] = @qty_onhand
	   ,[qty_commit] = @qty_commit
	   ,[qty_order] = @qty_order
	   ,[encounter_id] = @encounter_id 


 WHERE warehouse_product_location_id = @warehouse_product_location_id
           
End



GO


GO

/****** Object:  StoredProcedure [dbo].[SP_DMCS_Select_warehouseID_BY_Products_AND_Warehouse_Product_Location_WC]    Script Date: 11/11/2013 5:40:38 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO




-- =============================================
-- Author:		Edward Sobanski
-- Create date: 5/22/2012
-- Description:	Select row on products table
-- =============================================
create PROCEDURE [dbo].[SP_DMCS_Select_warehouseID_BY_Products_AND_Warehouse_Product_Location_WC]
	-- Add the parameters for the stored procedure here
           
          @wareclause as char(100)
AS
BEGIN
	
	Declare @string as varchar(300)
	Set @string = 'Select * from warehouse_product_Location, products where products.product_id = warehouse_product_Location.product_id and warehouse_product_Location.warehouse_ID = ' + @wareclause
	Exec(@string)
        
End




GO



GO

/****** Object:  StoredProcedure [dbo].[SP_DMCS_Delete_Encounter_Pet]    Script Date: 11/11/2013 5:46:22 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



-- =============================================
-- Author:		Edward Sobanski
-- Create date: 4/21/2012
-- Description:Delete Encounter record
-- =============================================
CREATE PROCEDURE [dbo].[SP_DMCS_Delete_Encounter_Pet]
	@Pet_Record_ID integer = 0
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	Delete dbo.encounter
	where Pet_Record_ID = @Pet_Record_ID
	 
	
END



GO


GO

/****** Object:  StoredProcedure [dbo].[SP_DMCS_get_Case_intakeID_MAX]    Script Date: 11/11/2013 5:49:41 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		Edward Sobanski
-- Create date: 5/31/2012
-- Description:	Select Row from Case intake table
-- =============================================
create PROCEDURE [dbo].[SP_DMCS_get_Case_intakeID_MAX]

      
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
  SELECT max([case_id]) FROM [disaster_mngt_test].[dbo].[case_intake] 
   

 End


GO


GO

/****** Object:  StoredProcedure [dbo].[SP_DMCS_get_Requestor_OrderID_MAX]    Script Date: 11/11/2013 5:54:11 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



-- =============================================
-- Author:		Edward Sobanski
-- Create date: 6/3/2012
-- Description:	Select row on Requestor order table
-- =============================================
CREATE PROCEDURE [dbo].[SP_DMCS_get_Requestor_OrderID_MAX]
	-- Add the parameters for the stored procedure here

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
     
    SELECT MAX([OrderID]) 
      FROM [disaster_mngt_test].[dbo].[requestor_Order] 
     
     
End



GO



GO

/****** Object:  StoredProcedure [dbo].[SP_DMCS_GrabEquiptmentList]    Script Date: 11/11/2013 5:55:27 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO










CREATE PROCEDURE [dbo].[SP_DMCS_GrabEquiptmentList]

    As
 
SET NOCOUNT ON
 
SELECT 
FEMA_ID as 'key',
Equipment AS value 

FROM FEMA

 
-- Return XML for formatting results
FOR XML RAW,ROOT('product')
 
SET NOCOUNT OFF












GO



GO

/****** Object:  StoredProcedure [dbo].[SP_DMCS_Location_CallCenter]    Script Date: 11/11/2013 6:01:14 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO











CREATE PROCEDURE [dbo].[SP_DMCS_Location_CallCenter]
    (
        @dmlLat decimal(18, 12),
        @dmlLng decimal(18, 12),
        @intRadius int
    )
    As
 
SET NOCOUNT ON
 
DECLARE @intMilesModifier int
SET @intMilesModifier = 3959  -- If using kilometers, use 6371 instead of 3959
 
-- Select locations that are near the parameters based on distance formula on a sphere
SELECT        
call_center.call_center_id,
call_center.call_center_name,
call_center.address_id,

address.address_type_id,
address.city,
address.country,
address.latitude,
address.longitude,
address.state,
address.str_add,
address.str_add2,
address.zip_plus_four,


      
	  (@intMilesModifier*acos(cos(radians(@dmlLat))*cos(radians(latitude))*cos(radians(longitude)-
       radians(@dmlLng))+sin(radians(@dmlLat))*sin(radians(latitude)))) AS distance

FROM   dbo.call_center, dbo.address
WHERE	call_center.address_id = address.address_id

	and (@intMilesModifier*acos(cos(radians(@dmlLat))*cos(radians(latitude))*cos(radians(longitude)-
       radians(@dmlLng))+sin(radians(@dmlLat))*sin(radians(latitude)))) < @intRadius
 
-- Return XML for formatting results
FOR XML RAW('marker'),ROOT('markers')
 
SET NOCOUNT OFF













GO


GO

/****** Object:  StoredProcedure [dbo].[SP_DMCS_Location_Person_Mobileunit_Non_XML]    Script Date: 11/11/2013 6:01:22 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[SP_DMCS_Location_Person_Mobileunit_Non_XML]
    (
        @dmlLat decimal(18, 12),
        @dmlLng decimal(18, 12),
        @intRadius int
    )
    As
 
SET NOCOUNT ON
 
DECLARE @intMilesModifier int
SET @intMilesModifier = 3959  -- If using kilometers, use 6371 instead of 3959
 
-- Select locations that are near the parameters based on distance formula on a sphere
SELECT        
resource.Resource_ID, 
resource.Location_ID, 
person.person_id, 
employee.employee_id,
mobile_unit.mobile_unit_id, 
mobile_unit.vehicle_id, 
mobile_unit.call_center_id,
type, 
city, 
state, 
zip, 
county, 
location_desc,
n_long, 
n_lat,  
address_id, 
address_id2, 
birthdate, 
certification_number, 
f_name, 
m_initial, 
l_name, 
gender, 
person_type,
phone_primary, 
phone_secondary, 
email, 
employee_department, 
employee_leadership,
employee_motivation, 
employee_notes, 
employee_overall, 
employee_payrate,
employee_performance, 
employee_quality, 
employee_timeliness, 
 
mobile_desc,
vehicle_desc,
vin,
client_id,
vehicle_make,
vehicle_model,
vehicle_type,
vehicle_year,
FUELTYPE,
PLATENUMBER,
      
	  (@intMilesModifier*acos(cos(radians(@dmlLat))*cos(radians(n_lat))*cos(radians(n_long)-
       radians(@dmlLng))+sin(radians(@dmlLat))*sin(radians(n_lat)))) AS distance
FROM            location, resource, person, employee, mobile_employees, mobile_unit, vehicle
WHERE			location.Location_ID = resource.Location_ID 
				AND resource.Resource_ID = person.Resource_ID
                AND person.person_id = employee.employee_id 
                AND employee.employee_id = mobile_employees.employee_id 
                AND mobile_employees.mobile_unit_id = mobile_unit.mobile_unit_id
				AND mobile_unit.vehicle_id = vehicle.vehicle_id
	and (@intMilesModifier*acos(cos(radians(@dmlLat))*cos(radians(n_lat))*cos(radians(n_long)-
       radians(@dmlLng))+sin(radians(@dmlLat))*sin(radians(n_lat)))) < @intRadius
 ORDER BY distance

 
SET NOCOUNT OFF


GO


GO

/****** Object:  StoredProcedure [dbo].[SP_DMCS_Location_Resources_Warehouse]    Script Date: 11/11/2013 6:02:34 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO









CREATE PROCEDURE [dbo].[SP_DMCS_Location_Resources_Warehouse]
    (
        @dmlLat decimal(18, 12),
        @dmlLng decimal(18, 12),
        @intRadius int
    )
    As
 
SET NOCOUNT ON
 
DECLARE @intMilesModifier int
SET @intMilesModifier = 3959  -- If using kilometers, use 6371 instead of 3959
 
-- Select locations that are near the parameters based on distance formula on a sphere
SELECT        
warehouse.warehouse_id,
warehouse.warehouse_name,
warehouse.warehouse_type,
warehouse.address_id,

address.address_type_id,
address.city,
address.country,
address.latitude,
address.longitude,
address.state,
address.str_add,
address.str_add2,
address.zip_plus_four,


      
	  (@intMilesModifier*acos(cos(radians(@dmlLat))*cos(radians(latitude))*cos(radians(longitude)-
       radians(@dmlLng))+sin(radians(@dmlLat))*sin(radians(latitude)))) AS distance

FROM   dbo.warehouse, dbo.address
WHERE	warehouse.address_id = address.address_id

	and (@intMilesModifier*acos(cos(radians(@dmlLat))*cos(radians(latitude))*cos(radians(longitude)-
       radians(@dmlLng))+sin(radians(@dmlLat))*sin(radians(latitude)))) < @intRadius
 
-- Return XML for formatting results
FOR XML RAW('marker'),ROOT('markers')
 
SET NOCOUNT OFF











GO


GO

/****** Object:  StoredProcedure [dbo].[SP_DMCS_Select_Agency_By_Address_ID]    Script Date: 11/11/2013 6:03:43 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		Edward Sobanski
-- Create date: 5/21/2012
-- Description:	select Row from agency table
-- =============================================
CREATE PROCEDURE [dbo].[SP_DMCS_Select_Agency_By_Address_ID]
	-- Add the parameters for the stored procedure here
	  @address_id as int

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT [agency_id]
          ,[address_id]
          ,[agency_name]
    FROM [disaster_mngt_test].[dbo].[agency]
    WHERE address_id = @address_id
END


GO


GO

/****** Object:  StoredProcedure [dbo].[SP_DMCS_Select_Mobile_Product_By_Mobileunit_ID_And_Product_ID]    Script Date: 11/11/2013 6:07:58 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO





-- =============================================
-- Author:		Edward Sobanski
-- Create date: 6/20/2012
-- Description:	Select row on mobile product table
-- =============================================
create PROCEDURE [dbo].[SP_DMCS_Select_Mobile_Product_By_Mobileunit_ID_And_Product_ID]
	-- Add the parameters for the stored procedure here
           
          @Mobile_Unit_id as int,
		  @Product_id as int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
SELECT [Mobile_Product_id]
      ,[Mobile_Unit_id]
      ,[Product_id]
      ,[Case_id]
      ,[Lot_id]
      ,[Min_inv]
      ,[Quantity]
      ,[Experiation_Date]
  FROM [disaster_mngt_test].[dbo].[Mobile_Product]
 WHERE Mobile_Unit_id = @Mobile_Unit_id AND Product_id = @Product_id
        
End





GO


GO

/****** Object:  StoredProcedure [dbo].[SP_DMCS_Select_mobileunit_ID_Mobile_Products_WC]    Script Date: 11/11/2013 6:09:23 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO





-- =============================================
-- Author:		Edward Sobanski
-- Create date: 5/22/2012
-- Description:	Select row on products table
-- =============================================
create PROCEDURE [dbo].[SP_DMCS_Select_mobileunit_ID_Mobile_Products_WC]
	-- Add the parameters for the stored procedure here
           
          @wareclause as char(100)
AS
BEGIN
	
	Declare @string as varchar(300)
	Set @string = 'Select * from warehouse_product_Location, products, Mobile_Product, mobile_unit where products.product_id = warehouse_product_Location.product_id and products.product_id = Mobile_Product.product_id and Mobile_Product.Mobile_Unit_id = mobile_unit.mobile_unit_id and mobile_unit.mobile_unit_id = ' + @wareclause
	Exec(@string)
        
End





GO

GO

/****** Object:  StoredProcedure [dbo].[SP_DMCS_Select_Orders_By_Warehouse]    Script Date: 11/11/2013 6:09:36 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



-- =============================================
-- Author:		Edward Sobanski
-- Create date: 5/22/2012
-- Description:	Select row on products table
-- =============================================
CREATE PROCEDURE [dbo].[SP_DMCS_Select_Orders_By_Warehouse]
	-- Add the parameters for the stored procedure here
           
           @warehouse_id as int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
SELECT DISTINCT 
                         dbo.Order_Product.warehouseid, dbo.Order_Product.orderID, dbo.requestor_Order.Requestor_ID, dbo.requestor.PersonID, dbo.requestor.EncounterID, 
                         dbo.person.f_name, dbo.person.l_name, dbo.person.phone_primary, dbo.person.email
FROM            dbo.case_intake INNER JOIN
                         dbo.case_client ON dbo.case_intake.case_id = dbo.case_client.case_id INNER JOIN
                         dbo.encounter ON dbo.case_intake.case_id = dbo.encounter.case_id INNER JOIN
                         dbo.requestor_Order INNER JOIN
                         dbo.requestor ON dbo.requestor_Order.Requestor_ID = dbo.requestor.RequestorID INNER JOIN
                         dbo.Order_Product ON dbo.requestor_Order.OrderID = dbo.Order_Product.orderID INNER JOIN
                         dbo.products ON dbo.Order_Product.ProductID = dbo.products.product_id ON dbo.encounter.encounter_id = dbo.requestor_Order.EncounterID AND 
                         dbo.encounter.encounter_id = dbo.requestor.EncounterID INNER JOIN
                         dbo.warehouse ON dbo.Order_Product.warehouseid = dbo.warehouse.warehouse_id INNER JOIN
                         dbo.person ON dbo.requestor.PersonID = dbo.person.person_id INNER JOIN
                         dbo.client ON dbo.case_client.client_id = dbo.client.client_id AND dbo.encounter.client_id = dbo.client.client_id AND 
                         dbo.person.person_id = dbo.client.client_id AND
						 dbo.Order_Product.warehouseid = @warehouse_id;
        
End



GO



GO

/****** Object:  StoredProcedure [dbo].[SP_DMCS_Select_Orders_Resources_By_orderID]    Script Date: 11/11/2013 6:09:43 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



-- =============================================
-- Author:		Edward Sobanski
-- Create date: 5/22/2012
-- Description:	Select row on products table
-- =============================================
CREATE PROCEDURE [dbo].[SP_DMCS_Select_Orders_Resources_By_orderID]
	-- Add the parameters for the stored procedure here
           
           @orderID as int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
SELECT        dbo.Order_Product.orderID, dbo.Order_Product.ProductID, dbo.products.product_name, dbo.products.product_desc, dbo.products.FEMA_Description
FROM            dbo.products INNER JOIN
                         dbo.Order_Product ON dbo.products.product_id = dbo.Order_Product.ProductID AND dbo.Order_Product.orderID = @orderID
        
End



GO


GO

/****** Object:  StoredProcedure [dbo].[SP_DMCS_Select_Products_AND_Warehouse_Product_Location_WC]    Script Date: 11/11/2013 6:10:56 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



-- =============================================
-- Author:		Edward Sobanski
-- Create date: 5/22/2012
-- Description:	Select row on products table
-- =============================================
create PROCEDURE [dbo].[SP_DMCS_Select_Products_AND_Warehouse_Product_Location_WC]
	-- Add the parameters for the stored procedure here
           
          @wareclause as char(100)
AS
BEGIN
	
	Declare @string as varchar(300)
	Set @string = 'Select * from warehouse_product_Location, products where products.product_id = warehouse_product_Location.product_id and ' + @wareclause
	Exec(@string)
        
End



GO

GO

/****** Object:  StoredProcedure [dbo].[SP_DMCS_Select_Products_by_Mobile_Unit_ID_WC]    Script Date: 11/11/2013 6:11:04 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO







-- =============================================
-- Author:		Edward Sobanski
-- Create date: 5/22/2012
-- Description:	Select row on mobile Unit table
-- =============================================
CREATE PROCEDURE [dbo].[SP_DMCS_Select_Products_by_Mobile_Unit_ID_WC]
	-- Add the parameters for the stored procedure here
           
           @wareclause as char(3000)
AS
BEGIN
			
	Declare @string as varchar(3000)
	Set @string = 'Select products.product_id,products.FEMA_Description,products.product_name,products.product_type,products.Product_subtype,products.Make,products.Model,Mobile_Product.Quantity, warehouse_product_Location.Experiation_Date from Mobile_Unit, Mobile_Product, products, warehouse_product_Location where mobile_unit.mobile_unit_id = Mobile_Product.Mobile_unit_id and Mobile_Product.Product_id = products.product_id and products.product_id = warehouse_product_Location.product_id and ' + @wareclause
	Exec(@string)
        
        
End







GO



GO

/****** Object:  StoredProcedure [dbo].[SP_DMCS_Select_Warehouse_by_Address_id]    Script Date: 11/11/2013 6:13:14 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



-- =============================================
-- Author:		Edward Sobanski
-- Create date: 5/22/2012
-- Description:	Select row on warehouse table
-- =============================================
CREATE PROCEDURE [dbo].[SP_DMCS_Select_Warehouse_by_Address_id]
	-- Add the parameters for the stored procedure here
             
            @address_id as int
            
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	SELECT [warehouse_id]
      ,[warehouse_name]
      ,warehouse.address_id
      ,[warehouse_type]
  FROM warehouse
 WHERE warehouse.address_id = @address_id
 
    -- Insert statements for procedure here

End



GO


GO

/****** Object:  StoredProcedure [dbo].[SP_DMCS_Select_warehouse_product_location_By_Product_ID]    Script Date: 11/11/2013 6:14:35 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO




-- =============================================
-- Author:		Edward Sobanski
-- Create date: 5/22/2012
-- Description:	Select row on warehouse products table
-- =============================================
CREATE PROCEDURE [dbo].[SP_DMCS_Select_warehouse_product_location_By_Product_ID]
	-- Add the parameters for the stored procedure here
            
            @product_id as int
            
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
SELECT [warehouse_product_location_id]
      ,[warehouse_id]
      ,[product_id]
      ,[Location_ID]
      ,[service_id]
      ,[Time_Date_MIA]
      ,[Experiation_Date]
      ,[min_inv]
      ,[status]
	  ,[Exp_delivery_date]
      ,[qty_onhand]
	  ,[qty_commit]
	  ,[qty_order]
	  ,[encounter_id]

  FROM [disaster_mngt_test].[dbo].[warehouse_product_Location]
 WHERE product_id = @product_id
           
End




COMMIT

