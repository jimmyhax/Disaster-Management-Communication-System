/****** Object:  Database [disaster_management_DEV]    Script Date: 08/23/2012 22:23:03 ******/
CREATE DATABASE [disaster_management_DEV]
GO
ALTER DATABASE [disaster_management_DEV] SET ANSI_NULL_DEFAULT OFF
GO
ALTER DATABASE [disaster_management_DEV] SET ANSI_NULLS OFF
GO
ALTER DATABASE [disaster_management_DEV] SET ANSI_PADDING OFF
GO
ALTER DATABASE [disaster_management_DEV] SET ANSI_WARNINGS OFF
GO
ALTER DATABASE [disaster_management_DEV] SET ARITHABORT OFF
GO
ALTER DATABASE [disaster_management_DEV] SET AUTO_CLOSE OFF
GO
ALTER DATABASE [disaster_management_DEV] SET AUTO_CREATE_STATISTICS ON
GO
ALTER DATABASE [disaster_management_DEV] SET AUTO_SHRINK OFF
GO
ALTER DATABASE [disaster_management_DEV] SET AUTO_UPDATE_STATISTICS ON
GO
ALTER DATABASE [disaster_management_DEV] SET CURSOR_CLOSE_ON_COMMIT OFF
GO
ALTER DATABASE [disaster_management_DEV] SET CURSOR_DEFAULT  GLOBAL
GO
ALTER DATABASE [disaster_management_DEV] SET CONCAT_NULL_YIELDS_NULL OFF
GO
ALTER DATABASE [disaster_management_DEV] SET NUMERIC_ROUNDABORT OFF
GO
ALTER DATABASE [disaster_management_DEV] SET QUOTED_IDENTIFIER OFF
GO
ALTER DATABASE [disaster_management_DEV] SET RECURSIVE_TRIGGERS OFF
GO
ALTER DATABASE [disaster_management_DEV] SET  ENABLE_BROKER
GO
ALTER DATABASE [disaster_management_DEV] SET AUTO_UPDATE_STATISTICS_ASYNC OFF
GO
ALTER DATABASE [disaster_management_DEV] SET DATE_CORRELATION_OPTIMIZATION OFF
GO
ALTER DATABASE [disaster_management_DEV] SET TRUSTWORTHY OFF
GO
ALTER DATABASE [disaster_management_DEV] SET ALLOW_SNAPSHOT_ISOLATION OFF
GO
ALTER DATABASE [disaster_management_DEV] SET PARAMETERIZATION SIMPLE
GO
ALTER DATABASE [disaster_management_DEV] SET READ_COMMITTED_SNAPSHOT OFF
GO
ALTER DATABASE [disaster_management_DEV] SET HONOR_BROKER_PRIORITY OFF
GO
ALTER DATABASE [disaster_management_DEV] SET  READ_WRITE
GO
ALTER DATABASE [disaster_management_DEV] SET RECOVERY FULL
GO
ALTER DATABASE [disaster_management_DEV] SET  MULTI_USER
GO
ALTER DATABASE [disaster_management_DEV] SET PAGE_VERIFY CHECKSUM
GO
ALTER DATABASE [disaster_management_DEV] SET DB_CHAINING OFF
GO
EXEC sys.sp_db_vardecimal_storage_format N'disaster_management_DEV', N'ON'
GO
USE [disaster_management_DEV]
GO
/****** Object:  Table [dbo].[account]    Script Date: 3/7/2014 5:04:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[account](
	[Account_ID] [int] IDENTITY(1,1) NOT NULL,
	[Bank_ID] [int] NOT NULL,
	[Account_Num] [varchar](15) NOT NULL,
	[Type] [varchar](20) NOT NULL,
 CONSTRAINT [pk_Account_Account_ID] PRIMARY KEY CLUSTERED 
(
	[Account_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[address]    Script Date: 3/7/2014 5:04:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[address](
	[address_id] [int] IDENTITY(1,1) NOT NULL,
	[address_type_id] [int] NOT NULL,
	[city] [varchar](30) NOT NULL,
	[country] [varchar](30) NOT NULL,
	[County_Township] [varchar](30) NULL,
	[longitude] [decimal](18, 12) NULL,
	[latitude] [decimal](18, 12) NULL,
	[state] [char](2) NOT NULL,
	[str_add] [varchar](30) NOT NULL,
	[str_add2] [varchar](30) NULL,
	[zip_plus_four] [varchar](10) NULL,
 CONSTRAINT [address_address_id_pk] PRIMARY KEY CLUSTERED 
(
	[address_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[agency]    Script Date: 3/7/2014 5:04:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[agency](
	[agency_id] [int] IDENTITY(1,1) NOT NULL,
	[address_id] [int] NOT NULL,
	[agency_name] [varchar](50) NOT NULL,
	[primary_fName] [varchar](50) NOT NULL,
	[primary_lName] [varchar](50) NOT NULL,
	[primary_phone] [varchar](50) NOT NULL,
	[sec_fName] [varchar](50) NULL,
	[sec_lName] [varchar](50) NULL,
	[sec_phone] [varchar](50) NULL,
 CONSTRAINT [agency_agency_id_pk] PRIMARY KEY CLUSTERED 
(
	[agency_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[agency_employees]    Script Date: 3/7/2014 5:04:01 PM ******/
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
/****** Object:  Table [dbo].[bank]    Script Date: 3/7/2014 5:04:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[bank](
	[Bank_ID] [int] IDENTITY(1,1) NOT NULL,
	[Routing_Num] [varchar](20) NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[IsFDIC] [bit] NOT NULL,
 CONSTRAINT [bank_id_pk] PRIMARY KEY CLUSTERED 
(
	[Bank_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[call_center]    Script Date: 3/7/2014 5:04:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[call_center](
	[call_center_id] [int] IDENTITY(1,1) NOT NULL,
	[address_id] [int] NOT NULL,
	[call_center_name] [varchar](50) NOT NULL,
 CONSTRAINT [call_center_id_pk] PRIMARY KEY CLUSTERED 
(
	[call_center_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[call_center_employee]    Script Date: 3/7/2014 5:04:01 PM ******/
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
/****** Object:  Table [dbo].[campaign]    Script Date: 3/7/2014 5:04:01 PM ******/
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
/****** Object:  Table [dbo].[case_client]    Script Date: 3/7/2014 5:04:01 PM ******/
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
/****** Object:  Table [dbo].[case_intake]    Script Date: 3/7/2014 5:04:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[case_intake](
	[case_id] [int] IDENTITY(1,1) NOT NULL,
	[applic_end_date_time] [datetime] NULL,
	[applic_start_date_time] [datetime] NOT NULL,
	[circum_emergency_event] [varchar](3) NOT NULL,
	[circum_help_request_memo] [text] NOT NULL,
	[circum_income_stolen] [varchar](3) NOT NULL,
	[circum_memo] [text] NOT NULL,
	[circum_no_income] [varchar](3) NOT NULL,
	[circum_not_enough_income] [varchar](3) NOT NULL,
	[agency_id] [int] NULL,
	[call_center_id] [int] NULL,
 CONSTRAINT [case_case_id_pk] PRIMARY KEY CLUSTERED 
(
	[case_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[client]    Script Date: 3/7/2014 5:04:01 PM ******/
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
/****** Object:  Table [dbo].[ClientWPets]    Script Date: 3/7/2014 5:04:01 PM ******/
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
/****** Object:  Table [dbo].[debt]    Script Date: 3/7/2014 5:04:01 PM ******/
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
/****** Object:  Table [dbo].[deceased]    Script Date: 3/7/2014 5:04:01 PM ******/
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
/****** Object:  Table [dbo].[disaster]    Script Date: 3/7/2014 5:04:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[disaster](
	[disaster_id] [int] IDENTITY(1,1) NOT NULL,
	[disaster_name] [varchar](50) NOT NULL,
	[disaster_type] [varchar](30) NOT NULL,
	[disaster_start_date] [datetime] NOT NULL,
	[disaster_end_date] [datetime] NULL,
	[disaster_north_latitude] [decimal](18, 12) NULL,
	[disaster_north_longitude] [decimal](18, 12) NULL,
	[disaster_south_latitude] [decimal](18, 12) NULL,
	[disaster_south_longitude] [decimal](18, 12) NULL,
	[disaster_east_latitude] [decimal](18, 12) NULL,
	[disaster_east_longitude] [decimal](18, 12) NULL,
	[disaster_west_latitude] [decimal](18, 12) NULL,
	[disaster_west_longitude] [decimal](18, 12) NULL,
 CONSTRAINT [dis_disaster_id_pk] PRIMARY KEY CLUSTERED 
(
	[disaster_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[disaster_encounter]    Script Date: 3/7/2014 5:04:01 PM ******/
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
/****** Object:  Table [dbo].[donation]    Script Date: 3/7/2014 5:04:01 PM ******/
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
/****** Object:  Table [dbo].[Donor]    Script Date: 3/7/2014 5:04:01 PM ******/
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
/****** Object:  Table [dbo].[Donor_Product]    Script Date: 3/7/2014 5:04:01 PM ******/
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
/****** Object:  Table [dbo].[emergency_medical]    Script Date: 3/7/2014 5:04:01 PM ******/
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
/****** Object:  Table [dbo].[employee]    Script Date: 3/7/2014 5:04:01 PM ******/
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
/****** Object:  Table [dbo].[employee_clients]    Script Date: 3/7/2014 5:04:01 PM ******/
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
/****** Object:  Table [dbo].[employer]    Script Date: 3/7/2014 5:04:01 PM ******/
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
/****** Object:  Table [dbo].[encounter]    Script Date: 3/7/2014 5:04:01 PM ******/
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
/****** Object:  Table [dbo].[encounter_client_vaccine]    Script Date: 3/7/2014 5:04:01 PM ******/
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
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[encounter_services]    Script Date: 3/7/2014 5:04:01 PM ******/
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
/****** Object:  Table [dbo].[expense]    Script Date: 3/7/2014 5:04:01 PM ******/
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
/****** Object:  Table [dbo].[FEMA]    Script Date: 3/7/2014 5:04:01 PM ******/
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
/****** Object:  Table [dbo].[food]    Script Date: 3/7/2014 5:04:01 PM ******/
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
/****** Object:  Table [dbo].[house]    Script Date: 3/7/2014 5:04:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[house](
	[house_id] [int] IDENTITY(1,1) NOT NULL,
	[house_name] [varchar](50) NOT NULL,
	[house_eligibility] [varchar](15) NULL,
	[house_request_date] [datetime] NOT NULL,
	[house_voucher_amt] [money] NOT NULL,
	[house_voucher_begin_date] [datetime] NOT NULL,
	[house_voucher_exp_date] [datetime] NOT NULL,
	[house_voucher_num] [int] NOT NULL,
	[house_voucher_schedule] [varchar](10) NOT NULL,
	[house_wait_list] [int] NOT NULL,
 CONSTRAINT [house_id_pk] PRIMARY KEY CLUSTERED 
(
	[house_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[house_choice]    Script Date: 3/7/2014 5:04:02 PM ******/
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
/****** Object:  Table [dbo].[income_source]    Script Date: 3/7/2014 5:04:02 PM ******/
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
/****** Object:  Table [dbo].[job]    Script Date: 3/7/2014 5:04:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[job](
	[job_id] [int] IDENTITY(1,1) NOT NULL,
	[address_id] [int] NOT NULL,
	[company_id] [int] NOT NULL,
	[job_cat_id] [int] NOT NULL,
	[job_posted_date] [datetime] NOT NULL,
	[job_status] [varchar](10) NOT NULL,
	[job_title] [varchar](15) NOT NULL,
	[Work_Classification_Full_time] [varchar](15) NOT NULL,
	[Work_Classification_Part_time] [varchar](15) NOT NULL,
	[Work_Payment_Freq_Weekly] [varchar](15) NOT NULL,
	[Work_Payment_Freq_Bi-Weekly] [varchar](15) NOT NULL,
	[Work_Payment_Freq_Monthly] [varchar](15) NOT NULL,
	[Work_Payment_Freq_Bi-Monthly] [varchar](15) NOT NULL,
 CONSTRAINT [job_job_id_pk] PRIMARY KEY CLUSTERED 
(
	[job_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[job_category]    Script Date: 3/7/2014 5:04:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[job_category](
	[job_cat_id] [int] IDENTITY(1,1) NOT NULL,
	[job_category_name] [varchar](30) NOT NULL,
 CONSTRAINT [job_cat_id_pk] PRIMARY KEY CLUSTERED 
(
	[job_cat_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[location]    Script Date: 3/7/2014 5:04:02 PM ******/
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
/****** Object:  Table [dbo].[lot]    Script Date: 3/7/2014 5:04:02 PM ******/
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
/****** Object:  Table [dbo].[medical_assistance]    Script Date: 3/7/2014 5:04:02 PM ******/
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
/****** Object:  Table [dbo].[medicine]    Script Date: 3/7/2014 5:04:02 PM ******/
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
/****** Object:  Table [dbo].[military]    Script Date: 3/7/2014 5:04:02 PM ******/
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
/****** Object:  Table [dbo].[missing]    Script Date: 3/7/2014 5:04:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[missing](
	[Missing_id] [int] NOT NULL,
	[client_other_info] [varchar](250) NULL,
	[clothing] [varchar](150) NULL,
	[date_of_disappearance] [datetime] NOT NULL,
	[last_known_location] [varchar](30) NOT NULL,
 CONSTRAINT [missing_missing_id_pk] PRIMARY KEY CLUSTERED 
(
	[Missing_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[mobile_employees]    Script Date: 3/7/2014 5:04:02 PM ******/
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
/****** Object:  Table [dbo].[Mobile_Product]    Script Date: 3/7/2014 5:04:02 PM ******/
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
/****** Object:  Table [dbo].[mobile_unit]    Script Date: 3/7/2014 5:04:02 PM ******/
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
/****** Object:  Table [dbo].[Order_Product]    Script Date: 3/7/2014 5:04:02 PM ******/
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
/****** Object:  Table [dbo].[person]    Script Date: 3/7/2014 5:04:02 PM ******/
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
/****** Object:  Table [dbo].[Pet]    Script Date: 3/7/2014 5:04:02 PM ******/
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
/****** Object:  Table [dbo].[Pet_Deceased]    Script Date: 3/7/2014 5:04:02 PM ******/
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
/****** Object:  Table [dbo].[Pet_Missing]    Script Date: 3/7/2014 5:04:02 PM ******/
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
/****** Object:  Table [dbo].[Pet_type]    Script Date: 3/7/2014 5:04:02 PM ******/
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
/****** Object:  Table [dbo].[Pet_Vaccine]    Script Date: 3/7/2014 5:04:02 PM ******/
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
/****** Object:  Table [dbo].[products]    Script Date: 3/7/2014 5:04:02 PM ******/
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
/****** Object:  Table [dbo].[property]    Script Date: 3/7/2014 5:04:02 PM ******/
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
/****** Object:  Table [dbo].[Pvaccine]    Script Date: 3/7/2014 5:04:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING OFF
GO
CREATE TABLE [dbo].[Pvaccine](
	[Vaccine_Type_ID] [int] IDENTITY(1,1) NOT NULL,
	[Vaccine_Name] [varchar](50) NULL,
	[Vaccine_Reactions] [varchar](50) NULL,
	[Vaccine_Type] [varchar](50) NULL,
 CONSTRAINT [Vaccine_Type_id_pk] PRIMARY KEY CLUSTERED 
(
	[Vaccine_Type_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[receipt]    Script Date: 3/7/2014 5:04:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[receipt](
	[Receipt_ID] [int] IDENTITY(1,1) NOT NULL,
	[Account_ID] [int] NULL,
	[Check_Num] [int] NULL,
	[DLN] [int] NULL,
	[Phone] [int] NULL,
	[Pay_Type] [int] NULL,
	[Amount] [int] NULL,
	[Transfer] [bit] NULL,
	[Recieve] [bit] NULL,
 CONSTRAINT [pk_receipt_Receipt_ID] PRIMARY KEY CLUSTERED 
(
	[Receipt_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[relative]    Script Date: 3/7/2014 5:04:02 PM ******/
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
/****** Object:  Table [dbo].[requestor]    Script Date: 3/7/2014 5:04:02 PM ******/
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
/****** Object:  Table [dbo].[requestor_Order]    Script Date: 3/7/2014 5:04:02 PM ******/
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
	[Call_In_Order_Description] [varchar](8000) NULL,
 CONSTRAINT [OrderID_pk] PRIMARY KEY CLUSTERED 
(
	[OrderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[requirements]    Script Date: 3/7/2014 5:04:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[requirements](
	[req_id] [int] IDENTITY(1,1) NOT NULL,
	[requirement_desc] [varchar](100) NOT NULL,
 CONSTRAINT [req_pk] PRIMARY KEY CLUSTERED 
(
	[req_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[resource]    Script Date: 3/7/2014 5:04:02 PM ******/
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
/****** Object:  Table [dbo].[services]    Script Date: 3/7/2014 5:04:02 PM ******/
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
/****** Object:  Table [dbo].[Shipment]    Script Date: 3/7/2014 5:04:02 PM ******/
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
/****** Object:  Table [dbo].[tier]    Script Date: 3/7/2014 5:04:02 PM ******/
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
/****** Object:  Table [dbo].[tier_req]    Script Date: 3/7/2014 5:04:02 PM ******/
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
/****** Object:  Table [dbo].[transportation]    Script Date: 3/7/2014 5:04:02 PM ******/
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
/****** Object:  Table [dbo].[vaccine]    Script Date: 3/7/2014 5:04:02 PM ******/
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
/****** Object:  Table [dbo].[vehicle]    Script Date: 3/7/2014 5:04:02 PM ******/
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
/****** Object:  Table [dbo].[vendor]    Script Date: 3/7/2014 5:04:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[vendor](
	[vendor_id] [int] IDENTITY(1,1) NOT NULL,
	[vendor_name] [varchar](50) NOT NULL,
	[phone_num] [varchar](11) NOT NULL,
	[email] [varchar](50) NULL,
	[address_id] [int] NOT NULL,
	[Vendor_address2] [int] NULL,
	[vendor_job_assign] [varchar](30) NULL,
	[vendor_start_date] [datetime] NOT NULL,
	[vendor_end_date] [datetime] NULL,
	[vendor_meth_of_contact] [char](1) NOT NULL,
	[vendor_status] [varchar](10) NOT NULL,
	[vendor_meth_of_pay] [varchar](15) NULL,
	[vendor_type] [varchar](20) NOT NULL,
	[vendor_comments] [text] NULL,
	[primary_fName] [varchar](50) NULL,
	[primary_lName] [varchar](50) NULL,
	[primary_phone] [varchar](50) NULL,
	[sec_fName] [varchar](50) NULL,
	[sec_lName] [varchar](50) NULL,
	[sec_phone] [varchar](50) NULL,
 CONSTRAINT [vendor_id_pk] PRIMARY KEY CLUSTERED 
(
	[vendor_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[vendor_products]    Script Date: 3/7/2014 5:04:02 PM ******/
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
/****** Object:  Table [dbo].[Vendor_Products_shipments]    Script Date: 3/7/2014 5:04:02 PM ******/
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
/****** Object:  Table [dbo].[warehouse]    Script Date: 3/7/2014 5:04:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[warehouse](
	[warehouse_id] [int] IDENTITY(1,1) NOT NULL,
	[warehouse_name] [varchar](50) NOT NULL,
	[address_id] [int] NULL,
	[warehouse_type] [varchar](10) NOT NULL,
	[Location_ID] [int] NULL,
 CONSTRAINT [warehouse_pk] PRIMARY KEY CLUSTERED 
(
	[warehouse_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[warehouse_product_Location]    Script Date: 3/7/2014 5:04:02 PM ******/
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
	[address_id] [int] NULL,
 CONSTRAINT [warehouse_product_pk] PRIMARY KEY CLUSTERED 
(
	[warehouse_product_location_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
ALTER TABLE [dbo].[location] ADD  CONSTRAINT [DF_tblocation_Longitude]  DEFAULT ((0)) FOR [n_long]
GO
ALTER TABLE [dbo].[location] ADD  CONSTRAINT [DF_tblLocation_Latitude]  DEFAULT ((0)) FOR [n_lat]
GO
ALTER TABLE [dbo].[account]  WITH CHECK ADD  CONSTRAINT [fk_account_Bank_ID] FOREIGN KEY([Bank_ID])
REFERENCES [dbo].[bank] ([Bank_ID])
GO
ALTER TABLE [dbo].[account] CHECK CONSTRAINT [fk_account_Bank_ID]
GO
ALTER TABLE [dbo].[agency]  WITH CHECK ADD  CONSTRAINT [agency_address_id_fk] FOREIGN KEY([address_id])
REFERENCES [dbo].[address] ([address_id])
GO
ALTER TABLE [dbo].[agency] CHECK CONSTRAINT [agency_address_id_fk]
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
ALTER TABLE [dbo].[call_center]  WITH CHECK ADD  CONSTRAINT [cc_address_id_fk] FOREIGN KEY([address_id])
REFERENCES [dbo].[address] ([address_id])
GO
ALTER TABLE [dbo].[call_center] CHECK CONSTRAINT [cc_address_id_fk]
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
ALTER TABLE [dbo].[campaign]  WITH CHECK ADD  CONSTRAINT [campaign_vaccine_id_fk] FOREIGN KEY([medicine_id])
REFERENCES [dbo].[medicine] ([Medicine_Id])
GO
ALTER TABLE [dbo].[campaign] CHECK CONSTRAINT [campaign_vaccine_id_fk]
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
ALTER TABLE [dbo].[case_intake]  WITH CHECK ADD  CONSTRAINT [call_center_id_fk] FOREIGN KEY([call_center_id])
REFERENCES [dbo].[call_center] ([call_center_id])
GO
ALTER TABLE [dbo].[case_intake] CHECK CONSTRAINT [call_center_id_fk]
GO
ALTER TABLE [dbo].[case_intake]  WITH CHECK ADD  CONSTRAINT [case_agency_id_fk] FOREIGN KEY([agency_id])
REFERENCES [dbo].[agency] ([agency_id])
GO
ALTER TABLE [dbo].[case_intake] CHECK CONSTRAINT [case_agency_id_fk]
GO
ALTER TABLE [dbo].[client]  WITH CHECK ADD  CONSTRAINT [client_person_id_fk] FOREIGN KEY([client_id])
REFERENCES [dbo].[person] ([person_id])
GO
ALTER TABLE [dbo].[client] CHECK CONSTRAINT [client_person_id_fk]
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
ALTER TABLE [dbo].[deceased]  WITH CHECK ADD  CONSTRAINT [deceased_coroner_id_fk] FOREIGN KEY([coroner_id])
REFERENCES [dbo].[person] ([person_id])
GO
ALTER TABLE [dbo].[deceased] CHECK CONSTRAINT [deceased_coroner_id_fk]
GO
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
ALTER TABLE [dbo].[employee]  WITH CHECK ADD  CONSTRAINT [employee_id_fk] FOREIGN KEY([employee_id])
REFERENCES [dbo].[person] ([person_id])
GO
ALTER TABLE [dbo].[employee] CHECK CONSTRAINT [employee_id_fk]
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
ALTER TABLE [dbo].[food]  WITH CHECK ADD  CONSTRAINT [Food_Product_id_fk] FOREIGN KEY([Product_id])
REFERENCES [dbo].[products] ([product_id])
GO
ALTER TABLE [dbo].[food] CHECK CONSTRAINT [Food_Product_id_fk]
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
ALTER TABLE [dbo].[job]  WITH CHECK ADD  CONSTRAINT [job_add_id_fk] FOREIGN KEY([address_id])
REFERENCES [dbo].[address] ([address_id])
GO
ALTER TABLE [dbo].[job] CHECK CONSTRAINT [job_add_id_fk]
GO
ALTER TABLE [dbo].[job]  WITH CHECK ADD  CONSTRAINT [job_com_id_fk] FOREIGN KEY([company_id])
REFERENCES [dbo].[vendor] ([vendor_id])
GO
ALTER TABLE [dbo].[job] CHECK CONSTRAINT [job_com_id_fk]
GO
ALTER TABLE [dbo].[job]  WITH CHECK ADD  CONSTRAINT [job_job_cat_id_fk] FOREIGN KEY([job_cat_id])
REFERENCES [dbo].[job_category] ([job_cat_id])
GO
ALTER TABLE [dbo].[job] CHECK CONSTRAINT [job_job_cat_id_fk]
GO
ALTER TABLE [dbo].[lot]  WITH CHECK ADD  CONSTRAINT [product_id_fk] FOREIGN KEY([product_id])
REFERENCES [dbo].[products] ([product_id])
GO
ALTER TABLE [dbo].[lot] CHECK CONSTRAINT [product_id_fk]
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
ALTER TABLE [dbo].[medicine]  WITH CHECK ADD  CONSTRAINT [fk_medicine_Medicine_Id] FOREIGN KEY([Medicine_Id])
REFERENCES [dbo].[products] ([product_id])
GO
ALTER TABLE [dbo].[medicine] CHECK CONSTRAINT [fk_medicine_Medicine_Id]
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
ALTER TABLE [dbo].[receipt]  WITH CHECK ADD  CONSTRAINT [fk_receipt_Account_ID] FOREIGN KEY([Account_ID])
REFERENCES [dbo].[account] ([Account_ID])
GO
ALTER TABLE [dbo].[receipt] CHECK CONSTRAINT [fk_receipt_Account_ID]
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
ALTER TABLE [dbo].[resource]  WITH CHECK ADD  CONSTRAINT [fk_recource_Location_ID] FOREIGN KEY([Location_ID])
REFERENCES [dbo].[location] ([Location_ID])
GO
ALTER TABLE [dbo].[resource] CHECK CONSTRAINT [fk_recource_Location_ID]
GO
ALTER TABLE [dbo].[services]  WITH CHECK ADD  CONSTRAINT [fk_services_service_id] FOREIGN KEY([service_id])
REFERENCES [dbo].[resource] ([Resource_ID])
GO
ALTER TABLE [dbo].[services] CHECK CONSTRAINT [fk_services_service_id]
GO
ALTER TABLE [dbo].[Shipment]  WITH CHECK ADD  CONSTRAINT [shipment_warehouse_id_fk] FOREIGN KEY([WarehouseID])
REFERENCES [dbo].[warehouse] ([warehouse_id])
GO
ALTER TABLE [dbo].[Shipment] CHECK CONSTRAINT [shipment_warehouse_id_fk]
GO
ALTER TABLE [dbo].[tier]  WITH CHECK ADD  CONSTRAINT [tier_campaign_id] FOREIGN KEY([campaign_id])
REFERENCES [dbo].[campaign] ([campaign_id])
GO
ALTER TABLE [dbo].[tier] CHECK CONSTRAINT [tier_campaign_id]
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
ALTER TABLE [dbo].[transportation]  WITH CHECK ADD  CONSTRAINT [FK_transportation_vehicle] FOREIGN KEY([Vehicle_id])
REFERENCES [dbo].[vehicle] ([vehicle_id])
GO
ALTER TABLE [dbo].[transportation] CHECK CONSTRAINT [FK_transportation_vehicle]
GO
ALTER TABLE [dbo].[vaccine]  WITH CHECK ADD  CONSTRAINT [vaccine_medicine_id_fk] FOREIGN KEY([medicine_id])
REFERENCES [dbo].[medicine] ([Medicine_Id])
GO
ALTER TABLE [dbo].[vaccine] CHECK CONSTRAINT [vaccine_medicine_id_fk]
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
ALTER TABLE [dbo].[vendor]  WITH CHECK ADD  CONSTRAINT [vendor_address_id_fk] FOREIGN KEY([address_id])
REFERENCES [dbo].[address] ([address_id])
GO
ALTER TABLE [dbo].[vendor] CHECK CONSTRAINT [vendor_address_id_fk]
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
ALTER TABLE [dbo].[warehouse]  WITH CHECK ADD  CONSTRAINT [warehouse_address_id_fk] FOREIGN KEY([address_id])
REFERENCES [dbo].[address] ([address_id])
GO
ALTER TABLE [dbo].[warehouse] CHECK CONSTRAINT [warehouse_address_id_fk]
GO
ALTER TABLE [dbo].[warehouse]  WITH CHECK ADD  CONSTRAINT [warehouse_location_id_fk] FOREIGN KEY([Location_ID])
REFERENCES [dbo].[location] ([Location_ID])
GO
ALTER TABLE [dbo].[warehouse] CHECK CONSTRAINT [warehouse_location_id_fk]
GO
ALTER TABLE [dbo].[warehouse_product_Location]  WITH CHECK ADD  CONSTRAINT [w_p_address_id_fk] FOREIGN KEY([address_id])
REFERENCES [dbo].[address] ([address_id])
GO
ALTER TABLE [dbo].[warehouse_product_Location] CHECK CONSTRAINT [w_p_address_id_fk]
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
/****** Object:  StoredProcedure [dbo].[sp_DMCS_customerOrderpickupGV]    Script Date: 3/7/2014 5:04:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Dustin Franz
-- Create date: 07/16/12
-- Description:	customer Order pickup grid view
-- =============================================
CREATE PROCEDURE [dbo].[sp_DMCS_customerOrderpickupGV]

	@warehouse_id as int
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	select distinct requestor_order.ordernum, Order_Product.orderid,person.F_name, person.l_name, products.product_id, products.product_name,
	Order_Product.Quantity, Order_Product.QtyPicked, Order_Product.DatePicked
	from order_product,requestor_order,requestor, warehouse_products,person,products
	where requestor_order.orderid = order_product.orderid and
	requestor.RequestorID = requestor_order.Requestor_ID and
	order_product.warehouseid = warehouse_products.warehouse_id and
	requestor.personID = person.person_id and
	order_product.productID = products.product_id and
	warehouse_products.warehouse_id = @warehouse_id
END

GO
/****** Object:  StoredProcedure [dbo].[SP_DMCS_Delete_Account]    Script Date: 3/7/2014 5:04:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		James Miller
-- Create date: 2/28/2013
-- Description:	Delete Bank Record
-- =============================================
CREATE PROCEDURE [dbo].[SP_DMCS_Delete_Account]
	@Account_ID integer = 0
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	Delete dbo.account
	where Account_ID = @Account_ID
	
END


GO
/****** Object:  StoredProcedure [dbo].[SP_DMCS_Delete_Address]    Script Date: 3/7/2014 5:04:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Edward Sobanski
-- Create date: 4/21/2012
-- Description:	Delete Adress record
-- =============================================
CREATE PROCEDURE [dbo].[SP_DMCS_Delete_Address] 
	@address_id integer = 0
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	Delete dbo.address
	where address_id = @address_id
	
END

GO
/****** Object:  StoredProcedure [dbo].[SP_DMCS_Delete_Agency]    Script Date: 3/7/2014 5:04:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Edward Sobanski
-- Create date: 4/21/2012
-- Description:	Delete agency record
-- =============================================
CREATE PROCEDURE [dbo].[SP_DMCS_Delete_Agency] 
	@agency_id integer = 0
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	Delete dbo.agency
	where agency_id = @agency_id
	
END

GO
/****** Object:  StoredProcedure [dbo].[SP_DMCS_Delete_Agency_Employees]    Script Date: 3/7/2014 5:04:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Edward Sobanski
-- Create date: 4/21/2012
-- Description:	List of all call Centers for DDL
-- =============================================
CREATE PROCEDURE [dbo].[SP_DMCS_Delete_Agency_Employees] 
	@agency_empl_id integer = 0
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	Delete dbo.Agency_Employees
	where agency_empl_id = @agency_empl_id
	
END

GO
/****** Object:  StoredProcedure [dbo].[SP_DMCS_Delete_Bank]    Script Date: 3/7/2014 5:04:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Jon Kamphuis
-- Create date: 2/26/2013
-- Description:	Delete Bank Record
-- =============================================
CREATE PROCEDURE [dbo].[SP_DMCS_Delete_Bank]
	@Bank_ID integer = 0
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	Delete dbo.bank
	where Bank_ID = @Bank_ID
	
END


GO
/****** Object:  StoredProcedure [dbo].[SP_DMCS_Delete_Call_Center]    Script Date: 3/7/2014 5:04:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Edward Sobanski
-- Create date: 4/21/2012
-- Description:Delete Call Center record
-- =============================================
CREATE PROCEDURE [dbo].[SP_DMCS_Delete_Call_Center] 
	@Call_Center_id integer = 0
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	Delete dbo.Call_Center
	where Call_Center_id = @Call_Center_id
	
END

GO
/****** Object:  StoredProcedure [dbo].[SP_DMCS_Delete_Call_Center_Employee]    Script Date: 3/7/2014 5:04:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Edward Sobanski
-- Create date: 4/21/2012
-- Description:	Delete call Center Emplyee Record
-- =============================================
CREATE PROCEDURE [dbo].[SP_DMCS_Delete_Call_Center_Employee]
	@Call_Center_Employee_id integer = 0
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	Delete dbo.Call_Center_Employee
	where Call_Center_Employee_id = @Call_Center_Employee_id
	
END

GO
/****** Object:  StoredProcedure [dbo].[SP_DMCS_Delete_Campaign]    Script Date: 3/7/2014 5:04:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Edward Sobanski
-- Create date: 4/21/2012
-- Description:Delete Campaign record
-- =============================================
CREATE PROCEDURE [dbo].[SP_DMCS_Delete_Campaign]
	@Campaign_id integer = 0
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	Delete dbo.Campaign
	where Campaign_id = @Campaign_id
	
END

GO
/****** Object:  StoredProcedure [dbo].[SP_DMCS_Delete_Case_Client]    Script Date: 3/7/2014 5:04:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Edward Sobanski
-- Create date: 4/21/2012
-- Description:Delete Case_Client record
-- =============================================
CREATE PROCEDURE [dbo].[SP_DMCS_Delete_Case_Client]
	@Case_id integer = 0,
	@Client_id integer = 0
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	Delete dbo.case_client
	where case_id = @Case_id
	  and client_id = @Client_id
	
END

GO
/****** Object:  StoredProcedure [dbo].[SP_DMCS_Delete_Case_Intake]    Script Date: 3/7/2014 5:04:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Edward Sobanski
-- Create date: 4/21/2012
-- Description:Delete Case_Intake record
-- =============================================
CREATE PROCEDURE [dbo].[SP_DMCS_Delete_Case_Intake]
	@Case_id integer = 0
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	Delete dbo.case_intake
	where case_id = @Case_id
	 
	
END

GO
/****** Object:  StoredProcedure [dbo].[SP_DMCS_Delete_Client]    Script Date: 3/7/2014 5:04:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Edward Sobanski
-- Create date: 4/21/2012
-- Description:Delete Client record
-- =============================================
CREATE PROCEDURE [dbo].[SP_DMCS_Delete_Client]
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
/****** Object:  StoredProcedure [dbo].[SP_DMCS_Delete_ClientWPets]    Script Date: 3/7/2014 5:04:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Jianwang Xing
-- Create date: 4/22/2013
-- Description:	Delete clientWPets record
-- =============================================
CREATE PROCEDURE [dbo].[SP_DMCS_Delete_ClientWPets]
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
/****** Object:  StoredProcedure [dbo].[SP_DMCS_Delete_Debt]    Script Date: 3/7/2014 5:04:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Edward Sobanski
-- Create date: 4/21/2012
-- Description:Delete Debt record
-- =============================================
CREATE PROCEDURE [dbo].[SP_DMCS_Delete_Debt]
	@debt_id integer = 0
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	Delete dbo.debt
	where debt_id = @debt_id
	 
	
END

GO
/****** Object:  StoredProcedure [dbo].[SP_DMCS_Delete_Deceased]    Script Date: 3/7/2014 5:04:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Edward Sobanski
-- Create date: 4/21/2012
-- Description:Delete Deceased record
-- =============================================
CREATE PROCEDURE [dbo].[SP_DMCS_Delete_Deceased]
	@deceased_id integer = 0
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	Delete dbo.deceased
	where deceased_id = @deceased_id
	 
	
END

GO
/****** Object:  StoredProcedure [dbo].[SP_DMCS_Delete_Disaster]    Script Date: 3/7/2014 5:04:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Edward Sobanski
-- Create date: 4/21/2012
-- Description:Delete Disaster record
-- =============================================
CREATE PROCEDURE [dbo].[SP_DMCS_Delete_Disaster]
	@disaster_id integer = 0
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	Delete dbo.disaster
	where disaster_id = @disaster_id
	 
	
END

GO
/****** Object:  StoredProcedure [dbo].[SP_DMCS_Delete_Disaster_Encounter]    Script Date: 3/7/2014 5:04:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Edward Sobanski
-- Create date: 4/21/2012
-- Description:Delete Disaster_Encounter record
-- =============================================
CREATE PROCEDURE [dbo].[SP_DMCS_Delete_Disaster_Encounter]
	@disaster_encounter_id integer = 0
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	Delete dbo.disaster_encounter
	where disaster_encounter_id = @disaster_encounter_id
	 
	
END

GO
/****** Object:  StoredProcedure [dbo].[SP_DMCS_Delete_Donation]    Script Date: 3/7/2014 5:04:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Mohammed Mohammed
-- Create date: 2/26/2013
-- Description:	Delete Donation Record
-- =============================================
CREATE PROCEDURE [dbo].[SP_DMCS_Delete_Donation]
	@Donation_ID integer = 0
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	Delete dbo.donation
	where Donation_ID = @Donation_ID
	
END


GO
/****** Object:  StoredProcedure [dbo].[SP_DMCS_Delete_Donor]    Script Date: 3/7/2014 5:04:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Edward Sobanski
-- Create date: 4/21/2012
-- Description:Delete Donor record
-- =============================================
CREATE PROCEDURE [dbo].[SP_DMCS_Delete_Donor]
	@donor_id integer = 0
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	Delete dbo.Donor
	where donor_id = @donor_id
	 
	
END

GO
/****** Object:  StoredProcedure [dbo].[SP_DMCS_Delete_Donor_Product]    Script Date: 3/7/2014 5:04:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Edward Sobanski
-- Create date: 4/21/2012
-- Description:Delete Donor_Product record
-- =============================================
CREATE PROCEDURE [dbo].[SP_DMCS_Delete_Donor_Product]
	@donorProduct_id integer = 0
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	Delete dbo.Donor_Product
	where DonorProductID = @donorProduct_id
	 
	
END

GO
/****** Object:  StoredProcedure [dbo].[SP_DMCS_Delete_Emergency_Medical]    Script Date: 3/7/2014 5:04:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Edward Sobanski
-- Create date: 4/21/2012
-- Description:Delete Emergency_Medical record
-- =============================================
CREATE PROCEDURE [dbo].[SP_DMCS_Delete_Emergency_Medical]
	@em_id integer = 0
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	Delete dbo.emergency_medical
	where em_id = @em_id
	 
	
END

GO
/****** Object:  StoredProcedure [dbo].[SP_DMCS_Delete_Employee]    Script Date: 3/7/2014 5:04:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Edward Sobanski
-- Create date: 4/21/2012
-- Description:Delete Employee record
-- =============================================
CREATE PROCEDURE [dbo].[SP_DMCS_Delete_Employee]
	@employee_id integer = 0
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	Delete dbo.employee
	where employee_id = @employee_id
	 
	
END

GO
/****** Object:  StoredProcedure [dbo].[SP_DMCS_Delete_Employee_Clients]    Script Date: 3/7/2014 5:04:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Edward Sobanski
-- Create date: 4/21/2012
-- Description:Delete Employee_Clients record
-- =============================================
CREATE PROCEDURE [dbo].[SP_DMCS_Delete_Employee_Clients]
	@emp_client_id integer = 0
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	Delete dbo.employee_clients
	where emp_client_id = @emp_client_id
	 
	
END

GO
/****** Object:  StoredProcedure [dbo].[SP_DMCS_Delete_Employer]    Script Date: 3/7/2014 5:04:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Edward Sobanski
-- Create date: 4/21/2012
-- Description:Delete Employer record
-- =============================================
CREATE PROCEDURE [dbo].[SP_DMCS_Delete_Employer]
	@emplr_id integer = 0
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	Delete dbo.employer
	where emplr_id = @emplr_id
	 
	
END

GO
/****** Object:  StoredProcedure [dbo].[SP_DMCS_Delete_Encounter]    Script Date: 3/7/2014 5:04:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Edward Sobanski
-- Create date: 4/21/2012
-- Description:Delete Encounter record
-- =============================================
CREATE PROCEDURE [dbo].[SP_DMCS_Delete_Encounter]
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
/****** Object:  StoredProcedure [dbo].[SP_DMCS_Delete_Encounter_Client_vaccine]    Script Date: 3/7/2014 5:04:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Edward Sobanski
-- Create date: 6/2/2012
-- Description:Delete Encounter_Client_vaccine record
-- =============================================
CREATE PROCEDURE [dbo].[SP_DMCS_Delete_Encounter_Client_vaccine]
	@encounter_id integer = 0
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	Delete dbo.encounter_client_vaccine
	where encounter_id = @encounter_id
	 
	
END

GO
/****** Object:  StoredProcedure [dbo].[SP_DMCS_Delete_Encounter_Pet]    Script Date: 3/7/2014 5:04:02 PM ******/
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
/****** Object:  StoredProcedure [dbo].[SP_DMCS_Delete_Encounter_Services]    Script Date: 3/7/2014 5:04:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Edward Sobanski
-- Create date: 4/21/2012
-- Description:Delete Encounter_Services record
-- =============================================
CREATE PROCEDURE [dbo].[SP_DMCS_Delete_Encounter_Services]
	@encounter_serv_id integer = 0
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	Delete dbo.encounter_services
	where encounter_serv_id = @encounter_serv_id	 
	
END

GO
/****** Object:  StoredProcedure [dbo].[SP_DMCS_Delete_Expense]    Script Date: 3/7/2014 5:04:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Edward Sobanski
-- Create date: 4/21/2012
-- Description:Delete Expense record
-- =============================================
CREATE PROCEDURE [dbo].[SP_DMCS_Delete_Expense]
	@expense_id integer = 0
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	Delete dbo.expense
	where expense_id = @expense_id	 
	
END

GO
/****** Object:  StoredProcedure [dbo].[SP_DMCS_Delete_FEMA]    Script Date: 3/7/2014 5:04:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		James Miller
-- Create date: 2/28/2013
-- Description:	Delete FEMA Record
-- =============================================
CREATE PROCEDURE [dbo].[SP_DMCS_Delete_FEMA]
	@FEMA_ID integer = 0
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	Delete dbo.FEMA
	where FEMA_ID = @FEMA_ID
	
END


GO
/****** Object:  StoredProcedure [dbo].[SP_DMCS_Delete_Food]    Script Date: 3/7/2014 5:04:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Edward Sobanski
-- Create date: 4/21/2012
-- Description:Delete Food record
-- =============================================
CREATE PROCEDURE [dbo].[SP_DMCS_Delete_Food]
	@food_voucher_id integer = 0
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	Delete dbo.food
	where food_voucher_id = @food_voucher_id	 
	
END

GO
/****** Object:  StoredProcedure [dbo].[SP_DMCS_Delete_House]    Script Date: 3/7/2014 5:04:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Edward Sobanski
-- Create date: 4/21/2012
-- Description:Delete Food record
-- =============================================
CREATE PROCEDURE [dbo].[SP_DMCS_Delete_House]
	@house_id integer = 0
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	Delete dbo.house
	where house_id = @house_id	 
	
END

GO
/****** Object:  StoredProcedure [dbo].[SP_DMCS_Delete_House_Choice]    Script Date: 3/7/2014 5:04:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Edward Sobanski
-- Create date: 4/21/2012
-- Description:Delete House_Choice record
-- =============================================
CREATE PROCEDURE [dbo].[SP_DMCS_Delete_House_Choice]
	@house_choice_id integer = 0
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	Delete dbo.house_choice
	where house_choice_id = @house_choice_id	 
	
END

GO
/****** Object:  StoredProcedure [dbo].[SP_DMCS_Delete_Income_Source]    Script Date: 3/7/2014 5:04:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Edward Sobanski
-- Create date: 4/21/2012
-- Description:Delete Income_Source record
-- =============================================
CREATE PROCEDURE [dbo].[SP_DMCS_Delete_Income_Source]
	@income_source_id integer = 0
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	Delete dbo.income_source
	where income_source_id = @income_source_id	 
	
END

GO
/****** Object:  StoredProcedure [dbo].[SP_DMCS_Delete_Job]    Script Date: 3/7/2014 5:04:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Edward Sobanski
-- Create date: 4/21/2012
-- Description:Delete Job record
-- =============================================
CREATE PROCEDURE [dbo].[SP_DMCS_Delete_Job]
	@job_id integer = 0
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	Delete dbo.job
	where job_id = @job_id	 
	
END

GO
/****** Object:  StoredProcedure [dbo].[SP_DMCS_Delete_Job_Category]    Script Date: 3/7/2014 5:04:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Edward Sobanski
-- Create date: 4/21/2012
-- Description:Delete Job_Category record
-- =============================================
CREATE PROCEDURE [dbo].[SP_DMCS_Delete_Job_Category]
	@job_cat_id integer = 0
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	Delete dbo.job_category
	where job_cat_id = @job_cat_id	 
	
END

GO
/****** Object:  StoredProcedure [dbo].[SP_DMCS_Delete_location]    Script Date: 3/7/2014 5:04:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		Justin Gamble
-- Create date: 2/26/2013
-- Description:	Delete Location Record
-- =============================================
CREATE PROCEDURE [dbo].[SP_DMCS_Delete_location]
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
/****** Object:  StoredProcedure [dbo].[SP_DMCS_Delete_Lot]    Script Date: 3/7/2014 5:04:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Edward Sobanski
-- Create date: 4/21/2012
-- Description:Delete Lot record
-- =============================================
CREATE PROCEDURE [dbo].[SP_DMCS_Delete_Lot]
	@lot_id integer = 0
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	Delete dbo.lot
	where lot_id = @lot_id	 
	
END

GO
/****** Object:  StoredProcedure [dbo].[SP_DMCS_Delete_Medical_Assistance]    Script Date: 3/7/2014 5:04:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Edward Sobanski
-- Create date: 4/21/2012
-- Description:Delete Medical_Assistance record
-- =============================================
CREATE PROCEDURE [dbo].[SP_DMCS_Delete_Medical_Assistance]
	@medical_assist_order_id integer = 0
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	Delete dbo.medical_assistance
	where medical_assist_order_id = @medical_assist_order_id	 
	
END

GO
/****** Object:  StoredProcedure [dbo].[SP_DMCS_Delete_Medicine]    Script Date: 3/7/2014 5:04:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Edward Sobanski
-- Create date: 4/21/2012
-- Description:Delete Medicine record
-- =============================================
CREATE PROCEDURE [dbo].[SP_DMCS_Delete_Medicine]
	@medicine_id integer = 0
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	Delete dbo.medicine
	where medicine_id = @medicine_id	 
	
END

GO
/****** Object:  StoredProcedure [dbo].[SP_DMCS_Delete_Military]    Script Date: 3/7/2014 5:04:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Edward Sobanski
-- Create date: 4/21/2012
-- Description:Delete Military record
-- =============================================
CREATE PROCEDURE [dbo].[SP_DMCS_Delete_Military]
	@military_id integer = 0
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	Delete dbo.military
	where military_id = @military_id	 
	
END

GO
/****** Object:  StoredProcedure [dbo].[SP_DMCS_Delete_Missing]    Script Date: 3/7/2014 5:04:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Edward Sobanski
-- Create date: 4/21/2012
-- Description:Delete Missing record
-- =============================================
CREATE PROCEDURE [dbo].[SP_DMCS_Delete_Missing]
	@missing_id integer = 0
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	Delete dbo.missing
	where missing_id = @missing_id	 
	
END

GO
/****** Object:  StoredProcedure [dbo].[SP_DMCS_Delete_Mobile_Employees]    Script Date: 3/7/2014 5:04:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Edward Sobanski
-- Create date: 4/21/2012
-- Description:Delete Mobile_Employees record
-- =============================================
CREATE PROCEDURE [dbo].[SP_DMCS_Delete_Mobile_Employees]
	@mobile_employee_id integer = 0
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	Delete dbo.mobile_employees
	where mobile_employee_id = @mobile_employee_id	 
	
END

GO
/****** Object:  StoredProcedure [dbo].[SP_DMCS_Delete_Mobile_Product]    Script Date: 3/7/2014 5:04:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Edward Sobanski
-- Create date: 6/20/2012
-- Description:Delete Order_Product record
-- =============================================
CREATE PROCEDURE [dbo].[SP_DMCS_Delete_Mobile_Product]
	@Mobile_Product_id integer = 0
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	Delete dbo.Mobile_Product
	where Mobile_Product_id  = @Mobile_Product_id 	 
	
END

GO
/****** Object:  StoredProcedure [dbo].[SP_DMCS_Delete_Mobile_Unit]    Script Date: 3/7/2014 5:04:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Edward Sobanski
-- Create date: 4/21/2012
-- Description:Delete Mobile_Unit record
-- =============================================
CREATE PROCEDURE [dbo].[SP_DMCS_Delete_Mobile_Unit]
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
/****** Object:  StoredProcedure [dbo].[SP_DMCS_Delete_Order_Product]    Script Date: 3/7/2014 5:04:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Edward Sobanski
-- Create date: 4/21/2012
-- Description:Delete Order_Product record
-- =============================================
CREATE PROCEDURE [dbo].[SP_DMCS_Delete_Order_Product]
	@order_Product_ID integer = 0
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	Delete dbo.Order_Product
	where order_Product_ID  = @order_Product_ID 	 
	
END

GO
/****** Object:  StoredProcedure [dbo].[SP_DMCS_Delete_Person]    Script Date: 3/7/2014 5:04:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Edward Sobanski
-- Create date: 4/21/2012
-- Description:Delete Person record
-- =============================================
CREATE PROCEDURE [dbo].[SP_DMCS_Delete_Person]
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
/****** Object:  StoredProcedure [dbo].[SP_DMCS_Delete_pet]    Script Date: 3/7/2014 5:04:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Jianwang Xing
-- Create date: 3/29/2013
-- Description:	Delete pet record
-- =============================================
CREATE PROCEDURE [dbo].[SP_DMCS_Delete_pet] 
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
/****** Object:  StoredProcedure [dbo].[SP_DMCS_Delete_Pet_Deceased]    Script Date: 3/7/2014 5:04:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Mike Phillips
-- Create date: 3/29/2013
-- Description:Delete pet deceased record
-- =============================================
CREATE PROCEDURE [dbo].[SP_DMCS_Delete_Pet_Deceased]
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
/****** Object:  StoredProcedure [dbo].[SP_DMCS_Delete_Pet_missing]    Script Date: 3/7/2014 5:04:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Jianwang Xing
-- Create date: 3/29/2013
-- Description:Delete Pet missing record
-- =============================================
CREATE PROCEDURE [dbo].[SP_DMCS_Delete_Pet_missing]
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
/****** Object:  StoredProcedure [dbo].[SP_DMCS_Delete_Pet_Type]    Script Date: 3/7/2014 5:04:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Jianwang Xing
-- Create date: 3/29/2013
-- Description:	Delete pet type record
-- =============================================
CREATE PROCEDURE [dbo].[SP_DMCS_Delete_Pet_Type] 
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
/****** Object:  StoredProcedure [dbo].[SP_DMCS_Delete_Pet_Vaccine]    Script Date: 3/7/2014 5:04:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Mike Phillips
-- Create date: 3/29/2013
-- Description:Delete pet Vaccines record
-- =============================================
CREATE PROCEDURE [dbo].[SP_DMCS_Delete_Pet_Vaccine]
	@Pet_Vaccine_ID integer = 0
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	Delete dbo.Pet_Vaccine
	where Pet_Vaccine_ID = @Pet_Vaccine_ID	 
	
END

GO
/****** Object:  StoredProcedure [dbo].[SP_DMCS_Delete_Products]    Script Date: 3/7/2014 5:04:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Edward Sobanski
-- Create date: 4/21/2012
-- Description:Delete Products record
-- =============================================
CREATE PROCEDURE [dbo].[SP_DMCS_Delete_Products]
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
/****** Object:  StoredProcedure [dbo].[SP_DMCS_Delete_Property]    Script Date: 3/7/2014 5:04:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Edward Sobanski
-- Create date: 4/21/2012
-- Description:Delete Property record
-- =============================================
CREATE PROCEDURE [dbo].[SP_DMCS_Delete_Property]
	@property_id integer = 0
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	Delete dbo.property
	where property_id  = @property_id 	 
	
END

GO
/****** Object:  StoredProcedure [dbo].[SP_DMCS_Delete_Pvaccine]    Script Date: 3/7/2014 5:04:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Mike Phillips
-- Create date: 3/29/2013
-- Description: Delete pvaccine record
-- =============================================
CREATE PROCEDURE [dbo].[SP_DMCS_Delete_Pvaccine]
	@Vaccine_Type_ID integer = 0
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	Delete dbo.Pvaccine
	where Vaccine_Type_ID = @Vaccine_Type_ID	 
	
END

GO
/****** Object:  StoredProcedure [dbo].[SP_DMCS_Delete_Receipt]    Script Date: 3/7/2014 5:04:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		James Miller
-- Create date: 2/28/2013
-- Description:	Delete Receipt Record
-- =============================================
CREATE PROCEDURE [dbo].[SP_DMCS_Delete_Receipt]
	@Receipt_ID integer = 0
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	Delete dbo.receipt
	where Receipt_ID = @Receipt_ID
	
END


GO
/****** Object:  StoredProcedure [dbo].[SP_DMCS_Delete_Relative]    Script Date: 3/7/2014 5:04:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Edward Sobanski
-- Create date: 4/21/2012
-- Description:Delete Relative record
-- =============================================
CREATE PROCEDURE [dbo].[SP_DMCS_Delete_Relative]
	@relative_id integer = 0
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	Delete dbo.[relative]
	where relative_id  = @relative_id 	 
	
END

GO
/****** Object:  StoredProcedure [dbo].[SP_DMCS_Delete_Requestor]    Script Date: 3/7/2014 5:04:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Edward Sobanski
-- Create date: 4/21/2012
-- Description:Delete Requestor record
-- =============================================
CREATE PROCEDURE [dbo].[SP_DMCS_Delete_Requestor]
	@RequestorID integer = 0
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	Delete dbo.[requestor]
	where RequestorID  = @RequestorID 	 
	
END

GO
/****** Object:  StoredProcedure [dbo].[SP_DMCS_Delete_Requestor_Order]    Script Date: 3/7/2014 5:04:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Edward Sobanski
-- Create date: 6/3/2012
-- Description:Delete Requestor record
-- =============================================
CREATE PROCEDURE [dbo].[SP_DMCS_Delete_Requestor_Order]
	@OrderID integer = 0
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	Delete dbo.[requestor_Order]
	where OrderID  = @OrderID 	 
	
END

GO
/****** Object:  StoredProcedure [dbo].[SP_DMCS_Delete_Requirements]    Script Date: 3/7/2014 5:04:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Edward Sobanski
-- Create date: 4/21/2012
-- Description:Delete Requirements record
-- =============================================
CREATE PROCEDURE [dbo].[SP_DMCS_Delete_Requirements]
	@req_id integer = 0
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	Delete dbo.requirements
	where req_id  = @req_id 	 
	
END

GO
/****** Object:  StoredProcedure [dbo].[SP_DMCS_Delete_Resource]    Script Date: 3/7/2014 5:04:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		James Miller
-- Create date: 2/26/2013
-- Description:	Delete Resource Record
-- =============================================
CREATE PROCEDURE [dbo].[SP_DMCS_Delete_Resource]
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
/****** Object:  StoredProcedure [dbo].[SP_DMCS_Delete_Services]    Script Date: 3/7/2014 5:04:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Edward Sobanski
-- Create date: 4/21/2012
-- Description:Delete Services record
-- =============================================
CREATE PROCEDURE [dbo].[SP_DMCS_Delete_Services]
	@service_id integer = 0
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	Delete dbo.[services]
	where service_id  = @service_id 	 
	
END

GO
/****** Object:  StoredProcedure [dbo].[SP_DMCS_Delete_Shipment]    Script Date: 3/7/2014 5:04:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Edward Sobanski
-- Create date: 4/21/2012
-- Description:Delete Shipment record
-- =============================================
CREATE PROCEDURE [dbo].[SP_DMCS_Delete_Shipment]
	@ShipmentID integer = 0
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	Delete dbo.Shipment
	where ShipmentID  = @ShipmentID 	 
	
END

GO
/****** Object:  StoredProcedure [dbo].[SP_DMCS_Delete_Tier]    Script Date: 3/7/2014 5:04:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Edward Sobanski
-- Create date: 4/21/2012
-- Description:Delete Tier record
-- =============================================
CREATE PROCEDURE [dbo].[SP_DMCS_Delete_Tier]
	@tier_id integer = 0
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	Delete dbo.tier
	where tier_id  = @tier_id 	 
	
END

GO
/****** Object:  StoredProcedure [dbo].[SP_DMCS_Delete_Tier_Req]    Script Date: 3/7/2014 5:04:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Edward Sobanski
-- Create date: 4/21/2012
-- Description:Delete Tier_Req record
-- =============================================
CREATE PROCEDURE [dbo].[SP_DMCS_Delete_Tier_Req]
	@tier_req_id integer = 0
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	Delete dbo.tier_req
	where tier_req_id  = @tier_req_id 	 
	
END

GO
/****** Object:  StoredProcedure [dbo].[SP_DMCS_Delete_Transportation]    Script Date: 3/7/2014 5:04:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Edward Sobanski
-- Create date: 4/21/2012
-- Description:Delete Transportation record
-- =============================================
CREATE PROCEDURE [dbo].[SP_DMCS_Delete_Transportation]
	@transport_id integer = 0
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	Delete dbo.transportation
	where transport_id  = @transport_id 	 
	
END

GO
/****** Object:  StoredProcedure [dbo].[SP_DMCS_Delete_Vaccine]    Script Date: 3/7/2014 5:04:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Edward Sobanski
-- Create date: 4/21/2012
-- Description:Delete Vaccine record
-- =============================================
CREATE PROCEDURE [dbo].[SP_DMCS_Delete_Vaccine]
	@vaccine_id integer = 0
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	Delete dbo.vaccine
	where vaccine_id  = @vaccine_id 	 
	
END

GO
/****** Object:  StoredProcedure [dbo].[SP_DMCS_Delete_Vehicle]    Script Date: 3/7/2014 5:04:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Edward Sobanski
-- Create date: 4/21/2012
-- Description:Delete Vehicle record
-- =============================================
CREATE PROCEDURE [dbo].[SP_DMCS_Delete_Vehicle]
	@vehicle_id integer = 0
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	Delete dbo.vehicle
	where vehicle_id  = @vehicle_id 	 
	
END

GO
/****** Object:  StoredProcedure [dbo].[SP_DMCS_Delete_Vendor]    Script Date: 3/7/2014 5:04:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Edward Sobanski
-- Create date: 4/21/2012
-- Description:Delete Vendor record
-- =============================================
CREATE PROCEDURE [dbo].[SP_DMCS_Delete_Vendor]
	@vendor_id integer = 0
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	Delete dbo.vendor
	where vendor_id  = @vendor_id 	 
	
END

GO
/****** Object:  StoredProcedure [dbo].[SP_DMCS_Delete_Vendor_Products]    Script Date: 3/7/2014 5:04:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Edward Sobanski
-- Create date: 4/21/2012
-- Description:Delete Vendor_Products record
-- =============================================
CREATE PROCEDURE [dbo].[SP_DMCS_Delete_Vendor_Products]
	@vendor_prod_id integer = 0
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	Delete dbo.vendor_products
	where vendor_prod_id  = @vendor_prod_id 	 
	
END

GO
/****** Object:  StoredProcedure [dbo].[SP_DMCS_Delete_Vendor_Products_Shipments]    Script Date: 3/7/2014 5:04:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Edward Sobanski
-- Create date: 4/21/2012
-- Description:Delete Vendor_Products_Shipments record
-- =============================================
CREATE PROCEDURE [dbo].[SP_DMCS_Delete_Vendor_Products_Shipments]
	@PO_Order_no integer = 0,
	@ProductID integer = 0
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	Delete dbo.Vendor_Products_shipments
	where PO_Order_no  = @PO_Order_no
	  and ProductID = @ProductID 	 
	
END

GO
/****** Object:  StoredProcedure [dbo].[SP_DMCS_Delete_Warehouse]    Script Date: 3/7/2014 5:04:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Edward Sobanski
-- Create date: 4/21/2012
-- Description:Delete Warehouse record
-- =============================================
CREATE PROCEDURE [dbo].[SP_DMCS_Delete_Warehouse]
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
/****** Object:  StoredProcedure [dbo].[SP_DMCS_Delete_Warehouse_Product_Location]    Script Date: 3/7/2014 5:04:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Edward Sobanski
-- Create date: 4/21/2012
-- Description:Delete Warehouse_Products record
-- =============================================
CREATE PROCEDURE [dbo].[SP_DMCS_Delete_Warehouse_Product_Location]
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
/****** Object:  StoredProcedure [dbo].[sp_DMCS_Donor_DDL]    Script Date: 3/7/2014 5:04:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Edward Sobanski
-- Create date: 06/05/12
-- Description:	load donor drop down
-- =============================================
CREATE PROCEDURE [dbo].[sp_DMCS_Donor_DDL]
	
AS
BEGIN
	    select donor_id as ID,l_name +', ' + f_name Name from person, donor 
         where person.person_id = donor.PersonID 
                             union 
         select donor_id as ID, agency_name from agency, Donor 
         where agency.agency_id = Donor.AgencyID
END

GO
/****** Object:  StoredProcedure [dbo].[SP_DMCS_get_Account_ID]    Script Date: 3/7/2014 5:04:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Joseph Hemphill
-- Create date: 2/26/2013
-- Description:	get a Account ID after insert
-- =============================================
CREATE PROCEDURE [dbo].[SP_DMCS_get_Account_ID]
	-- Add the parameters for the stored procedure here
           
			@Bank_ID as int,
			@Account_Num as varchar(15),
			@Type as varchar(20)
       
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
SELECT [Account_ID]
  FROM [dbo].[Account]
 WHERE [Bank_ID] = @Bank_ID 
   and [Account_Num] = @Account_Num
   and [Type] = @Type
        
End

GO
/****** Object:  StoredProcedure [dbo].[SP_DMCS_get_AddressID]    Script Date: 3/7/2014 5:04:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Edward Sobanski
-- Create date: 5/21/2012
-- Description:	select address id from just inserted record
-- =============================================
CREATE PROCEDURE [dbo].[SP_DMCS_get_AddressID]
	-- Add the parameters for the stored procedure here
	  @address_type_id as int,
      @city as varchar(30)= null,
      @country as varchar(30)= null,
      @County_Township as varchar(30)= null,
      @longitude as decimal(18,12),
      @latitude as decimal(18,12),
      @state as char(2)= null,
      @str_add as varchar(30)= null,
      @str_add2 as  varchar(30)= null,
      @zip_plus_four as varchar(10)= null

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT [address_id]
	FROM [dbo].[address]
	where [address_type_id] = @address_type_id
      and [city] = @city
      and [country] = @country
      and ([County_Township] = @County_Township or [County_Township] is null)
      and [longitude] = @longitude
      and [latitude] = @latitude
      and [state] = @state
      and [str_add] = @str_add
      and ([str_add2] = @str_add2 or [str_add2] is null)
      and [zip_plus_four] = @zip_plus_four
    
END

GO
/****** Object:  StoredProcedure [dbo].[SP_DMCS_Get_Agency_employeeID]    Script Date: 3/7/2014 5:04:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Edward Sobanski
-- Create date: 5/31/2012
-- Description:	select Row from agency_Employee table
-- =============================================
CREATE PROCEDURE [dbo].[SP_DMCS_Get_Agency_employeeID]
	-- Add the parameters for the stored procedure here
      @agency_id as int,
      @employee_id as int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
  SELECT [agency_empl_id] 
    FROM [dbo].[agency_employees]
    WHERE ([agency_id] = @agency_id or [agency_id] is null)
      and ([employee_id] = @employee_id or [employee_id] is null)
      
END

GO
/****** Object:  StoredProcedure [dbo].[SP_DMCS_get_AgencyID]    Script Date: 3/7/2014 5:04:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Edward Sobanski
-- Create date: 5/30/2012
-- Description:	select Row from agency table
-- =============================================
CREATE PROCEDURE [dbo].[SP_DMCS_get_AgencyID]
	-- Add the parameters for the stored procedure here
	  @address_id as int,
	  @agency_name as varchar(100),
	  @primary_fName VARCHAR(50),
	  @primary_lName VARCHAR(50),
	  @primary_phone VARCHAR(50),
	  @sec_fName VARCHAR(50),
	  @sec_lName VARCHAR(50),
	  @sec_phone VARCHAR(50)

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
 
 SELECT [agency_id] 
   FROM [dbo].[agency] 
  WHERE [agency_name] = @agency_name
    and ([address_id] = @address_id or[address_id] is null) 
    and ([primary_fName] = @primary_fName or[primary_fName] is null)
    and ([primary_lName] = @primary_lName or[primary_lName] is null)
    and ([primary_phone] = @primary_phone or[primary_phone] is null)
    and ([sec_fName] = @sec_fName or[sec_fName] is null)
    and ([sec_lName] = @sec_lName or[sec_lName] is null)
    and ([sec_phone] = @sec_phone or[sec_phone] is null) 
  
  
END

GO
/****** Object:  StoredProcedure [dbo].[SP_DMCS_get_Bank_ID]    Script Date: 3/7/2014 5:04:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Jon Kamphuis
-- Create date: 2/26/2013
-- Description:	get a Bank ID after insert
-- =============================================
CREATE PROCEDURE [dbo].[SP_DMCS_get_Bank_ID]
	-- Add the parameters for the stored procedure here
           
			@Name as varchar(50),
			@IsFDIC as bit,
			@Routing_Num as varchar(10)
       
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
SELECT [Bank_ID]
  FROM [dbo].[bank]
 WHERE [Name] = @Name 
   and [IsFDIC] = @IsFDIC
   and [Routing_Num] = @Routing_Num
        
End

GO
/****** Object:  StoredProcedure [dbo].[SP_DMCS_get_Call_CenterID]    Script Date: 3/7/2014 5:04:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Edward Sobanski
-- Create date: 5/31/2012
-- Description:	select Row from Call Center table
-- =============================================
CREATE PROCEDURE [dbo].[SP_DMCS_get_Call_CenterID]
	-- Add the parameters for the stored procedure here
      @address_id as int,
      @call_center_name as varchar(100)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

   SELECT [call_center_id] 
     FROM [dbo].[call_center] 
     WHERE [call_center_name] =  @call_center_name
       and ([address_id] = @address_id or [address_id] is null)
     
   
END

GO
/****** Object:  StoredProcedure [dbo].[SP_DMCS_Get_Call_Centers]    Script Date: 3/7/2014 5:04:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Edward Sobanski
-- Create date: 4/21/2012
-- Description:	List of all call Centers for DDL
-- =============================================
CREATE PROCEDURE [dbo].[SP_DMCS_Get_Call_Centers] 
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT '' as call_center_id, '' as call_center_name
	    union
	SELECT Call_center_id, call_center_Name from dbo.call_center
END

GO
/****** Object:  StoredProcedure [dbo].[SP_DMCS_get_CampaignID]    Script Date: 3/7/2014 5:04:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Edward Sobanski
-- Create date: 5/31/2012
-- Description:	Select Row from Campaign table
-- =============================================
CREATE PROCEDURE [dbo].[SP_DMCS_get_CampaignID]
	-- Add the parameters for the stored procedure here
      @campaign_name as varchar(100),
      @campaign_start_date as datetime,
      @campaign_end_date as datetime,
      @medicine_id as int
      
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
   SELECT [campaign_id] 
     FROM [dbo].[campaign] 
    WHERE campaign_name = @campaign_name 
      and campaign_start_date = @campaign_start_date 
      and campaign_end_date = @campaign_end_date 
      and ([medicine_id] = @medicine_id or [medicine_id] is null)
      

 End

GO
/****** Object:  StoredProcedure [dbo].[SP_DMCS_get_Case_intakeID]    Script Date: 3/7/2014 5:04:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Edward Sobanski
-- Create date: 5/31/2012
-- Description:	Select Row from Case intake table
-- =============================================
CREATE PROCEDURE [dbo].[SP_DMCS_get_Case_intakeID]
	-- Add the parameters for the stored procedure here
       @circum_emergency_event as varchar(3),
       @circum_income_stolen as varchar(3),
       @circum_no_income as varchar(3),
       @circum_not_enough_income as varchar(3),
       @agency_id as int,
       @call_center_id as int
      
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
  SELECT max([case_id]) FROM [dbo].[case_intake] 
   WHERE [circum_emergency_event] = @circum_emergency_event
     and [circum_income_stolen] =   @circum_income_stolen
     and [circum_no_income] =   @circum_no_income
     and [circum_not_enough_income] =   @circum_not_enough_income
     and ([agency_id] =  @agency_id  or [agency_id] is null)
     and ([call_center_id] = @call_center_id or [call_center_id] is null)

 End

GO
/****** Object:  StoredProcedure [dbo].[SP_DMCS_get_Case_intakeID_MAX]    Script Date: 3/7/2014 5:04:02 PM ******/
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
/****** Object:  StoredProcedure [dbo].[SP_DMCS_GET_ClientWPets_ID]    Script Date: 3/7/2014 5:04:02 PM ******/
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
/****** Object:  StoredProcedure [dbo].[SP_DMCS_get_DebtID]    Script Date: 3/7/2014 5:04:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Edward Sobanski
-- Create date: 5/31/2012
-- Description:	Select Row from debt table
-- =============================================
CREATE PROCEDURE [dbo].[SP_DMCS_get_DebtID]
	-- Add the parameters for the stored procedure here
     
            @amt_paid as decimal = 0,
            @case_id as int = 0,
            @client_id as int = 0,
            @creditor_name as varchar(100) = Null,
            @debt_amt as decimal = 0,
            @item_purchased as varchar(100) = Null,
            @value_amt as decimal = 0
      
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
    SELECT [debt_id]
      FROM [dbo].[debt] 
      where [amt_paid] = @amt_paid 
        and [creditor_name] = @creditor_name
        and [debt_amt] = @debt_amt
        and [item_purchased] = @item_purchased
        and [value_amt] = @value_amt
        and ([case_id] = @case_id or [case_id] is null)
        and ([client_id] = @client_id or [client_id] is null)
     
End

GO
/****** Object:  StoredProcedure [dbo].[SP_DMCS_get_Disaster_EncounterID]    Script Date: 3/7/2014 5:04:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Edward Sobanski
-- Create date: 6/1/2013
-- Description:	Select Row on disaster encounter table
-- =============================================
CREATE PROCEDURE [dbo].[SP_DMCS_get_Disaster_EncounterID]
	-- Add the parameters for the stored procedure here
       @disaster_id as int,
       @encounter_id as int,
       @address_id as int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
   SELECT [disaster_encounter_id] 
   FROM [dbo].[disaster_encounter] 
   where ([disaster_id] = @disaster_id or [disaster_id] is null)
     and ([encounter_id] = @encounter_id or [encounter_id] is null) 
     and ([address_id] = @address_id or [address_id] is null)
      
End

GO
/****** Object:  StoredProcedure [dbo].[SP_DMCS_get_DisasterID]    Script Date: 3/7/2014 5:04:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Edward Sobanski
-- Create date: 6/1/2012
-- Description:	Select Row on disaster table
-- =============================================
CREATE PROCEDURE [dbo].[SP_DMCS_get_DisasterID]
	-- Add the parameters for the stored procedure here
     
           @disaster_name as varchar(50),
           @disaster_type as varchar(30),
           @disaster_start_date as datetime,
		   @disaster_end_date as datetime,
		   @disaster_north_latitude as Decimal,
           @disaster_north_longitude as Decimal,
           @disaster_south_latitude as Decimal,
           @disaster_south_longitude as Decimal,
           @disaster_east_latitude as Decimal,
           @disaster_east_longitude as Decimal,
           @disaster_west_latitude as Decimal,
           @disaster_west_longitude as Decimal  
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
SELECT [disaster_id]
  FROM [dbo].[disaster]
 WHERE [disaster_name] =  @disaster_name
   and [disaster_type] = @disaster_type
   and [disaster_start_date] = @disaster_start_date
   and [disaster_end_date] = @disaster_end_date
   and [disaster_north_latitude] = @disaster_north_latitude
   and [disaster_north_longitude] =  @disaster_north_longitude
   and [disaster_south_latitude] =  @disaster_south_latitude
   and [disaster_south_longitude] = @disaster_south_longitude
   and [disaster_east_latitude] =  @disaster_east_latitude
   and [disaster_east_longitude] = @disaster_east_longitude
   and [disaster_west_latitude] = @disaster_west_latitude
   and [disaster_west_longitude] =  @disaster_west_longitude
End

GO
/****** Object:  StoredProcedure [dbo].[SP_DMCS_Get_disasters]    Script Date: 3/7/2014 5:04:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Edward Sobanski
-- Create date: 6/14/2012
-- Description:	Get list of disaster
-- =============================================
CREATE PROCEDURE [dbo].[SP_DMCS_Get_disasters] 
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
    
    select '' as disaster_id, '' as disaster_name
    union
	select disaster_id, disaster_name from disaster;
END

GO
/****** Object:  StoredProcedure [dbo].[SP_DMCS_get_Donation_ID]    Script Date: 3/7/2014 5:04:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Joshua Stone
-- Create date: 2/26/2013
-- Description:	get a Donation ID after insert
-- =============================================
CREATE PROCEDURE [dbo].[SP_DMCS_get_Donation_ID]
	-- Add the parameters for the stored procedure here
           
            @Donation_ID as int,
			@Receipt_ID as int,
			@Resource_ID as int,
			@Donor_ID as int,
			@Date as datetime,
			@Quantity as int,
			@Agency_ID as int,
			@Is_Monetary as bit,
			@Is_FEMA as bit
       
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
SELECT [Donation_ID]
  FROM [dbo].[donation]
 WHERE [Receipt_ID] = @Receipt_ID 
   and [Resource_ID] = @Resource_ID
   and [Donor_ID] = @Donor_ID
   and [Date] = @Date
   and [Quantity] = @Quantity
   and [Agency_ID] = @Agency_ID
   and [Is_Monetary] = @Is_Monetary
   and [IS_FEMA] = @Is_FEMA
        
End

GO
/****** Object:  StoredProcedure [dbo].[SP_DMCS_get_Donor_ProductID]    Script Date: 3/7/2014 5:04:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Edward Sobanski
-- Create date: 6/1/2012
-- Description:	Select Row on doner Product table
-- =============================================
CREATE PROCEDURE [dbo].[SP_DMCS_get_Donor_ProductID]
	-- Add the parameters for the stored procedure here
       @DonorID as int,
       @ProductID as int,
       @quantity as int,
       @other_info as varchar,
       @Product_rec_date as datetime,
       @AmountOfProdDonated as varchar
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
    SELECT [DonorProductID] 
      FROM [dbo].[Donor_Product] 
     WHERE [quantity] = @quantity
      and [other_info] = @other_info
      and [Product_rec_date] = @Product_rec_date
      and [AmountOfProdDonated] = @AmountOfProdDonated
      and ([DonorID] = @DonorID or [DonorID] is null)
      and ([ProductID] = @ProductID or [ProductID] is null)
      
End

GO
/****** Object:  StoredProcedure [dbo].[SP_DMCS_get_DonorID]    Script Date: 3/7/2014 5:04:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Edward Sobanski
-- Create date: 6/1/2012
-- Description:	Select Row on doner table
-- =============================================
CREATE PROCEDURE [dbo].[SP_DMCS_get_DonorID]
	-- Add the parameters for the stored procedure here

       
       @PersonID  as int,
       @Status as varchar,
       @DonorType as varchar,
       @AgencyID as int,
       @Phone as int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
   
    SELECT [donor_id] 
      FROM [dbo].[Donor]
     WHERE [Status] = @Status
       and [DonorType] = @DonorType
       and ([PersonID] = @PersonID or [PersonID] is null) 
       and ([AgencyID] = @AgencyID or [AgencyID] is null)
       and [Phone] = @Phone
        
End

GO
/****** Object:  StoredProcedure [dbo].[SP_DMCS_get_Emergency_MedicalID]    Script Date: 3/7/2014 5:04:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Edward Sobanski
-- Create date: 6/2/2012
-- Description:	Select Row on Emergency medical table
-- =============================================
CREATE PROCEDURE [dbo].[SP_DMCS_get_Emergency_MedicalID]
	-- Add the parameters for the stored procedure here
      @client_id as int,
      @ambulance_company_name as varchar,
      @ambulance_identification as varchar,
      @appointment_date as datetime,
      @area_of_specialty as varchar,
      @assistance_order as varchar,
      @date_of_service as datetime,
      @doctor_appointments as varchar,
      @doctor_id as int,
      @doctor_start_date as datetime,
      @driver_id as int,
      @educational_institution_name as varchar,
      @hospital_name as varchar,
      @lights_sirens_to_scene as varchar,
      @location_type as varchar,
      @number_of_days_admitted as int,
      @office_location as varchar,
      @time_of_service as datetime,
      @total_cost as decimal,
      @deceased_id as int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
   SELECT [em_id] 
     FROM [dbo].[emergency_medical] 
    WHERE [ambulance_company_name] =  @ambulance_company_name
    and [ambulance_identification] = @ambulance_identification
    and [appointment_date] = @appointment_date
    and [area_of_specialty] = @area_of_specialty
    and [assistance_order] = @assistance_order
    and [date_of_service] = @date_of_service 
    and [doctor_appointments] = @doctor_appointments
    and [doctor_start_date] = @doctor_start_date
    and [educational_institution_name] = @educational_institution_name
    and [hospital_name] = @hospital_name
    and [lights_sirens_to_scene] = @lights_sirens_to_scene
    and [location_type] = @location_type
    and [number_of_days_admitted] = @number_of_days_admitted
    and [office_location] = @office_location
    and [time_of_service] = @time_of_service
    and [total_cost] = @total_cost
    and ([client_id] = @client_id or [client_id] is null) 
    and ([doctor_id] = @doctor_id or [doctor_id] is null) 
    and ([driver_id] = @driver_id or [driver_id] is null)
    and ([deceased_id] = @deceased_id or [deceased_id] is null) 
      
End

GO
/****** Object:  StoredProcedure [dbo].[SP_DMCS_get_Employee_ClientsID]    Script Date: 3/7/2014 5:04:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Edward Sobanski
-- Create date: 6/1/2012
-- Description:	Select Row on Employee clients table
-- =============================================
CREATE PROCEDURE [dbo].[SP_DMCS_get_Employee_ClientsID]
	-- Add the parameters for the stored procedure here
      @client_id as int,
      @employee_id as int
      
   AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
    SELECT [emp_client_id] 
      FROM [dbo].[employee_clients] 
     Where ([client_id] = @client_id or [client_id] is null)
       and ([employee_id] = @employee_id or [employee_id] is null)
      
End

GO
/****** Object:  StoredProcedure [dbo].[SP_DMCS_get_EmployeeID]    Script Date: 3/7/2014 5:04:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Edward Sobanski
-- Create date: 6/1/2012
-- Description:	Select Row on Employee table
-- =============================================
CREATE PROCEDURE [dbo].[SP_DMCS_get_EmployeeID]
	-- Add the parameters for the stored procedure here
     
      @employee_date_hired as datetime,
      @employee_department as varchar,
      @employee_hours_worked as int,
      @employee_leadership as varchar,
      @employee_motivation as varchar,
      @employee_overall as varchar,
      @employee_payrate as decimal,
      @employee_performance as varchar,
      @employee_quality as varchar,
      @employee_timeliness as varchar,
      @username as varchar,
      @pswd as varchar
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
SELECT [employee_id]
  FROM [dbo].[employee]
 WHERE [employee_date_hired] = @employee_date_hired
   and [employee_department] =  @employee_department
   and [employee_hours_worked] = @employee_hours_worked
   and [employee_leadership] =  @employee_leadership
   and [employee_motivation] = @employee_motivation
   and [employee_overall] = @employee_overall 
   and [employee_payrate] = @employee_payrate
   and [employee_performance] = @employee_performance
   and [employee_quality] =  @employee_quality
   and [employee_timeliness] =  @employee_timeliness 
   and [username] = @username
   and [pswd] =  @pswd
End

GO
/****** Object:  StoredProcedure [dbo].[SP_DMCS_Get_Employees]    Script Date: 3/7/2014 5:04:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Edward Sobanski
-- Create date: 8/09/2012
-- Description:	List of all employes for DDL
-- =============================================
CREATE PROCEDURE [dbo].[SP_DMCS_Get_Employees] 
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT '' as employee_id, '' as emp_name
	    union
	select e.employee_id,p.f_name + ' ' + p.l_name as emp_name 
      from person p,employee e
     where p.person_id = e.employee_id
END

GO
/****** Object:  StoredProcedure [dbo].[SP_DMCS_get_EmployerID]    Script Date: 3/7/2014 5:04:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Edward Sobanski
-- Create date: 6/1/2012
-- Description:	Select Row on Employer table
-- =============================================
CREATE PROCEDURE [dbo].[SP_DMCS_get_EmployerID]
	-- Add the parameters for the stored procedure here

        @case_id as int,
        @client_id as int,
        @address_id as int,
        @emplr_name as varchar(50),
        @emplr_phone as varchar(11)
        
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
    SELECT [emplr_id] 
      FROM [dbo].[employer] 
     WHERE [emplr_name] = @emplr_name
       and [emplr_phone] = @emplr_phone
       and ([case_id] = @case_id or [case_id] is null)
       and ([client_id] = @client_id or [client_id] is null)
       and ([address_id] = @address_id or [address_id] is null) 
      
End

GO
/****** Object:  StoredProcedure [dbo].[SP_DMCS_get_Encounter_ServicesID]    Script Date: 3/7/2014 5:04:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Edward Sobanski
-- Create date: 6/2/2012
-- Description:	Select Row on Encounter Services table
-- =============================================
CREATE PROCEDURE [dbo].[SP_DMCS_get_Encounter_ServicesID]
	-- Add the parameters for the stored procedure here
      @encounter_id as int,
      @mobile_unit_id as int,
      @service_id as int,
      @service_date as datetime,
      @service_completed as datetime
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
    
    SELECT [encounter_serv_id] 
      FROM [dbo].[encounter_services] 
     where [service_date] = @service_date
       and [service_completed] = @service_completed
       and ( [encounter_id] = @encounter_id or [encounter_id] is null)
       and ([mobile_unit_id] = @mobile_unit_id or [mobile_unit_id] is null)
       and ([service_id] = @service_id or [service_id] is null)
     
End

GO
/****** Object:  StoredProcedure [dbo].[SP_DMCS_get_EncounterID]    Script Date: 3/7/2014 5:04:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Edward Sobanski
-- Create date: 6/2/2012
-- Description:	Select Row on Encounter table
-- =============================================
CREATE PROCEDURE [dbo].[SP_DMCS_get_EncounterID]
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
/****** Object:  StoredProcedure [dbo].[SP_DMCS_get_ExpenseID]    Script Date: 3/7/2014 5:04:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Edward Sobanski
-- Create date: 5/22/2012
-- Description:	Select Row on Expense table
-- =============================================
CREATE PROCEDURE [dbo].[SP_DMCS_get_ExpenseID]
	-- Add the parameters for the stored procedure here
       @case_id as int,
       @client_id as int,
       @expense_amt_paid as decimal,
       @expense_amt_paid_to as varchar
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
    
    SELECT [expense_id] 
      FROM [dbo].[expense] 
     WHERE [expense_amt_paid] =  @expense_amt_paid
       and [expense_amt_paid_to] = @expense_amt_paid_to  
       and ([case_id] = @case_id or [case_id] is null)
       and ([client_id] = @client_id or [client_id] is null)
      
End

GO
/****** Object:  StoredProcedure [dbo].[SP_DMCS_get_FEMA_ID]    Script Date: 3/7/2014 5:04:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		James Miller
-- Create date: 2/28/2013
-- Description:	get a FEMA ID after insert
-- =============================================
CREATE PROCEDURE [dbo].[SP_DMCS_get_FEMA_ID]
	-- Add the parameters for the stored procedure here
           
	  @FEMA_ID as int,
	  @Cost_Code as int,
      @Equipment as int,
      @Specification as VarChar,
      @Capacity_Size as VarChar,
      @HP as VarChar,
      @Notes as VarChar,
      @Unit as VarChar,
      @Rate as VarChar
       
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
SELECT [FEMA_ID]
  FROM [dbo].[FEMA]
 WHERE [FEMA_ID] = @FEMA_ID
	and [Cost_Code] = @Cost_Code
	and [Equipment] = @Equipment 
	and [Specification] = @Specification
	and [Capacity_Size] = @Capacity_Size
	and [HP] = @HP
	and [Notes] = @Notes
	and [Unit] = @Unit
	and [Rate] = @Rate
        
      
      
End

GO
/****** Object:  StoredProcedure [dbo].[SP_DMCS_get_House_ChoiceID]    Script Date: 3/7/2014 5:04:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Edward Sobanski
-- Create date: 6/2/2012
-- Description:	Select Row on house choice table
-- =============================================
CREATE PROCEDURE [dbo].[SP_DMCS_get_House_ChoiceID]
	-- Add the parameters for the stored procedure here
      
      @house_id as int, 
      @address_id as int,
      @house_choice_bathrooms as int,
      @house_choice_comments as varchar,
      @house_choice_contact_person_id as int,
      @house_choice_laundry as varchar,
      @house_choice_no_floors as int,
      @house_choice_parking as varchar,
      @house_choice_rent as decimal,
      @house_choice_type as varchar,
      @house_choice_units_avail as int
       
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
   
   SELECT [house_choice_id] 
     FROM [dbo].[house_choice] 
    WHERE  [house_choice_bathrooms] =  @house_choice_bathrooms
      and [house_choice_comments] = @house_choice_comments
      and [house_choice_laundry] = @house_choice_laundry
      and [house_choice_no_floors] = @house_choice_no_floors
      and [house_choice_parking] = @house_choice_parking
      and [house_choice_rent] =  @house_choice_rent
      and [house_choice_type] = @house_choice_type
      and [house_choice_units_avail] = @house_choice_units_avail
      and ([house_id] = @house_id or [house_id] is null)
      and ([address_id] = @address_id or [address_id] is null)
      and ([house_choice_contact_person_id] = @house_choice_contact_person_id or [house_choice_contact_person_id] is null)
         
End

GO
/****** Object:  StoredProcedure [dbo].[SP_DMCS_get_houseID]    Script Date: 3/7/2014 5:04:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Edward Sobanski
-- Create date: 6/2/2012
-- Description:	Select Row on house table
-- =============================================
create PROCEDURE [dbo].[SP_DMCS_get_houseID]
	-- Add the parameters for the stored procedure here
      
      @house_name as varchar,
      @house_eligibility as varchar,
      @house_request_date as datetime,
      @house_voucher_amt as decimal,
      @house_voucher_begin_date as datetime,
      @house_voucher_exp_date as datetime,
      @house_voucher_num as int,
      @house_voucher_schedule as varchar,
      @house_wait_list as int
       
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
SELECT [house_id]
  FROM [dbo].[house]
 WHERE [house_name] =  @house_name
   and [house_eligibility] = @house_eligibility
   and [house_request_date] = @house_request_date
   and [house_voucher_amt] =  @house_voucher_amt
   and [house_voucher_begin_date] = @house_voucher_begin_date
   and [house_voucher_exp_date] = @house_voucher_exp_date
   and [house_voucher_num] = @house_voucher_num
   and [house_voucher_schedule] = @house_voucher_schedule
   and [house_wait_list] = @house_wait_list
        
End

GO
/****** Object:  StoredProcedure [dbo].[SP_DMCS_get_Income_SourceID]    Script Date: 3/7/2014 5:04:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Edward Sobanski
-- Create date: 6/2/2012
-- Description:	Select Row on Income_Source table
-- =============================================
CREATE PROCEDURE [dbo].[SP_DMCS_get_Income_SourceID]
	-- Add the parameters for the stored procedure here
      
     @case_id as int,
       @cash_amt as money = null,
       @cash_on_hand as char(1) = 'N',
       @wages_stopped as char(1) = 'N',
       @waiting_on_income as char(1) = 'N',
       @recieving_income as char(1) = 'N',
       @no_income as char(1)= 'N',
       @currently_working as char(1)= 'N',
       @laid_off as char(1)= 'N',
       @never_worked as char(1)= 'N',
       @quit as char(1)= 'N',
       @fired as char(1)= 'N',
       @sick_leave as char(1)= 'N',
       @maternity_leave as char(1)= 'N',
       @on_strike as char(1)= 'N',
       @trying_to_find_work as char(1)= 'N',
       @ckg_acct as char(1)= 'N',
       @ckg_balance as money= null,
       @ckg_bank as varchar(30)= null,
       @claims as char(1)= 'N',
       @claims_memo as text= null,
       @client_id as int= null,
       @gifts_amt as money= null,
       @gifts_inc as char(1)= 'N',
       @investments as char(1)= 'N',
       @life_ins as char(1)= 'N',
       @other_ins as char(1)= 'N',
       @pension_amt as money= null,
       @pension_inc as char(1)= null,
       @strike_benefits_amt as money= null,
       @strike_benefits_inc as char(1)= 'N',
       @support_amt as money= null,
       @support_inc as char(1)= 'N',
       @SSI_Amt as money= null,
       @SSI_Inc as char(1)= 'N',
       @svgs_acct as char(1)= null,
       @svgs_balance as money= null,
       @svgs_bank as varchar(30)= null,
       @wages_amt as money= null,
       @wages_inc as char(1)= 'N'
       
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
SELECT [income_source_id] 
  FROM [dbo].[income_source] 
 WHERE [cash_amt] = @cash_amt
   and [cash_on_hand] =  @cash_on_hand
   and [wages_stopped] = @wages_stopped
   and [waiting_on_income] = @waiting_on_income
   and [recieving_income] = @recieving_income
   and [no_income] = @no_income
   and [currently_working] = @currently_working
   and [laid_off] = @laid_off
   and [never_worked] = @never_worked
   and [quit] = @quit
   and [fired] = @fired
   and [sick_leave] =  @sick_leave
   and [maternity_leave] =  @maternity_leave
   and [on_strike] =  @on_strike
   and [trying_to_find_work] =  @trying_to_find_work
   and [ckg_acct] =   @ckg_acct
   and [ckg_balance] =   @ckg_balance
   and [ckg_bank] =  @ckg_bank
   and [claims] =  @claims
   and [gifts_amt] =  @gifts_amt
   and [gifts_inc] =  @gifts_inc
   and [investments] =  @investments
   and [life_ins] =  @life_ins
   and [other_ins] =  @other_ins
   and [pension_amt] =  @pension_amt
   and [pension_inc] =  @pension_inc
   and [strike_benefits_amt] =  @strike_benefits_amt
   and [strike_benefits_inc] =   @strike_benefits_inc
   and [support_amt] =  @support_amt
   and [support_inc] =  @support_inc
   and [SSI_Amt] =  @SSI_Amt
   and [SSI_Inc] =  @SSI_Inc
   and [svgs_acct] =  @svgs_acct
   and [svgs_balance] =  @svgs_balance
   and [svgs_bank] =  @svgs_bank
   and [wages_amt] =   @wages_amt
   and [wages_inc] =   @wages_inc
   and ([client_id] is null or [client_id] = @client_id)
   and ([case_id] is null or [case_id] = @case_id)

   
End

GO
/****** Object:  StoredProcedure [dbo].[SP_DMCS_GET_Job_Categoryid]    Script Date: 3/7/2014 5:04:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Edward Sobanski
-- Create date: 6/2/2012
-- Description:	Select Row on Job Category table
-- =============================================
create PROCEDURE [dbo].[SP_DMCS_GET_Job_Categoryid]
	-- Add the parameters for the stored procedure here
           
           @job_category_name as varchar
       
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
SELECT [job_cat_id]
  FROM [dbo].[job_category]
 WHERE job_category_name = @job_category_name
        
End

GO
/****** Object:  StoredProcedure [dbo].[SP_DMCS_get_JobID]    Script Date: 3/7/2014 5:04:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Edward Sobanski
-- Create date: 6/2/2012
-- Description:	Select Row on Job table
-- =============================================
CREATE PROCEDURE [dbo].[SP_DMCS_get_JobID]
	-- Add the parameters for the stored procedure here
           
      @address_id as int,
      @company_id as int,
      @job_cat_id as int,
      @job_posted_date as datetime,
      @job_status as varchar,
      @job_title as varchar,
      @Work_Classification_Full_time as varchar,
      @Work_Classification_Part_time as varchar,
      @Work_Payment_Freq_Weekly as varchar,
      @Work_Payment_Freq_BiWeekly as varchar,
      @Work_Payment_Freq_Monthly as varchar,
      @Work_Payment_Freq_BiMonthly as varchar
       
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
    
    SELECT [job_id] 
      FROM [dbo].[job] 
     WHERE [job_posted_date] = @job_posted_date
       and [job_status] = @job_status
       and [job_title] = @job_title
       and [Work_Classification_Full_time] = @Work_Classification_Full_time
       and [Work_Classification_Part_time] = @Work_Classification_Part_time
       and [Work_Payment_Freq_Weekly] = @Work_Payment_Freq_Weekly
       and [Work_Payment_Freq_Bi-Weekly] = @Work_Payment_Freq_BiWeekly
       and [Work_Payment_Freq_Monthly] =  @Work_Payment_Freq_Monthly
       and [Work_Payment_Freq_Bi-Monthly] = @Work_Payment_Freq_BiMonthly
       and ([address_id] =  @address_id or [address_id] is null)
       and ([company_id] = @company_id or [company_id] is null)
       and ([job_cat_id] = @job_cat_id or [job_cat_id] is null)
      
End

GO
/****** Object:  StoredProcedure [dbo].[SP_DMCS_get_Location_ID]    Script Date: 3/7/2014 5:04:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Justin Gamble
-- Create date: 2/26/2013
-- Description:	get a Location ID after insert
-- =============================================
CREATE PROCEDURE [dbo].[SP_DMCS_get_Location_ID]
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
/****** Object:  StoredProcedure [dbo].[SP_DMCS_get_Location_ID_MAX]    Script Date: 3/7/2014 5:04:02 PM ******/
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
/****** Object:  StoredProcedure [dbo].[SP_DMCS_Get_Login_Info]    Script Date: 3/7/2014 5:04:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Edward Sobanski
-- Create date: 6/8/12
-- Description:	get login information
-- =============================================
CREATE PROCEDURE [dbo].[SP_DMCS_Get_Login_Info]
	-- Add the parameters for the stored procedure here
	        @UserName as varchar(50),
	        @password as varchar(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT Person.Person_ID, Person.Person_Type
	FROM Person,employee 
	WHERE Person.Person_ID=employee.employee_id 
	  and Employee.username =  @UserName 
	  AND employee.Pswd =  @password
END

GO
/****** Object:  StoredProcedure [dbo].[SP_DMCS_get_LotID]    Script Date: 3/7/2014 5:04:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Edward Sobanski
-- Create date: 6/2/2012
-- Description:	Select Row on Lot table
-- =============================================
CREATE PROCEDURE [dbo].[SP_DMCS_get_LotID]
	-- Add the parameters for the stored procedure here
           
       @product_id as int,
       @manufactured_date as datetime,
       @expiration_date as datetime,
       @manufacture_name as varchar
       
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    SELECT [lot_id] 
      FROM [dbo].[lot] 
     WHERE [manufactured_date] = @manufactured_date
       and [expiration_date] = @expiration_date
       and [manufacture_name] = @manufacture_name
       and ([product_id] = @product_id or [product_id] is null)
      
End

GO
/****** Object:  StoredProcedure [dbo].[SP_DMCS_get_Medical_AssistanceID]    Script Date: 3/7/2014 5:04:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Edward Sobanski
-- Create date: 6/3/2012
-- Description:	Select Medical Assistance on Lot table
-- =============================================
CREATE PROCEDURE [dbo].[SP_DMCS_get_Medical_AssistanceID]
	-- Add the parameters for the stored procedure here
           
      @em_id as int,
      @medical_assist_date as datetime,
      @medical_assist_doctor_id as int, 
      @medical_assist_hosp_price as decimal,
      @medical_assist_hospital_name as varchar,
      @medical_assist_script_meds as varchar,
      @medical_assist_script_price as decimal,
      @medical_assist_script_quantity as int
       
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
    
    SELECT [medical_assist_order_id] 
      FROM [dbo].[medical_assistance] 
     WHERE [medical_assist_date] = @medical_assist_date
       and [medical_assist_hosp_price] = @medical_assist_hosp_price
       and [medical_assist_hospital_name] = @medical_assist_hospital_name
       and [medical_assist_script_meds] = @medical_assist_script_meds
       and [medical_assist_script_price] =  @medical_assist_script_price
       and [medical_assist_script_quantity]  =  @medical_assist_script_quantity
       and ([medical_assist_doctor_id] = @medical_assist_doctor_id or [medical_assist_doctor_id] is null)
       and ([em_id] = @em_id or [em_id] is null)
        
End

GO
/****** Object:  StoredProcedure [dbo].[SP_DMCS_get_MedicineID]    Script Date: 3/7/2014 5:04:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Edward Sobanski
-- Create date: 6/3/2012
-- Description:	Select Medicine on Lot table
-- =============================================
CREATE PROCEDURE [dbo].[SP_DMCS_get_MedicineID]
	-- Add the parameters for the stored procedure here
      @medicine_id as int,  
      @Medication_type as varchar, 
      @Medication_name as varchar,
      @Clients_Served as int
       
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
    
    SELECT [Medicine_Id] FROM [dbo].[medicine] 
     WHERE [Medication_type] = @Medication_type
       and [Medication_name] = @Medication_name
       and [Clients_Served] =  @Clients_Served
       and ([medicine_id] = @medicine_id or [medicine_id] is null)
           
End

GO
/****** Object:  StoredProcedure [dbo].[SP_DMCS_get_MilitaryID]    Script Date: 3/7/2014 5:04:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Edward Sobanski
-- Create date: 6/3/2012
-- Description:	Select Military on Lot table
-- =============================================
CREATE PROCEDURE [dbo].[SP_DMCS_get_MilitaryID]
	-- Add the parameters for the stored procedure here
           
       @case_id as int,
       @client_id as int,
       @military_branch as varchar,
       @serial_num as int
       
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
    
    SELECT [military_id] FROM [dbo].[military] 
     WHERE [military_branch] = @military_branch
       and [serial_num] = @serial_num
       and ([case_id] = @case_id or [case_id] is null)
       and ([client_id] = @client_id or [client_id] is null)
      
End

GO
/****** Object:  StoredProcedure [dbo].[SP_DMCS_get_Mobile_EmployeesID]    Script Date: 3/7/2014 5:04:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Edward Sobanski
-- Create date: 6/3/2012
-- Description:	Select row on mobile employees table
-- =============================================
CREATE PROCEDURE [dbo].[SP_DMCS_get_Mobile_EmployeesID]
	-- Add the parameters for the stored procedure here
           
            @mobile_unit_id as int,
            @employee_id as int
       
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
   
    SELECT [mobile_employee_id] 
      FROM [dbo].[mobile_employees] 
      WHERE ([mobile_unit_id] = @mobile_unit_id or [mobile_unit_id] is null)
        and ([employee_id] = @employee_id or [employee_id] is null) 
      
End

GO
/****** Object:  StoredProcedure [dbo].[SP_DMCS_get_mobile_productID]    Script Date: 3/7/2014 5:04:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Edward Sobanski
-- Create date: 6/20/2012
-- Description:	get mobile product id fro mobile product table
-- =============================================
CREATE PROCEDURE [dbo].[SP_DMCS_get_mobile_productID]
	-- Add the parameters for the stored procedure here
           
     
       @Mobile_Unit_id as int,
       @Product_id as int,
       @Case_id as int,
       @Lot_id as int,
       @Min_inv as int,
       @Quantity as int,
       @Experiation_Date as datetime
       
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
 
    SELECT [Mobile_Product_id] 
      FROM [dbo].[mobile_product] 
     WHERE [Min_inv] = @Min_inv
       and [Quantity] = @Quantity
       and [Experiation_Date] = @Experiation_Date
       and ([Mobile_Unit_id] = @Mobile_Unit_id or [Mobile_Unit_id] is null) 
       and ([Product_id] = @Product_id or [Product_id] is null)
       and ([Case_id] = @Case_id or [Case_id] is null) 
       and ([Lot_id] = @Lot_id or [Lot_id] is null)
     
  
End

GO
/****** Object:  StoredProcedure [dbo].[SP_DMCS_get_Mobile_UnitID]    Script Date: 3/7/2014 5:04:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Edward Sobanski
-- Create date: 6/3/2012
-- Description:	Select row on mobile Unit table
-- =============================================
CREATE PROCEDURE [dbo].[SP_DMCS_get_Mobile_UnitID]
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
/****** Object:  StoredProcedure [dbo].[SP_DMCS_get_Order_ProductID]    Script Date: 3/7/2014 5:04:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Edward Sobanski
-- Create date:6/3/2012
-- Description:	Select row on order product table
-- =============================================
CREATE PROCEDURE [dbo].[SP_DMCS_get_Order_ProductID]
	-- Add the parameters for the stored procedure here
           
       @orderID as int,
       @ProductID as int,
       @Quantity as int,
       @warehouseid as int,
       @DatePicked as datetime,
       @Qtypicked as int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    SELECT [order_Product_ID] 
      FROM [dbo].[Order_Product] 
     WHERE [Quantity] = @Quantity
       and [DatePicked] = @DatePicked
       and [Qtypicked] = @Qtypicked
       and ([orderID] = @orderID or [orderID] is null)
       and ([ProductID] = @ProductID or [ProductID] is null) 
       and ([warehouseid] = @warehouseid or [warehouseid] is null)
      
End

GO
/****** Object:  StoredProcedure [dbo].[SP_DMCS_get_PersonID]    Script Date: 3/7/2014 5:04:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Edward Sobanski
-- Create date: 6/3/2012
-- Description:	Select row on person table
-- =============================================
CREATE PROCEDURE [dbo].[SP_DMCS_get_PersonID]
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
/****** Object:  StoredProcedure [dbo].[SP_DMCS_get_Pet_Deceased_ID]    Script Date: 3/7/2014 5:04:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Mike Phillips
-- Create date: 3/29/2013
-- Description:	get pet deceased id after insert
-- =============================================
CREATE PROCEDURE [dbo].[SP_DMCS_get_Pet_Deceased_ID]
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
/****** Object:  StoredProcedure [dbo].[SP_DMCS_get_Pet_Deceased_ID_MAX]    Script Date: 3/7/2014 5:04:02 PM ******/
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
/****** Object:  StoredProcedure [dbo].[SP_DMCS_get_pet_missingID]    Script Date: 3/7/2014 5:04:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		Mike Phillips
-- Create date: 3/29/2012
-- Description:	get missing pet id after insert
-- =============================================
CREATE PROCEDURE [dbo].[SP_DMCS_get_pet_missingID]
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
  FROM [dbo].[Pet_Missing]
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
/****** Object:  StoredProcedure [dbo].[SP_DMCS_get_pet_missingID_MAX]    Script Date: 3/7/2014 5:04:02 PM ******/
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
/****** Object:  StoredProcedure [dbo].[SP_DMCS_get_Pet_typeID]    Script Date: 3/7/2014 5:04:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Jianwang Xing
-- Create date: 3/29/2013
-- Description:	get pet type id after insert
-- =============================================
CREATE PROCEDURE [dbo].[SP_DMCS_get_Pet_typeID]
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
/****** Object:  StoredProcedure [dbo].[SP_DMCS_get_Pet_typeID_MAX]    Script Date: 3/7/2014 5:04:02 PM ******/
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
/****** Object:  StoredProcedure [dbo].[SP_DMCS_Get_Pet_Types_ddl]    Script Date: 3/7/2014 5:04:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Jianwang Xing
-- Create date: 3/29/2013
-- Description:	Get pet types for ddl
-- =============================================
CREATE PROCEDURE [dbo].[SP_DMCS_Get_Pet_Types_ddl] 
	
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
/****** Object:  StoredProcedure [dbo].[SP_DMCS_get_Pet_Vaccine_ID]    Script Date: 3/7/2014 5:04:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Mike Phillips
-- Create date: 3/29/2013
-- Description:	get pet Vaccines id after insert
-- =============================================
CREATE PROCEDURE [dbo].[SP_DMCS_get_Pet_Vaccine_ID]
	-- Add the parameters for the stored procedure here
            /*@Pet_Vaccine_ID as int,*/
			@Last_Vaccine_Given as DateTime,
            @Pet_Record_ID AS int,
            @Datetime AS DateTime,
			@Vaccine_Type_ID as int
       
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
SELECT [Pet_Vaccine_ID]
  FROM [dbo].[Pet_Vaccine]
 WHERE /*[Pet_Vaccine_ID]= @Pet_Vaccine_ID
   and */[Last_Vaccine_Given] = @Last_Vaccine_Given
   and [Pet_Record_ID] = @Pet_Record_ID 
   and [Datetime] = @Datetime
   and [Vaccine_Type_ID] = @Vaccine_Type_ID
        
End

GO
/****** Object:  StoredProcedure [dbo].[SP_DMCS_get_petsID]    Script Date: 3/7/2014 5:04:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Jianwang Xing
-- Create date: 3/29/2013
-- Description:	select Row from pet table
-- =============================================
CREATE PROCEDURE [dbo].[SP_DMCS_get_petsID]
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
/****** Object:  StoredProcedure [dbo].[SP_DMCS_get_petsID_MAX]    Script Date: 3/7/2014 5:04:02 PM ******/
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
/****** Object:  StoredProcedure [dbo].[SP_DMCS_get_Productsid]    Script Date: 3/7/2014 5:04:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Edward Sobanski
-- Create date: 6/3/2012
-- Description:	Select row on products table
-- =============================================
CREATE PROCEDURE [dbo].[SP_DMCS_get_Productsid]
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
/****** Object:  StoredProcedure [dbo].[SP_DMCS_get_PropertyID]    Script Date: 3/7/2014 5:04:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Edward Sobanski
-- Create date: 6/3/2012
-- Description:	Select row on property table
-- =============================================
CREATE PROCEDURE [dbo].[SP_DMCS_get_PropertyID]
	-- Add the parameters for the stored procedure here
           
      @approx_mrkt_value as decimal,
      @address_id as int,
      @case_id as int,
      @client_id as int,
      @Homeowners_Insurance__Payment as decimal,
      @monthly_property_payment as decimal,
      @mortg_comp as varchar,
      @Property_Tax__Payment as decimal,
      @own_prop as varchar,
      @rent_prop as varchar,
      @date_purchased as datetime
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    SELECT [property_id] 
      FROM [dbo].[property] 
     WHERE [approx_mrkt_value] = @approx_mrkt_value
       and [Homeowners_Insurance _Payment] =  @Homeowners_Insurance__Payment
       and [monthly_property_payment] =  @monthly_property_payment
       and [mortg_comp] = @mortg_comp
       and [Property_Tax _Payment] =  @Property_Tax__Payment
       and [own_prop] =  @own_prop
       and [rent_prop] =  @rent_prop
       and [date_purchased] =  @date_purchased
       and ([address_id] = @address_id or [address_id] is null) 
       and ([case_id] = @case_id or [case_id] is null)
       and ([client_id] = @client_id or [client_id] is null) 
      
End

GO
/****** Object:  StoredProcedure [dbo].[SP_DMCS_get_Pvaccine_ID]    Script Date: 3/7/2014 5:04:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Mike Phillips
-- Create date: 3/29/2013
-- Description:	get Pvaccine id after insert
-- =============================================
CREATE PROCEDURE [dbo].[SP_DMCS_get_Pvaccine_ID]
	-- Add the parameters for the stored procedure here
            @Vaccine_Type_ID as int,
			@Vaccine_Name as varchar,
            @Vaccine_Reactions AS varchar,
            @Vaccine_Type AS varchar
       
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
SELECT [Vaccine_Type_ID]
  FROM [dbo].[Pvaccine]
 WHERE [Vaccine_Type_ID]= @Vaccine_Type_ID
   and [Vaccine_Name] = @Vaccine_Name
   and [Vaccine_Reactions] = @Vaccine_Reactions 
   and [Vaccine_Type] = @Vaccine_Type
        
End

GO
/****** Object:  StoredProcedure [dbo].[SP_DMCS_get_Receipt_ID]    Script Date: 3/7/2014 5:04:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		James Miller
-- Create date: 2/28/2013
-- Description:	get a Receipt ID after insert
-- =============================================
CREATE PROCEDURE [dbo].[SP_DMCS_get_Receipt_ID]
	-- Add the parameters for the stored procedure here
           
	  @Receipt_ID as int,
	  @Account_ID as int,
      @Check_Num as int,
      @DLN as int,
      @Phone as int,
      @Pay_Type as int,
      @Amount as int,
      @Transfer as bit,
      @Recieve as bit
       
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
SELECT [Receipt_ID]
  FROM [dbo].[receipt]
 WHERE [Receipt_ID] = @Receipt_ID 
   and [Account_ID] = @Account_ID
   and [Check_Num] = @Check_Num
   and [DLN] = @DLN
   and [Phone] = @Phone
   and [Pay_Type] = @Pay_Type
   and [Amount] = @Amount
   and [Transfer] = @Transfer
   and [Recieve] = @Recieve 
        
End

GO
/****** Object:  StoredProcedure [dbo].[SP_DMCS_get_RelativeID]    Script Date: 3/7/2014 5:04:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Edward Sobanski
-- Create date: 6/3/2012
-- Description:	Select row on relative table
-- =============================================
CREATE PROCEDURE [dbo].[SP_DMCS_get_RelativeID]
	-- Add the parameters for the stored procedure here
           
      @case_id as int,
      @client_id as int,
      @address_id as int,
      @will_help as varchar
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    SELECT [relative_id] 
      FROM [dbo].[relative]
     WHERE [will_help] = @will_help
       and ([address_id] = @address_id or [address_id] is null) 
       and ([case_id] = @case_id or [case_id] is null) 
       and ([client_id] = @client_id or [client_id] is null)
      
   
End

GO
/****** Object:  StoredProcedure [dbo].[SP_DMCS_get_Requestor_OrderID]    Script Date: 3/7/2014 5:04:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Edward Sobanski
-- Create date: 6/3/2012
-- Description:	Select row on Requestor order table
-- =============================================
CREATE PROCEDURE [dbo].[SP_DMCS_get_Requestor_OrderID]
	-- Add the parameters for the stored procedure here
      @EncounterID as int,
      @OrderPriority as int,
      @OrderNum as int,
      @ShipToAddressID as int,
      @Requestor_ID as int,
      @OrderDeliveryType as varchar,
      @OrderPickUpDate as datetime
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
     
    SELECT [OrderID] 
      FROM [dbo].[requestor_Order] 
     WHERE [OrderPriority] = @OrderPriority
       and [OrderNum] = @OrderNum
       and [OrderDeliveryType] = @OrderDeliveryType
       and ([EncounterID] = @EncounterID or [EncounterID] is null) 
       and ([ShipToAddressID] = @ShipToAddressID or [ShipToAddressID] is null) 
       and ([Requestor_ID] = @Requestor_ID or [Requestor_ID] is null) 
     
     
End

GO
/****** Object:  StoredProcedure [dbo].[SP_DMCS_get_Requestor_OrderID_MAX]    Script Date: 3/7/2014 5:04:02 PM ******/
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
/****** Object:  StoredProcedure [dbo].[SP_DMCS_get_RequestorID]    Script Date: 3/7/2014 5:04:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Edward Sobanski
-- Create date: 6/3/2012
-- Description:	Select row on Requestor table
-- =============================================
CREATE PROCEDURE [dbo].[SP_DMCS_get_RequestorID]
	-- Add the parameters for the stored procedure here
      @EncounterID as int,
      @Requestor_Type as varchar,
      @MobilUnitID as int,
      @PersonID as int,
      @AgencyID as int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    SELECT [RequestorID] 
      FROM [dbo].[requestor]  
     WHERE [Requestor_Type] = @Requestor_Type
       and ([EncounterID] = @EncounterID or [EncounterID] is null) 
       and ([MobilUnitID] = @MobilUnitID or [MobilUnitID] is null)
       and ([PersonID] = @PersonID or [PersonID] is null) 
       and ([AgencyID] = @AgencyID or [AgencyID] is null) 
      
   
End

GO
/****** Object:  StoredProcedure [dbo].[SP_DMCS_get_RequirementsID]    Script Date: 3/7/2014 5:04:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Edward Sobanski
-- Create date: 6/3/2012
-- Description:	Select row on Requirements order table
-- =============================================
create PROCEDURE [dbo].[SP_DMCS_get_RequirementsID]
	-- Add the parameters for the stored procedure here
          @requirement_desc as varchar
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
SELECT [req_id]
  FROM [dbo].[requirements]
 WHERE [requirement_desc] = @requirement_desc
        
End

GO
/****** Object:  StoredProcedure [dbo].[SP_DMCS_get_Resource_ID]    Script Date: 3/7/2014 5:04:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		James Miller
-- Create date: 2/26/2013
-- Description:	get a Resource ID after insert
-- =============================================
CREATE PROCEDURE [dbo].[SP_DMCS_get_Resource_ID]
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
/****** Object:  StoredProcedure [dbo].[SP_DMCS_get_ServicesID]    Script Date: 3/7/2014 5:04:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Edward Sobanski
-- Create date: 6/3/2012
-- Description:	Select row on services table
-- =============================================
CREATE PROCEDURE [dbo].[SP_DMCS_get_ServicesID]
	-- Add the parameters for the stored procedure here

          @service_id as int,
		  @Company as varchar,
		  @service_type as char,
		  @Estimated_Time as date,
		  @Email as varchar,
		  @Phone_Number as int,
		  @Full_Cost as int,
		  @Estimated_Cost as int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
SELECT [service_id]
  FROM [dbo].[services]
 WHERE [Company] = @Company
   and [service_type] = @service_type
   and [Estimated_Time] = @Estimated_Time
   and [Email] = @Email 
   and [Phone_Number] = @Phone_Number
   and [Full_Cost] =  @Full_Cost 
   and [Estimated_Cost] =  @Estimated_Cost 
        
End

GO
/****** Object:  StoredProcedure [dbo].[SP_DMCS_get_ShipmentID]    Script Date: 3/7/2014 5:04:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Edward Sobanski
-- Create date: 6/3/2012
-- Description:	Select row on shipment table
-- =============================================
CREATE PROCEDURE [dbo].[SP_DMCS_get_ShipmentID]
	-- Add the parameters for the stored procedure here

      @WarehouseID as int,
      @Tracking_Num as varchar,
      @Ship_Method as varchar,
      @OrderRecByID as int,
      @FullOrderReceived as varchar
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    SELECT [ShipmentID] 
      FROM [dbo].[Shipment] 
     WHERE [Tracking_Num] =  @Tracking_Num
       and [Ship_Method] = @Ship_Method
       and [FullOrderReceived] = @FullOrderReceived
       and ([WarehouseID] = @WarehouseID or [WarehouseID] is null) 
       and ([OrderRecByID] = @OrderRecByID or [OrderRecByID] is null) 
      
    
End

GO
/****** Object:  StoredProcedure [dbo].[SP_DMCS_get_Tier_ReqID]    Script Date: 3/7/2014 5:04:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Edward Sobanski
-- Create date: 6/3/2012
-- Description:	Select row on Tier req table
-- =============================================
CREATE PROCEDURE [dbo].[SP_DMCS_get_Tier_ReqID]
	-- Add the parameters for the stored procedure here
             
      @req_id as int,
      @tier_id as int
        
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    SELECT [tier_req_id] 
      FROM [dbo].[tier_req] 
     WHERE ([req_id] = @req_id or [req_id] is null)
       and ([tier_id] = @tier_id or [tier_id] is null)
      
End

GO
/****** Object:  StoredProcedure [dbo].[SP_DMCS_get_TierID]    Script Date: 3/7/2014 5:04:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Edward Sobanski
-- Create date: 6/3/2012
-- Description:	Select row on Tier table
-- =============================================
CREATE PROCEDURE [dbo].[SP_DMCS_get_TierID]
	-- Add the parameters for the stored procedure here

      @include_req as varchar,
      @campaign_id as int,
      @Tier_Age_Begin_Month as int,
      @Tier_Age_Begin_Year as int,
      @Tier_Age_End_Month as int,
      @Tier_Age_End_Year as int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    SELECT [tier_id] 
      FROM [dbo].[tier]
     WHERE [include_req] = @include_req
       and [Tier_Age_Begin_Month] = @Tier_Age_Begin_Month
       and [Tier_Age_Begin_Year] = @Tier_Age_Begin_Year
       and [Tier_Age_End_Month] = @Tier_Age_End_Month
       and [Tier_Age_End_Year] = @Tier_Age_End_Year
       and ([campaign_id] = @campaign_id or [campaign_id] is null) 
         
End

GO
/****** Object:  StoredProcedure [dbo].[SP_DMCS_get_VaccineID]    Script Date: 3/7/2014 5:04:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Edward Sobanski
-- Create date: 6/3/2012
-- Description:	Select row on vaccine table
-- =============================================
CREATE PROCEDURE [dbo].[SP_DMCS_get_VaccineID]
	-- Add the parameters for the stored procedure here
             
      @medicine_id as int,
      @Num_of_reg_doses as int,
      @vaccine_name as varchar
        
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    SELECT [vaccine_id] 
      FROM [dbo].[vaccine] 
     WHERE [Num_of_reg_doses] = @Num_of_reg_doses
       and [vaccine_name] = @vaccine_name
       and ([medicine_id] = @medicine_id or [medicine_id] is null)
     
End

GO
/****** Object:  StoredProcedure [dbo].[SP_DMCS_get_VehicleID]    Script Date: 3/7/2014 5:04:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Edward Sobanski
-- Create date: 6/3/2012
-- Description:	Select row on vehicle table
-- =============================================
CREATE PROCEDURE [dbo].[SP_DMCS_get_VehicleID]
	-- Add the parameters for the stored procedure here
             
      @case_id as int,
      @client_id as int,
      @vehicle_make as varchar,
      @vehicle_model as varchar,
      @vehicle_type as varchar,
      @vehicle_year as int,
      @vehicle_desc as varchar,
      @vin as varchar,
      @start_mileage as int,
      @PLATENUMBER as varchar,
      @FUELTYPE as varchar,
      @MPH as int,
      @INSURED as varchar
        
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    SELECT [vehicle_id] 
      FROM [dbo].[vehicle]
     WHERE [vehicle_make] = @vehicle_make
       and [vehicle_model] = @vehicle_model
       and [vehicle_type] = @vehicle_type
       and [vehicle_year] = @vehicle_year
       and [vehicle_desc] = @vehicle_desc
       and [vin] = @vin 
       and [start_mileage] = @start_mileage
       and [PLATENUMBER] = @PLATENUMBER
       and [FUELTYPE] = @FUELTYPE
       and [MPH] = @MPH
       and [INSURED] = @INSURED
       and ([case_id] = @case_id or [case_id] is null) 
       and ([client_id] = @client_id or [client_id] is null) 
            
End

GO
/****** Object:  StoredProcedure [dbo].[SP_DMCS_get_Vendor_ProductID]    Script Date: 3/7/2014 5:04:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Edward Sobanski
-- Create date: 5/22/2012
-- Description:	Select row on vendor Product table
-- =============================================
CREATE PROCEDURE [dbo].[SP_DMCS_get_Vendor_ProductID]
	-- Add the parameters for the stored procedure here
             
       @vendor_id as int,
       @product_id as int,
       @product_qty as int,
       @Product_exp_date as bit,
       @lot_id as int
        
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    SELECT [vendor_prod_id] 
      FROM [dbo].[vendor_products]
     WHERE [product_qty] = @product_qty
       and [Product_exp_date] = @Product_exp_date
       and ([vendor_id] = @vendor_id or [vendor_id] is null) 
       and ([product_id] = @product_id or [product_id] is null)
       and ([lot_id] = @lot_id or [lot_id] is null) 
     
       
End

GO
/****** Object:  StoredProcedure [dbo].[SP_DMCS_get_VendorID]    Script Date: 3/7/2014 5:04:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Edward Sobanski
-- Create date: 6/3/2012
-- Description:	Select row on vendor table
-- =============================================
CREATE PROCEDURE [dbo].[SP_DMCS_get_VendorID]
	-- Add the parameters for the stored procedure here
             
      @vendor_name as varchar,
      @phone_num as varchar,
      @email as varchar,
      @address_id as int,
      @Vendor_address2 as int,
      @vendor_job_assign as varchar,
      @vendor_start_date as datetime,
      @vendor_end_date as datetime,
      @vendor_meth_of_contact as varchar,
      @vendor_status as varchar,
      @vendor_meth_of_pay as varchar,
      @vendor_type as varchar
        
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    SELECT [vendor_id] 
      FROM [dbo].[vendor]
     WHERE [vendor_name] = @vendor_name
       and [phone_num] = @phone_num
       and [email] = @email
       and [vendor_job_assign] = @vendor_job_assign
       and [vendor_start_date] = @vendor_start_date
       and [vendor_end_date] = @vendor_end_date
       and [vendor_meth_of_contact] = @vendor_meth_of_contact
       and [vendor_status] = @vendor_status
       and [vendor_meth_of_pay] = @vendor_meth_of_pay
       and [vendor_type] = @vendor_type
       and ([address_id] = @address_id or [address_id] is null) 
       and ([Vendor_address2] = @Vendor_address2 or [Vendor_address2] is null) 
      
End

GO
/****** Object:  StoredProcedure [dbo].[SP_DMCS_get_Warehouse_ProductsID]    Script Date: 3/7/2014 5:04:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Edward Sobanski
-- Create date: 6/3/2012
-- Description:	Select row on warehouse products table
-- =============================================
CREATE PROCEDURE [dbo].[SP_DMCS_get_Warehouse_ProductsID]
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
/****** Object:  StoredProcedure [dbo].[SP_DMCS_get_WarehouseID]    Script Date: 3/7/2014 5:04:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		Edward Sobanski
-- Create date: 5/22/2012
-- Description:	Select row on warehouse table
-- =============================================
CREATE PROCEDURE [dbo].[SP_DMCS_get_WarehouseID]
	-- Add the parameters for the stored procedure here
             
       @warehouse_name as varchar,
       @address_id as int,
       @warehouse_type as varchar(10),
	   @Location_ID as int
            
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    SELECT [warehouse_id] 
      FROM [dbo].[warehouse]
     WHERE [warehouse_name] = @warehouse_name
       and [warehouse_type] = @warehouse_type
	   and [Location_ID] = @Location_ID
       and ([address_id] = @address_id or [address_id] is null) 
           
End



GO
/****** Object:  StoredProcedure [dbo].[SP_DMCS_GrabEquiptmentList]    Script Date: 3/7/2014 5:04:02 PM ******/
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
/****** Object:  StoredProcedure [dbo].[SP_DMCS_Insert_Account]    Script Date: 3/7/2014 5:04:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Joseph Hemphill
-- Create date: 2/26/2013
-- Description:	Insert Row in Account table
-- =============================================
CREATE PROCEDURE [dbo].[SP_DMCS_Insert_Account]
	-- Add the parameters for the stored procedure here
     
			@Account_ID as int,
			@Bank_ID as int,
			@Account_Num as varchar(15),
			@Type as varchar(20)
      
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

if @Account_ID  = 0
begin 
   set @Account_ID = null
end

    -- Insert statements for procedure here
INSERT INTO [dbo].[Account]
           ([Account_ID]
           ,[Bank_ID]
           ,[Account_Num]
           ,[Type])
     VALUES
           (@Account_ID,
            @Bank_ID,
			@Account_Num,
			@Type)

 End


GO
/****** Object:  StoredProcedure [dbo].[SP_DMCS_Insert_address]    Script Date: 3/7/2014 5:04:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Edward Sobanski
-- Create date: 5/21/2012
-- Description:	Insert Row to address table
-- =============================================
CREATE PROCEDURE [dbo].[SP_DMCS_Insert_address]
	-- Add the parameters for the stored procedure here
	  @address_type_id as int,
      @city as varchar(30)= null,
      @country as varchar(30)= null,
      @County_Township as varchar(30)= null,
      @longitude as decimal(18,12),
      @latitude as decimal(18,12),
      @state as char(2)= null,
      @str_add as varchar(30)= null,
      @str_add2 as  varchar(30)= null,
      @zip_plus_four as varchar(10)= null
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	Insert INTO [dbo].[address]
           ([address_type_id]
           ,[city]
           ,[country]
           ,[County_Township]
           ,[longitude]
           ,[latitude]
           ,[state]
           ,[str_add]
           ,[str_add2]
           ,[zip_plus_four])
     VALUES (@address_type_id,
           @city,
           @country,
           @County_Township,
           @longitude,
           @latitude,
           @state,
           @str_add,
           @str_add2,
           @zip_plus_four)
END

GO
/****** Object:  StoredProcedure [dbo].[SP_DMCS_Insert_Agency]    Script Date: 3/7/2014 5:04:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Edward Sobanski
-- Create date: 5/21/2012
-- Description:	Insert Row on agency table
-- =============================================
CREATE PROCEDURE [dbo].[SP_DMCS_Insert_Agency]
	-- Add the parameters for the stored procedure here
	  @address_id as int,
      @agency_name as varchar(50),
	  @primary_fName VARCHAR(50),
	  @primary_lName VARCHAR(50),
	  @primary_phone VARCHAR(50),
	  @sec_fName VARCHAR(50),
	  @sec_lName VARCHAR(50),
	  @sec_phone VARCHAR(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
 if @address_id = 0
 begin
    set @address_id = NULL
 end
    -- Insert statements for procedure here
	INSERT INTO [dbo].[agency]
           ([address_id]
           ,[agency_name]
           ,[primary_fName]
           ,[primary_lName]
           ,[primary_phone]
           ,[sec_fName]
           ,[sec_lName]
           ,[sec_phone]
           )
     VALUES
           (@address_id, 
            @agency_name,
            @primary_fName ,
			@primary_lName ,
			@primary_phone ,
			@sec_fName ,
			@sec_lName ,
			@sec_phone)
END

GO
/****** Object:  StoredProcedure [dbo].[SP_DMCS_Insert_Agency_employee]    Script Date: 3/7/2014 5:04:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Edward Sobanski
-- Create date: 5/21/2012
-- Description:	Insert Row on agency_Employee table
-- =============================================
CREATE PROCEDURE [dbo].[SP_DMCS_Insert_Agency_employee]
	-- Add the parameters for the stored procedure here
	  @agency_id as int,
      @employee_id as int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

 if @agency_id = 0
 begin
   set @agency_id = NUll
 End 
 
 If @employee_id = 0
 begin
   set @employee_id = NUll
 end
    -- Insert statements for procedure here
INSERT INTO [dbo].[agency_employees]
           ([agency_id]
           ,[employee_id])
     VALUES
           (@agency_id, 
            @employee_id)
END

GO
/****** Object:  StoredProcedure [dbo].[SP_DMCS_Insert_Bank]    Script Date: 3/7/2014 5:04:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Jon Kamphuis
-- Create date: 2/26/2013
-- Description:	Insert Row in Bank table
-- =============================================
CREATE PROCEDURE [dbo].[SP_DMCS_Insert_Bank]
	-- Add the parameters for the stored procedure here
     
			@Bank_ID as int,
			@Name as varchar(50),
			@IsFDIC as bit,
			@Routing_Num as varchar(10)
      
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

if @Bank_ID  = 0
begin 
   set @Bank_ID = null
end

    -- Insert statements for procedure here
INSERT INTO [dbo].[bank]
           ([Bank_ID]
           ,[Name]
           ,[IsFDIC]
           ,[Routing_Num])
     VALUES
           (@Bank_ID,
            @Name,
			@IsFDIC,
			@Routing_Num)

 End


GO
/****** Object:  StoredProcedure [dbo].[SP_DMCS_Insert_Call_Center]    Script Date: 3/7/2014 5:04:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Edward Sobanski
-- Create date: 5/21/2012
-- Description:	Insert Row on Call Center table
-- =============================================
CREATE PROCEDURE [dbo].[SP_DMCS_Insert_Call_Center]
	-- Add the parameters for the stored procedure here

      @address_id as int,
      @call_center_name as varchar(50)
      
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
if @address_id = 0
begin
   set @address_id = NULL
end
    -- Insert statements for procedure here
INSERT INTO [dbo].[call_center]
           ([address_id]
           ,[call_center_name])
     VALUES
           (@address_id, 
            @call_center_name)
END

GO
/****** Object:  StoredProcedure [dbo].[SP_DMCS_Insert_Call_Center_Employee]    Script Date: 3/7/2014 5:04:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Edward Sobanski
-- Create date: 5/21/2012
-- Description:	Insert Row on Call Center Employee table
-- =============================================
CREATE PROCEDURE [dbo].[SP_DMCS_Insert_Call_Center_Employee]
	-- Add the parameters for the stored procedure here
      @Call_Center_id as int,
      @employee_id as int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
if @Call_Center_id = 0
begin
   set @Call_Center_id = NULL
End

IF @employee_id = 0
BEGIN 
   set @employee_id = NULL
End
    -- Insert statements for procedure here
INSERT INTO [dbo].[call_center_employee]
           ([call_center_id]
           ,[employee_id])
     VALUES
           (@call_center_id,
            @employee_id)
END

GO
/****** Object:  StoredProcedure [dbo].[SP_DMCS_Insert_Campaign]    Script Date: 3/7/2014 5:04:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Edward Sobanski
-- Create date: 5/21/2012
-- Description:	Insert Row on Campaign table
-- =============================================
CREATE PROCEDURE [dbo].[SP_DMCS_Insert_Campaign]
	-- Add the parameters for the stored procedure here
      @campaign_name as varchar(50),
      @campaign_start_date as datetime,
      @campaign_end_date as datetime,
      @medicine_id as int
      
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
if @medicine_id = 0
Begin
    Set @medicine_id = null
End
    -- Insert statements for procedure here
INSERT INTO [dbo].[campaign]
           ([campaign_name]
           ,[campaign_start_date]
           ,[campaign_end_date]
           ,[medicine_id])
     VALUES
           (@campaign_name,
            @campaign_start_date,
            @campaign_end_date,
            @medicine_id)

 End

GO
/****** Object:  StoredProcedure [dbo].[SP_DMCS_Insert_Case_Client]    Script Date: 3/7/2014 5:04:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Edward Sobanski
-- Create date: 5/21/2012
-- Description:	Insert Row on Case Client table
-- =============================================
CREATE PROCEDURE [dbo].[SP_DMCS_Insert_Case_Client]
	-- Add the parameters for the stored procedure here
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
      @utilities_incl as char(1),
      @related_ll as char(1),
      @relation_to_ll as char(1),
      @mtg_amt_owed_today as money,
      @utilities_list as text,
      @water_amt_owed_today as money,
      @public_asst_app_date as datetime,
      @util_allot_app_date as datetime,
      @util_allot_amt as money,
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
      @client_issue_desc as text,
      @client_issue_resolved as char(1),
      @client_issue_comments as text
      
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
if @address_id = 0
Begin
   set @address_id = null
End

if @prev_address_id = 0
Begin 
   set @prev_address_id = null
end

if @case_id =0
begin
   set @case_id = null
end

if @client_id = 0
begin
    set @client_id = Null
end

    -- Insert statements for procedure here
INSERT INTO [dbo].[case_client]
           ([case_id]
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
           ,[utilities_incl]
           ,[related_ll]
           ,[relation_to_ll]
           ,[mtg_amt_owed_today]
           ,[utilities_list]
           ,[water_amt_owed_today]
           ,[public_asst_app_date]
           ,[util_allot_app_date]
           ,[util_allot_amt]
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
           ,[client_issue_desc]
           ,[client_issue_resolved]
           ,[client_issue_comments] )
     VALUES
           (@case_id,
            @client_id,
            @address_id,
            @cable_amt_owed_today,
            @colessee_name,
            @child_support, 
            @child_support_memo, 
            @curr_residence_date, 
            @electric_amt_owed_today, 
            @employment_memo, 
            @employment_status,
            @gas_or_heating_amt_owed_today, 
            @housing_amt_owed_today, 
            @housing_status,
            @income_status, 
            @lease_num_adults, 
            @lease_start_date, 
            @minor_children, 
            @monthly_rent_amt, 
            @Other_help_Sources, 
            @Other_help_Sources_memo, 
            @prev_address_id, 
            @prev_residence_date, 
            @relationship_to_head_of_household, 
            @rental_name,
            @rental_phone,
            @sewage_amt_owed_today,
            @telephone_amt_owed_today, 
            @trash_removal_amt_owed_today, 
            @us_status_memo, 
            @utilities_incl, 
            @related_ll, 
            @relation_to_ll, 
            @mtg_amt_owed_today, 
            @utilities_list, 
            @water_amt_owed_today,
            @public_asst_app_date, 
            @util_allot_app_date, 
            @util_allot_amt, 
            @fd_stmps_app_date, 
            @fd_stmps_amt,
            @fd_Inc, 
            @afdc_app_date, 
            @afdc_amt,
            @afdc_Inc,
            @oth_trustee_app_date,
            @oth_trustee_amt,
            @oth_trustee_Inc, 
            @ss_app_date, 
            @ss_amt,
            @ss_Inc, 
            @va_app_date, 
            @va_amt,
            @va_Inc,
            @eap_app_date, 
            @eap_amt, 
            @eap_Inc,
            @fema_app_date,
            @fema_amt,
            @fema_Inc,
            @unempl_app_date, 
            @unempl_amt,
            @unempl_Inc, 
            @grants_loans_app_date,
            @grants_loans_amt,
            @grants_Inc,
            @other_app_date, 
            @other_amt,
            @other_Inc,
            @denial_memo, 
            @welfr_fraud_memo,
            @client_issue_desc,
            @client_issue_resolved,
            @client_issue_comments)

 End

GO
/****** Object:  StoredProcedure [dbo].[SP_DMCS_Insert_Case_intake]    Script Date: 3/7/2014 5:04:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Edward Sobanski
-- Create date: 5/21/2012
-- Description:	Insert Row in Case intake table
-- =============================================
CREATE PROCEDURE [dbo].[SP_DMCS_Insert_Case_intake]
	-- Add the parameters for the stored procedure here
     
      @applic_end_date_time as datetime,
      @applic_start_date_time as datetime,
      @circum_emergency_event as varchar(3),
      @circum_help_request_memo as text,
      @circum_income_stolen as varchar(3),
      @circum_memo as text,
      @circum_no_income as varchar(3),
      @circum_not_enough_income as varchar(3),
      @agency_id as int,
      @call_center_id as int
      
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
if @agency_id = 0
begin
  set @agency_id = null
end

if @call_center_id = 0
begin
   set @call_center_id = null
end 
    -- Insert statements for procedure here
INSERT INTO [dbo].[case_intake]
           ([applic_end_date_time]
           ,[applic_start_date_time]
           ,[circum_emergency_event]
           ,[circum_help_request_memo]
           ,[circum_income_stolen]
           ,[circum_memo]
           ,[circum_no_income]
           ,[circum_not_enough_income]
           ,[agency_id]
           ,[call_center_id])
     VALUES
           (@applic_end_date_time,
            @applic_start_date_time, 
            @circum_emergency_event, 
            @circum_help_request_memo, 
            @circum_income_stolen,
            @circum_memo, 
            @circum_no_income, 
            @circum_not_enough_income, 
            @agency_id, 
            @call_center_id)

 End

GO
/****** Object:  StoredProcedure [dbo].[SP_DMCS_Insert_Client]    Script Date: 3/7/2014 5:04:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Edward Sobanski
-- Create date: 5/21/2012
-- Description:	Insert Row in Client table
-- =============================================
CREATE PROCEDURE [dbo].[SP_DMCS_Insert_Client]
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
/****** Object:  StoredProcedure [dbo].[SP_DMCS_Insert_ClientWPets]    Script Date: 3/7/2014 5:04:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




-- =============================================
-- Author:		Jianwang Xing
-- Create date: 4/22/2013
-- Description:	Insert Row to client pet table
-- =============================================
CREATE PROCEDURE [dbo].[SP_DMCS_Insert_ClientWPets]
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
/****** Object:  StoredProcedure [dbo].[SP_DMCS_Insert_Debt]    Script Date: 3/7/2014 5:04:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Edward Sobanski
-- Create date: 5/21/2012
-- Description:	Insert Row on debt table
-- =============================================
CREATE PROCEDURE [dbo].[SP_DMCS_Insert_Debt]
	-- Add the parameters for the stored procedure here
     
       @amt_paid as money = 0,
       @case_id as int = 0,
       @client_id as int = 0,
       @creditor_name as varchar(50) = Null,
       @debt_amt as money = 0,
       @item_purchased as varchar(30) = Null,
       @last_payment_date as datetime = Null,
       @purchase_date as datetime = Null,
       @value_amt as money = 0
      
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
    -- Insert statements for procedure here
INSERT INTO [dbo].[debt]
           ([amt_paid]
           ,[case_id]
           ,[client_id]
           ,[creditor_name]
           ,[debt_amt]
           ,[item_purchased]
           ,[last_payment_date]
           ,[purchase_date]
           ,[value_amt])
     VALUES
           (@amt_paid,
            @case_id, 
            @client_id, 
            @creditor_name,
            @debt_amt,
            @item_purchased, 
            @last_payment_date, 
            @purchase_date, 
            @value_amt)
  
End

GO
/****** Object:  StoredProcedure [dbo].[SP_DMCS_Insert_Deceased]    Script Date: 3/7/2014 5:04:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Edward Sobanski
-- Create date: 5/21/2012
-- Description:	Insert Row on deceased table
-- =============================================
CREATE PROCEDURE [dbo].[SP_DMCS_Insert_Deceased]
	-- Add the parameters for the stored procedure here
     
           @deceased_id as int,
           @coroner_id as int,
           @date_of_autopsy as datetime,
           @external_exam as text,
           @identifying_marks as text,
           @internal_exam as text,
           @reason_of_death as text,
           @time_of_death as datetime
      
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
if @coroner_id = 0
begin
  Set @coroner_id = NULL
end
    -- Insert statements for procedure here
INSERT INTO [dbo].[deceased]
           ([deceased_id]
           ,[coroner_id]
           ,[date_of_autopsy]
           ,[external_exam]
           ,[identifying_marks]
           ,[internal_exam]
           ,[reason_of_death]
           ,[time_of_death])
     VALUES
           (@deceased_id,
            @coroner_id,
            @date_of_autopsy, 
            @external_exam, 
            @identifying_marks,
            @internal_exam,
            @reason_of_death, 
            @time_of_death)
  
End

GO
/****** Object:  StoredProcedure [dbo].[SP_DMCS_Insert_Disaster]    Script Date: 3/7/2014 5:04:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Edward Sobanski
-- Create date: 5/21/2012
-- Description:	Insert Row on disaster table
-- =============================================
create PROCEDURE [dbo].[SP_DMCS_Insert_Disaster]
	-- Add the parameters for the stored procedure here
     
      @disaster_name as varchar(50),
      @disaster_type as varchar(30),
      @disaster_start_date as datetime,
      @disaster_end_date as datetime,
      @disaster_north_latitude as decimal(18,12),
      @disaster_north_longitude as decimal(18,12),
      @disaster_south_latitude as decimal(18,12),
      @disaster_south_longitude as decimal(18,12),
      @disaster_east_latitude as decimal(18,12),
      @disaster_east_longitude as decimal(18,12),
      @disaster_west_latitude as decimal(18,12),
      @disaster_west_longitude as decimal(18,12)    
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
INSERT INTO [dbo].[disaster]
           ([disaster_name]
           ,[disaster_type]
           ,[disaster_start_date]
           ,[disaster_end_date]
           ,[disaster_north_latitude]
           ,[disaster_north_longitude]
           ,[disaster_south_latitude]
           ,[disaster_south_longitude]
           ,[disaster_east_latitude]
           ,[disaster_east_longitude]
           ,[disaster_west_latitude]
           ,[disaster_west_longitude])
     VALUES
           (@disaster_name, 
            @disaster_type, 
            @disaster_start_date, 
            @disaster_end_date, 
            @disaster_north_latitude, 
            @disaster_north_longitude, 
            @disaster_south_latitude, 
            @disaster_south_longitude,
            @disaster_east_latitude,
            @disaster_east_longitude,
            @disaster_west_latitude,
            @disaster_west_longitude)
  
End

GO
/****** Object:  StoredProcedure [dbo].[SP_DMCS_Insert_Disaster_Encounter]    Script Date: 3/7/2014 5:04:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Edward Sobanski
-- Create date: 5/21/2012
-- Description:	Insert Row on disaster encounter table
-- =============================================
CREATE PROCEDURE [dbo].[SP_DMCS_Insert_Disaster_Encounter]
	-- Add the parameters for the stored procedure here
     
       @disaster_id int,
       @encounter_id int,
       @address_id int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

if @disaster_id = 0
begin
   set @disaster_id = null
end

if @encounter_id = 0
Begin
   set @encounter_id = Null
end

if @address_id = 0
begin
   set @address_id = NULL
end


    -- Insert statements for procedure here
INSERT INTO [dbo].[disaster_encounter]
           ([disaster_id]
           ,[encounter_id]
           ,[address_id])
     VALUES
           (@disaster_id,
            @encounter_id,
            @address_id)
  
End

GO
/****** Object:  StoredProcedure [dbo].[SP_DMCS_Insert_Donation]    Script Date: 3/7/2014 5:04:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Mohammed Mohammed
-- Create date: 2/26/2013
-- Description:	Insert Row in Donation table
-- =============================================
CREATE PROCEDURE [dbo].[SP_DMCS_Insert_Donation]
	-- Add the parameters for the stored procedure here
     
			@Donation_ID as int,
			@Receipt_ID as int,
			@Resource_ID as int,
			@Donor_ID as int,
			@Date as datetime,
			@Quantity as int,
			@Agency_ID as int,
			@Is_Monetary as bit,
			@Is_FEMA as bit
      
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

if @Donation_ID  = 0
begin 
   set @Donation_ID = null
end

    -- Insert statements for procedure here
INSERT INTO [dbo].[donation]
           ([Donation_ID]
           ,[Receipt_ID]
           ,[Resource_ID]
           ,[Donor_ID]
           ,[Date]
           ,[Quantity]
           ,[Agency_ID]
           ,[Is_Monetary]
           ,[Is_FEMA])
     VALUES
           (@Donation_ID,
            @Receipt_ID,
			@Resource_ID,
			@Donor_ID,
			@Date,
			@Quantity,
			@Agency_ID,
			@Is_Monetary,
			@Is_FEMA)

 End


GO
/****** Object:  StoredProcedure [dbo].[SP_DMCS_Insert_Donor]    Script Date: 3/7/2014 5:04:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Edward Sobanski
-- Create date: 5/21/2012
-- Description:	Insert Row on doner table
-- =============================================
CREATE PROCEDURE [dbo].[SP_DMCS_Insert_Donor]
	-- Add the parameters for the stored procedure here
      
       
       @PersonID AS int,
       @Status AS varchar(30),
       @DonorType AS char(1),
       @AgencyID AS int,
       @Phone as int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

     if @PersonID = 0
        begin
          set @PersonID =  null
        End
        
     if @AgencyID = 0
       begin
          set @AgencyID = null
       end
  
    -- Insert statements for procedure here
INSERT INTO [dbo].[Donor]
           ([PersonID]
           ,[Status]
           ,[DonorType]
           ,[AgencyID]
           ,[Phone])
     VALUES
           (@PersonID, 
            @Status, 
            @DonorType, 
            @AgencyID,
            @Phone)
End

GO
/****** Object:  StoredProcedure [dbo].[SP_DMCS_Insert_Donor_Product]    Script Date: 3/7/2014 5:04:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Edward Sobanski
-- Create date: 5/21/2012
-- Description:	Insert Row on doner Product table
-- =============================================
CREATE PROCEDURE [dbo].[SP_DMCS_Insert_Donor_Product]
	-- Add the parameters for the stored procedure here
      
        @DonorID as int,
        @ProductID as int,
        @quantity as int,
        @other_info as varchar(50),
        @Product_rec_date as datetime,
        @AmountOfProdDonated as varchar
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

if @DonorID = 0
begin
  set @DonorID = NUll
end

if @ProductID = 0
begin
    set @ProductID = NULL
end 

    -- Insert statements for procedure here
INSERT INTO [dbo].[Donor_Product]
           ([DonorID]
           ,[ProductID]
           ,[quantity]
           ,[other_info]
           ,[Product_rec_date]
           ,[AmountOfProdDonated])
     VALUES
           (@DonorID,
            @ProductID,
            @quantity,
            @other_info,
            @Product_rec_date,
            @AmountOfProdDonated)
End

GO
/****** Object:  StoredProcedure [dbo].[SP_DMCS_Insert_Emergency_Medical]    Script Date: 3/7/2014 5:04:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Edward Sobanski
-- Create date: 5/21/2012
-- Description:	Insert Row on Emergency medical table
-- =============================================
CREATE PROCEDURE [dbo].[SP_DMCS_Insert_Emergency_Medical]
	-- Add the parameters for the stored procedure here
     
      @client_id as int,
      @ambulance_company_name as varchar(50),
      @ambulance_identification  as varchar(30),
      @appointment_date as datetime,
      @area_of_specialty as varchar(30),
      @assistance_order as varchar(50),
      @date_of_service as datetime,
      @degree_certifications as text,
      @doctor_appointments as varchar(30),
      @doctor_id as int,
      @doctor_start_date as datetime,
      @driver_id as int,
      @educational_institution_name as varchar(50),
      @external_examination as text,
      @hospital_name as varchar(50),
      @internal_examination as text,
      @lights_sirens_to_scene as varchar(3),
      @location_type as varchar(3),
      @number_of_days_admitted as int,
      @office_location as varchar(30),
      @other_remarks As text,
      @prescription_medicines as text,
      @time_of_service as datetime,
      @total_cost as money,
      @deceased_id as int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
if @client_id = 0
begin 
   set @client_id = NULL
end

if @doctor_id = 0 
Begin
   set @doctor_id = Null
end

if @driver_id = 0
Begin
   set @driver_id = NULL
end

if @deceased_id = 0
Begin
   set @deceased_id = null
End   
      
    -- Insert statements for procedure here
INSERT INTO [dbo].[emergency_medical]
           ([client_id]
           ,[ambulance_company_name]
           ,[ambulance_identification]
           ,[appointment_date]
           ,[area_of_specialty]
           ,[assistance_order]
           ,[date_of_service]
           ,[degree_certifications]
           ,[doctor_appointments]
           ,[doctor_id]
           ,[doctor_start_date]
           ,[driver_id]
           ,[educational_institution_name]
           ,[external_examination]
           ,[hospital_name]
           ,[internal_examination]
           ,[lights_sirens_to_scene]
           ,[location_type]
           ,[number_of_days_admitted]
           ,[office_location]
           ,[other_remarks]
           ,[prescription_medicines]
           ,[time_of_service]
           ,[total_cost]
           ,[deceased_id])
     VALUES
           (@client_id, 
            @ambulance_company_name, 
            @ambulance_identification, 
            @appointment_date,
            @area_of_specialty,
            @assistance_order, 
            @date_of_service, 
            @degree_certifications, 
            @doctor_appointments,
            @doctor_id, 
            @doctor_start_date, 
            @driver_id,
            @educational_institution_name, 
            @external_examination, 
            @hospital_name, 
            @internal_examination, 
            @lights_sirens_to_scene, 
            @location_type, 
            @number_of_days_admitted, 
            @office_location, 
            @other_remarks, 
            @prescription_medicines,
            @time_of_service, 
            @total_cost, 
            @deceased_id)
 
End

GO
/****** Object:  StoredProcedure [dbo].[SP_DMCS_Insert_Employee]    Script Date: 3/7/2014 5:04:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Edward Sobanski
-- Create date: 5/21/2012
-- Description:	Insert Row on Employee table
-- =============================================
CREATE PROCEDURE [dbo].[SP_DMCS_Insert_Employee]
	-- Add the parameters for the stored procedure here
     
        @employee_id as int,
        @employee_date_hired as datetime,
        @employee_department as varchar(15) = null,
        @employee_hours_worked as int,
        @employee_leadership as varchar(30) = null,
        @employee_motivation as varchar(30) = null,
        @employee_notes as text = null,
        @employee_overall as varchar(30) = null,
        @employee_payrate as money,      
        @employee_performance as varchar(30) = null,
        @employee_quality as varchar(30) = null,
        @employee_timeliness as varchar(30) = null,
        @username as varchar(50) = null,
        @pswd as varchar(15) = null
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

if @employee_id = 0
begin
   set @employee_id = Null
end   
    -- Insert statements for procedure here
INSERT INTO [dbo].[employee]
           ([employee_id]
           ,[employee_date_hired]
           ,[employee_department]
           ,[employee_hours_worked]
           ,[employee_leadership]
           ,[employee_motivation]
           ,[employee_notes]
           ,[employee_overall]
           ,[employee_payrate]
           ,[employee_performance]
           ,[employee_quality]
           ,[employee_timeliness]
           ,[username]
           ,[pswd])
     VALUES
           (@employee_id,
            @employee_date_hired,
            @employee_department, 
            @employee_hours_worked,
            @employee_leadership,
            @employee_motivation, 
            @employee_notes, 
            @employee_overall,
            @employee_payrate, 
            @employee_performance, 
            @employee_quality, 
            @employee_timeliness,
            @username, 
            @pswd)
 
End

GO
/****** Object:  StoredProcedure [dbo].[SP_DMCS_Insert_Employee_Clients]    Script Date: 3/7/2014 5:04:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Edward Sobanski
-- Create date: 5/21/2012
-- Description:	Insert Row on Employee clients table
-- =============================================
CREATE PROCEDURE [dbo].[SP_DMCS_Insert_Employee_Clients]
	-- Add the parameters for the stored procedure here

      @client_id as int,
      @employee_id as int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
if @client_id = 0
begin
    set @client_id = Null
End

if @employee_id = 0
begin
   set @employee_id = Null
end

    -- Insert statements for procedure here
INSERT INTO [dbo].[employee_clients]
           ([client_id]
           ,[employee_id])
     VALUES
           (@client_id, 
            @employee_id)
 
End

GO
/****** Object:  StoredProcedure [dbo].[SP_DMCS_Insert_Employer]    Script Date: 3/7/2014 5:04:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Edward Sobanski
-- Create date: 5/22/2012
-- Description:	Insert Row on Employer table
-- =============================================
CREATE PROCEDURE [dbo].[SP_DMCS_Insert_Employer]
	-- Add the parameters for the stored procedure here

           @case_id as int,
           @client_id as int,
           @address_id as int,
           @emplr_name as varchar(50),
           @emplr_phone as varchar(11),
           @end_date as datetime,
           @strt_date as datetime,
           @term_reason as text
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

if @address_id = 0
begin
    set @address_id = null
end


    -- Insert statements for procedure here
INSERT INTO [dbo].[employer]
           ([case_id]
           ,[client_id]
           ,[address_id]
           ,[emplr_name]
           ,[emplr_phone]
           ,[end_date]
           ,[strt_date]
           ,[term_reason])
     VALUES
           (@case_id,
            @client_id, 
            @address_id, 
            @emplr_name, 
            @emplr_phone, 
            @end_date, 
            @strt_date, 
            @term_reason)
 
End

GO
/****** Object:  StoredProcedure [dbo].[SP_DMCS_Insert_Encounter]    Script Date: 3/7/2014 5:04:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Edward Sobanski
-- Create date: 5/22/2012
-- Description:	Insert Row on Encounter table
-- =============================================
CREATE PROCEDURE [dbo].[SP_DMCS_Insert_Encounter]
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
/****** Object:  StoredProcedure [dbo].[SP_DMCS_Insert_Encounter_Client_Vaccine]    Script Date: 3/7/2014 5:04:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Edward Sobanski
-- Create date: 5/22/2012
-- Description:	Insert Row on Encounter client vaccine table
-- =============================================
CREATE PROCEDURE [dbo].[SP_DMCS_Insert_Encounter_Client_Vaccine]
	-- Add the parameters for the stored procedure here
      @encounter_id as int,
      @vaccine_id as int,
      @medicine as varchar(30),
      @assistance as char(1),
      @quantity as int,
      @under6m as char(1),
      @pregnant as char(1),
      @children as int,
      @occupation as varchar(30),
      @chronic_disease as varchar(50),
      @qualify as char(1),
      @dose_date1 as datetime,
      @dose_date2 as datetime,
      @adult_consent as image,
      @guardian_consent as image,
      @vaccine_admin as datetime,
      @guardian_f_name as varchar(20),
      @guardian_l_name as varchar(20),
      @guardian_mi as char(1),
      @guardian_phone as varchar(11),
      @adult_consent_date as datetime,
      @guard_consent_date as datetime,
      @dose_form1 as char(1),
      @dose_form2 as char(1)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
if @encounter_id = 0
begin
   set @encounter_id = null
end

if @vaccine_id = 0
begin
   set @vaccine_id = null
end


    -- Insert statements for procedure here
INSERT INTO [dbo].[encounter_client_vaccine]
           ([encounter_id]
           ,[vaccine_id]
           ,[medicine]
           ,[assistance]
           ,[quantity]
           ,[under6m]
           ,[pregnant]
           ,[children]
           ,[occupation]
           ,[chronic_disease]
           ,[qualify]
           ,[dose_date1]
           ,[dose_date2]
           ,[adult_consent]
           ,[guardian_consent]
           ,[vaccine_admin]
           ,[guardian_f_name]
           ,[guardian_l_name]
           ,[guardian_mi]
           ,[guardian_phone]
           ,[adult_consent_date]
           ,[guard_consent_date]
           ,[dose_form1]
           ,[dose_form2])
     VALUES
           (@encounter_id, 
            @vaccine_id,
            @medicine, 
            @assistance,
            @quantity,
            @under6m, 
            @pregnant,
            @children, 
            @occupation,
            @chronic_disease, 
            @qualify, 
            @dose_date1, 
            @dose_date2, 
            @adult_consent, 
            @guardian_consent, 
            @vaccine_admin,
            @guardian_f_name, 
            @guardian_l_name, 
            @guardian_mi, 
            @guardian_phone, 
            @adult_consent_date, 
            @guard_consent_date,
            @dose_form1,
            @dose_form2)
           
End

GO
/****** Object:  StoredProcedure [dbo].[SP_DMCS_Insert_Encounter_Services]    Script Date: 3/7/2014 5:04:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Edward Sobanski
-- Create date: 5/22/2012
-- Description:	Insert Row on Encounter Services table
-- =============================================
CREATE PROCEDURE [dbo].[SP_DMCS_Insert_Encounter_Services]
	-- Add the parameters for the stored procedure here
      @encounter_id as int,
      @mobile_unit_id as int,
      @service_id as int,
      @service_date as datetime,
      @service_completed as datetime
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

if @encounter_id = 0
begin
   set @encounter_id = null
end

if @mobile_unit_id = 0
begin
   set @mobile_unit_id = null
end

if @service_id = 0
begin
   set @service_id = null
end

    -- Insert statements for procedure here
INSERT INTO [dbo].[encounter_services]
           ([encounter_id]
           ,[mobile_unit_id]
           ,[service_id]
           ,[service_date]
           ,[service_completed])
     VALUES
           (@encounter_id, 
            @mobile_unit_id, 
            @service_id,
            @service_date, 
            @service_completed)
           
End

GO
/****** Object:  StoredProcedure [dbo].[SP_DMCS_Insert_Expense]    Script Date: 3/7/2014 5:04:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Edward Sobanski
-- Create date: 5/22/2012
-- Description:	Insert Row on Expense table
-- =============================================
CREATE PROCEDURE [dbo].[SP_DMCS_Insert_Expense]
	-- Add the parameters for the stored procedure here
      
      @case_id as int,
      @client_id as int,
      @date_paid as datetime,
      @expense_amt_paid as money,
      @expense_amt_paid_to as varchar(30)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
if @client_id = 0
begin
  set @client_id = null
end

if @case_id = 0
begin
  set @case_id = null
end
    -- Insert statements for procedure here
INSERT INTO [dbo].[expense]
           ([case_id]
           ,[client_id]
           ,[date_paid]
           ,[expense_amt_paid]
           ,[expense_amt_paid_to])
     VALUES
           (@case_id, 
            @client_id, 
            @date_paid, 
            @expense_amt_paid,
            @expense_amt_paid_to)
           
End

GO
/****** Object:  StoredProcedure [dbo].[SP_DMCS_Insert_FEMA]    Script Date: 3/7/2014 5:04:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		James Miller
-- Create date: 2/28/2013
-- Description:	Insert Row in FEMA table
-- =============================================
CREATE PROCEDURE [dbo].[SP_DMCS_Insert_FEMA]
	-- Add the parameters for the stored procedure here
     
      @FEMA_ID as int,
	  @Cost_Code as int,
      @Equipment as int,
      @Specification as VarChar,
      @Capacity_Size as VarChar,
      @HP as VarChar,
      @Notes as VarChar,
      @Unit as VarChar,
      @Rate as VarChar
     
      
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

if @FEMA_ID  = 0
begin 
   set @FEMA_ID = null
end

    -- Insert statements for procedure here
           INSERT INTO [dbo].[FEMA]
           ([Cost_Code]
           ,[Equipment]
           ,[Specification]
           ,[Capacity_Size]
           ,[HP]
           ,[Notes]
           ,[Unit]
           ,[Rate])
     VALUES
           (@Cost_Code
           ,@Equipment
           ,@Specification
           ,@Capacity_Size
           ,@HP
           ,@Notes
           ,@Unit
           ,@Rate)

 End


GO
/****** Object:  StoredProcedure [dbo].[SP_DMCS_Insert_Food]    Script Date: 3/7/2014 5:04:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Edward Sobanski
-- Create date: 5/22/2012
-- Description:	Insert Row on Food table
-- =============================================
CREATE PROCEDURE [dbo].[SP_DMCS_Insert_Food]
	-- Add the parameters for the stored procedure here
      
       @food_voucher_id as int,
       @clients_served as int,
       @food_voucher_number as int,
       @date_issued as datetime,
       @Product_id as int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	
if @food_voucher_id = 0
   begin
       set @food_voucher_id = null
   end
   
if @Product_id = 0
   begin
       set @Product_id = null
   end
       -- Insert statements for procedure here
INSERT INTO [dbo].[food]
           ([food_voucher_id]
           ,[clients_served]
           ,[food_voucher_number]
           ,[date_issued]
           ,[Product_id])
     VALUES
           (@food_voucher_id,
            @clients_served,
            @food_voucher_number, 
            @date_issued, 
            @Product_id)
           
End

GO
/****** Object:  StoredProcedure [dbo].[SP_DMCS_Insert_house]    Script Date: 3/7/2014 5:04:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Edward Sobanski
-- Create date: 5/22/2012
-- Description:	Insert Row on house table
-- =============================================
create PROCEDURE [dbo].[SP_DMCS_Insert_house]
	-- Add the parameters for the stored procedure here
      
       @house_name as varchar(50),
       @house_eligibility as varchar(15),
       @house_request_date as datetime,
       @house_voucher_amt as money,
       @house_voucher_begin_date as datetime,
       @house_voucher_exp_date as datetime,
       @house_voucher_num as int,
       @house_voucher_schedule as varchar(10),
       @house_wait_list as int
       
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
INSERT INTO [dbo].[house]
           ([house_name]
           ,[house_eligibility]
           ,[house_request_date]
           ,[house_voucher_amt]
           ,[house_voucher_begin_date]
           ,[house_voucher_exp_date]
           ,[house_voucher_num]
           ,[house_voucher_schedule]
           ,[house_wait_list])
     VALUES
           (@house_name, 
            @house_eligibility, 
            @house_request_date, 
            @house_voucher_amt,
            @house_voucher_begin_date, 
            @house_voucher_exp_date, 
            @house_voucher_num, 
            @house_voucher_schedule, 
            @house_wait_list)
        
End

GO
/****** Object:  StoredProcedure [dbo].[SP_DMCS_Insert_House_Choice]    Script Date: 3/7/2014 5:04:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Edward Sobanski
-- Create date: 5/22/2012
-- Description:	Insert Row on house choice table
-- =============================================
CREATE PROCEDURE [dbo].[SP_DMCS_Insert_House_Choice]
	-- Add the parameters for the stored procedure here
      
       @house_id as int,
       @address_id as int,
       @house_choice_bathrooms as int,
       @house_choice_comments as varchar(30),
       @house_choice_contact_person_id as int,
       @house_choice_laundry as varchar(15),
       @house_choice_no_floors as int,
       @house_choice_parking as varchar(15),
       @house_choice_rent as money,
       @house_choice_type as varchar(30),
       @house_choice_units_avail as int
       
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
if @house_id = 0
   begin
       set @house_id = null
   end

if @address_id = 0
   begin
       set @address_id = null
   end

if @house_choice_contact_person_id = 0
   begin
       set @house_choice_contact_person_id = null
   end
     
    -- Insert statements for procedure here
INSERT INTO [dbo].[house_choice]
           ([house_id]
           ,[address_id]
           ,[house_choice_bathrooms]
           ,[house_choice_comments]
           ,[house_choice_contact_person_id]
           ,[house_choice_laundry]
           ,[house_choice_no_floors]
           ,[house_choice_parking]
           ,[house_choice_rent]
           ,[house_choice_type]
           ,[house_choice_units_avail])
     VALUES
           (@house_id,
            @address_id, 
            @house_choice_bathrooms,
            @house_choice_comments,
            @house_choice_contact_person_id, 
            @house_choice_laundry,
            @house_choice_no_floors,
            @house_choice_parking,
            @house_choice_rent, 
            @house_choice_type, 
            @house_choice_units_avail)
        
End

GO
/****** Object:  StoredProcedure [dbo].[SP_DMCS_Insert_Income_Source]    Script Date: 3/7/2014 5:04:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Edward Sobanski
-- Create date: 5/22/2012
-- Description:	Insert Row on Income_Source table
-- =============================================
CREATE PROCEDURE [dbo].[SP_DMCS_Insert_Income_Source]
	-- Add the parameters for the stored procedure here
      
       @case_id as int,
       @cash_amt as money = null,
       @cash_on_hand as char(1) = 'N',
       @wages_stopped as char(1) = 'N',
       @waiting_on_income as char(1) = 'N',
       @recieving_income as char(1) = 'N',
       @no_income as char(1)= 'N',
       @currently_working as char(1)= 'N',
       @laid_off as char(1)= 'N',
       @never_worked as char(1)= 'N',
       @quit as char(1)= 'N',
       @fired as char(1)= 'N',
       @sick_leave as char(1)= 'N',
       @maternity_leave as char(1)= 'N',
       @on_strike as char(1)= 'N',
       @trying_to_find_work as char(1)= 'N',
       @ckg_acct as char(1)= 'N',
       @ckg_balance as money= null,
       @ckg_bank as varchar(30)= null,
       @claims as char(1)= 'N',
       @claims_memo as text= null,
       @client_id as int= null,
       @gifts_amt as money= null,
       @gifts_inc as char(1)= 'N',
       @investments as char(1)= 'N',
       @life_ins as char(1)= 'N',
       @other_ins as char(1)= 'N',
       @pension_amt as money= null,
       @pension_inc as char(1)= null,
       @strike_benefits_amt as money= null,
       @strike_benefits_inc as char(1)= 'N',
       @support_amt as money= null,
       @support_inc as char(1)= 'N',
       @SSI_Amt as money= null,
       @SSI_Inc as char(1)= 'N',
       @svgs_acct as char(1)= null,
       @svgs_balance as money= null,
       @svgs_bank as varchar(30)= null,
       @wages_amt as money= null,
       @wages_inc as char(1)= 'N'
       
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
   
    -- Insert statements for procedure here
INSERT INTO [dbo].[income_source]
           ([case_id]
           ,[cash_amt]
           ,[cash_on_hand]
           ,[wages_stopped]
           ,[waiting_on_income]
           ,[recieving_income]
           ,[no_income]
           ,[currently_working]
           ,[laid_off]
           ,[never_worked]
           ,[quit]
           ,[fired]
           ,[sick_leave]
           ,[maternity_leave]
           ,[on_strike]
           ,[trying_to_find_work]
           ,[ckg_acct]
           ,[ckg_balance]
           ,[ckg_bank]
           ,[claims]
           ,[claims_memo]
           ,[client_id]
           ,[gifts_amt]
           ,[gifts_inc]
           ,[investments]
           ,[life_ins]
           ,[other_ins]
           ,[pension_amt]
           ,[pension_inc]
           ,[strike_benefits_amt]
           ,[strike_benefits_inc]
           ,[support_amt]
           ,[support_inc]
           ,[SSI_Amt]
           ,[SSI_Inc]
           ,[svgs_acct]
           ,[svgs_balance]
           ,[svgs_bank]
           ,[wages_amt]
           ,[wages_inc])
     VALUES
           (@case_id, 
            @cash_amt, 
            @cash_on_hand, 
            @wages_stopped,
            @waiting_on_income,
            @recieving_income, 
            @no_income, 
            @currently_working,
            @laid_off, 
            @never_worked, 
            @quit, 
            @fired, 
            @sick_leave,
            @maternity_leave, 
            @on_strike, 
            @trying_to_find_work, 
            @ckg_acct,
            @ckg_balance, 
            @ckg_bank,
            @claims,
            @claims_memo, 
            @client_id,
            @gifts_amt, 
            @gifts_inc, 
            @investments, 
            @life_ins, 
            @other_ins, 
            @pension_amt, 
            @pension_inc, 
            @strike_benefits_amt, 
            @strike_benefits_inc, 
            @support_amt, 
            @support_inc, 
            @SSI_Amt, 
            @SSI_Inc,
            @svgs_acct,
            @svgs_balance, 
            @svgs_bank, 
            @wages_amt, 
            @wages_inc)
        
End

GO
/****** Object:  StoredProcedure [dbo].[SP_DMCS_Insert_Job]    Script Date: 3/7/2014 5:04:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Edward Sobanski
-- Create date: 5/22/2012
-- Description:	Insert Row on Job table
-- =============================================
CREATE PROCEDURE [dbo].[SP_DMCS_Insert_Job]
	-- Add the parameters for the stored procedure here
      
           @address_id AS int,
           @company_id AS int,
           @job_cat_id AS int,
           @job_posted_date AS datetime,
           @job_status AS varchar(10),
           @job_title AS varchar(15),
           @Work_Classification_Full_time AS varchar(15),
           @Work_Classification_Part_time AS varchar(15),
           @Work_Payment_Freq_Weekly AS varchar(15),
           @Work_Payment_Freq_BiWeekly AS varchar(15),
           @Work_Payment_Freq_Monthly AS varchar(15),
           @Work_Payment_Freq_BiMonthly AS varchar(15)
       
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
if @address_id = 0
begin
   set @address_id = null
end

if @company_id = 0
begin
   set @company_id = null
end

if @job_cat_id = 0
begin
   set @job_cat_id = null
end

    -- Insert statements for procedure here
INSERT INTO [dbo].[job]
           ([address_id]
           ,[company_id]
           ,[job_cat_id]
           ,[job_posted_date]
           ,[job_status]
           ,[job_title]
           ,[Work_Classification_Full_time]
           ,[Work_Classification_Part_time]
           ,[Work_Payment_Freq_Weekly]
           ,[Work_Payment_Freq_Bi-Weekly]
           ,[Work_Payment_Freq_Monthly]
           ,[Work_Payment_Freq_Bi-Monthly])
     VALUES
           (@address_id, 
            @company_id, 
            @job_cat_id, 
            @job_posted_date, 
            @job_status, 
            @job_title, 
            @Work_Classification_Full_time, 
            @Work_Classification_Part_time, 
            @Work_Payment_Freq_Weekly, 
            @Work_Payment_Freq_BiWeekly, 
            @Work_Payment_Freq_Monthly, 
            @Work_Payment_Freq_BiMonthly)
        
End

GO
/****** Object:  StoredProcedure [dbo].[SP_DMCS_Insert_Job_Category]    Script Date: 3/7/2014 5:04:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Edward Sobanski
-- Create date: 5/22/2012
-- Description:	Insert Row on Job Category table
-- =============================================
create PROCEDURE [dbo].[SP_DMCS_Insert_Job_Category]
	-- Add the parameters for the stored procedure here
           
           
           @job_category_name as varchar(30)
       
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
INSERT INTO [dbo].[job_category]
           ([job_category_name])
     VALUES
           (@job_category_name)
        
End

GO
/****** Object:  StoredProcedure [dbo].[SP_DMCS_Insert_location]    Script Date: 3/7/2014 5:04:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




-- =============================================
-- Author:		Justin Gamble
-- Create date: 2/26/2013
-- Description:	Insert Row in Location table
-- =============================================
CREATE PROCEDURE [dbo].[SP_DMCS_Insert_location]
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
/****** Object:  StoredProcedure [dbo].[SP_DMCS_Insert_Lot]    Script Date: 3/7/2014 5:04:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Edward Sobanski
-- Create date: 5/22/2012
-- Description:	Insert Row on Lot table
-- =============================================
CREATE PROCEDURE [dbo].[SP_DMCS_Insert_Lot]
	-- Add the parameters for the stored procedure here
           
           
           @product_id as int,
           @manufactured_date as datetime,
           @expiration_date as datetime,
           @manufacture_name as varchar(50)
       
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
if @product_id = 0
begin
   set @product_id = null
end

    -- Insert statements for procedure here
INSERT INTO [dbo].[lot]
           ([product_id]
           ,[manufactured_date]
           ,[expiration_date]
           ,[manufacture_name])
     VALUES
           (@product_id,
            @manufactured_date, 
            @expiration_date, 
            @manufacture_name)
        
End

GO
/****** Object:  StoredProcedure [dbo].[SP_DMCS_Insert_Medical_Assistance]    Script Date: 3/7/2014 5:04:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Edward Sobanski
-- Create date: 5/22/2012
-- Description:	Insert Medical Assistance on Lot table
-- =============================================
CREATE PROCEDURE [dbo].[SP_DMCS_Insert_Medical_Assistance]
	-- Add the parameters for the stored procedure here
           
      @em_id as int,
      @medical_assist_date as datetime,
      @medical_assist_doctor_id as int,
      @medical_assist_hosp_price as money,
      @medical_assist_hospital_name as varchar(50),
      @medical_assist_script_meds as varchar(30),
      @medical_assist_script_price as money,
      @medical_assist_script_quantity as int
       
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
if @em_id = 0
begin
   set @em_id = null
end

if @medical_assist_doctor_id = 0
begin
   set @medical_assist_doctor_id = null
end

    -- Insert statements for procedure here
INSERT INTO [dbo].[medical_assistance]
           ([em_id]
           ,[medical_assist_date]
           ,[medical_assist_doctor_id]
           ,[medical_assist_hosp_price]
           ,[medical_assist_hospital_name]
           ,[medical_assist_script_meds]
           ,[medical_assist_script_price]
           ,[medical_assist_script_quantity])
     VALUES
           (@em_id, 
            @medical_assist_date, 
            @medical_assist_doctor_id,
            @medical_assist_hosp_price,
            @medical_assist_hospital_name,
            @medical_assist_script_meds, 
            @medical_assist_script_price, 
            @medical_assist_script_quantity)
        
End

GO
/****** Object:  StoredProcedure [dbo].[SP_DMCS_Insert_Medicine]    Script Date: 3/7/2014 5:04:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Edward Sobanski
-- Create date: 5/22/2012
-- Description:	Insert Medicine on Lot table
-- =============================================
CREATE PROCEDURE [dbo].[SP_DMCS_Insert_Medicine]
	-- Add the parameters for the stored procedure here
           @medicine_id  as int,
           @Medication_type as varchar(30),
           @Medication_name as varchar(50),
           @Clients_Served as int
       
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
if @medicine_id = 0
begin
   set @medicine_id = null
end

    -- Insert statements for procedure here
INSERT INTO [dbo].[medicine]
           ([Medication_type]
           ,[Medication_name]
           ,[Clients_Served])
     VALUES
           (@Medication_type, 
            @Medication_name, 
            @Clients_Served)
        
End

GO
/****** Object:  StoredProcedure [dbo].[SP_DMCS_Insert_Military]    Script Date: 3/7/2014 5:04:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Edward Sobanski
-- Create date: 5/22/2012
-- Description:	Insert Military on Lot table
-- =============================================
CREATE PROCEDURE [dbo].[SP_DMCS_Insert_Military]
	-- Add the parameters for the stored procedure here
           
         @case_id as int,
         @client_id as int,
         @discharge_date as datetime,
         @enlistment_date as datetime,
         @military_branch as varchar(30),
         @serial_num as int
       
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

    -- Insert statements for procedure here
INSERT INTO [dbo].[military]
           ([case_id]
           ,[client_id]
           ,[discharge_date]
           ,[enlistment_date]
           ,[military_branch]
           ,[serial_num])
     VALUES
           (@case_id,
            @client_id, 
            @discharge_date, 
            @enlistment_date, 
            @military_branch,
            @serial_num)
        
End

GO
/****** Object:  StoredProcedure [dbo].[SP_DMCS_Insert_Missing]    Script Date: 3/7/2014 5:04:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Edward Sobanski
-- Create date: 5/22/2012
-- Description:	Insert row on Missing  table
-- =============================================
CREATE PROCEDURE [dbo].[SP_DMCS_Insert_Missing]
	-- Add the parameters for the stored procedure here
           
           @Missing_id as int,
           @client_other_info as varchar(30),
           @clothing as varchar(30),
           @date_of_disappearance as datetime,
           @last_known_location as varchar(30)
       
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
if @Missing_id = 0
begin
   set @Missing_id = null
end
    -- Insert statements for procedure here
INSERT INTO [dbo].[missing]
           ([Missing_id]
           ,[client_other_info]
           ,[clothing]
           ,[date_of_disappearance]
           ,[last_known_location])
     VALUES
           (@Missing_id, 
            @client_other_info,
            @clothing, 
            @date_of_disappearance,
            @last_known_location) 
        
End

GO
/****** Object:  StoredProcedure [dbo].[SP_DMCS_Insert_Mobile_Employees]    Script Date: 3/7/2014 5:04:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Edward Sobanski
-- Create date: 5/22/2012
-- Description:	Insert row on mobile employees table
-- =============================================
CREATE PROCEDURE [dbo].[SP_DMCS_Insert_Mobile_Employees]
	-- Add the parameters for the stored procedure here
           
         @mobile_unit_id as int,
         @employee_id as int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
if @mobile_unit_id = 0
begin
   set @mobile_unit_id = null
end

if @employee_id = 0
begin
   set @employee_id = null
end

    -- Insert statements for procedure here
INSERT INTO [dbo].[mobile_employees]
           ([mobile_unit_id]
           ,[employee_id])
     VALUES
           (@mobile_unit_id,
            @employee_id)
        
End

GO
/****** Object:  StoredProcedure [dbo].[SP_DMCS_Insert_mobile_product]    Script Date: 3/7/2014 5:04:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Edward Sobanski
-- Create date: 6/20/2012
-- Description:	Insert row on mobile product table
-- =============================================
create PROCEDURE [dbo].[SP_DMCS_Insert_mobile_product]
	-- Add the parameters for the stored procedure here
           

       @Mobile_Unit_id as int,
       @Product_id as int,
       @Case_id as int,
       @Lot_id as int,
       @Min_inv as int,
       @Quantity as int,
       @Experiation_Date as datetime
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
if @Mobile_Unit_id = 0
begin
   set @Mobile_Unit_id = null
end

if @Product_id = 0
begin
   set @Product_id = null
end

if @Case_id = 0
begin
   set @Case_id = null
end

if @Lot_id = 0
begin
   set @Lot_id = null
end
    -- Insert statements for procedure here
INSERT INTO [dbo].[Mobile_Product]
           ([Mobile_Unit_id]
           ,[Product_id]
           ,[Case_id]
           ,[Lot_id]
           ,[Min_inv]
           ,[Quantity]
           ,[Experiation_Date])
     VALUES
           (@Mobile_Unit_id
           ,@Product_id
           ,@Case_id
           ,@Lot_id
           ,@Min_inv
           ,@Quantity
           ,@Experiation_Date)
        
End

GO
/****** Object:  StoredProcedure [dbo].[SP_DMCS_Insert_Mobile_Unit]    Script Date: 3/7/2014 5:04:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Edward Sobanski
-- Create date: 5/22/2012
-- Description:	Insert row on mobile Unit table
-- =============================================
CREATE PROCEDURE [dbo].[SP_DMCS_Insert_Mobile_Unit]
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
/****** Object:  StoredProcedure [dbo].[SP_DMCS_Insert_Order_Product]    Script Date: 3/7/2014 5:04:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Edward Sobanski
-- Create date: 5/22/2012
-- Description:	Insert row on order product table
-- =============================================
CREATE PROCEDURE [dbo].[SP_DMCS_Insert_Order_Product]
	-- Add the parameters for the stored procedure here
           

       @orderID as int,
       @ProductID as int,
       @Quantity as int,
       @warehouseid as int,
       @DatePicked as date,
       @Qtypicked as int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
if @orderID = 0
begin
   set @orderID = null
end

if @ProductID = 0
begin
   set @ProductID = null
end

if @warehouseid = 0
begin
   set @warehouseid = null
end

    -- Insert statements for procedure here
INSERT INTO [dbo].[Order_Product]
           ([orderID]
           ,[ProductID]
           ,[Quantity]
           ,[warehouseid]
           ,[DatePicked]
           ,[Qtypicked])
     VALUES
           (@orderID, 
            @ProductID, 
            @Quantity, 
            @warehouseid, 
            @DatePicked, 
            @Qtypicked)
        
End

GO
/****** Object:  StoredProcedure [dbo].[SP_DMCS_Insert_Person]    Script Date: 3/7/2014 5:04:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Edward Sobanski
-- Create date: 5/22/2012
-- Description:	Insert row on person table
-- =============================================
CREATE PROCEDURE [dbo].[SP_DMCS_Insert_Person]
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
/****** Object:  StoredProcedure [dbo].[SP_DMCS_Insert_pet]    Script Date: 3/7/2014 5:04:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO






-- =============================================
-- Author:		Jianwang Xing
-- Create date: 3/29/2013
-- Description:	Insert Row on pet table
-- =============================================
CREATE PROCEDURE [dbo].[SP_DMCS_Insert_pet]
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
/****** Object:  StoredProcedure [dbo].[SP_DMCS_Insert_Pet_Deceased]    Script Date: 3/7/2014 5:04:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




-- =============================================
-- Author:		Mike Phillips
-- Create date: 3/29/2013
-- Description:	Insert Row in pet deceased table
-- =============================================
CREATE PROCEDURE [dbo].[SP_DMCS_Insert_Pet_Deceased]
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
/****** Object:  StoredProcedure [dbo].[SP_DMCS_Insert_Pet_Missing]    Script Date: 3/7/2014 5:04:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




-- =============================================
-- Author:		Jianwang Xing
-- Create date: 3/29/2013
-- Description:	Insert Row in missing pet table
-- =============================================
CREATE PROCEDURE [dbo].[SP_DMCS_Insert_Pet_Missing]
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
INSERT INTO [dbo].[Pet_Missing]
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
/****** Object:  StoredProcedure [dbo].[SP_DMCS_Insert_Pet_type]    Script Date: 3/7/2014 5:04:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Jianwang Xing
-- Create date: 3/29/2013
-- Description:	Insert Row on pet type table
-- =============================================
CREATE PROCEDURE [dbo].[SP_DMCS_Insert_Pet_type]
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
/****** Object:  StoredProcedure [dbo].[SP_DMCS_Insert_Pet_Vaccine]    Script Date: 3/7/2014 5:04:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Mike Phillips
-- Create date: 3/29/2013
-- Description:	Insert Row in pet vaccines table
-- =============================================
create PROCEDURE [dbo].[SP_DMCS_Insert_Pet_Vaccine]
	-- Add the parameters for the stored procedure here
			@Pet_Vaccine_ID as int,
			@Last_Vaccine_Given as DateTime,
            @Pet_Record_ID AS int,
            @Datetime AS DateTime,
			@Vaccine_Type_ID as int
			
			 
      
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
INSERT INTO [dbo].[Pet_Vaccine]
           ([Pet_Vaccine_ID]
		   ,[Last_Vaccine_Given]
		   ,[Pet_Record_ID]
           ,[Datetime]
           ,[Vaccine_Type_ID])

     VALUES
           (@Pet_Vaccine_ID,
            @Last_Vaccine_Given,
            @Pet_Record_ID,
            @Datetime,
            @Vaccine_Type_ID)

 End

GO
/****** Object:  StoredProcedure [dbo].[SP_DMCS_Insert_Products]    Script Date: 3/7/2014 5:04:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Edward Sobanski
-- Create date: 5/22/2012
-- Description:	Insert row on products table
-- =============================================
CREATE PROCEDURE [dbo].[SP_DMCS_Insert_Products]
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
/****** Object:  StoredProcedure [dbo].[SP_DMCS_Insert_Property]    Script Date: 3/7/2014 5:04:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Edward Sobanski
-- Create date: 5/22/2012
-- Description:	Insert row on property table
-- =============================================
CREATE PROCEDURE [dbo].[SP_DMCS_Insert_Property]
	-- Add the parameters for the stored procedure here
           
         
            @approx_mrkt_value as money,
            @address_id as int,
            @case_id as int,
            @client_id as int,
            @Homeowners_Insurance_Payment as money,
            @monthly_property_payment as money,
            @mortg_comp as varchar(30),
            @Property_Tax_Payment as money,
            @own_prop as char(1),
            @rent_prop as char(1),
            @date_purchased as int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
if @address_id = 0
begin
   set @address_id = null
end

if @case_id = 0
begin
   set @case_id = null
end

if @client_id = 0
begin
   set @client_id = null
end

    -- Insert statements for procedure here
INSERT INTO [dbo].[property]
           ([approx_mrkt_value]
           ,[address_id]
           ,[case_id]
           ,[client_id]
           ,[Homeowners_Insurance _Payment]
           ,[monthly_property_payment]
           ,[mortg_comp]
           ,[Property_Tax _Payment]
           ,[own_prop]
           ,[rent_prop]
           ,[date_purchased])
     VALUES
           (@approx_mrkt_value,
            @address_id, 
            @case_id, 
            @client_id, 
            @Homeowners_Insurance_Payment, 
            @monthly_property_payment, 
            @mortg_comp, 
            @Property_Tax_Payment, 
            @own_prop,
            @rent_prop, 
            @date_purchased)
        
End

GO
/****** Object:  StoredProcedure [dbo].[SP_DMCS_Insert_Pvaccine]    Script Date: 3/7/2014 5:04:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Mike Phillips
-- Create date: 3/29/2013
-- Description:	Insert Row in Pvaccine table
-- =============================================
create PROCEDURE [dbo].[SP_DMCS_Insert_Pvaccine]
	-- Add the parameters for the stored procedure here
			@Vaccine_Type_ID as int,
			@Vaccine_Name as varchar,
            @Vaccine_Reactions AS text,
            @Vaccine_Type AS text
			
			 
      
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
INSERT INTO [dbo].[Pvaccine]
           ([Vaccine_Type_ID]
		   ,[Vaccine_Name]
		   ,[Vaccine_Reactions]
           ,[Vaccine_Type])

     VALUES
           (@Vaccine_Type_ID,
            @Vaccine_Name,
            @Vaccine_Reactions,
            @Vaccine_Type)

 End

GO
/****** Object:  StoredProcedure [dbo].[SP_DMCS_Insert_Receipt]    Script Date: 3/7/2014 5:04:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		James Miller
-- Create date: 2/28/2013
-- Description:	Insert Row in Receipt table
-- =============================================
CREATE PROCEDURE [dbo].[SP_DMCS_Insert_Receipt]
	-- Add the parameters for the stored procedure here
     
	  @Receipt_ID as int,
	  @Account_ID as int,
      @Check_Num as int,
      @DLN as int,
      @Phone as int,
      @Pay_Type as int,
      @Amount as int,
      @Transfer as bit,
      @Recieve as bit
      
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

if @Receipt_ID  = 0
begin 
   set @Receipt_ID = null
end

    -- Insert statements for procedure here
INSERT INTO [dbo].[receipt]
           ([Account_ID]
           ,[Check_Num]
           ,[DLN]
           ,[Phone]
           ,[Pay_Type]
           ,[Amount]
           ,[Transfer]
           ,[Recieve])
     VALUES
           (@Account_ID
           ,@Check_Num
           ,@DLN
           ,@Phone
           ,@Pay_Type
           ,@Amount
           ,@Transfer
           ,@Recieve)

 End


GO
/****** Object:  StoredProcedure [dbo].[SP_DMCS_Insert_Relative]    Script Date: 3/7/2014 5:04:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Edward Sobanski
-- Create date: 5/22/2012
-- Description:	Insert row on relative table
-- =============================================
CREATE PROCEDURE [dbo].[SP_DMCS_Insert_Relative]
	-- Add the parameters for the stored procedure here
           
            @case_id as int,
            @client_id as int,
            @address_id as int,
            @relative_help_memo as text,
            @will_help as char(1)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
if @address_id = 0
begin
   set @address_id = null
end

if @case_id = 0
begin
   set @case_id = null
end

if @client_id = 0
begin
   set @client_id = null
end

    -- Insert statements for procedure here
INSERT INTO [dbo].[relative]
           ([case_id]
           ,[client_id]
           ,[address_id]
           ,[relative_help_memo]
           ,[will_help])
     VALUES
           (@case_id,  
            @client_id, 
            @address_id,  
            @relative_help_memo,  
            @will_help)
        
End

GO
/****** Object:  StoredProcedure [dbo].[SP_DMCS_Insert_Requestor]    Script Date: 3/7/2014 5:04:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Edward Sobanski
-- Create date: 5/22/2012
-- Description:	Insert row on Requestor table
-- =============================================
CREATE PROCEDURE [dbo].[SP_DMCS_Insert_Requestor]
	-- Add the parameters for the stored procedure here
           
           @EncounterID as int,
           @Requestor_Type as char(1),
           @MobilUnitID as int,
           @PersonID as int,
           @AgencyID as int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

if @EncounterID = 0
begin
   set @EncounterID = null
end

if @MobilUnitID = 0
begin
   set @MobilUnitID = null
end

if @PersonID = 0
begin
   set @PersonID = null
end

if @AgencyID = 0
begin
   set @AgencyID = null
end

    -- Insert statements for procedure here
INSERT INTO [dbo].[requestor]
           ([EncounterID]
           ,[Requestor_Type]
           ,[MobilUnitID]
           ,[PersonID]
           ,[AgencyID])
     VALUES
           (@EncounterID,
            @Requestor_Type, 
            @MobilUnitID, 
            @PersonID, 
            @AgencyID)
        
End

GO
/****** Object:  StoredProcedure [dbo].[SP_DMCS_Insert_Requestor_Order]    Script Date: 3/7/2014 5:04:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Edward Sobanski
-- Create date: 5/22/2012
-- Description:	Insert row on Requestor order table
-- =============================================
CREATE PROCEDURE [dbo].[SP_DMCS_Insert_Requestor_Order]
	-- Add the parameters for the stored procedure here
          
           @EncounterID as int,
           @OrderPriority as int,
           @OrderNum as int,
           @ShipToAddressID as int,
           @RequestorID as int,
           @OrderDeliveryType as varchar(20),
           @OrderPickUpDate as date
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
if @EncounterID = 0
begin
   set @EncounterID = null
end

if @ShipToAddressID = 0
begin
   set @ShipToAddressID = null
end

if @RequestorID = 0
begin
   set @RequestorID = null
end

    -- Insert statements for procedure here
INSERT INTO [dbo].[requestor_Order]
           ([EncounterID]
           ,[OrderPriority]
           ,[OrderNum]
           ,[ShipToAddressID]
           ,[Requestor_ID]
           ,[OrderDeliveryType]
           ,[OrderPickUpDate])
     VALUES
           (@EncounterID, 
            @OrderPriority, 
            @OrderNum, 
            @ShipToAddressID,
            @RequestorID, 
            @OrderDeliveryType, 
            @OrderPickUpDate)
        
End

GO
/****** Object:  StoredProcedure [dbo].[SP_DMCS_Insert_Requirements]    Script Date: 3/7/2014 5:04:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Edward Sobanski
-- Create date: 5/22/2012
-- Description:	Insert row on Requirements order table
-- =============================================
create PROCEDURE [dbo].[SP_DMCS_Insert_Requirements]
	-- Add the parameters for the stored procedure here
          
          @requirement_desc as varchar(100)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
INSERT INTO [dbo].[requirements]
           ([requirement_desc])
     VALUES
           (@requirement_desc)
        
End

GO
/****** Object:  StoredProcedure [dbo].[SP_DMCS_Insert_Resource]    Script Date: 3/7/2014 5:04:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		James Miller
-- Create date: 2/26/2013
-- Description:	Insert Row in Resource table
-- =============================================
CREATE PROCEDURE [dbo].[SP_DMCS_Insert_Resource]
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
/****** Object:  StoredProcedure [dbo].[SP_DMCS_Insert_Services]    Script Date: 3/7/2014 5:04:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Edward Sobanski
-- Create date: 5/22/2012
-- Description:	Insert row on services table
-- =============================================
create PROCEDURE [dbo].[SP_DMCS_Insert_Services]
	-- Add the parameters for the stored procedure here

		  @Company as varchar,
		  @service_type as char,
		  @Estimated_Time as date,
		  @Email as varchar,
		  @Phone_Number as int,
		  @Full_Cost as int,
		  @Estimated_Cost as int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
INSERT INTO [dbo].[services]
           ([Company]
           ,[service_type]
           ,[Estimated_Time]
           ,[Email]
           ,[Phone_Number]
           ,[Full_Cost]
           ,[Estimated_Cost] )
     VALUES
           (@Company,
            @service_type,
            @Estimated_Time,
            @Email,
            @Phone_Number,
            @Full_Cost,
            @Estimated_Cost)
        
End

GO
/****** Object:  StoredProcedure [dbo].[SP_DMCS_Insert_Shipment]    Script Date: 3/7/2014 5:04:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Edward Sobanski
-- Create date: 5/22/2012
-- Description:	Shipment row on services table
-- =============================================
CREATE PROCEDURE [dbo].[SP_DMCS_Insert_Shipment]
	-- Add the parameters for the stored procedure here

           @WarehouseID as int,
           @Tracking_Num as varchar(128),
           @Ship_Method as varchar(30),
           @Other as text,
           @OrderRecByID as int,
           @FullOrderReceived as char(1)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
if @WarehouseID = 0
begin
   set @WarehouseID = null
end

if @OrderRecByID = 0
begin
   set @OrderRecByID = null
end

    -- Insert statements for procedure here
INSERT INTO [dbo].[Shipment]
           ([WarehouseID]
           ,[Tracking_Num]
           ,[Ship_Method]
           ,[Other]
           ,[OrderRecByID]
           ,[FullOrderReceived])
     VALUES
           (@WarehouseID,
            @Tracking_Num,
            @Ship_Method, 
            @Other, 
            @OrderRecByID, 
            @FullOrderReceived)
End

GO
/****** Object:  StoredProcedure [dbo].[SP_DMCS_Insert_Tier]    Script Date: 3/7/2014 5:04:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Edward Sobanski
-- Create date: 5/22/2012
-- Description:	Insert row on Tier table
-- =============================================
CREATE PROCEDURE [dbo].[SP_DMCS_Insert_Tier]
	-- Add the parameters for the stored procedure here

           @include_req as char(1),
           @campaign_id as int,
           @Tier_Age_Begin_Month as int,
           @Tier_Age_Begin_Year as int,
           @Tier_Age_End_Month as int,
           @Tier_Age_End_Year as int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
INSERT INTO [dbo].[tier]
           ([include_req]
           ,[campaign_id]
           ,[Tier_Age_Begin_Month]
           ,[Tier_Age_Begin_Year]
           ,[Tier_Age_End_Month]
           ,[Tier_Age_End_Year])
     VALUES
           (@include_req, 
            @campaign_id, 
            @Tier_Age_Begin_Month, 
            @Tier_Age_Begin_Year,
            @Tier_Age_End_Month, 
            @Tier_Age_End_Year)
 
End

GO
/****** Object:  StoredProcedure [dbo].[SP_DMCS_Insert_Tier_Req]    Script Date: 3/7/2014 5:04:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Edward Sobanski
-- Create date: 5/22/2012
-- Description:	Insert row on Tier req table
-- =============================================
CREATE PROCEDURE [dbo].[SP_DMCS_Insert_Tier_Req]
	-- Add the parameters for the stored procedure here

            @req_id as int,
            @tier_id as int
        
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

if @req_id = 0
begin
   set @req_id = null
end

if @tier_id = 0
begin
   set @tier_id = null
end

    -- Insert statements for procedure here
INSERT INTO [dbo].[tier_req]
           ([req_id]
           ,[tier_id])
     VALUES
           (@req_id,
            @tier_id)
 
End

GO
/****** Object:  StoredProcedure [dbo].[SP_DMCS_Insert_Transportation]    Script Date: 3/7/2014 5:04:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Edward Sobanski
-- Create date: 5/22/2012
-- Description:	Insert row on transportation table
-- =============================================
CREATE PROCEDURE [dbo].[SP_DMCS_Insert_Transportation]
	-- Add the parameters for the stored procedure here
             
         @transport_id as int,
         @location_from as varchar(30),
         @location_to as varchar(30),
         @no_of_passangers as int,
         @pickup_date as datetime,
         @trans_type as varchar(3),
         @Vehicle_id as int
        
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
if @transport_id = 0
begin
   set @transport_id = null
end

if @Vehicle_id = 0
begin
   set @Vehicle_id = null
end
    -- Insert statements for procedure here
INSERT INTO [dbo].[transportation]
           ([transport_id]
           ,[location_from]
           ,[location_to]
           ,[no_of_passangers]
           ,[pickup_date]
           ,[trans_type]
           ,[Vehicle_id])
     VALUES
           (@transport_id, 
           @location_from,
           @location_to, 
           @no_of_passangers, 
           @pickup_date, 
           @trans_type,
           @Vehicle_id)
 
End

GO
/****** Object:  StoredProcedure [dbo].[SP_DMCS_Insert_Vaccine]    Script Date: 3/7/2014 5:04:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Edward Sobanski
-- Create date: 5/22/2012
-- Description:	Insert row on vaccine table
-- =============================================
CREATE PROCEDURE [dbo].[SP_DMCS_Insert_Vaccine]
	-- Add the parameters for the stored procedure here
             
            @medicine_id as int,
            @Num_of_reg_doses as int,
            @vaccine_name as varchar(50)
        
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
if @medicine_id = 0
begin
   set @medicine_id = null
end

    -- Insert statements for procedure here
INSERT INTO [dbo].[vaccine]
           ([medicine_id]
           ,[Num_of_reg_doses]
           ,[vaccine_name])
     VALUES
           (@medicine_id,
            @Num_of_reg_doses, 
            @vaccine_name)
 
End

GO
/****** Object:  StoredProcedure [dbo].[SP_DMCS_Insert_Vehicle]    Script Date: 3/7/2014 5:04:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Edward Sobanski
-- Create date: 5/22/2012
-- Description:	Insert row on vehicle table
-- =============================================
CREATE PROCEDURE [dbo].[SP_DMCS_Insert_Vehicle]
	-- Add the parameters for the stored procedure here
             
            @case_id as int,
			@client_id as int,
			@vehicle_make as varchar(15),
            @vehicle_model as varchar(30),
            @vehicle_type as varchar(15),
            @vehicle_year as int,
            @vehicle_desc as varchar(50),
            @vin as varchar(17),
            @start_mileage as int,
            @first_service_date as datetime,
            @last_service_date as datetime,
            @PLATENUMBER as varchar(10),
            @FUELTYPE as char(1) = '0',
            @MPH as int = 0,
            @INSURED as char(1)
        
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

    -- Insert statements for procedure here
INSERT INTO [dbo].[vehicle]
           ([case_id]
           ,[client_id]
           ,[vehicle_make]
           ,[vehicle_model]
           ,[vehicle_type]
           ,[vehicle_year]
           ,[vehicle_desc]
           ,[vin]
           ,[start_mileage]
           ,[first_service_date]
           ,[last_service_date]
           ,[PLATENUMBER]
           ,[FUELTYPE]
           ,[MPH]
           ,[INSURED])
     VALUES
           (@case_id, 
            @client_id, 
            @vehicle_make, 
            @vehicle_model, 
            @vehicle_type, 
            @vehicle_year, 
            @vehicle_desc, 
            @vin, 
            @start_mileage,
            @first_service_date, 
            @last_service_date, 
            @PLATENUMBER, 
            @FUELTYPE, 
            @MPH, 
            @INSURED)
 
End

GO
/****** Object:  StoredProcedure [dbo].[SP_DMCS_Insert_Vendor]    Script Date: 3/7/2014 5:04:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Edward Sobanski
-- Create date: 5/22/2012
-- Description:	Insert row on vendor table
-- =============================================
CREATE PROCEDURE [dbo].[SP_DMCS_Insert_Vendor]
	-- Add the parameters for the stored procedure here
             
            @vendor_name as varchar(50),
            @phone_num as varchar(11),
            @email as varchar(50),
            @address_id as int,
            @Vendor_address2 as int,
            @vendor_job_assign as varchar(30),
            @vendor_start_date as datetime,
            @vendor_end_date as datetime,
            @vendor_meth_of_contact as char(1),
            @vendor_status as varchar(10),
            @vendor_meth_of_pay as varchar(15),
            @vendor_type as varchar(20),
            @vendor_comments as text
        
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
if @address_id = 0
begin
   set @address_id = null
end

if @Vendor_address2 = 0
begin
   set @Vendor_address2 = null
end

    -- Insert statements for procedure here
INSERT INTO [dbo].[vendor]
           ([vendor_name]
           ,[phone_num]
           ,[email]
           ,[address_id]
           ,[Vendor_address2]
           ,[vendor_job_assign]
           ,[vendor_start_date]
           ,[vendor_end_date]
           ,[vendor_meth_of_contact]
           ,[vendor_status]
           ,[vendor_meth_of_pay]
           ,[vendor_type]
           ,[vendor_comments])
     VALUES
           (@vendor_name, 
            @phone_num, 
            @email, 
            @address_id, 
            @Vendor_address2, 
            @vendor_job_assign, 
            @vendor_start_date, 
            @vendor_end_date, 
            @vendor_meth_of_contact, 
            @vendor_status, 
            @vendor_meth_of_pay, 
            @vendor_type, 
            @vendor_comments)
 
End

GO
/****** Object:  StoredProcedure [dbo].[SP_DMCS_Insert_Vendor_Product]    Script Date: 3/7/2014 5:04:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Edward Sobanski
-- Create date: 5/22/2012
-- Description:	Insert row on vendor Product table
-- =============================================
CREATE PROCEDURE [dbo].[SP_DMCS_Insert_Vendor_Product]
	-- Add the parameters for the stored procedure here
             
            @vendor_id as int,
			@product_id as int,
			@product_qty as int,
			@Product_exp_date as bit,
			@lot_id as int
        
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
if @vendor_id = 0
begin
   set @vendor_id = null
end

if @product_id = 0
begin
   set @product_id = null
end

if @lot_id = 0
begin
   set @lot_id = null
end

    -- Insert statements for procedure here
INSERT INTO [dbo].[vendor_products]
           ([vendor_id]
           ,[product_id]
           ,[product_qty]
           ,[Product_exp_date]
           ,[lot_id])
     VALUES
           (@vendor_id, 
            @product_id,
            @product_qty, 
            @Product_exp_date,
            @lot_id)
End

GO
/****** Object:  StoredProcedure [dbo].[SP_DMCS_Insert_Vendor_Product_Shipment]    Script Date: 3/7/2014 5:04:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Edward Sobanski
-- Create date: 5/22/2012
-- Description:	Insert row on vendor Product shipment table
-- =============================================
CREATE PROCEDURE [dbo].[SP_DMCS_Insert_Vendor_Product_Shipment]
	-- Add the parameters for the stored procedure here
             
            @ShipmentID as int,
            @VendorID as int,
            @ProductID as int,
            @Expect_Delivery_Date as datetime,
            @orderdate as datetime,
            @quantity as int,
            @OtherInfo as varchar(100),
            @DateReceived as datetime,
            @AmountReceived as int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
if @ShipmentID = 0
begin
   set @ShipmentID = null
end

if @VendorID = 0
begin
   set @VendorID = null
end

if @ProductID = 0
begin
   set @ProductID = null
end

    -- Insert statements for procedure here
INSERT INTO [dbo].[Vendor_Products_shipments]
           ([ShipmentID]
           ,[VendorID]
           ,[ProductID]
           ,[Expect_Delivery_Date]
           ,[orderdate]
           ,[quantity]
           ,[OtherInfo]
           ,[DateReceived]
           ,[AmountReceived])
     VALUES
           (@ShipmentID, 
            @VendorID, 
            @ProductID, 
            @Expect_Delivery_Date,
            @orderdate, 
            @quantity, 
            @OtherInfo, 
            @DateReceived, 
            @AmountReceived)
End

GO
/****** Object:  StoredProcedure [dbo].[SP_DMCS_Insert_Warehouse]    Script Date: 3/7/2014 5:04:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		Edward Sobanski
-- Create date: 5/22/2012
-- Description:	Insert row on warehouse table
-- =============================================
CREATE PROCEDURE [dbo].[SP_DMCS_Insert_Warehouse]
	-- Add the parameters for the stored procedure here
             
            @warehouse_name as varchar(50),
            @address_id as int,
            @warehouse_type as varchar(10),
			@location_ID as int
            
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
INSERT INTO [dbo].[warehouse]
           ([warehouse_name]
           ,[address_id]
           ,[warehouse_type]
		   ,[Location_ID])
     VALUES
           (@warehouse_name,
            @address_id,
            @warehouse_type,
			@location_ID)
           
End



GO
/****** Object:  StoredProcedure [dbo].[SP_DMCS_Insert_Warehouse_Products]    Script Date: 3/7/2014 5:04:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		Edward Sobanski
-- Create date: 5/22/2012
-- Description:	Insert row on warehouse products table
-- =============================================
CREATE PROCEDURE [dbo].[SP_DMCS_Insert_Warehouse_Products]
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
	@encounter_id as int,
	@address_id as int
    
            
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

if @address_id = 0
begin
   set @address_id = null
end


    -- Insert statements for procedure here            
INSERT INTO [dbo].[warehouse_product_Location]
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
		   ,[encounter_id]
		   ,[address_id])
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
		   ,@encounter_id
		   ,@address_id)        
End



GO
/****** Object:  StoredProcedure [dbo].[sp_DMCS_List_jobs]    Script Date: 3/7/2014 5:04:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Edward Sobanski
-- Create date: 8/23/2012
-- Description:	display liet of jobs
-- =============================================
CREATE PROCEDURE [dbo].[sp_DMCS_List_jobs]
	-- Add the parameters for the stored procedure here
	@Type Varchar(30),
	@Value varchar(30)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT job.job_id, job.job_posted_date, job.job_title, addr.str_add, addr.city,
	       addr.state, addr.zip_plus_four, job_category.job_category_name 
      FROM address addr 
      INNER JOIN job ON addr.address_id = job.address_id 
      INNER JOIN job_category ON job.job_cat_id = job_category.job_cat_id
   Where  @Type LIKE '%' + @Value + '%'
END

GO
/****** Object:  StoredProcedure [dbo].[sp_DMCS_LoadClientDDL]    Script Date: 3/7/2014 5:04:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Dustin Franz
-- Create date: 07/17/12
-- Description:	load client DDL
-- =============================================
CREATE PROCEDURE [dbo].[sp_DMCS_LoadClientDDL]
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	select F_name + ' ' + L_name  client, client_id from person, client
    where person.person_id = client.client_id
END

GO
/****** Object:  StoredProcedure [dbo].[sp_DMCS_LoadDonorWarehouseDDL]    Script Date: 3/7/2014 5:04:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Dustin Franz
-- Create date: 07/17/12
-- Description:	load donor warehouse DDL
-- =============================================
CREATE PROCEDURE [dbo].[sp_DMCS_LoadDonorWarehouseDDL]

	@f_name as varchar(50),
	@l_name as varchar(50)
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	select donor_id from donor, person where donor.personID =
    person.person_id and person.f_name = @f_name
    and person.l_name = @l_name
END

GO
/****** Object:  StoredProcedure [dbo].[sp_DMCS_LoadLots_DDL]    Script Date: 3/7/2014 5:04:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Edward Sobanski
-- Create date: 07/30/12
-- Description:	load lots drop down
-- =============================================
CREATE PROCEDURE [dbo].[sp_DMCS_LoadLots_DDL]
	
AS
BEGIN
	    select Lot_id,manufacture_name from Lot, products 
	    where lot.product_id = products.product_id
END

GO
/****** Object:  StoredProcedure [dbo].[sp_DMCS_LoadOrderGV]    Script Date: 3/7/2014 5:04:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Dustin Franz
-- Create date: 07/16/12
-- Description:	load order gridview
-- =============================================
CREATE PROCEDURE [dbo].[sp_DMCS_LoadOrderGV]

	@trackingNum as int
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	select prod.product_id ID, prod.product_name Prod_NM, vps.orderdate, vps.quantity,
    ven.vendor_id Ven_ID, ven.vendor_name vendor, vps.shipmentID Ship_ID
    from vendor_products_shipments vps, vendor ven, products prod, shipment ship
    where vps.productid = prod.product_id and vps.vendorID = ven.vendor_id
    and vps.shipmentid = ship.shipmentId
    and ship.tracking_num = @trackingNum
END

GO
/****** Object:  StoredProcedure [dbo].[sp_DMCS_LoadOutstandingOrdersGV]    Script Date: 3/7/2014 5:04:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Dustin Franz
-- Create date: 07/16/12
-- Description:	load Outstanding Orders grid view
-- =============================================
CREATE PROCEDURE [dbo].[sp_DMCS_LoadOutstandingOrdersGV]

	@warehouse_id as int
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	select req_o.OrderNum, OP.orderid, req_o.OrderPriority, F_name, m_initial, l_name,
    prod.Product_name, OP.Quantity, Req_o.OrderDeliveryType, op.datepicked, op.qtypicked
    from products prod,order_product OP,warehouse wh,requestor_order req_o,
    requestor req,person 
    where  prod.product_id = op.productid
    and  op.warehouseid = wh.warehouse_id and  op.orderid = req_o.orderid
    and  req_o.Requestor_ID = req.RequestorID and  req.personID = person.person_id
	and  wh.warehouse_id = @warehouse_id and req_o.OrderPickUpDate is null
END

GO
/****** Object:  StoredProcedure [dbo].[sp_DMCS_LoadPersonDonorDDL]    Script Date: 3/7/2014 5:04:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Dustin Franz
-- Create date: 07/17/12
-- Description:	load person donor DDL
-- =============================================
CREATE PROCEDURE [dbo].[sp_DMCS_LoadPersonDonorDDL]

	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	select f_name + ' ' + L_name d_name, donor.donor_id from person, donor
    where donor.personid = person.person_id
END

GO
/****** Object:  StoredProcedure [dbo].[sp_DMCS_LoadProductOrderGV]    Script Date: 3/7/2014 5:04:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Dustin Franz
-- Create date: 07/16/12
-- Description:	load Product Orders gridview
-- =============================================
CREATE PROCEDURE [dbo].[sp_DMCS_LoadProductOrderGV]

	@order_num as int
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	select prod.product_id prod_id, prod.product_Name prod_NM,
	prod.product_desc prod_desc, op.quantity qty, op.warehouseid WH_ID,
	wh.warehouse_name WH_NM
	from order_product op, products prod, requestor_order ro, warehouse wh
	where op.orderID = ro.orderid and op.productId = prod.product_id
	and op.warehouseid = wh.warehouse_id and ro.ordernum = @order_num
END

GO
/****** Object:  StoredProcedure [dbo].[sp_DMCS_LoadProductsDDL]    Script Date: 3/7/2014 5:04:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Dustin Franz
-- Create date: 07/17/12
-- Description:	load products DDL
-- =============================================
CREATE PROCEDURE [dbo].[sp_DMCS_LoadProductsDDL]

	@warehouse_id as int
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	select prod.Product_id, prod.Product_name from products prod, warehouse_products wp,
    warehouse wh where prod.product_id = wp.product_id and
    wh.warehouse_id = wp.warehouse_id and wh.warehouse_id = @warehouse_id
END

GO
/****** Object:  StoredProcedure [dbo].[sp_DMCS_LoadRecDonor]    Script Date: 3/7/2014 5:04:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Dustin Franz
-- Create date: 07/30/12
-- Description:	load receieve donor
-- =============================================
CREATE PROCEDURE [dbo].[sp_DMCS_LoadRecDonor]

	@f_name as varchar(50),
	@l_name as varchar(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	select donor_id from donor, person 
	where donor.personID = person.person_id and person.f_name = @f_name 
	and person.l_name = @l_name
END

GO
/****** Object:  StoredProcedure [dbo].[sp_DMCS_LoadReqVendorProdDDL]    Script Date: 3/7/2014 5:04:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Dustin Franz
-- Create date: 07/30/12
-- Description:	Load Request Vendor Prod DDL
-- =============================================
CREATE PROCEDURE [dbo].[sp_DMCS_LoadReqVendorProdDDL]

	@vendorName as varchar(50)
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	select prod.Product_name Prod_NM, prod.Product_type Type, prod.product_qty Qty,
    prod.Product_desc Prod_Desc, prod.Product_color color, 
    prod.product_size size, prod.Product_cost cost, ven.Email
    from vendor_products vp, products prod, vendor ven
    where vp.product_id = prod.product_id
    and vp.vendor_id = ven.vendor_id
    and ven.vendor_name = @vendorName
END

GO
/****** Object:  StoredProcedure [dbo].[sp_DMCS_loadVendorOrdersGV]    Script Date: 3/7/2014 5:04:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Dustin Franz
-- Create date: 07/16/12
-- Description:	load Vendor Orders gridview
-- =============================================
CREATE PROCEDURE [dbo].[sp_DMCS_loadVendorOrdersGV]

	@warehouse_id as int
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	select op.OrderID, op.ProductID, prod.Product_name, op.quantity, ven.Vendor_name
	from Order_Product op, products prod, vendor_products vp, vendor ven
	where op.ProductID = prod.product_id and vp.product_id = prod.product_id
	and vp.vendor_id = ven.vendor_id and op.warehouseid = @warehouse_id
END

GO
/****** Object:  StoredProcedure [dbo].[sp_DMCS_LoadVendorProdRecGV]    Script Date: 3/7/2014 5:04:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Dustin Franz
-- Create date: 07/16/12
-- Description:	load VendorProdRec gridview
-- =============================================
CREATE PROCEDURE [dbo].[sp_DMCS_LoadVendorProdRecGV]

	@vendorName as varchar(50)
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	select ven.vendor_name Ven_NM, vps.PO_Order_NO Ord_Num, vps.Quantity Qty,
    vps.Otherinfo info, vps.Expect_delivery_date deliv_DT, prod.Product_id Prod_ID, prod.product_name Prod_NM,
    war.warehouse_id WH_ID, war.warehouse_name WH_NM, ship.shipmentid ShipID
    from Vendor_Products_shipments vps, products prod, vendor ven,
    Shipment ship, warehouse war where vps.productid = prod.product_id
    and ship.warehouseid = war.warehouse_id
    and vps.vendorid = ven.vendor_id and vps.shipmentid = ship.shipmentid
    and ven.vendor_name = @vendorName and DateReceived is null
END

GO
/****** Object:  StoredProcedure [dbo].[sp_DMCS_LoadWarehouseAddressDDL]    Script Date: 3/7/2014 5:04:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Dustin Franz
-- Create date: 07/17/12
-- Description:	load warehouse address DDL
-- =============================================
CREATE PROCEDURE [dbo].[sp_DMCS_LoadWarehouseAddressDDL]

	@warehouse_name as varchar(50)
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	select addr.Str_add,  addr.Str_add2, addr.city, addr.state, addr.zip_plus_four
    from warehouse wh, address addr
    where wh.warehouse_name = @warehouse_name
    and wh.address_Id = addr.address_Id
END

GO
/****** Object:  StoredProcedure [dbo].[sp_DMCS_LoadWarehouseReport]    Script Date: 3/7/2014 5:04:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Dustin Franz
-- Create date: 8/9/12
-- Description:	load warehouse reports
-- =============================================
CREATE PROCEDURE [dbo].[sp_DMCS_LoadWarehouseReport]
 
	-- Add the parameters for the stored procedure here
	@warehouse_id as int,
	@type as varchar(5)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
if @type = 'inv'
select products.product_name, warehouse_products.Experiation_Date
from warehouse, warehouse_products, products
where
warehouse_products.Experiation_Date >= Convert(Date, GetDate(), 101) and
warehouse_products.product_id = products.product_id and 
warehouse_products.warehouse_id = warehouse.warehouse_id and
warehouse.warehouse_id = @warehouse_id;

if @type = 'exp'
select products.product_name, warehouse_products.Experiation_Date
from warehouse, warehouse_products, products
where
warehouse_products.Experiation_Date < Convert(Date, GetDate(), 101) and
warehouse_products.product_id = products.product_id and 
warehouse_products.warehouse_id = warehouse.warehouse_id and
warehouse.warehouse_id = @warehouse_id;

if @type = 'prod'
select products.product_name, products.product_type, products.product_qty
from warehouse, warehouse_products, products
where
warehouse_products.product_id = products.product_id and 
warehouse_products.warehouse_id = warehouse.warehouse_id and
warehouse.warehouse_id = @warehouse_id;

if @type = 'prior'
select requestor.Requestor_Type, requestor_Order.OrderPriority
from  warehouse, warehouse_products, products, requestor_Order, requestor, Order_Product
where
requestor_Order.Requestor_ID = requestor.RequestorID and
requestor_Order.OrderID = Order_Product.orderID and
Order_Product.ProductID = products.product_id and
warehouse_products.product_id = products.product_id and 
warehouse_products.warehouse_id = warehouse.warehouse_id and
warehouse.warehouse_id = @warehouse_id
order by requestor_Order.OrderPriority;

if @type = 'outs'
select products.product_name, Vendor_Products_shipments.Expect_Delivery_Date, Vendor_Products_shipments.quantity,Shipment.Tracking_Num, Vendor_Products_shipments.OtherInfo
from warehouse, warehouse_products, products, Vendor_Products_shipments, Shipment
where 
Shipment.FullOrderReceived = 'n' and
Vendor_Products_shipments.ShipmentID = Shipment.ShipmentID and
Vendor_Products_shipments.ProductID = products.product_id and
warehouse_products.product_id = products.product_id and 
warehouse_products.warehouse_id = warehouse.warehouse_id and
warehouse.warehouse_id = @warehouse_id;

if @type = 'food'
select products.product_name, food.date_issued, products.product_qty
from warehouse, warehouse_products, products, food
where
food.Product_id = products.product_id and
warehouse_products.product_id = products.product_id and 
warehouse_products.warehouse_id = warehouse.warehouse_id and
warehouse.warehouse_id = @warehouse_id;

if @type = 'vacc'
select vaccine.vaccine_name, vaccine.Num_of_reg_doses
from warehouse, warehouse_products,products,medicine,vaccine
where
medicine.Medicine_Id = vaccine.vaccine_id and
products.product_id = medicine.Medicine_Id and
warehouse_products.product_id = products.product_id and 
warehouse_products.warehouse_id = warehouse.warehouse_id and
warehouse.warehouse_id = @warehouse_id;

if @type = 'vend'
select products.product_name, vendor.vendor_name, vendor_products.product_qty, vendor_products.Product_exp_date
from warehouse, warehouse_products, products, vendor_products, vendor
where
vendor_products.vendor_id = vendor.vendor_id and
products.product_id = vendor_products.product_id and
warehouse_products.product_id = products.product_id and 
warehouse_products.warehouse_id = warehouse.warehouse_id and
warehouse.warehouse_id = @warehouse_id;
END

GO
/****** Object:  StoredProcedure [dbo].[SP_DMCS_Location_CallCenter]    Script Date: 3/7/2014 5:04:02 PM ******/
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
/****** Object:  StoredProcedure [dbo].[SP_DMCS_Location_Person]    Script Date: 3/7/2014 5:04:02 PM ******/
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
/****** Object:  StoredProcedure [dbo].[SP_DMCS_Location_Person_Mobileunit]    Script Date: 3/7/2014 5:04:02 PM ******/
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
/****** Object:  StoredProcedure [dbo].[SP_DMCS_Location_Person_Mobileunit_Non_XML]    Script Date: 3/7/2014 5:04:02 PM ******/
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
/****** Object:  StoredProcedure [dbo].[SP_DMCS_Location_Pet]    Script Date: 3/7/2014 5:04:02 PM ******/
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
/****** Object:  StoredProcedure [dbo].[SP_DMCS_Location_Resources_In_Warehouse]    Script Date: 3/7/2014 5:04:02 PM ******/
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
/****** Object:  StoredProcedure [dbo].[SP_DMCS_Location_Resources_In_Warehouse_Non_FEMA]    Script Date: 3/7/2014 5:04:02 PM ******/
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
/****** Object:  StoredProcedure [dbo].[SP_DMCS_Location_Resources_Not_In_Warehouse]    Script Date: 3/7/2014 5:04:02 PM ******/
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
/****** Object:  StoredProcedure [dbo].[SP_DMCS_Location_Resources_Warehouse]    Script Date: 3/7/2014 5:04:02 PM ******/
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
/****** Object:  StoredProcedure [dbo].[SP_DMCS_Location_Resources_Warehouse_Inventory]    Script Date: 3/7/2014 5:04:02 PM ******/
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
/****** Object:  StoredProcedure [dbo].[SP_DMCS_Location_Warehouse]    Script Date: 3/7/2014 5:04:02 PM ******/
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
/****** Object:  StoredProcedure [dbo].[SP_DMCS_Location_Warehouse_XML]    Script Date: 3/7/2014 5:04:02 PM ******/
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
/****** Object:  StoredProcedure [dbo].[SP_DMCS_Location_Warehouse2]    Script Date: 3/7/2014 5:04:02 PM ******/
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
/****** Object:  StoredProcedure [dbo].[sp_DMCS_ProductSearch]    Script Date: 3/7/2014 5:04:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Dustin Franz
-- Create date: 07/18/12
-- Description:	Product Search
-- =============================================
CREATE PROCEDURE [dbo].[sp_DMCS_ProductSearch]

	@prod_name as varchar(50),
	@warehouse_name as varchar(50)	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	select prod.Product_ID ID, prod.Product_Desc Descrip,
   prod.Product_Size Size, prod.Product_Color Color, wp.product_Qty Quantity
   from Warehouse_Products wp, Products prod, Warehouse wh 
   where wp.product_id = prod.product_id and
   wp.warehouse_id = wh.warehouse_id and 
   prod.product_name = @prod_name and
   wh.WareHouse_Name = @warehouse_name
END

GO
/****** Object:  StoredProcedure [dbo].[SP_DMCS_Select_Account]    Script Date: 3/7/2014 5:04:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Joseph Hemphill
-- Create date: 2/26/2013
-- Description:	Select row on Account table
-- =============================================
CREATE PROCEDURE [dbo].[SP_DMCS_Select_Account]
	-- Add the parameters for the stored procedure here
           
           @Account_ID as int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
SELECT [Account_ID]
      ,[Bank_ID]
      ,[Account_Num]
      ,[Type]
  FROM [dbo].[Account]
  WHERE Account_ID = @Account_ID
  
 END

GO
/****** Object:  StoredProcedure [dbo].[SP_DMCS_Select_Address]    Script Date: 3/7/2014 5:04:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Edward Sobanski
-- Create date: 5/21/2012
-- Description:	select Row from address table
-- =============================================
CREATE PROCEDURE [dbo].[SP_DMCS_Select_Address]
	-- Add the parameters for the stored procedure here
	  @address_id as int

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT [address_id]
      ,[address_type_id]
      ,[city]
      ,[country]
      ,[County_Township]
      ,[longitude]
      ,[latitude]
      ,[state]
      ,[str_add]
      ,[str_add2]
      ,[zip_plus_four]
    FROM [dbo].[address]
    WHERE address_id = @address_id
END

GO
/****** Object:  StoredProcedure [dbo].[SP_DMCS_Select_Address_WC]    Script Date: 3/7/2014 5:04:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Edward Sobanski
-- Create date: 5/21/2012
-- Description:	select Row from address table
-- =============================================
CREATE PROCEDURE [dbo].[SP_DMCS_Select_Address_WC]
	-- Add the parameters for the stored procedure here
	  @wareclause as char(100)

AS
BEGIN
												    
    Declare @string as varchar(300)
	Set @string = 'Select * from Address where ' + @wareclause
	Exec(@string)
END

GO
/****** Object:  StoredProcedure [dbo].[SP_DMCS_Select_Agency]    Script Date: 3/7/2014 5:04:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Edward Sobanski
-- Create date: 5/21/2012
-- Description:	select Row from agency table
-- =============================================
CREATE PROCEDURE [dbo].[SP_DMCS_Select_Agency]
	-- Add the parameters for the stored procedure here
	  @agency_id as int

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT [agency_id]
          ,[address_id]
          ,[agency_name]
          ,[primary_fName]
          ,[primary_lName]
          ,[primary_phone]
          ,[sec_fName]
          ,[sec_lName]
          ,[sec_phone]
    FROM [dbo].[agency]
    WHERE agency_id = @agency_id
END

GO
/****** Object:  StoredProcedure [dbo].[SP_DMCS_Select_Agency_By_Address_ID]    Script Date: 3/7/2014 5:04:02 PM ******/
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
/****** Object:  StoredProcedure [dbo].[SP_DMCS_Select_Agency_employee]    Script Date: 3/7/2014 5:04:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Edward Sobanski
-- Create date: 5/21/2012
-- Description:	select Row from agency_Employee table
-- =============================================
create PROCEDURE [dbo].[SP_DMCS_Select_Agency_employee]
	-- Add the parameters for the stored procedure here
      @agency_empl_id as int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
SELECT [agency_empl_id]
      ,[agency_id]
      ,[employee_id]
  FROM [dbo].[agency_employees]
 WHERE agency_empl_id = @agency_empl_id
END

GO
/****** Object:  StoredProcedure [dbo].[SP_DMCS_Select_Agency_employee_WC]    Script Date: 3/7/2014 5:04:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Edward Sobanski
-- Create date: 5/21/2012
-- Description:	select Row from agency_Employee table
-- =============================================
create PROCEDURE [dbo].[SP_DMCS_Select_Agency_employee_WC]
	-- Add the parameters for the stored procedure here
      @wareclause as char(100)
AS
BEGIN
											    
    Declare @string as varchar(300)
	Set @string = 'Select * from Agency_employee where ' + @wareclause
	Exec(@string)
 
END

GO
/****** Object:  StoredProcedure [dbo].[SP_DMCS_Select_Agency_WC]    Script Date: 3/7/2014 5:04:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Edward Sobanski
-- Create date: 5/21/2012
-- Description:	select Row from agency table
-- =============================================
CREATE PROCEDURE [dbo].[SP_DMCS_Select_Agency_WC]
	-- Add the parameters for the stored procedure here
	 @wareclause as char(100)
AS
BEGIN
											    
    Declare @string as varchar(300)
	Set @string = 'Select * from Agency where ' + @wareclause
	Exec(@string)
 
END

GO
/****** Object:  StoredProcedure [dbo].[SP_DMCS_Select_Bank]    Script Date: 3/7/2014 5:04:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Jon Kamphuis
-- Create date: 2/26/2013
-- Description:	Select row on Bank table
-- =============================================
CREATE PROCEDURE [dbo].[SP_DMCS_Select_Bank]
	-- Add the parameters for the stored procedure here
           
           @Bank_ID as int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
SELECT [Bank_ID]
      ,[Name]
      ,[IsFDIC]
  FROM [dbo].[bank]
  WHERE Bank_ID = @Bank_ID
  
 END

GO
/****** Object:  StoredProcedure [dbo].[SP_DMCS_Select_Call_Center]    Script Date: 3/7/2014 5:04:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Edward Sobanski
-- Create date: 5/21/2012
-- Description:	select Row from Call Center table
-- =============================================
CREATE PROCEDURE [dbo].[SP_DMCS_Select_Call_Center]
	-- Add the parameters for the stored procedure here
      @call_center_id as int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
SELECT [call_center_id]
      ,[address_id]
      ,[call_center_name]
  FROM [dbo].[call_center]
 WHERE call_center_id = @call_center_id
END

GO
/****** Object:  StoredProcedure [dbo].[SP_DMCS_Select_Call_Center_Employee]    Script Date: 3/7/2014 5:04:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Edward Sobanski
-- Create date: 5/21/2012
-- Description:	Select Row from Call Center Employee table
-- =============================================
create PROCEDURE [dbo].[SP_DMCS_Select_Call_Center_Employee]
	-- Add the parameters for the stored procedure here
      @call_center_employee_id as int
      
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
SELECT [call_center_employee_id]
      ,[call_center_id]
      ,[employee_id]
  FROM [dbo].[call_center_employee]
 WHERE call_center_employee_id = @call_center_employee_id

 End

GO
/****** Object:  StoredProcedure [dbo].[SP_DMCS_Select_Call_Center_Employee_WC]    Script Date: 3/7/2014 5:04:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Edward Sobanski
-- Create date: 5/21/2012
-- Description:	Select Row from Call Center Employee table
-- =============================================
create PROCEDURE [dbo].[SP_DMCS_Select_Call_Center_Employee_WC]
	-- Add the parameters for the stored procedure here
      @wareclause as char(100)
      
AS
BEGIN
										    
    Declare @string as varchar(300)
	Set @string = 'Select * from Call_Center_Employee where ' + @wareclause
	Exec(@string)
 

 End

GO
/****** Object:  StoredProcedure [dbo].[SP_DMCS_Select_Call_Center_WC]    Script Date: 3/7/2014 5:04:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Edward Sobanski
-- Create date: 5/21/2012
-- Description:	select Row from Call Center table
-- =============================================
CREATE PROCEDURE [dbo].[SP_DMCS_Select_Call_Center_WC]
	-- Add the parameters for the stored procedure here
      @wareclause as char(100)
AS
BEGIN
										    
    Declare @string as varchar(300)
	Set @string = 'Select * from Call_Center where ' + @wareclause
	Exec(@string)
 
END

GO
/****** Object:  StoredProcedure [dbo].[SP_DMCS_Select_Campaign]    Script Date: 3/7/2014 5:04:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Edward Sobanski
-- Create date: 5/21/2012
-- Description:	Select Row from Campaign table
-- =============================================
create PROCEDURE [dbo].[SP_DMCS_Select_Campaign]
	-- Add the parameters for the stored procedure here
      @campaign_id as int
      
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
SELECT [campaign_id]
      ,[campaign_name]
      ,[campaign_start_date]
      ,[campaign_end_date]
      ,[medicine_id]
  FROM [dbo].[campaign]
 WHERE campaign_id = @campaign_id

 End

GO
/****** Object:  StoredProcedure [dbo].[SP_DMCS_Select_Campaign_WC]    Script Date: 3/7/2014 5:04:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Edward Sobanski
-- Create date: 5/21/2012
-- Description:	Select Row from Campaign table
-- =============================================
create PROCEDURE [dbo].[SP_DMCS_Select_Campaign_WC]
	-- Add the parameters for the stored procedure here
      @wareclause as char(100)
      
AS
BEGIN
										    
    Declare @string as varchar(300)
	Set @string = 'Select * from Campaign where ' + @wareclause
	Exec(@string)
 
 End

GO
/****** Object:  StoredProcedure [dbo].[SP_DMCS_Select_Case_Client]    Script Date: 3/7/2014 5:04:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Edward Sobanski
-- Create date: 5/21/2012
-- Description:	Select Row from Case Client table
-- =============================================
CREATE PROCEDURE [dbo].[SP_DMCS_Select_Case_Client]
	-- Add the parameters for the stored procedure here
      @case_id as int,
      @client_id as int
      
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
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
      ,[utilities_incl]
      ,[related_ll]
      ,[relation_to_ll]
      ,[mtg_amt_owed_today]
      ,[utilities_list]
      ,[water_amt_owed_today]
      ,[public_asst_app_date]
      ,[util_allot_app_date]
      ,[util_allot_amt]
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
      ,[client_issue_desc]
      ,[client_issue_resolved]
      ,[client_issue_comments]
  FROM [dbo].[case_client]
 WHERE case_id = @case_id and client_id = @client_id

 End

GO
/****** Object:  StoredProcedure [dbo].[SP_DMCS_Select_Case_Client_WC]    Script Date: 3/7/2014 5:04:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Edward Sobanski
-- Create date: 5/21/2012
-- Description:	Select Row from Case Client table
-- =============================================
CREATE PROCEDURE [dbo].[SP_DMCS_Select_Case_Client_WC]
	-- Add the parameters for the stored procedure here
     @wareclause as char(100)
      
AS
BEGIN
								    
    Declare @string as varchar(300)
	Set @string = 'Select * from Case_Client where ' + @wareclause
	Exec(@string)
 
  

 End

GO
/****** Object:  StoredProcedure [dbo].[SP_DMCS_Select_Case_intake]    Script Date: 3/7/2014 5:04:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Edward Sobanski
-- Create date: 5/21/2012
-- Description:	Select Row from Case intake table
-- =============================================
create PROCEDURE [dbo].[SP_DMCS_Select_Case_intake]
	-- Add the parameters for the stored procedure here
      @case_id as int
      
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
SELECT [case_id]
      ,[applic_end_date_time]
      ,[applic_start_date_time]
      ,[circum_emergency_event]
      ,[circum_help_request_memo]
      ,[circum_income_stolen]
      ,[circum_memo]
      ,[circum_no_income]
      ,[circum_not_enough_income]
      ,[agency_id]
      ,[call_center_id]
  FROM [dbo].[case_intake]
 WHERE case_id = @case_id 

 End

GO
/****** Object:  StoredProcedure [dbo].[SP_DMCS_Select_Case_intake_WC]    Script Date: 3/7/2014 5:04:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Edward Sobanski
-- Create date: 5/21/2012
-- Description:	Select Row from Case intake table
-- =============================================
create PROCEDURE [dbo].[SP_DMCS_Select_Case_intake_WC]
	-- Add the parameters for the stored procedure here
      @wareclause as char(100)
      
AS
BEGIN
									    
    Declare @string as varchar(300)
	Set @string = 'Select * from Case_intake where ' + @wareclause
	Exec(@string)
 
  
 End

GO
/****** Object:  StoredProcedure [dbo].[SP_DMCS_Select_Client]    Script Date: 3/7/2014 5:04:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Edward Sobanski
-- Create date: 5/21/2012
-- Description:	Select Row from Client table
-- =============================================
CREATE PROCEDURE [dbo].[SP_DMCS_Select_Client]
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
/****** Object:  StoredProcedure [dbo].[SP_DMCS_Select_Client_WC]    Script Date: 3/7/2014 5:04:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Edward Sobanski
-- Create date: 5/21/2012
-- Description:	Select Row from Client table
-- =============================================
CREATE PROCEDURE [dbo].[SP_DMCS_Select_Client_WC]
	-- Add the parameters for the stored procedure here
     
            @wareclause as char(100)
      
AS
BEGIN
								    
    Declare @string as varchar(300)
	Set @string = 'Select * from Client where ' + @wareclause
	Exec(@string)
 
  
  
End


GO
/****** Object:  StoredProcedure [dbo].[SP_DMCS_Select_ClientWPets]    Script Date: 3/7/2014 5:04:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO





-- =============================================
-- Author:		Jianwang Xing
-- Create date: 4/22/2013
-- Description:	select Row from ClientWPets table
-- =============================================
CREATE PROCEDURE [dbo].[SP_DMCS_Select_ClientWPets]
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
/****** Object:  StoredProcedure [dbo].[SP_DMCS_Select_ClientWPets_WC]    Script Date: 3/7/2014 5:04:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Edward Sobanski
-- Create date: 5/21/2012
-- Description:	select Row from ClientWPets table
-- =============================================
CREATE PROCEDURE [dbo].[SP_DMCS_Select_ClientWPets_WC]
	-- Add the parameters for the stored procedure here
	 @wareclause as char(100)
AS
BEGIN
											    
    Declare @string as varchar(300)
	Set @string = 'Select * from ClientWPets where ' + @wareclause
	Exec(@string)
 
END


GO
/****** Object:  StoredProcedure [dbo].[SP_DMCS_Select_Debt]    Script Date: 3/7/2014 5:04:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Edward Sobanski
-- Create date: 5/21/2012
-- Description:	Select Row from debt table
-- =============================================
create PROCEDURE [dbo].[SP_DMCS_Select_Debt]
	-- Add the parameters for the stored procedure here
     
            @debt_id as int
      
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
SELECT [debt_id]
      ,[amt_paid]
      ,[case_id]
      ,[client_id]
      ,[creditor_name]
      ,[debt_amt]
      ,[item_purchased]
      ,[last_payment_date]
      ,[purchase_date]
      ,[value_amt]
  FROM [dbo].[debt]
  where debt_id = @debt_id
  
End

GO
/****** Object:  StoredProcedure [dbo].[SP_DMCS_Select_Debt_WC]    Script Date: 3/7/2014 5:04:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Edward Sobanski
-- Create date: 5/21/2012
-- Description:	Select Row from debt table
-- =============================================
create PROCEDURE [dbo].[SP_DMCS_Select_Debt_WC]
	-- Add the parameters for the stored procedure here
     
            @wareclause as char(100)
      
AS
BEGIN
									    
    Declare @string as varchar(300)
	Set @string = 'Select * from Debt where ' + @wareclause
	Exec(@string)
 
  
  
End

GO
/****** Object:  StoredProcedure [dbo].[SP_DMCS_Select_Deceased]    Script Date: 3/7/2014 5:04:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Edward Sobanski
-- Create date: 5/21/2012
-- Description:	Select Row on deceased table
-- =============================================
create PROCEDURE [dbo].[SP_DMCS_Select_Deceased]
	-- Add the parameters for the stored procedure here
     
           @deceased_id as int
                
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
SELECT [deceased_id]
      ,[coroner_id]
      ,[date_of_autopsy]
      ,[external_exam]
      ,[identifying_marks]
      ,[internal_exam]
      ,[reason_of_death]
      ,[time_of_death]
  FROM [dbo].[deceased]
 WHERE deceased_id = @deceased_id
  
End

GO
/****** Object:  StoredProcedure [dbo].[SP_DMCS_Select_Deceased_WC]    Script Date: 3/7/2014 5:04:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Edward Sobanski
-- Create date: 5/21/2012
-- Description:	Select Row on deceased table
-- =============================================
create PROCEDURE [dbo].[SP_DMCS_Select_Deceased_WC]
	-- Add the parameters for the stored procedure here
     
           @wareclause as char(100)
                
AS
BEGIN
								    
    Declare @string as varchar(300)
	Set @string = 'Select * from Deceased where ' + @wareclause
	Exec(@string)
 
  
End

GO
/****** Object:  StoredProcedure [dbo].[SP_DMCS_Select_Disaster]    Script Date: 3/7/2014 5:04:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Edward Sobanski
-- Create date: 5/21/2012
-- Description:	Select Row on disaster table
-- =============================================
create PROCEDURE [dbo].[SP_DMCS_Select_Disaster]
	-- Add the parameters for the stored procedure here
     
           @disaster_id as int
                
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
SELECT [disaster_id]
      ,[disaster_name]
      ,[disaster_type]
      ,[disaster_start_date]
      ,[disaster_end_date]
      ,[disaster_north_latitude]
      ,[disaster_north_longitude]
      ,[disaster_south_latitude]
      ,[disaster_south_longitude]
      ,[disaster_east_latitude]
      ,[disaster_east_longitude]
      ,[disaster_west_latitude]
      ,[disaster_west_longitude]
  FROM [dbo].[disaster]
 WHERE disaster_id = @disaster_id
  
End

GO
/****** Object:  StoredProcedure [dbo].[SP_DMCS_Select_Disaster_Encounter]    Script Date: 3/7/2014 5:04:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Edward Sobanski
-- Create date: 5/21/2012
-- Description:	Select Row on disaster encounter table
-- =============================================
create PROCEDURE [dbo].[SP_DMCS_Select_Disaster_Encounter]
	-- Add the parameters for the stored procedure here
       @disaster_encounter_id as int 
       
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
SELECT [disaster_encounter_id]
      ,[disaster_id]
      ,[encounter_id]
      ,[address_id]
  FROM [dbo].[disaster_encounter]
 WHERE disaster_encounter_id = @disaster_encounter_id
  
End

GO
/****** Object:  StoredProcedure [dbo].[SP_DMCS_Select_Disaster_Encounter_WC]    Script Date: 3/7/2014 5:04:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Edward Sobanski
-- Create date: 5/21/2012
-- Description:	Select Row on disaster encounter table
-- =============================================
create PROCEDURE [dbo].[SP_DMCS_Select_Disaster_Encounter_WC]
	-- Add the parameters for the stored procedure here
       @wareclause as char(100) 
       
AS
BEGIN
									    
    Declare @string as varchar(300)
	Set @string = 'Select * from Disaster_Encounter where ' + @wareclause
	Exec(@string)
 
  
End

GO
/****** Object:  StoredProcedure [dbo].[SP_DMCS_Select_Disaster_WC]    Script Date: 3/7/2014 5:04:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Edward Sobanski
-- Create date: 5/21/2012
-- Description:	Select Row on disaster table
-- =============================================
create PROCEDURE [dbo].[SP_DMCS_Select_Disaster_WC]
	-- Add the parameters for the stored procedure here
     
          @wareclause as char(100)
                
AS
BEGIN
									    
    Declare @string as varchar(300)
	Set @string = 'Select * from Disaster where ' + @wareclause
	Exec(@string)
 
  
End

GO
/****** Object:  StoredProcedure [dbo].[SP_DMCS_Select_Donation]    Script Date: 3/7/2014 5:04:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Mohammed Mohammed
-- Create date: 2/26/2013
-- Description:	Select row on Donation table
-- =============================================
CREATE PROCEDURE [dbo].[SP_DMCS_Select_Donation]
	-- Add the parameters for the stored procedure here
           
           @Donation_ID as int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Select statements for procedure here
SELECT [Donation_ID]
      ,[Receipt_ID]
      ,[Resource_ID]
      ,[Donor_ID]
      ,[Date]
      ,[Quantity]
      ,[Agency_ID]
      ,[Is_Monetary]
      ,[Is_FEMA]
  FROM [dbo].[donation]
  WHERE Donation_ID = @Donation_ID
  
 END

GO
/****** Object:  StoredProcedure [dbo].[SP_DMCS_Select_Doner_Product]    Script Date: 3/7/2014 5:04:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Edward Sobanski
-- Create date: 5/21/2012
-- Description:	Select Row on doner Product table
-- =============================================
create PROCEDURE [dbo].[SP_DMCS_Select_Doner_Product]
	-- Add the parameters for the stored procedure here
        @DonorProductID as int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
SELECT [DonorProductID]
      ,[DonorID]
      ,[ProductID]
      ,[quantity]
      ,[other_info]
      ,[Product_rec_date]
      ,[AmountOfProdDonated]
  FROM [dbo].[Donor_Product]
 WHERE DonorProductID = @DonorProductID
 
End

GO
/****** Object:  StoredProcedure [dbo].[SP_DMCS_Select_Donoer_Product_WC]    Script Date: 3/7/2014 5:04:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Edward Sobanski
-- Create date: 5/21/2012
-- Description:	Select Row on doner Product table
-- =============================================
create PROCEDURE [dbo].[SP_DMCS_Select_Donoer_Product_WC]
	-- Add the parameters for the stored procedure here
       @wareclause as char(100)
AS
BEGIN
								    
    Declare @string as varchar(300)
	Set @string = 'Select * from Doner_Product where ' + @wareclause
	Exec(@string)
 
End

GO
/****** Object:  StoredProcedure [dbo].[SP_DMCS_Select_Donor]    Script Date: 3/7/2014 5:04:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Edward Sobanski
-- Create date: 5/21/2012
-- Description:	Select Row on doner table
-- =============================================
create PROCEDURE [dbo].[SP_DMCS_Select_Donor]
	-- Add the parameters for the stored procedure here
       @donor_id as int 
       
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
SELECT [donor_id]
      ,[PersonID]
      ,[Status]
      ,[DonorType]
      ,[AgencyID]
      ,[Phone]
  FROM [dbo].[Donor]
 WHERE donor_id = @donor_id
  
End

GO
/****** Object:  StoredProcedure [dbo].[SP_DMCS_Select_Donor_WC]    Script Date: 3/7/2014 5:04:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Edward Sobanski
-- Create date: 5/21/2012
-- Description:	Select Row on doner table
-- =============================================
CREATE PROCEDURE [dbo].[SP_DMCS_Select_Donor_WC]
	-- Add the parameters for the stored procedure here
       @wareclause as char(100) 
       
AS
BEGIN
								    
    Declare @string as varchar(300)
	Set @string = 'Select * from Donor where ' + @wareclause
	Exec(@string)
  
End

GO
/****** Object:  StoredProcedure [dbo].[SP_DMCS_Select_Emergency_Medical]    Script Date: 3/7/2014 5:04:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Edward Sobanski
-- Create date: 5/21/2012
-- Description:	Select Row on Emergency medical table
-- =============================================
create PROCEDURE [dbo].[SP_DMCS_Select_Emergency_Medical]
	-- Add the parameters for the stored procedure here
        @em_id as int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
SELECT [em_id]
      ,[client_id]
      ,[ambulance_company_name]
      ,[ambulance_identification]
      ,[appointment_date]
      ,[area_of_specialty]
      ,[assistance_order]
      ,[date_of_service]
      ,[degree_certifications]
      ,[doctor_appointments]
      ,[doctor_id]
      ,[doctor_start_date]
      ,[driver_id]
      ,[educational_institution_name]
      ,[external_examination]
      ,[hospital_name]
      ,[internal_examination]
      ,[lights_sirens_to_scene]
      ,[location_type]
      ,[number_of_days_admitted]
      ,[office_location]
      ,[other_remarks]
      ,[prescription_medicines]
      ,[time_of_service]
      ,[total_cost]
      ,[deceased_id]
  FROM [dbo].[emergency_medical]
 WHERE em_id = @em_id
 
End

GO
/****** Object:  StoredProcedure [dbo].[SP_DMCS_Select_Emergency_Medical_WC]    Script Date: 3/7/2014 5:04:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Edward Sobanski
-- Create date: 5/21/2012
-- Description:	Select Row on Emergency medical table
-- =============================================
create PROCEDURE [dbo].[SP_DMCS_Select_Emergency_Medical_WC]
	-- Add the parameters for the stored procedure here
        @wareclause as char(100)
AS
BEGIN
								    
    Declare @string as varchar(300)
	Set @string = 'Select * from Emergency_Medical where ' + @wareclause
	Exec(@string)
 
End

GO
/****** Object:  StoredProcedure [dbo].[SP_DMCS_Select_Employee]    Script Date: 3/7/2014 5:04:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Edward Sobanski
-- Create date: 5/21/2012
-- Description:	Select Row on Employee table
-- =============================================
CREATE PROCEDURE [dbo].[SP_DMCS_Select_Employee]
	-- Add the parameters for the stored procedure here
     
        @employee_id as int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
SELECT [employee_id]
      ,[employee_date_hired]
      ,[employee_department]
      ,[employee_hours_worked]
      ,[employee_leadership]
      ,[employee_motivation]
      ,[employee_notes]
      ,[employee_overall]
      ,[employee_payrate]
      ,[employee_performance]
      ,[employee_quality]
      ,[employee_timeliness]
      ,[username]
      ,[pswd]
  FROM [dbo].[employee]
 WHERE employee_id = @employee_id
 
End

GO
/****** Object:  StoredProcedure [dbo].[SP_DMCS_Select_Employee_Clients]    Script Date: 3/7/2014 5:04:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Edward Sobanski
-- Create date: 5/21/2012
-- Description:	Select Row on Employee clients table
-- =============================================
CREATE PROCEDURE [dbo].[SP_DMCS_Select_Employee_Clients]
	-- Add the parameters for the stored procedure here
      @emp_client_id as int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
SELECT [emp_client_id]
      ,[client_id]
      ,[employee_id]
  FROM [dbo].[employee_clients]
 WHERE emp_client_id = @emp_client_id
 
End

GO
/****** Object:  StoredProcedure [dbo].[SP_DMCS_Select_Employee_Clients_WC]    Script Date: 3/7/2014 5:04:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Edward Sobanski
-- Create date: 5/21/2012
-- Description:	Select Row on Employee clients table
-- =============================================
CREATE PROCEDURE [dbo].[SP_DMCS_Select_Employee_Clients_WC]
	-- Add the parameters for the stored procedure here
      @wareclause as char(100)
AS
BEGIN
							    
    Declare @string as varchar(300)
	Set @string = 'Select * from Employee_Clients where ' + @wareclause
	Exec(@string)
           
 
End

GO
/****** Object:  StoredProcedure [dbo].[SP_DMCS_Select_Employee_WC]    Script Date: 3/7/2014 5:04:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Edward Sobanski
-- Create date: 5/21/2012
-- Description:	Select Row on Employee table
-- =============================================
CREATE PROCEDURE [dbo].[SP_DMCS_Select_Employee_WC]
	-- Add the parameters for the stored procedure here
     
        @wareclause as char(100)
AS
BEGIN
							    
    Declare @string as varchar(300)
	Set @string = 'Select * from Employee where ' + @wareclause
	Exec(@string)
           
 
End

GO
/****** Object:  StoredProcedure [dbo].[SP_DMCS_Select_Employer]    Script Date: 3/7/2014 5:04:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Edward Sobanski
-- Create date: 5/22/2012
-- Description:	Select Row on Employer table
-- =============================================
create PROCEDURE [dbo].[SP_DMCS_Select_Employer]
	-- Add the parameters for the stored procedure here

           @emplr_id as int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
SELECT [emplr_id]
      ,[case_id]
      ,[client_id]
      ,[address_id]
      ,[emplr_name]
      ,[emplr_phone]
      ,[end_date]
      ,[strt_date]
      ,[term_reason]
  FROM [dbo].[employer]
 WHERE emplr_id = @emplr_id
 
End

GO
/****** Object:  StoredProcedure [dbo].[SP_DMCS_Select_Employer_WC]    Script Date: 3/7/2014 5:04:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Edward Sobanski
-- Create date: 5/22/2012
-- Description:	Select Row on Employer table
-- =============================================
create PROCEDURE [dbo].[SP_DMCS_Select_Employer_WC]
	-- Add the parameters for the stored procedure here

           @wareclause as char(100)
AS
BEGIN
							    
    Declare @string as varchar(300)
	Set @string = 'Select * from Employer where ' + @wareclause
	Exec(@string)
           
 
End

GO
/****** Object:  StoredProcedure [dbo].[SP_DMCS_Select_Encounter]    Script Date: 3/7/2014 5:04:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Edward Sobanski
-- Create date: 5/22/2012
-- Description:	Select Row on Encounter table
-- =============================================
CREATE PROCEDURE [dbo].[SP_DMCS_Select_Encounter]
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
/****** Object:  StoredProcedure [dbo].[SP_DMCS_Select_Encounter_Client_Vaccine]    Script Date: 3/7/2014 5:04:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Edward Sobanski
-- Create date: 5/22/2012
-- Description:	Select Row on Encounter client vaccine table
-- =============================================
create PROCEDURE [dbo].[SP_DMCS_Select_Encounter_Client_Vaccine]
	-- Add the parameters for the stored procedure here
      @encounter_id as int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
SELECT [encounter_id]
      ,[vaccine_id]
      ,[medicine]
      ,[assistance]
      ,[quantity]
      ,[under6m]
      ,[pregnant]
      ,[children]
      ,[occupation]
      ,[chronic_disease]
      ,[qualify]
      ,[dose_date1]
      ,[dose_date2]
      ,[adult_consent]
      ,[guardian_consent]
      ,[vaccine_admin]
      ,[guardian_f_name]
      ,[guardian_l_name]
      ,[guardian_mi]
      ,[guardian_phone]
      ,[adult_consent_date]
      ,[guard_consent_date]
      ,[dose_form1]
      ,[dose_form2]
  FROM [dbo].[encounter_client_vaccine]
 WHERE encounter_id = @encounter_id 
           
End

GO
/****** Object:  StoredProcedure [dbo].[SP_DMCS_Select_Encounter_Client_Vaccine_WC]    Script Date: 3/7/2014 5:04:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Edward Sobanski
-- Create date: 5/22/2012
-- Description:	Select Row on Encounter client vaccine table
-- =============================================
create PROCEDURE [dbo].[SP_DMCS_Select_Encounter_Client_Vaccine_WC]
	-- Add the parameters for the stored procedure here
      @wareclause as char(100)
AS
BEGIN
						    
    Declare @string as varchar(300)
	Set @string = 'Select * from Encounter_Client_Vaccine where ' + @wareclause
	Exec(@string)
           
           
End

GO
/****** Object:  StoredProcedure [dbo].[SP_DMCS_Select_Encounter_Services]    Script Date: 3/7/2014 5:04:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Edward Sobanski
-- Create date: 5/22/2012
-- Description:	Select Row on Encounter Services table
-- =============================================
create PROCEDURE [dbo].[SP_DMCS_Select_Encounter_Services]
	-- Add the parameters for the stored procedure here
      @encounter_serv_id as int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
SELECT [encounter_serv_id]
      ,[encounter_id]
      ,[mobile_unit_id]
      ,[service_id]
      ,[service_date]
      ,[service_completed]
  FROM [dbo].[encounter_services]
 WHERE encounter_serv_id = @encounter_serv_id
           
End

GO
/****** Object:  StoredProcedure [dbo].[SP_DMCS_Select_Encounter_Services_WC]    Script Date: 3/7/2014 5:04:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Edward Sobanski
-- Create date: 5/22/2012
-- Description:	Select Row on Encounter Services table
-- =============================================
create PROCEDURE [dbo].[SP_DMCS_Select_Encounter_Services_WC]
	-- Add the parameters for the stored procedure here
      @wareclause as char(100)
AS
BEGIN
						    
    Declare @string as varchar(300)
	Set @string = 'Select * from Encounter_Services where ' + @wareclause
	Exec(@string)
           
End

GO
/****** Object:  StoredProcedure [dbo].[SP_DMCS_Select_Encounter_WC]    Script Date: 3/7/2014 5:04:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Edward Sobanski
-- Create date: 5/22/2012
-- Description:	Select Row on Encounter table
-- =============================================
CREATE PROCEDURE [dbo].[SP_DMCS_Select_Encounter_WC]
	-- Add the parameters for the stored procedure here

           @wareclause as char(100)
AS
BEGIN
							    
    Declare @string as varchar(300)
	Set @string = 'Select * from Encounter where ' + @wareclause
	Exec(@string)
           
End


GO
/****** Object:  StoredProcedure [dbo].[SP_DMCS_Select_Expense]    Script Date: 3/7/2014 5:04:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Edward Sobanski
-- Create date: 5/22/2012
-- Description:	Select Row on Expense table
-- =============================================
create PROCEDURE [dbo].[SP_DMCS_Select_Expense]
	-- Add the parameters for the stored procedure here
      @expense_id as int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
SELECT [expense_id]
      ,[case_id]
      ,[client_id]
      ,[date_paid]
      ,[expense_amt_paid]
      ,[expense_amt_paid_to]
  FROM [dbo].[expense]
 WHERE expense_id = @expense_id
           
End

GO
/****** Object:  StoredProcedure [dbo].[SP_DMCS_Select_Expense_WC]    Script Date: 3/7/2014 5:04:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Edward Sobanski
-- Create date: 5/22/2012
-- Description:	Select Row on Expense table
-- =============================================
create PROCEDURE [dbo].[SP_DMCS_Select_Expense_WC]
	-- Add the parameters for the stored procedure here
      @wareclause as char(100)
AS
BEGIN
						    
    Declare @string as varchar(300)
	Set @string = 'Select * from Expense where ' + @wareclause
	Exec(@string)
           
End

GO
/****** Object:  StoredProcedure [dbo].[SP_DMCS_Select_FEMA]    Script Date: 3/7/2014 5:04:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		James Miller
-- Create date: 2/28/2013
-- Description:	Select row on FEMA table
-- =============================================
CREATE PROCEDURE [dbo].[SP_DMCS_Select_FEMA]
	-- Add the parameters for the stored procedure here
           
           @FEMA_ID as int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
SELECT [FEMA_ID]
      ,[Cost_Code]
      ,[Equipment]
      ,[Specification]
      ,[Capacity_Size]
      ,[HP]
      ,[Notes]
      ,[Unit]
      ,[Rate]
  FROM [dbo].[FEMA]
  WHERE FEMA_ID = @FEMA_ID
  

 END

GO
/****** Object:  StoredProcedure [dbo].[SP_DMCS_Select_Food]    Script Date: 3/7/2014 5:04:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Edward Sobanski
-- Create date: 5/22/2012
-- Description:	Select Row on Food table
-- =============================================
create PROCEDURE [dbo].[SP_DMCS_Select_Food]
	-- Add the parameters for the stored procedure here
      
       @food_voucher_id as int
       
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
SELECT [food_voucher_id]
      ,[clients_served]
      ,[food_voucher_number]
      ,[date_issued]
      ,[Product_id]
  FROM [dbo].[food]
 WHERE food_voucher_id = @food_voucher_id
        
End

GO
/****** Object:  StoredProcedure [dbo].[SP_DMCS_Select_Food_WC]    Script Date: 3/7/2014 5:04:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Edward Sobanski
-- Create date: 5/22/2012
-- Description:	Select Row on Food table
-- =============================================
create PROCEDURE [dbo].[SP_DMCS_Select_Food_WC]
	-- Add the parameters for the stored procedure here
      
       @wareclause as char(100)
       
AS
BEGIN
					    
    Declare @string as varchar(300)
	Set @string = 'Select * from Food where ' + @wareclause
	Exec(@string)
        
End

GO
/****** Object:  StoredProcedure [dbo].[SP_DMCS_Select_get_Product_ShipmentID]    Script Date: 3/7/2014 5:04:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Edward Sobanski
-- Create date: 6/3/2012
-- Description:	Select row on vendor Product shipment table
-- =============================================
create PROCEDURE [dbo].[SP_DMCS_Select_get_Product_ShipmentID]
	-- Add the parameters for the stored procedure here
             
      @ShipmentID as int,
      @VendorID as int,
      @ProductID as int,
      @Expect_Delivery_Date as datetime,
      @orderdate as datetime,
      @quantity as int,
      @OtherInfo as varchar,
      @DateReceived as datetime,
      @AmountReceived as int
            
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
SELECT [PO_Order_no]

  FROM [dbo].[Vendor_Products_shipments]
 WHERE [ShipmentID] = @ShipmentID
   and [VendorID] = @VendorID
   and [ProductID] = @ProductID
   and [Expect_Delivery_Date] = @Expect_Delivery_Date 
   and [orderdate] = @orderdate
   and [quantity] = @quantity
   and [OtherInfo] = @OtherInfo
   and [DateReceived] = @DateReceived
   and [AmountReceived] = @AmountReceived
End

GO
/****** Object:  StoredProcedure [dbo].[SP_DMCS_Select_house]    Script Date: 3/7/2014 5:04:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Edward Sobanski
-- Create date: 5/22/2012
-- Description:	Select Row on house table
-- =============================================
create PROCEDURE [dbo].[SP_DMCS_Select_house]
	-- Add the parameters for the stored procedure here
      
       @house_id as int
       
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
SELECT [house_id]
      ,[house_name]
      ,[house_eligibility]
      ,[house_request_date]
      ,[house_voucher_amt]
      ,[house_voucher_begin_date]
      ,[house_voucher_exp_date]
      ,[house_voucher_num]
      ,[house_voucher_schedule]
      ,[house_wait_list]
  FROM [dbo].[house]
 WHERE house_id = @house_id
        
End

GO
/****** Object:  StoredProcedure [dbo].[SP_DMCS_Select_House_Choice]    Script Date: 3/7/2014 5:04:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Edward Sobanski
-- Create date: 5/22/2012
-- Description:	Select Row on house choice table
-- =============================================
create PROCEDURE [dbo].[SP_DMCS_Select_House_Choice]
	-- Add the parameters for the stored procedure here
      
       @house_choice_id as int
       
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
SELECT [house_choice_id]
      ,[house_id]
      ,[address_id]
      ,[house_choice_bathrooms]
      ,[house_choice_comments]
      ,[house_choice_contact_person_id]
      ,[house_choice_laundry]
      ,[house_choice_no_floors]
      ,[house_choice_parking]
      ,[house_choice_rent]
      ,[house_choice_type]
      ,[house_choice_units_avail]
  FROM [dbo].[house_choice]
 WHERE house_choice_id = @house_choice_id
        
End

GO
/****** Object:  StoredProcedure [dbo].[SP_DMCS_Select_House_Choice_WC]    Script Date: 3/7/2014 5:04:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Edward Sobanski
-- Create date: 5/22/2012
-- Description:	Select Row on house choice table
-- =============================================
create PROCEDURE [dbo].[SP_DMCS_Select_House_Choice_WC]
	-- Add the parameters for the stored procedure here
      
       @wareclause as char(100)
       
AS
BEGIN
						    
    Declare @string as varchar(300)
	Set @string = 'Select * from House_Choice where ' + @wareclause
	Exec(@string)
        
End

GO
/****** Object:  StoredProcedure [dbo].[SP_DMCS_Select_House_WC]    Script Date: 3/7/2014 5:04:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Edward Sobanski
-- Create date: 5/22/2012
-- Description:	Select Row on house table
-- =============================================
create PROCEDURE [dbo].[SP_DMCS_Select_House_WC]
	-- Add the parameters for the stored procedure here
      
       @wareclause as char(100)
       
AS
BEGIN
						    
    Declare @string as varchar(300)
	Set @string = 'Select * from house where ' + @wareclause
	Exec(@string)
        
End

GO
/****** Object:  StoredProcedure [dbo].[SP_DMCS_Select_Income_Source]    Script Date: 3/7/2014 5:04:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Edward Sobanski
-- Create date: 5/22/2012
-- Description:	Select Row on Income_Source table
-- =============================================
CREATE PROCEDURE [dbo].[SP_DMCS_Select_Income_Source]
	-- Add the parameters for the stored procedure here
      
       @income_source_id as int
       
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
SELECT [income_source_id]
      ,[case_id]
      ,[cash_amt]
      ,[cash_on_hand]
      ,[wages_stopped]
      ,[waiting_on_income]
      ,[recieving_income]
      ,[no_income]
      ,[currently_working]
      ,[laid_off]
      ,[never_worked]
      ,[quit]
      ,[fired]
      ,[sick_leave]
      ,[maternity_leave]
      ,[on_strike]
      ,[trying_to_find_work]
      ,[ckg_acct]
      ,[ckg_balance]
      ,[ckg_bank]
      ,[claims]
      ,[claims_memo]
      ,[client_id]
      ,[gifts_amt]
      ,[gifts_inc]
      ,[investments]
      ,[life_ins]
      ,[other_ins]
      ,[pension_amt]
      ,[pension_inc]
      ,[strike_benefits_amt]
      ,[strike_benefits_inc]
      ,[support_amt]
      ,[support_inc]
      ,[SSI_Amt]
      ,[SSI_Inc]
      ,[svgs_acct]
      ,[svgs_balance]
      ,[svgs_bank]
      ,[wages_amt]
      ,[wages_inc]
  FROM [dbo].[income_source]
 WHERE income_source_id = @income_source_id
        
End

GO
/****** Object:  StoredProcedure [dbo].[SP_DMCS_Select_Income_Source_WC]    Script Date: 3/7/2014 5:04:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Edward Sobanski
-- Create date: 5/22/2012
-- Description:	Select Row on Income_Source table
-- =============================================
CREATE PROCEDURE [dbo].[SP_DMCS_Select_Income_Source_WC]
	-- Add the parameters for the stored procedure here
      
       @wareclause as char(100)
       
AS
BEGIN
					    
    Declare @string as varchar(300)
	Set @string = 'Select * from Income_Source where ' + @wareclause
	Exec(@string)
        
End

GO
/****** Object:  StoredProcedure [dbo].[SP_DMCS_Select_Job]    Script Date: 3/7/2014 5:04:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Edward Sobanski
-- Create date: 5/22/2012
-- Description:	Select Row on Job table
-- =============================================
create PROCEDURE [dbo].[SP_DMCS_Select_Job]
	-- Add the parameters for the stored procedure here
           
           @Job_id as int
       
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
SELECT [job_id]
      ,[address_id]
      ,[company_id]
      ,[job_cat_id]
      ,[job_posted_date]
      ,[job_status]
      ,[job_title]
      ,[Work_Classification_Full_time]
      ,[Work_Classification_Part_time]
      ,[Work_Payment_Freq_Weekly]
      ,[Work_Payment_Freq_Bi-Weekly]
      ,[Work_Payment_Freq_Monthly]
      ,[Work_Payment_Freq_Bi-Monthly]
  FROM [dbo].[job]
 WHERE job_id = @job_id
        
End

GO
/****** Object:  StoredProcedure [dbo].[SP_DMCS_Select_Job_Category]    Script Date: 3/7/2014 5:04:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Edward Sobanski
-- Create date: 5/22/2012
-- Description:	Select Row on Job Category table
-- =============================================
create PROCEDURE [dbo].[SP_DMCS_Select_Job_Category]
	-- Add the parameters for the stored procedure here
           
           @Job_cat_id as int
       
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
SELECT [job_cat_id]
      ,[job_category_name]
  FROM [dbo].[job_category]
 WHERE job_cat_id = @job_cat_id
        
End

GO
/****** Object:  StoredProcedure [dbo].[SP_DMCS_Select_Job_Category_WC]    Script Date: 3/7/2014 5:04:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Edward Sobanski
-- Create date: 5/22/2012
-- Description:	Select Row on Job Category table
-- =============================================
create PROCEDURE [dbo].[SP_DMCS_Select_Job_Category_WC]
	-- Add the parameters for the stored procedure here
           
           @wareclause as char(100)
       
AS
BEGIN
			    
    Declare @string as varchar(300)
	Set @string = 'Select * from Job_Category where ' + @wareclause
	Exec(@string)
        
End

GO
/****** Object:  StoredProcedure [dbo].[SP_DMCS_Select_Job_WC]    Script Date: 3/7/2014 5:04:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Edward Sobanski
-- Create date: 5/22/2012
-- Description:	Select Row on Job table
-- =============================================
create PROCEDURE [dbo].[SP_DMCS_Select_Job_WC]
	-- Add the parameters for the stored procedure here
           
           @wareclause as char(100)
       
AS
BEGIN
				    
    Declare @string as varchar(300)
	Set @string = 'Select * from Job where ' + @wareclause
	Exec(@string)
        
End

GO
/****** Object:  StoredProcedure [dbo].[SP_DMCS_Select_location]    Script Date: 3/7/2014 5:04:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Justin Gamble
-- Create date: 2/26/2013
-- Description:	Select row on location table
-- =============================================
CREATE PROCEDURE [dbo].[SP_DMCS_Select_location]
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
/****** Object:  StoredProcedure [dbo].[SP_DMCS_Select_Location_WC]    Script Date: 3/7/2014 5:04:02 PM ******/
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
/****** Object:  StoredProcedure [dbo].[SP_DMCS_Select_Lot]    Script Date: 3/7/2014 5:04:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Edward Sobanski
-- Create date: 5/22/2012
-- Description:	Select Row on Lot table
-- =============================================
create PROCEDURE [dbo].[SP_DMCS_Select_Lot]
	-- Add the parameters for the stored procedure here
           
           @lot_id as int
       
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
SELECT [lot_id]
      ,[product_id]
      ,[manufactured_date]
      ,[expiration_date]
      ,[manufacture_name]
  FROM [dbo].[lot]
 WHERE lot_id = @lot_id
        
End

GO
/****** Object:  StoredProcedure [dbo].[SP_DMCS_Select_Lot_WC]    Script Date: 3/7/2014 5:04:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Edward Sobanski
-- Create date: 5/22/2012
-- Description:	Select Row on Lot table
-- =============================================
create PROCEDURE [dbo].[SP_DMCS_Select_Lot_WC]
	-- Add the parameters for the stored procedure here
           
           @wareclause as char(100)
       
AS
BEGIN
		    
    Declare @string as varchar(300)
	Set @string = 'Select * from Lot where ' + @wareclause
	Exec(@string)
        
        
End

GO
/****** Object:  StoredProcedure [dbo].[SP_DMCS_Select_Medical_Assistance]    Script Date: 3/7/2014 5:04:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Edward Sobanski
-- Create date: 5/22/2012
-- Description:	Select Medical Assistance on Lot table
-- =============================================
create PROCEDURE [dbo].[SP_DMCS_Select_Medical_Assistance]
	-- Add the parameters for the stored procedure here
           
           @medical_assist_order_id as int
       
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
SELECT [medical_assist_order_id]
      ,[em_id]
      ,[medical_assist_date]
      ,[medical_assist_doctor_id]
      ,[medical_assist_hosp_price]
      ,[medical_assist_hospital_name]
      ,[medical_assist_script_meds]
      ,[medical_assist_script_price]
      ,[medical_assist_script_quantity]
  FROM [dbo].[medical_assistance]
 WHERE medical_assist_order_id = @medical_assist_order_id
        
End

GO
/****** Object:  StoredProcedure [dbo].[SP_DMCS_Select_Medical_Assistance_WC]    Script Date: 3/7/2014 5:04:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Edward Sobanski
-- Create date: 5/22/2012
-- Description:	Select Medical Assistance on Lot table
-- =============================================
create PROCEDURE [dbo].[SP_DMCS_Select_Medical_Assistance_WC]
	-- Add the parameters for the stored procedure here
           
           @wareclause as char(100)
       
AS
BEGIN
	    
    Declare @string as varchar(300)
	Set @string = 'Select * from Medical_Assistance where ' + @wareclause
	Exec(@string)
        
        
End

GO
/****** Object:  StoredProcedure [dbo].[SP_DMCS_Select_Medicine]    Script Date: 3/7/2014 5:04:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Edward Sobanski
-- Create date: 5/22/2012
-- Description:	Select Medicine on Lot table
-- =============================================
create PROCEDURE [dbo].[SP_DMCS_Select_Medicine]
	-- Add the parameters for the stored procedure here
           
           @medicine_id as int
       
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
SELECT [Medicine_Id]
      ,[Medication_type]
      ,[Medication_name]
      ,[Clients_Served]
  FROM [dbo].[medicine]
 WHERE Medicine_Id = @medicine_id
        
End

GO
/****** Object:  StoredProcedure [dbo].[SP_DMCS_Select_Medicine_WC]    Script Date: 3/7/2014 5:04:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Edward Sobanski
-- Create date: 5/22/2012
-- Description:	Select Medicine on Lot table
-- =============================================
create PROCEDURE [dbo].[SP_DMCS_Select_Medicine_WC]
	-- Add the parameters for the stored procedure here
           
           @wareclause as char(100)
       
AS
BEGIN
    
    Declare @string as varchar(300)
	Set @string = 'Select * from Medicine where ' + @wareclause
	Exec(@string)
        
End

GO
/****** Object:  StoredProcedure [dbo].[SP_DMCS_Select_Military]    Script Date: 3/7/2014 5:04:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Edward Sobanski
-- Create date: 5/22/2012
-- Description:	Select Military on Lot table
-- =============================================
create PROCEDURE [dbo].[SP_DMCS_Select_Military]
	-- Add the parameters for the stored procedure here
           
           @military_id as int
       
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
SELECT [military_id]
      ,[case_id]
      ,[client_id]
      ,[discharge_date]
      ,[enlistment_date]
      ,[military_branch]
      ,[serial_num]
  FROM [dbo].[military]
 WHERE military_id = @military_id
        
End

GO
/****** Object:  StoredProcedure [dbo].[SP_DMCS_Select_Military_WC]    Script Date: 3/7/2014 5:04:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Edward Sobanski
-- Create date: 5/22/2012
-- Description:	Select Military on Lot table
-- =============================================
create PROCEDURE [dbo].[SP_DMCS_Select_Military_WC]
	-- Add the parameters for the stored procedure here
           
           @wareclause as char(100)
       
AS
BEGIN
	
	Declare @string as varchar(300)
	Set @string = 'Select * from Military where ' + @wareclause
	Exec(@string)
        
End

GO
/****** Object:  StoredProcedure [dbo].[SP_DMCS_Select_Missing]    Script Date: 3/7/2014 5:04:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Edward Sobanski
-- Create date: 5/22/2012
-- Description:	Select row on Missing  table
-- =============================================
create PROCEDURE [dbo].[SP_DMCS_Select_Missing]
	-- Add the parameters for the stored procedure here
           
           @Missing_id as int
       
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
SELECT [Missing_id]
      ,[client_other_info]
      ,[clothing]
      ,[date_of_disappearance]
      ,[last_known_location]
  FROM [dbo].[missing]
 WHERE missing_id = @missing_id
        
End

GO
/****** Object:  StoredProcedure [dbo].[SP_DMCS_Select_Missing_WC]    Script Date: 3/7/2014 5:04:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Edward Sobanski
-- Create date: 5/22/2012
-- Description:	Select row on Missing  table
-- =============================================
create PROCEDURE [dbo].[SP_DMCS_Select_Missing_WC]
	-- Add the parameters for the stored procedure here
           
           @wareclause as char(100)
       
AS
BEGIN
					
	Declare @string as varchar(300)
	Set @string = 'Select * from Missing where ' + @wareclause
	Exec(@string)
        
End

GO
/****** Object:  StoredProcedure [dbo].[SP_DMCS_Select_Mobile_Employees]    Script Date: 3/7/2014 5:04:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Edward Sobanski
-- Create date: 5/22/2012
-- Description:	Select row on mobile employees table
-- =============================================
create PROCEDURE [dbo].[SP_DMCS_Select_Mobile_Employees]
	-- Add the parameters for the stored procedure here
           
           @mobile_employee_id as int
       
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
SELECT [mobile_employee_id]
      ,[mobile_unit_id]
      ,[employee_id]
  FROM [dbo].[mobile_employees]
 WHERE mobile_employee_id = @mobile_employee_id
        
End

GO
/****** Object:  StoredProcedure [dbo].[SP_DMCS_Select_Mobile_Employees_WC]    Script Date: 3/7/2014 5:04:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Edward Sobanski
-- Create date: 5/22/2012
-- Description:	Select row on mobile employees table
-- =============================================
create PROCEDURE [dbo].[SP_DMCS_Select_Mobile_Employees_WC]
	-- Add the parameters for the stored procedure here
           
           @wareclause as char(100)
       
AS
BEGIN
				
	Declare @string as varchar(300)
	Set @string = 'Select * from Mobile_Employees where ' + @wareclause
	Exec(@string)
        
        
End

GO
/****** Object:  StoredProcedure [dbo].[SP_DMCS_Select_Mobile_Product]    Script Date: 3/7/2014 5:04:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Edward Sobanski
-- Create date: 6/20/2012
-- Description:	Select row on mobile product table
-- =============================================
CREATE PROCEDURE [dbo].[SP_DMCS_Select_Mobile_Product]
	-- Add the parameters for the stored procedure here
           
          @Mobile_Product_id as int
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
  FROM [dbo].[Mobile_Product]
 WHERE Mobile_Product_id = @Mobile_Product_id
        
End

GO
/****** Object:  StoredProcedure [dbo].[SP_DMCS_Select_Mobile_Product_By_Mobileunit_ID_And_Product_ID]    Script Date: 3/7/2014 5:04:02 PM ******/
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
/****** Object:  StoredProcedure [dbo].[SP_DMCS_Select_Mobile_Product_WC]    Script Date: 3/7/2014 5:04:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Edward Sobanski
-- Create date: 6/20/2012
-- Description:	Select row on order product table
-- =============================================
create PROCEDURE [dbo].[SP_DMCS_Select_Mobile_Product_WC]
	-- Add the parameters for the stored procedure here
           
           @wareclause as char(100)
AS
BEGIN
		
	Declare @string as varchar(300)
	Set @string = 'Select * from Order_Product where ' + @wareclause
	Exec(@string)
        
End

GO
/****** Object:  StoredProcedure [dbo].[SP_DMCS_Select_Mobile_Unit]    Script Date: 3/7/2014 5:04:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Edward Sobanski
-- Create date: 5/22/2012
-- Description:	Select row on mobile Unit table
-- =============================================
CREATE PROCEDURE [dbo].[SP_DMCS_Select_Mobile_Unit]
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
/****** Object:  StoredProcedure [dbo].[SP_DMCS_Select_Mobile_Unit_WC]    Script Date: 3/7/2014 5:04:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Edward Sobanski
-- Create date: 5/22/2012
-- Description:	Select row on mobile Unit table
-- =============================================
CREATE PROCEDURE [dbo].[SP_DMCS_Select_Mobile_Unit_WC]
	-- Add the parameters for the stored procedure here
           
           @wareclause as char(100)
AS
BEGIN
			
	Declare @string as varchar(300)
	Set @string = 'Select * from Mobile_Unit where ' + @wareclause
	Exec(@string)
        
        
End


GO
/****** Object:  StoredProcedure [dbo].[SP_DMCS_Select_mobileunit_ID_Mobile_Products_WC]    Script Date: 3/7/2014 5:04:02 PM ******/
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
/****** Object:  StoredProcedure [dbo].[SP_DMCS_Select_Order_Product]    Script Date: 3/7/2014 5:04:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Edward Sobanski
-- Create date: 5/22/2012
-- Description:	Select row on order product table
-- =============================================
create PROCEDURE [dbo].[SP_DMCS_Select_Order_Product]
	-- Add the parameters for the stored procedure here
           
           @order_Product_ID as int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
SELECT [order_Product_ID]
      ,[orderID]
      ,[ProductID]
      ,[Quantity]
      ,[warehouseid]
      ,[DatePicked]
      ,[Qtypicked]
  FROM [dbo].[Order_Product]
 WHERE order_Product_ID = @order_Product_ID
        
End

GO
/****** Object:  StoredProcedure [dbo].[SP_DMCS_Select_Order_Product_WC]    Script Date: 3/7/2014 5:04:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Edward Sobanski
-- Create date: 5/22/2012
-- Description:	Select row on order product table
-- =============================================
create PROCEDURE [dbo].[SP_DMCS_Select_Order_Product_WC]
	-- Add the parameters for the stored procedure here
           
           @wareclause as char(100)
AS
BEGIN
		
	Declare @string as varchar(300)
	Set @string = 'Select * from Order_Product where ' + @wareclause
	Exec(@string)
        
End

GO
/****** Object:  StoredProcedure [dbo].[SP_DMCS_Select_Orders_By_Warehouse]    Script Date: 3/7/2014 5:04:02 PM ******/
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
/****** Object:  StoredProcedure [dbo].[SP_DMCS_Select_Orders_Resources_By_orderID]    Script Date: 3/7/2014 5:04:02 PM ******/
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
/****** Object:  StoredProcedure [dbo].[SP_DMCS_Select_Person]    Script Date: 3/7/2014 5:04:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Edward Sobanski
-- Create date: 5/22/2012
-- Description:	Select row on person table
-- =============================================
CREATE PROCEDURE [dbo].[SP_DMCS_Select_Person]
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
/****** Object:  StoredProcedure [dbo].[SP_DMCS_Select_Person_WC]    Script Date: 3/7/2014 5:04:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Edward Sobanski
-- Create date: 5/22/2012
-- Description:	Select row on person table
-- =============================================
CREATE PROCEDURE [dbo].[SP_DMCS_Select_Person_WC]
	-- Add the parameters for the stored procedure here
           
           @wareclause as char(100)
AS
BEGIN
		
	Declare @string as varchar(300)
	Set @string = 'Select * from Person where ' + @wareclause
	Exec(@string)
        
End


GO
/****** Object:  StoredProcedure [dbo].[SP_DMCS_Select_Pet]    Script Date: 3/7/2014 5:04:02 PM ******/
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
/****** Object:  StoredProcedure [dbo].[SP_DMCS_Select_Pet_Deceased]    Script Date: 3/7/2014 5:04:02 PM ******/
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
/****** Object:  StoredProcedure [dbo].[SP_DMCS_Select_Pet_Deceased_WC]    Script Date: 3/7/2014 5:04:02 PM ******/
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
/****** Object:  StoredProcedure [dbo].[SP_DMCS_Select_Pet_missing]    Script Date: 3/7/2014 5:04:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		Jianwang Xing
-- Create date: 3/29/2013
-- Description:	Select Row on pet_missing table
-- =============================================
CREATE PROCEDURE [dbo].[SP_DMCS_Select_Pet_missing]
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
						
	FROM [dbo].[Pet_Missing]
	WHERE Pet_Missing_Id = @Pet_Missing_ID
 
End

GO
/****** Object:  StoredProcedure [dbo].[SP_DMCS_Select_Pet_missing_WC]    Script Date: 3/7/2014 5:04:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		Jianwang Xing
-- Create date: 3/29/2013
-- Description:	Select Row on disaster table
-- =============================================
CREATE PROCEDURE [dbo].[SP_DMCS_Select_Pet_missing_WC]
	-- Add the parameters for the stored procedure here
     
          @wareclause as char(100)
                
AS
BEGIN
									    
    Declare @string as varchar(300)
	Set @string = 'Select * from Pets_Missing where ' + @wareclause
	Exec(@string)
 
  
End



GO
/****** Object:  StoredProcedure [dbo].[SP_DMCS_Select_Pet_Type]    Script Date: 3/7/2014 5:04:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



-- =============================================
-- Author:		Jianwang Xing
-- Create date: 3/29/2013
-- Description:	select Row from pet type table
-- =============================================
CREATE PROCEDURE [dbo].[SP_DMCS_Select_Pet_Type]
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
/****** Object:  StoredProcedure [dbo].[SP_DMCS_Select_Pet_Type_WC]    Script Date: 3/7/2014 5:04:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Jianwang Xing
-- Create date: 3/29/2013
-- Description:	select Row from pet type table
-- =============================================
CREATE PROCEDURE [dbo].[SP_DMCS_Select_Pet_Type_WC]
	-- Add the parameters for the stored procedure here
	 @wareclause as char(100)
AS
BEGIN
											    
    Declare @string as varchar(300)
	Set @string = 'Select * from pet_type where ' + @wareclause
	Exec(@string)
 
END


GO
/****** Object:  StoredProcedure [dbo].[SP_DMCS_Select_pet_WC]    Script Date: 3/7/2014 5:04:02 PM ******/
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
/****** Object:  StoredProcedure [dbo].[SP_DMCS_Select_PetAndPetType_WC]    Script Date: 3/7/2014 5:04:02 PM ******/
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
/****** Object:  StoredProcedure [dbo].[SP_DMCS_Select_pets_WC]    Script Date: 3/7/2014 5:04:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Edward Sobanski
-- Create date: 6/12/2012
-- Description:	select Row from pets table
-- =============================================
CREATE PROCEDURE [dbo].[SP_DMCS_Select_pets_WC]
	-- Add the parameters for the stored procedure here
	 @wareclause as char(100)
AS
BEGIN
											    
    Declare @string as varchar(300)
	Set @string = 'Select * from pets where ' + @wareclause
	Exec(@string)
 
END

GO
/****** Object:  StoredProcedure [dbo].[SP_DMCS_Select_Products]    Script Date: 3/7/2014 5:04:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Edward Sobanski
-- Create date: 5/22/2012
-- Description:	Select row on products table
-- =============================================
CREATE PROCEDURE [dbo].[SP_DMCS_Select_Products]
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
/****** Object:  StoredProcedure [dbo].[SP_DMCS_Select_Products_AND_Warehouse_Product_Location_WC]    Script Date: 3/7/2014 5:04:02 PM ******/
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
/****** Object:  StoredProcedure [dbo].[SP_DMCS_Select_Products_by_Mobile_Unit_ID_WC]    Script Date: 3/7/2014 5:04:02 PM ******/
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
/****** Object:  StoredProcedure [dbo].[SP_DMCS_Select_Products_WC]    Script Date: 3/7/2014 5:04:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Edward Sobanski
-- Create date: 5/22/2012
-- Description:	Select row on products table
-- =============================================
CREATE PROCEDURE [dbo].[SP_DMCS_Select_Products_WC]
	-- Add the parameters for the stored procedure here
           
          @wareclause as char(100)
AS
BEGIN
	
	Declare @string as varchar(300)
	Set @string = 'Select * from Products where ' + @wareclause
	Exec(@string)
        
End


GO
/****** Object:  StoredProcedure [dbo].[SP_DMCS_Select_Property]    Script Date: 3/7/2014 5:04:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Edward Sobanski
-- Create date: 5/22/2012
-- Description:	Select row on property table
-- =============================================
create PROCEDURE [dbo].[SP_DMCS_Select_Property]
	-- Add the parameters for the stored procedure here
           
            @property_id as int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
SELECT [property_id]
      ,[approx_mrkt_value]
      ,[address_id]
      ,[case_id]
      ,[client_id]
      ,[Homeowners_Insurance _Payment]
      ,[monthly_property_payment]
      ,[mortg_comp]
      ,[Property_Tax _Payment]
      ,[own_prop]
      ,[rent_prop]
      ,[date_purchased]
  FROM [dbo].[property]
 WHERE property_id = @property_id
        
End

GO
/****** Object:  StoredProcedure [dbo].[SP_DMCS_Select_Property_WC]    Script Date: 3/7/2014 5:04:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Edward Sobanski
-- Create date: 5/22/2012
-- Description:	Select row on property table
-- =============================================
create PROCEDURE [dbo].[SP_DMCS_Select_Property_WC]
	-- Add the parameters for the stored procedure here
           
            @wareclause as char(100)
AS
BEGIN
								
	Declare @string as varchar(300)
	set @string = 'Select * from Property where ' + @wareclause
    exec(@string)
        
End

GO
/****** Object:  StoredProcedure [dbo].[SP_DMCS_Select_receipt]    Script Date: 3/7/2014 5:04:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		James Miller
-- Create date: 2/28/2013
-- Description:	Select row on Receipt table
-- =============================================
CREATE PROCEDURE [dbo].[SP_DMCS_Select_receipt]
	-- Add the parameters for the stored procedure here
           
           @Receipt_ID as int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
SELECT [Receipt_ID]
      ,[Account_ID]
      ,[Check_Num]
      ,[DLN]
      ,[Phone]
      ,[Pay_Type]
      ,[Amount]
      ,[Transfer]
      ,[Recieve]
  FROM [dbo].[receipt]
  WHERE Receipt_ID = @Receipt_ID
  
 END

GO
/****** Object:  StoredProcedure [dbo].[SP_DMCS_Select_Relative]    Script Date: 3/7/2014 5:04:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Edward Sobanski
-- Create date: 5/22/2012
-- Description:	Select row on relative table
-- =============================================
create PROCEDURE [dbo].[SP_DMCS_Select_Relative]
	-- Add the parameters for the stored procedure here
           
            @relative_id as int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
SELECT [relative_id]
      ,[case_id]
      ,[client_id]
      ,[address_id]
      ,[relative_help_memo]
      ,[will_help]
  FROM [dbo].[relative]
 WHERE relative_id = @relative_id
        
End

GO
/****** Object:  StoredProcedure [dbo].[SP_DMCS_Select_Relative_WC]    Script Date: 3/7/2014 5:04:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Edward Sobanski
-- Create date: 5/22/2012
-- Description:	Select row on relative table
-- =============================================
create PROCEDURE [dbo].[SP_DMCS_Select_Relative_WC]
	-- Add the parameters for the stored procedure here
           
            @wareclause as char(100)
AS
BEGIN
							
	Declare @string as varchar(300)
	set @string = 'Select * from Relative where ' + @wareclause
    exec(@string)
End

GO
/****** Object:  StoredProcedure [dbo].[SP_DMCS_Select_Requestor]    Script Date: 3/7/2014 5:04:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Edward Sobanski
-- Create date: 5/22/2012
-- Description:	Select row on Requestor table
-- =============================================
create PROCEDURE [dbo].[SP_DMCS_Select_Requestor]
	-- Add the parameters for the stored procedure here
           @requestorid as int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
SELECT [RequestorID]
      ,[EncounterID]
      ,[Requestor_Type]
      ,[MobilUnitID]
      ,[PersonID]
      ,[AgencyID]
  FROM [dbo].[requestor] 
 WHERE requestorid = @requestorid
        
End

GO
/****** Object:  StoredProcedure [dbo].[SP_DMCS_Select_Requestor_Order]    Script Date: 3/7/2014 5:04:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Edward Sobanski
-- Create date: 5/22/2012
-- Description:	Select row on Requestor order table
-- =============================================
CREATE PROCEDURE [dbo].[SP_DMCS_Select_Requestor_Order]
	-- Add the parameters for the stored procedure here
           @OrderID as int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
SELECT [OrderID]
      ,[EncounterID]
      ,[OrderPriority]
      ,[OrderNum]
      ,[ShipToAddressID]
      ,[Requestor_ID]
      ,[OrderDeliveryType]
      ,[OrderPickUpDate]
  FROM [dbo].[requestor_Order]
 WHERE OrderID = @OrderID
        
End

GO
/****** Object:  StoredProcedure [dbo].[SP_DMCS_Select_Requestor_Order_WC]    Script Date: 3/7/2014 5:04:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Edward Sobanski
-- Create date: 5/22/2012
-- Description:	Select row on Requestor order table
-- =============================================
CREATE PROCEDURE [dbo].[SP_DMCS_Select_Requestor_Order_WC]
	-- Add the parameters for the stored procedure here
           @wareclause as char(100)
AS
BEGIN
						
	Declare @string as varchar(300)
	set @string = 'Select * from Requestor_Order where ' + @wareclause
    exec(@string)
        
End

GO
/****** Object:  StoredProcedure [dbo].[SP_DMCS_Select_Requestor_WC]    Script Date: 3/7/2014 5:04:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Edward Sobanski
-- Create date: 5/22/2012
-- Description:	Select row on Requestor table
-- =============================================
create PROCEDURE [dbo].[SP_DMCS_Select_Requestor_WC]
	-- Add the parameters for the stored procedure here
           @wareclause as char(100)
AS
BEGIN
							
	Declare @string as varchar(300)
	set @string = 'Select * from Requestor where ' + @wareclause
    exec(@string)
        
        
End

GO
/****** Object:  StoredProcedure [dbo].[SP_DMCS_Select_Requirements]    Script Date: 3/7/2014 5:04:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Edward Sobanski
-- Create date: 5/22/2012
-- Description:	Select row on Requirements order table
-- =============================================
create PROCEDURE [dbo].[SP_DMCS_Select_Requirements]
	-- Add the parameters for the stored procedure here
          @req_id as int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
SELECT [req_id]
      ,[requirement_desc]
  FROM [dbo].[requirements]
 WHERE req_id = @req_id
        
End

GO
/****** Object:  StoredProcedure [dbo].[SP_DMCS_Select_Requirements_WC]    Script Date: 3/7/2014 5:04:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Edward Sobanski
-- Create date: 5/22/2012
-- Description:	Select row on Requirements order table
-- =============================================
create PROCEDURE [dbo].[SP_DMCS_Select_Requirements_WC]
	-- Add the parameters for the stored procedure here
          
          @wareclause as char(100)
AS
BEGIN
						
	Declare @string as varchar(300)
	set @string = 'Select * from Requirements where ' + @wareclause
    exec(@string)
        
        
End

GO
/****** Object:  StoredProcedure [dbo].[SP_DMCS_Select_resource]    Script Date: 3/7/2014 5:04:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		James Miller
-- Create date: 2/26/2013
-- Description:	Select row on Resource table
-- =============================================
CREATE PROCEDURE [dbo].[SP_DMCS_Select_resource]
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
/****** Object:  StoredProcedure [dbo].[SP_DMCS_Select_Services]    Script Date: 3/7/2014 5:04:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Edward Sobanski
-- Create date: 5/22/2012
-- Description:	Select row on services table
-- =============================================
create PROCEDURE [dbo].[SP_DMCS_Select_Services]
	-- Add the parameters for the stored procedure here
          @service_id as int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
SELECT [service_id]
      ,[Company]
      ,[service_type]
      ,[Estimated_Time] 
	  ,[Email]
	  ,[Phone_Number] 
	  ,[Full_Cost] 
	  ,[Estimated_Cost]
      
  FROM [dbo].[services]
 WHERE service_id = @service_id
        
End

GO
/****** Object:  StoredProcedure [dbo].[SP_DMCS_Select_Services_WC]    Script Date: 3/7/2014 5:04:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Edward Sobanski
-- Create date: 5/22/2012
-- Description:	Select row on services table
-- =============================================
create PROCEDURE [dbo].[SP_DMCS_Select_Services_WC]
	-- Add the parameters for the stored procedure here
          @wareclause as char(100)
AS
BEGIN
						
	Declare @string as varchar(300)
	set @string = 'Select * from Services where ' + @wareclause
    exec(@string)
        
End

GO
/****** Object:  StoredProcedure [dbo].[SP_DMCS_Select_Shipment]    Script Date: 3/7/2014 5:04:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Edward Sobanski
-- Create date: 5/22/2012
-- Description:	Select row on shipment table
-- =============================================
create PROCEDURE [dbo].[SP_DMCS_Select_Shipment]
	-- Add the parameters for the stored procedure here

           @shipmentid as int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
SELECT [ShipmentID]
      ,[WarehouseID]
      ,[Tracking_Num]
      ,[Ship_Method]
      ,[Other]
      ,[OrderRecByID]
      ,[FullOrderReceived]
  FROM [dbo].[Shipment]
 WHERE shipmentid = @shipmentid
 
End

GO
/****** Object:  StoredProcedure [dbo].[SP_DMCS_Select_Shipment_WC]    Script Date: 3/7/2014 5:04:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Edward Sobanski
-- Create date: 5/22/2012
-- Description:	Select row on shipment table
-- =============================================
create PROCEDURE [dbo].[SP_DMCS_Select_Shipment_WC]
	-- Add the parameters for the stored procedure here

           @wareclause as char(100)
AS
BEGIN
					
	Declare @string as varchar(300)
	set @string = 'Select * from Shipment where ' + @wareclause
    exec(@string)
 
End

GO
/****** Object:  StoredProcedure [dbo].[SP_DMCS_Select_Tier]    Script Date: 3/7/2014 5:04:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Edward Sobanski
-- Create date: 5/22/2012
-- Description:	Select row on Tier table
-- =============================================
CREATE PROCEDURE [dbo].[SP_DMCS_Select_Tier]
	-- Add the parameters for the stored procedure here

           @tier_id as int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
SELECT [tier_id]
      ,[include_req]
      ,[campaign_id]
      ,[Tier_Age_Begin_Month]
      ,[Tier_Age_Begin_Year]
      ,[Tier_Age_End_Month]
      ,[Tier_Age_End_Year]
  FROM [dbo].[tier]
 WHERE tier_id = @tier_id
 
End

GO
/****** Object:  StoredProcedure [dbo].[SP_DMCS_Select_Tier_Req]    Script Date: 3/7/2014 5:04:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Edward Sobanski
-- Create date: 5/22/2012
-- Description:	Select row on Tier req table
-- =============================================
create PROCEDURE [dbo].[SP_DMCS_Select_Tier_Req]
	-- Add the parameters for the stored procedure here
             
            @tier_req_id as int
        
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
SELECT [tier_req_id]
      ,[req_id]
      ,[tier_id]
  FROM [dbo].[tier_req]
 WHERE tier_req_id = @tier_req_id
 
End

GO
/****** Object:  StoredProcedure [dbo].[SP_DMCS_Select_Tier_Req_WC]    Script Date: 3/7/2014 5:04:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Edward Sobanski
-- Create date: 5/22/2012
-- Description:	Select row on Tier req table
-- =============================================
create PROCEDURE [dbo].[SP_DMCS_Select_Tier_Req_WC]
	-- Add the parameters for the stored procedure here
             
            @wareclause as char(100)
        
AS
BEGIN
			
	Declare @string as varchar(300)
	set @string = 'Select * from Tier_Req where ' + @wareclause
    exec(@string)
 
End

GO
/****** Object:  StoredProcedure [dbo].[SP_DMCS_Select_Tier_WC]    Script Date: 3/7/2014 5:04:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Edward Sobanski
-- Create date: 5/22/2012
-- Description:	Select row on Tier table
-- =============================================
CREATE PROCEDURE [dbo].[SP_DMCS_Select_Tier_WC]
	-- Add the parameters for the stored procedure here

          @wareclause as char(100)
AS
BEGIN
				
	Declare @string as varchar(300)
	set @string = 'Select * from Tier where ' + @wareclause
    exec(@string)
 
End

GO
/****** Object:  StoredProcedure [dbo].[SP_DMCS_Select_Transportation]    Script Date: 3/7/2014 5:04:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Edward Sobanski
-- Create date: 5/22/2012
-- Description:	Select row on transportation table
-- =============================================
create PROCEDURE [dbo].[SP_DMCS_Select_Transportation]
	-- Add the parameters for the stored procedure here
             
            @transport_id as int
        
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
SELECT [transport_id]
      ,[location_from]
      ,[location_to]
      ,[no_of_passangers]
      ,[pickup_date]
      ,[trans_type]
  FROM [dbo].[transportation]
 WHERE transport_id = @transport_id
 
End

GO
/****** Object:  StoredProcedure [dbo].[SP_DMCS_Select_Transportation_WC]    Script Date: 3/7/2014 5:04:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Edward Sobanski
-- Create date: 5/22/2012
-- Description:	Select row on transportation table
-- =============================================
create PROCEDURE [dbo].[SP_DMCS_Select_Transportation_WC]
	-- Add the parameters for the stored procedure here
             
            @wareclause as char(100)
        
AS
BEGIN
		
	Declare @string as varchar(300)
	set @string = 'Select * from Transportation where ' + @wareclause
    exec(@string)
 
End

GO
/****** Object:  StoredProcedure [dbo].[SP_DMCS_Select_Vaccine]    Script Date: 3/7/2014 5:04:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Edward Sobanski
-- Create date: 5/22/2012
-- Description:	Select row on vaccine table
-- =============================================
create PROCEDURE [dbo].[SP_DMCS_Select_Vaccine]
	-- Add the parameters for the stored procedure here
             
            @vaccine_id as int
        
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
SELECT [vaccine_id]
      ,[medicine_id]
      ,[Num_of_reg_doses]
      ,[vaccine_name]
  FROM [dbo].[vaccine]
 WHERE vaccine_id = @vaccine_id
 
End

GO
/****** Object:  StoredProcedure [dbo].[SP_DMCS_Select_Vaccine_WC]    Script Date: 3/7/2014 5:04:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Edward Sobanski
-- Create date: 5/22/2012
-- Description:	Select row on vaccine table
-- =============================================
create PROCEDURE [dbo].[SP_DMCS_Select_Vaccine_WC]
	-- Add the parameters for the stored procedure here
             
            @wareclause as char(100)
        
AS
BEGIN
	
	Declare @string as varchar(300)
	set @string = 'Select * from Vaccine where ' + @wareclause
    exec(@string)
 
End

GO
/****** Object:  StoredProcedure [dbo].[SP_DMCS_Select_Vehicle]    Script Date: 3/7/2014 5:04:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Edward Sobanski
-- Create date: 5/22/2012
-- Description:	Select row on vehicle table
-- =============================================
create PROCEDURE [dbo].[SP_DMCS_Select_Vehicle]
	-- Add the parameters for the stored procedure here
             
            @vehicle_id as int
        
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
SELECT [vehicle_id]
      ,[case_id]
      ,[client_id]
      ,[vehicle_make]
      ,[vehicle_model]
      ,[vehicle_type]
      ,[vehicle_year]
      ,[vehicle_desc]
      ,[vin]
      ,[start_mileage]
      ,[first_service_date]
      ,[last_service_date]
      ,[PLATENUMBER]
      ,[FUELTYPE]
      ,[MPH]
      ,[INSURED]
  FROM [dbo].[vehicle]
 WHERE vehicle_id = @vehicle_id
 
End

GO
/****** Object:  StoredProcedure [dbo].[SP_DMCS_Select_Vehicle_WC]    Script Date: 3/7/2014 5:04:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Edward Sobanski
-- Create date: 5/22/2012
-- Description:	Select row on vehicle table
-- =============================================
create PROCEDURE [dbo].[SP_DMCS_Select_Vehicle_WC]
	-- Add the parameters for the stored procedure here
             
            @wareclause as char(100)
        
AS
BEGIN
	
	Declare @string as varchar(300)
	set @string = 'Select * from Vehicle where ' + @wareclause
    exec(@string)
 
End

GO
/****** Object:  StoredProcedure [dbo].[SP_DMCS_Select_Vendor]    Script Date: 3/7/2014 5:04:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Edward Sobanski
-- Create date: 5/22/2012
-- Description:	Select row on vendor table
-- =============================================
create PROCEDURE [dbo].[SP_DMCS_Select_Vendor]
	-- Add the parameters for the stored procedure here
             
            @vendor_id as int
        
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
SELECT [vendor_id]
      ,[vendor_name]
      ,[phone_num]
      ,[email]
      ,[address_id]
      ,[Vendor_address2]
      ,[vendor_job_assign]
      ,[vendor_start_date]
      ,[vendor_end_date]
      ,[vendor_meth_of_contact]
      ,[vendor_status]
      ,[vendor_meth_of_pay]
      ,[vendor_type]
      ,[vendor_comments]
  FROM [dbo].[vendor]
 WHERE vendor_id = @vendor_id 
 
End

GO
/****** Object:  StoredProcedure [dbo].[SP_DMCS_Select_Vendor_Product]    Script Date: 3/7/2014 5:04:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Edward Sobanski
-- Create date: 5/22/2012
-- Description:	Select row on vendor Product table
-- =============================================
create PROCEDURE [dbo].[SP_DMCS_Select_Vendor_Product]
	-- Add the parameters for the stored procedure here
             
            @vendor_prod_id as int
        
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
SELECT [vendor_prod_id]
      ,[vendor_id]
      ,[product_id]
      ,[product_qty]
      ,[Product_exp_date]
      ,[lot_id]
  FROM [dbo].[vendor_products]
 WHERE vendor_prod_id = @vendor_prod_id 
 
End

GO
/****** Object:  StoredProcedure [dbo].[SP_DMCS_Select_Vendor_Product_Shipment]    Script Date: 3/7/2014 5:04:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Edward Sobanski
-- Create date: 5/22/2012
-- Description:	Select row on vendor Product shipment table
-- =============================================
CREATE PROCEDURE [dbo].[SP_DMCS_Select_Vendor_Product_Shipment]
	-- Add the parameters for the stored procedure here
             
            @PO_Order_no as int,
            @ProductID as int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
SELECT [PO_Order_no]
      ,[ShipmentID]
      ,[VendorID]
      ,[ProductID]
      ,[Expect_Delivery_Date]
      ,[orderdate]
      ,[quantity]
      ,[OtherInfo]
      ,[DateReceived]
      ,[AmountReceived]
  FROM [dbo].[Vendor_Products_shipments]
 WHERE PO_Order_no = @PO_Order_no
   and ProductID = @ProductID
End

GO
/****** Object:  StoredProcedure [dbo].[SP_DMCS_Select_Vendor_Product_Shipment_WC]    Script Date: 3/7/2014 5:04:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Edward Sobanski
-- Create date: 5/22/2012
-- Description:	Select row on vendor Product shipment table
-- =============================================
create PROCEDURE [dbo].[SP_DMCS_Select_Vendor_Product_Shipment_WC]
	-- Add the parameters for the stored procedure here
             
            @wareclause as char(100)
            
AS
BEGIN

	Declare @string as varchar(300)
	set @string = 'Select * from Vendor_Products_shipments where ' + @wareclause
    exec(@string)
    
 
End

GO
/****** Object:  StoredProcedure [dbo].[SP_DMCS_Select_Vendor_Product_WC]    Script Date: 3/7/2014 5:04:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Edward Sobanski
-- Create date: 5/22/2012
-- Description:	Select row on vendor Product table
-- =============================================
create PROCEDURE [dbo].[SP_DMCS_Select_Vendor_Product_WC]
	-- Add the parameters for the stored procedure here
             
            @wareclause as char(100)
        
AS
BEGIN
	Declare @string as varchar(300)
	set @string = 'Select * from Vendor_Products where ' + @wareclause
    exec(@string)
    
 
End

GO
/****** Object:  StoredProcedure [dbo].[SP_DMCS_Select_Vendor_WC]    Script Date: 3/7/2014 5:04:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Edward Sobanski
-- Create date: 5/22/2012
-- Description:	Select row on vendor table
-- =============================================
create PROCEDURE [dbo].[SP_DMCS_Select_Vendor_WC]
	-- Add the parameters for the stored procedure here
             
            @wareclause as char(100)
        
AS
BEGIN
	Declare @string as varchar(300)
	set @string = 'Select * from Vendor where ' + @wareclause
    exec(@string)
End

GO
/****** Object:  StoredProcedure [dbo].[SP_DMCS_Select_Warehouse]    Script Date: 3/7/2014 5:04:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		Edward Sobanski
-- Create date: 5/22/2012
-- Description:	Select row on warehouse table
-- =============================================
CREATE PROCEDURE [dbo].[SP_DMCS_Select_Warehouse]
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
	  ,[Location_ID]
  FROM [dbo].[warehouse]
 WHERE warehouse_id = @warehouse_id
End



GO
/****** Object:  StoredProcedure [dbo].[SP_DMCS_Select_Warehouse_by_Address_id]    Script Date: 3/7/2014 5:04:02 PM ******/
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
	  ,[location_id]
  FROM warehouse
 WHERE warehouse.address_id = @address_id
 
    -- Insert statements for procedure here

End


GO
/****** Object:  StoredProcedure [dbo].[SP_DMCS_Select_warehouse_product_location]    Script Date: 3/7/2014 5:04:02 PM ******/
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
	  ,[address_id]

  FROM [dbo].[warehouse_product_Location]
 WHERE warehouse_product_location_id = @warehouse_product_location_id
           
End



GO
/****** Object:  StoredProcedure [dbo].[SP_DMCS_Select_warehouse_product_location_By_Product_ID]    Script Date: 3/7/2014 5:04:02 PM ******/
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
	  ,[address_id]

  FROM [dbo].[warehouse_product_Location]
 WHERE product_id = @product_id
           
End



GO
/****** Object:  StoredProcedure [dbo].[SP_DMCS_Select_warehouse_product_location_WC]    Script Date: 3/7/2014 5:04:02 PM ******/
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

/****** Object:  StoredProcedure [dbo].[SP_DMCS_Select_Warehouse_Products_WC]    Script Date: 3/7/2014 5:04:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Edward Sobanski
-- Create date: 5/22/2012
-- Description:	Select row on warehouse products table 
-- =============================================
create PROCEDURE [dbo].[SP_DMCS_Select_Warehouse_Products_WC]
	-- Add the parameters for the stored procedure here
            
            @wareclause as char(100)
            
AS
BEGIN
  
    declare @string as varchar(300)
    set @string = 'Select * from warehouse_products where ' + @wareclause
    exec(@string)
           
End

GO
/****** Object:  StoredProcedure [dbo].[SP_DMCS_Select_Warehouse_WC]    Script Date: 3/7/2014 5:04:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Edward Sobanski
-- Create date: 5/22/2012
-- Description:	Select row on warehouse table
-- =============================================
CREATE PROCEDURE [dbo].[SP_DMCS_Select_Warehouse_WC]
	-- Add the parameters for the stored procedure here
             
            @wareclause as char(100)
            
AS
BEGIN
	
	declare @string as varchar(300)
    set @string = 'Select * from warehouse where ' + @wareclause
    exec(@string)

End


GO
/****** Object:  StoredProcedure [dbo].[SP_DMCS_Select_warehouseID_BY_Products_AND_Warehouse_Product_Location_WC]    Script Date: 3/7/2014 5:04:02 PM ******/
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
/****** Object:  StoredProcedure [dbo].[SP_DMCS_Update_Account]    Script Date: 3/7/2014 5:04:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Joseph Hemphill
-- Create date: 2/26/2013
-- Description:	update Rows on Account table
-- =============================================
CREATE PROCEDURE [dbo].[SP_DMCS_Update_Account]
	-- Add the parameters for the stored procedure here
	  @Account_ID as int,
	  @Bank_ID as int,
      @Account_Num as varchar(15),
      @Type as varchar(20)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
if @Account_ID = 0
begin
   set @Account_ID = null
end

 -- Insert statements for procedure here
UPDATE [dbo].[Account]
   SET [Bank_ID] = @Bank_ID,
      [Account_Num] = @Account_Num,
      [Type] = @Type
 WHERE Account_ID = @Account_ID
 END

GO
/****** Object:  StoredProcedure [dbo].[SP_DMCS_Update_Address]    Script Date: 3/7/2014 5:04:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Edward Sobanski
-- Create date: 5/21/2012
-- Description:	update Row to address table
-- =============================================
CREATE PROCEDURE [dbo].[SP_DMCS_Update_Address]
	-- Add the parameters for the stored procedure here
	  @address_id as int,
	  @address_type_id as int,
      @city as varchar(30)= Null,
      @country as varchar(30) = Null,
      @County_Township as varchar(30) = Null,
      @longitude as decimal(18,12),
      @latitude as decimal(18,12),
      @state as char(2) = Null,
      @str_add as varchar(30) = Null,
      @str_add2 as  varchar(30) = Null,
      @zip_plus_four as varchar(10) = Null
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
if @address_type_id = 0
  begin
     set @address_type_id = null
  end
  
    -- Insert statements for procedure here
	UPDATE [dbo].[address]
       SET [address_type_id] = @address_type_id, 
           [city] = @city,
           [country] = @country,
           [County_Township] = @County_Township,
           [longitude] = @longitude,
           [latitude] = @latitude,
           [state] = @state,
           [str_add] = @str_add,
           [str_add2] = @str_add2,
           [zip_plus_four] = @zip_plus_four
      WHERE address_id = @address_id
END

GO
/****** Object:  StoredProcedure [dbo].[SP_DMCS_Update_Agency]    Script Date: 3/7/2014 5:04:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Edward Sobanski
-- Create date: 5/21/2012
-- Description:	update Row on agency table
-- =============================================
CREATE PROCEDURE [dbo].[SP_DMCS_Update_Agency]
	-- Add the parameters for the stored procedure here
	  @agency_id as int,
      @address_id as int,
      @agency_name as varchar(50),
	  @primary_fName VARCHAR(50),
	  @primary_lName VARCHAR(50),
	  @primary_phone VARCHAR(50),
	  @sec_fName VARCHAR(50),
	  @sec_lName VARCHAR(50),
	  @sec_phone VARCHAR(50)
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
	UPDATE [dbo].[agency]
       SET [address_id] = @address_id,
           [agency_name] = @agency_name,
           [primary_fName]=@primary_fName,
           [primary_lName]=@primary_lName,
           [primary_phone]=@primary_phone,
           [sec_fName]=@sec_fName,
           [sec_lName]=@sec_lName,
           [sec_phone]=@sec_phone
    WHERE agency_id = @agency_id
    AND primary_fName = ISNULL(@primary_fName,primary_fName)
    AND primary_lName = ISNULL(@primary_lName,primary_lName)
END

GO
/****** Object:  StoredProcedure [dbo].[SP_DMCS_Update_Agency_employee]    Script Date: 3/7/2014 5:04:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Edward Sobanski
-- Create date: 5/21/2012
-- Description:	Update Row on agency_Employee table
-- =============================================
CREATE PROCEDURE [dbo].[SP_DMCS_Update_Agency_employee]
	-- Add the parameters for the stored procedure here
	  @agency_id as int,
      @employee_id as int,
      @agency_empl_id as int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
if @agency_id = 0
begin
   set @agency_id = null
end

if @employee_id = 0
begin
   set @employee_id = null
end

    -- Insert statements for procedure here
UPDATE [dbo].[agency_employees]
   SET [agency_id] = @agency_id,
       [employee_id] = @employee_id
 WHERE agency_empl_id = @agency_empl_id
END

GO
/****** Object:  StoredProcedure [dbo].[SP_DMCS_Update_Bank]    Script Date: 3/7/2014 5:04:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Jon Kamphuis
-- Create date: 2/26/2013
-- Description:	update Rows on Bank table
-- =============================================
CREATE PROCEDURE [dbo].[SP_DMCS_Update_Bank]
	-- Add the parameters for the stored procedure here
	  @Bank_ID as int,
	  @Name as varchar(50),
      @IsFDIC as bit,
      @Routing_Num as varchar(10)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
if @Bank_ID = 0
begin
   set @Bank_ID = null
end

 -- Insert statements for procedure here
UPDATE [dbo].[bank]
   SET [Name] = @Name,
      [IsFDIC] = @IsFDIC,
      [Routing_Num] = @Routing_Num
 WHERE Bank_ID = @Bank_ID
 END

GO
/****** Object:  StoredProcedure [dbo].[SP_DMCS_Update_Call_Center]    Script Date: 3/7/2014 5:04:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Edward Sobanski
-- Create date: 5/21/2012
-- Description:	Update Row on Call Center table
-- =============================================
CREATE PROCEDURE [dbo].[SP_DMCS_Update_Call_Center]
	-- Add the parameters for the stored procedure here
      @call_center_id as int,
      @address_id as int,
      @call_center_name as varchar(50)
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
UPDATE [dbo].[call_center]
   SET [address_id] = @address_id,
       [call_center_name] = @call_center_name
 WHERE call_center_id = @call_center_id
END

GO
/****** Object:  StoredProcedure [dbo].[SP_DMCS_Update_Call_Center_Employee]    Script Date: 3/7/2014 5:04:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Edward Sobanski
-- Create date: 5/21/2012
-- Description:	Update Row on Call Center Employee table
-- =============================================
CREATE PROCEDURE [dbo].[SP_DMCS_Update_Call_Center_Employee]
	-- Add the parameters for the stored procedure here
      @call_center_employee_id as int,
      @Call_Center_id as int,
      @employee_id as int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

if @Call_Center_id = 0
begin
   set @Call_Center_id = null
end

if @employee_id = 0
begin
   set @employee_id = null
end
    -- Insert statements for procedure here
UPDATE [dbo].[call_center_employee]
   SET [call_center_id] = @call_center_id,
       [employee_id] = @employee_id
 WHERE call_center_employee_id = @call_center_employee_id

 End

GO
/****** Object:  StoredProcedure [dbo].[SP_DMCS_Update_Campaign]    Script Date: 3/7/2014 5:04:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Edward Sobanski
-- Create date: 5/21/2012
-- Description:	Update Row on Campaign table
-- =============================================
CREATE PROCEDURE [dbo].[SP_DMCS_Update_Campaign]
	-- Add the parameters for the stored procedure here
      @campaign_id as int,
      @campaign_name as varchar(50),
      @campaign_start_date as datetime,
      @campaign_end_date as datetime,
      @medicine_id as int
      
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

if @medicine_id = 0
begin
   set @medicine_id = null
end

    -- Insert statements for procedure here
UPDATE [dbo].[campaign]
   SET [campaign_name] = @campaign_name,
       [campaign_start_date] = @campaign_start_date,
       [campaign_end_date] = @campaign_end_date, 
       [medicine_id] = @medicine_id
 WHERE campaign_id = @campaign_id

 End

GO
/****** Object:  StoredProcedure [dbo].[SP_DMCS_Update_Case_Client]    Script Date: 3/7/2014 5:04:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Edward Sobanski
-- Create date: 5/21/2012
-- Description:	Update Row on Case Client table
-- =============================================
CREATE PROCEDURE [dbo].[SP_DMCS_Update_Case_Client]
	-- Add the parameters for the stored procedure here
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
      @utilities_incl as char(1),
      @related_ll as char(1),
      @relation_to_ll as char(1),
      @mtg_amt_owed_today as money,
      @utilities_list as text,
      @water_amt_owed_today as money,
      @public_asst_app_date as datetime,
      @util_allot_app_date as datetime,
      @util_allot_amt as money,
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
      @client_issue_desc as text,
      @client_issue_resolved as char(1),
      @client_issue_comments as text
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
if @address_id = 0
begin
   set @address_id = null
end

if @prev_address_id = 0
Begin 
   set @prev_address_id = null
end

    -- Insert statements for procedure here
UPDATE [dbo].[case_client]
   SET [case_id] = @case_id,
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
      [income_status] =  @income_status,
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
      [utilities_incl] = @utilities_incl, 
      [related_ll] = @related_ll, 
      [relation_to_ll] = @relation_to_ll,
      [mtg_amt_owed_today] = @mtg_amt_owed_today,
      [utilities_list] = @utilities_list,
      [water_amt_owed_today] = @water_amt_owed_today,
      [public_asst_app_date] = @public_asst_app_date, 
      [util_allot_app_date] = @util_allot_app_date, 
      [util_allot_amt] = @util_allot_amt,
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
      [fema_Inc] = @afdc_Inc,
      [unempl_app_date] = @unempl_app_date, 
      [unempl_amt] = @unempl_amt,
      [unempl_Inc] = @unempl_Inc,
      [grants_loans_app_date] = @grants_loans_app_date, 
      [grants_loans_amt] = @grants_loans_amt,
      [grants_Inc] = @grants_Inc, 
      [other_app_date] = @other_app_date, 
      [other_amt] = @other_amt,
      [Other_Inc] = @other_Inc,
      [denial_memo] = @denial_memo, 
      [welfr_fraud_memo] = @welfr_fraud_memo,
      [client_issue_desc] = @client_issue_desc,
      [client_issue_resolved] = @client_issue_resolved,
      [client_issue_comments] = @client_issue_comments 
 WHERE case_id = @case_id and client_id = @client_id

 End

GO
/****** Object:  StoredProcedure [dbo].[SP_DMCS_Update_Case_intake]    Script Date: 3/7/2014 5:04:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Edward Sobanski
-- Create date: 5/21/2012
-- Description:	Update Row in Case intake table
-- =============================================
CREATE PROCEDURE [dbo].[SP_DMCS_Update_Case_intake]
	-- Add the parameters for the stored procedure here
      @case_id as int,
      @applic_end_date_time as datetime,
      @applic_start_date_time as datetime,
      @circum_emergency_event as varchar(3),
      @circum_help_request_memo as text,
      @circum_income_stolen as varchar(3),
      @circum_memo as text,
      @circum_no_income as varchar(3),
      @circum_not_enough_income as varchar(3),
      @agency_id as int,
      @call_center_id as int
      
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
if @agency_id = 0
Begin 
   set @agency_id = null
end

if @call_center_id = 0
Begin 
   set @call_center_id = null
end

    -- Insert statements for procedure here
UPDATE [dbo].[case_intake]
   SET [applic_end_date_time] = @applic_end_date_time,
       [applic_start_date_time] = @applic_start_date_time,
       [circum_emergency_event] = @circum_emergency_event, 
       [circum_help_request_memo] = @circum_help_request_memo,
       [circum_income_stolen] = @circum_income_stolen, 
       [circum_memo] = @circum_memo, 
       [circum_no_income] = @circum_no_income,
       [circum_not_enough_income] = @circum_not_enough_income, 
       [agency_id] = @agency_id,
       [call_center_id] = @call_center_id 
 WHERE case_id = @case_id 

 End

GO
/****** Object:  StoredProcedure [dbo].[SP_DMCS_Update_Client]    Script Date: 3/7/2014 5:04:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Edward Sobanski
-- Create date: 5/21/2012
-- Description:	Update Row from Client table
-- =============================================
CREATE PROCEDURE [dbo].[SP_DMCS_Update_Client]
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
/****** Object:  StoredProcedure [dbo].[SP_DMCS_Update_ClientWPets]    Script Date: 3/7/2014 5:04:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




-- =============================================
-- Author:		Jianwang Xing
-- Create date: 4/22/2013
-- Description:	update Row on ClientWPets table
-- =============================================
CREATE PROCEDURE [dbo].[SP_DMCS_Update_ClientWPets]
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
/****** Object:  StoredProcedure [dbo].[SP_DMCS_Update_Debt]    Script Date: 3/7/2014 5:04:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Edward Sobanski
-- Create date: 5/21/2012
-- Description:	Update Row on debt table
-- =============================================
CREATE PROCEDURE [dbo].[SP_DMCS_Update_Debt]
	-- Add the parameters for the stored procedure here
     
       @debt_id as int,
       @amt_paid as money,
       @case_id as int,
       @client_id as int,
       @creditor_name as varchar(50),
       @debt_amt as money,
       @item_purchased as varchar(30),
       @last_payment_date as datetime,
       @purchase_date as datetime,
       @value_amt as money
      
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
if @case_id = 0
Begin 
   set @case_id = null
end

if @client_id = 0
Begin 
   set @client_id = null
end

    -- Insert statements for procedure here
UPDATE [dbo].[debt]
   SET [amt_paid] = @amt_paid, 
       [case_id] = @case_id, 
       [client_id] = @client_id,
       [creditor_name] = @creditor_name, 
       [debt_amt] = @debt_amt,
       [item_purchased] = @item_purchased, 
       [last_payment_date] = @last_payment_date, 
       [purchase_date] = @purchase_date, 
       [value_amt] = @value_amt
  where debt_id = @debt_id
  
End

GO
/****** Object:  StoredProcedure [dbo].[SP_DMCS_Update_Deceased]    Script Date: 3/7/2014 5:04:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Edward Sobanski
-- Create date: 5/21/2012
-- Description:	Update Row on deceased table
-- =============================================
CREATE PROCEDURE [dbo].[SP_DMCS_Update_Deceased]
	-- Add the parameters for the stored procedure here
     
           @deceased_id as int,
           @coroner_id as int,
           @date_of_autopsy as datetime,
           @external_exam as text,
           @identifying_marks as text,
           @internal_exam as text,
           @reason_of_death as text,
           @time_of_death as datetime
      
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

if @coroner_id = 0
Begin 
   set @coroner_id = null
end

    -- Insert statements for procedure here
UPDATE [dbo].[deceased]
   SET [deceased_id] = @deceased_id, 
       [coroner_id] = @coroner_id, 
       [date_of_autopsy] = @date_of_autopsy, 
       [external_exam] = @external_exam, 
       [identifying_marks] = @identifying_marks,
       [internal_exam] = @internal_exam,
       [reason_of_death] = @reason_of_death, 
       [time_of_death] = @time_of_death
 WHERE deceased_id = @deceased_id
  
End

GO
/****** Object:  StoredProcedure [dbo].[SP_DMCS_Update_Disaster]    Script Date: 3/7/2014 5:04:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Edward Sobanski
-- Create date: 5/21/2012
-- Description:	Update Row on disaster table
-- =============================================
create PROCEDURE [dbo].[SP_DMCS_Update_Disaster]
	-- Add the parameters for the stored procedure here
     
      @disaster_id as int,
      @disaster_name as varchar(50),
      @disaster_type as varchar(30),
      @disaster_start_date as datetime,
      @disaster_end_date as datetime,
      @disaster_north_latitude as decimal(18,12),
      @disaster_north_longitude as decimal(18,12),
      @disaster_south_latitude as decimal(18,12),
      @disaster_south_longitude as decimal(18,12),
      @disaster_east_latitude as decimal(18,12),
      @disaster_east_longitude as decimal(18,12),
      @disaster_west_latitude as decimal(18,12),
      @disaster_west_longitude as decimal(18,12)    
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
UPDATE [dbo].[disaster]
   SET [disaster_name] = @disaster_name, 
       [disaster_type] = @disaster_type,
       [disaster_start_date] = @disaster_start_date,
       [disaster_end_date] = @disaster_end_date,
       [disaster_north_latitude] = @disaster_north_latitude, 
       [disaster_north_longitude] = @disaster_north_longitude, 
       [disaster_south_latitude] = @disaster_south_latitude, 
       [disaster_south_longitude] = @disaster_south_longitude,
       [disaster_east_latitude] = @disaster_east_latitude, 
       [disaster_east_longitude] = @disaster_east_longitude,
       [disaster_west_latitude] = @disaster_west_latitude, 
       [disaster_west_longitude] = @disaster_west_longitude
 WHERE disaster_id = @disaster_id
  
End

GO
/****** Object:  StoredProcedure [dbo].[SP_DMCS_Update_Disaster_Encounter]    Script Date: 3/7/2014 5:04:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Edward Sobanski
-- Create date: 5/21/2012
-- Description:	Update Row on disaster encounter table
-- =============================================
CREATE PROCEDURE [dbo].[SP_DMCS_Update_Disaster_Encounter]
	-- Add the parameters for the stored procedure here
       @disaster_encounter_id as int, 
       @disaster_id int,
       @encounter_id int,
       @address_id int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
if @address_id = 0
Begin 
   set @address_id = null
end

if @disaster_id = 0
Begin 
   set @disaster_id = null
end

if @encounter_id = 0
Begin 
   set @encounter_id = null
end

    -- Insert statements for procedure here
UPDATE [dbo].[disaster_encounter]
   SET [disaster_id] = @disaster_id,
       [encounter_id] = @encounter_id, 
       [address_id] = @address_id
 WHERE disaster_encounter_id = @disaster_encounter_id
  
End

GO
/****** Object:  StoredProcedure [dbo].[SP_DMCS_Update_Donation]    Script Date: 3/7/2014 5:04:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Joshua Stone
-- Create date: 2/26/2013
-- Description:	update Rows on Donation table
-- =============================================
CREATE PROCEDURE [dbo].[SP_DMCS_Update_Donation]
	-- Add the parameters for the stored procedure here
	  @Donation_ID as int,
	  @Receipt_ID as int,
	  @Resource_ID as int,
	  @Donor_ID as int,
	  @Date as datetime,
	  @Quantity as int,
	  @Agency_ID as int,
	  @Is_Monetary as bit,
	  @Is_FEMA as bit
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
if @Donation_ID = 0
begin
   set @Donation_ID = null
end

 -- Insert statements for procedure here
UPDATE [dbo].[donation]
   SET [Receipt_ID] = @Receipt_ID, 
       [Resource_ID] = @Resource_ID,
       [Donor_ID] = @Donor_ID,
       [Date] = @Date,
       [Quantity] = @Quantity,
       [Agency_ID] = @Agency_ID,
       [Is_Monetary] = @Is_Monetary,
       [Is_FEMA] = @Is_FEMA
 WHERE Donation_ID = @Donation_ID
 END

GO
/****** Object:  StoredProcedure [dbo].[SP_DMCS_Update_Donor]    Script Date: 3/7/2014 5:04:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Edward Sobanski
-- Create date: 5/21/2012
-- Description:	Update Row on doner table
-- =============================================
CREATE PROCEDURE [dbo].[SP_DMCS_Update_Donor]
	-- Add the parameters for the stored procedure here
       @donor_id as int, 
       @PersonID AS int,
       @Status AS varchar(30),
       @DonorType AS char(1),
       @AgencyID AS int,
       @Phone as int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
if @PersonID = 0
Begin 
   set @PersonID = null
end

if @AgencyID = 0
Begin 
   set @AgencyID = null
end

    -- Insert statements for procedure here
UPDATE [dbo].[Donor]
   SET [PersonID] = @PersonID, 
       [Status] = @Status, 
       [DonorType] = @DonorType, 
       [AgencyID] = @AgencyID,
       [Phone] = @Phone 
 WHERE donor_id = @donor_id
  
End

GO
/****** Object:  StoredProcedure [dbo].[SP_DMCS_Update_Donor_Product]    Script Date: 3/7/2014 5:04:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Edward Sobanski
-- Create date: 5/21/2012
-- Description:	Update Row on doner Product table
-- =============================================
CREATE PROCEDURE [dbo].[SP_DMCS_Update_Donor_Product]
	-- Add the parameters for the stored procedure here
        @DonorProductID as int,    
        @DonorID as int,
        @ProductID as int,
        @quantity as int,
        @other_info as varchar(50),
        @Product_rec_date as datetime,
        @AmountOfProdDonated as varchar
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
if @DonorID = 0
Begin 
   set @DonorID = null
end

if @ProductID = 0
Begin 
   set @ProductID = null
end

    -- Insert statements for procedure here
UPDATE [dbo].[Donor_Product]
   SET [DonorID] = @DonorID, 
       [ProductID] = @ProductID,
       [quantity] = @quantity, 
       [other_info] = @other_info, 
       [Product_rec_date] = @Product_rec_date,
       [AmountOfProdDonated] = @AmountOfProdDonated
 WHERE DonorProductID = @DonorProductID
 
End

GO
/****** Object:  StoredProcedure [dbo].[SP_DMCS_Update_Emergency_Medical]    Script Date: 3/7/2014 5:04:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Edward Sobanski
-- Create date: 5/21/2012
-- Description:	update Row on Emergency medical table
-- =============================================
CREATE PROCEDURE [dbo].[SP_DMCS_Update_Emergency_Medical]
	-- Add the parameters for the stored procedure here
      @em_id as int,
      @client_id as int,
      @ambulance_company_name as varchar(50),
      @ambulance_identification  as varchar(30),
      @appointment_date as datetime,
      @area_of_specialty as varchar(30),
      @assistance_order as varchar(50),
      @date_of_service as datetime,
      @degree_certifications as text,
      @doctor_appointments as varchar(30),
      @doctor_id as int,
      @doctor_start_date as datetime,
      @driver_id as int,
      @educational_institution_name as varchar(50),
      @external_examination as text,
      @hospital_name as varchar(50),
      @internal_examination as text,
      @lights_sirens_to_scene as varchar(3),
      @location_type as varchar(3),
      @number_of_days_admitted as int,
      @office_location as varchar(30),
      @other_remarks As text,
      @prescription_medicines as text,
      @time_of_service as datetime,
      @total_cost as money,
      @deceased_id as int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
if @client_id = 0
begin 
   set @client_id = NULL
end

if @doctor_id = 0 
Begin
   set @doctor_id = Null
end

if @driver_id = 0
Begin
   set @driver_id = NULL
end

if @deceased_id = 0
Begin
   set @deceased_id = null
End   
    -- Insert statements for procedure here
UPDATE [dbo].[emergency_medical]
   SET [client_id] = @client_id, 
       [ambulance_company_name] = @ambulance_company_name, 
       [ambulance_identification] = @ambulance_identification, 
       [appointment_date] = @appointment_date, 
       [area_of_specialty] = @area_of_specialty, 
       [assistance_order] = @assistance_order, 
       [date_of_service] = @date_of_service, 
       [degree_certifications] = @degree_certifications,
       [doctor_appointments] = @doctor_appointments, 
       [doctor_id] = @doctor_id,
       [doctor_start_date] = @doctor_start_date, 
       [driver_id] = @driver_id, 
       [educational_institution_name] = @educational_institution_name,
       [external_examination] = @external_examination, 
       [hospital_name] = @hospital_name, 
       [internal_examination] = @internal_examination, 
       [lights_sirens_to_scene] = @lights_sirens_to_scene,
       [location_type] = @location_type, 
       [number_of_days_admitted] = @number_of_days_admitted,
       [office_location] = @office_location, 
       [other_remarks] = @other_remarks,
       [prescription_medicines] = @prescription_medicines,
       [time_of_service] = @time_of_service,
       [total_cost] = @total_cost, 
       [deceased_id] = @deceased_id
 WHERE em_id = @em_id
 
End

GO
/****** Object:  StoredProcedure [dbo].[SP_DMCS_Update_Employee]    Script Date: 3/7/2014 5:04:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Edward Sobanski
-- Create date: 5/21/2012
-- Description:	Update Row on Employee table
-- =============================================
CREATE PROCEDURE [dbo].[SP_DMCS_Update_Employee]
	-- Add the parameters for the stored procedure here
     
        @employee_id as int,
        @employee_date_hired as datetime,
        @employee_department as varchar(15) = null,
        @employee_hours_worked as int,
        @employee_leadership as varchar(30) = null,
        @employee_motivation as varchar(30) = null,
        @employee_notes as text = null,
        @employee_overall as varchar(30) = null,
        @employee_payrate as money,      
        @employee_performance as varchar(30) = null,
        @employee_quality as varchar(30) = null,
        @employee_timeliness as varchar(30) = null,
        @username as varchar(50) = null,
        @pswd as varchar(15) = null
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
UPDATE [dbo].[employee]
   SET [employee_id] = @employee_id, 
       [employee_date_hired] = @employee_date_hired,
       [employee_department] = @employee_department, 
       [employee_hours_worked] = @employee_hours_worked, 
       [employee_leadership] = @employee_leadership, 
       [employee_motivation] = @employee_motivation,
       [employee_notes] = @employee_notes, 
       [employee_overall] = @employee_overall,
       [employee_payrate] = @employee_payrate,
       [employee_performance] = @employee_performance, 
       [employee_quality] = @employee_quality, 
       [employee_timeliness] = @employee_timeliness,
       [username] = @username, 
       [pswd] = @pswd
 WHERE employee_id = @employee_id
 
End

GO
/****** Object:  StoredProcedure [dbo].[SP_DMCS_Update_Employee_Clients]    Script Date: 3/7/2014 5:04:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Edward Sobanski
-- Create date: 5/21/2012
-- Description:	Update Row on Employee clients table
-- =============================================
CREATE PROCEDURE [dbo].[SP_DMCS_Update_Employee_Clients]
	-- Add the parameters for the stored procedure here
      @emp_client_id as int,
      @client_id as int,
      @employee_id as int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
IF @client_id = 0
BEGIN
  SET @client_id = NULL
END

IF @employee_id = 0
BEGIN
  SET @employee_id = NULL
END
   
    -- Insert statements for procedure here
UPDATE [dbo].[employee_clients]
   SET [client_id] = @client_id, 
       [employee_id] = @employee_id
  WHERE emp_client_id = @emp_client_id
 
End

GO
/****** Object:  StoredProcedure [dbo].[SP_DMCS_Update_Employer]    Script Date: 3/7/2014 5:04:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Edward Sobanski
-- Create date: 5/22/2012
-- Description:	Update Row on Employer table
-- =============================================
CREATE PROCEDURE [dbo].[SP_DMCS_Update_Employer]
	-- Add the parameters for the stored procedure here

           @emplr_id as int,
           @case_id as int,
           @client_id as int,
           @address_id as int,
           @emplr_name as varchar(50),
           @emplr_phone as varchar(11),
           @end_date as datetime,
           @strt_date as datetime,
           @term_reason as text
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
IF @client_id = 0
BEGIN
  SET @client_id = NULL
END
   
   IF @case_id = 0
BEGIN
  SET @case_id = NULL
END
   
   IF @address_id = 0
BEGIN
  SET @address_id = NULL
END
   
    -- Insert statements for procedure here
UPDATE [dbo].[employer]
   SET [case_id] = @case_id, 
       [client_id] = @client_id,
       [address_id] = @address_id,
       [emplr_name] = @emplr_name, 
       [emplr_phone] = @emplr_phone, 
       [end_date] = @end_date, 
       [strt_date] = @strt_date, 
       [term_reason] = @term_reason
 WHERE emplr_id = @emplr_id
 
End

GO
/****** Object:  StoredProcedure [dbo].[SP_DMCS_Update_Encounter]    Script Date: 3/7/2014 5:04:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Edward Sobanski
-- Create date: 5/22/2012
-- Description:	Update Row on Encounter table
-- =============================================
CREATE PROCEDURE [dbo].[SP_DMCS_Update_Encounter]
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
/****** Object:  StoredProcedure [dbo].[SP_DMCS_Update_Encounter_Client_Vaccine]    Script Date: 3/7/2014 5:04:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Edward Sobanski
-- Create date: 5/22/2012
-- Description:	Update Row on Encounter client vaccine table
-- =============================================
CREATE PROCEDURE [dbo].[SP_DMCS_Update_Encounter_Client_Vaccine]
	-- Add the parameters for the stored procedure here
      @encounter_id as int,
      @vaccine_id as int,
      @medicine as varchar(30),
      @assistance as char(1),
      @quantity as int,
      @under6m as char(1),
      @pregnant as char(1),
      @children as int,
      @occupation as varchar(30),
      @chronic_disease as varchar(50),
      @qualify as char(1),
      @dose_date1 as datetime,
      @dose_date2 as datetime,
      @adult_consent as image,
      @guardian_consent as image,
      @vaccine_admin as datetime,
      @guardian_f_name as varchar(20),
      @guardian_l_name as varchar(20),
      @guardian_mi as char(1),
      @guardian_phone as varchar(11),
      @adult_consent_date as datetime,
      @guard_consent_date as datetime,
      @dose_form1 as char(1),
      @dose_form2 as char(1)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
IF @vaccine_id = 0
BEGIN
  SET @vaccine_id = NULL
END
   
    -- Insert statements for procedure here
UPDATE [dbo].[encounter_client_vaccine]
   SET [encounter_id] = @encounter_id, 
       [vaccine_id] = @vaccine_id,
       [medicine] = @medicine, 
       [assistance] = @assistance, 
       [quantity] = @quantity,
       [under6m] = @under6m, 
       [pregnant] = @pregnant, 
       [children] = @children, 
       [occupation] = @occupation, 
       [chronic_disease] = @chronic_disease, 
       [qualify] = @qualify, 
       [dose_date1] = @dose_date1, 
       [dose_date2] = @dose_date2, 
       [adult_consent] = @adult_consent, 
       [guardian_consent] = @guardian_consent, 
       [vaccine_admin] = @vaccine_admin, 
       [guardian_f_name] = @guardian_f_name, 
       [guardian_l_name] = @guardian_l_name, 
       [guardian_mi] = @guardian_mi, 
       [guardian_phone] = @guardian_phone, 
       [adult_consent_date] = @adult_consent_date, 
       [guard_consent_date] = @guard_consent_date, 
       [dose_form1] = @dose_form1, 
       [dose_form2] = @dose_form2
 WHERE encounter_id = @encounter_id 
           
End

GO
/****** Object:  StoredProcedure [dbo].[SP_DMCS_Update_Encounter_Services]    Script Date: 3/7/2014 5:04:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Edward Sobanski
-- Create date: 5/22/2012
-- Description:	Update Row on Encounter Services table
-- =============================================
CREATE PROCEDURE [dbo].[SP_DMCS_Update_Encounter_Services]
	-- Add the parameters for the stored procedure here
      @encounter_serv_id as int,
      @encounter_id as int,
      @mobile_unit_id as int,
      @service_id as int,
      @service_date as datetime,
      @service_completed as datetime
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
IF @encounter_id = 0
BEGIN
  SET @encounter_id = NULL
END
   
   IF @mobile_unit_id = 0
BEGIN
  SET @mobile_unit_id = NULL
END
   
   IF @service_id = 0
BEGIN
  SET @service_id = NULL
END
   
    -- Insert statements for procedure here
UPDATE [dbo].[encounter_services]
   SET [encounter_id] = @encounter_id, 
       [mobile_unit_id] = @mobile_unit_id, 
       [service_id] = @service_id, 
       [service_date] = @service_date, 
       [service_completed] = @service_completed
 WHERE encounter_serv_id = @encounter_serv_id
           
End

GO
/****** Object:  StoredProcedure [dbo].[SP_DMCS_Update_Expense]    Script Date: 3/7/2014 5:04:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Edward Sobanski
-- Create date: 5/22/2012
-- Description:	Update Row on Expense table
-- =============================================
CREATE PROCEDURE [dbo].[SP_DMCS_Update_Expense]
	-- Add the parameters for the stored procedure here
      @expense_id as int,
      @case_id as int,
      @client_id as int,
      @date_paid as datetime,
      @expense_amt_paid as money,
      @expense_amt_paid_to as varchar(30)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
IF @client_id = 0
BEGIN
  SET @client_id = NULL
END
   
   IF @case_id = 0
BEGIN
  SET @case_id = NULL
END
   
    -- Insert statements for procedure here
UPDATE [dbo].[expense]
   SET [case_id] = @case_id,
       [client_id] = @client_id,
       [date_paid] = @date_paid, 
       [expense_amt_paid] = @expense_amt_paid,
       [expense_amt_paid_to] = @expense_amt_paid_to 
 WHERE expense_id = @expense_id
           
End

GO
/****** Object:  StoredProcedure [dbo].[SP_DMCS_Update_FEMA]    Script Date: 3/7/2014 5:04:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		James Miller
-- Create date: 2/28/2013
-- Description:	update Rows on FEMA table
-- =============================================
CREATE PROCEDURE [dbo].[SP_DMCS_Update_FEMA]
	-- Add the parameters for the stored procedure here
	  @FEMA_ID as int,
	  @Cost_Code as int,
      @Equipment as int,
      @Specification as VarChar,
      @Capacity_Size as VarChar,
      @HP as VarChar,
      @Notes as VarChar,
      @Unit as VarChar,
      @Rate as VarChar
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
if @FEMA_ID = 0
begin
   set @FEMA_ID = null
end

 -- Insert statements for procedure here
UPDATE [dbo].[FEMA]
   SET [Cost_Code] = @Cost_Code,
      [Equipment] = @Equipment, 
      [Specification] = @Specification,
      [Capacity_Size] = @Capacity_Size,
      [HP] = @HP,
      [Notes] = @Notes,
      [Unit] = @Unit,
      [Rate] = @Rate
      
 WHERE FEMA_ID = @FEMA_ID
 END

GO
/****** Object:  StoredProcedure [dbo].[SP_DMCS_Update_Food]    Script Date: 3/7/2014 5:04:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Edward Sobanski
-- Create date: 5/22/2012
-- Description:	Update Row on Food table
-- =============================================
CREATE PROCEDURE [dbo].[SP_DMCS_Update_Food]
	-- Add the parameters for the stored procedure here
      
       @food_voucher_id as int,
       @clients_served as int,
       @food_voucher_number as int,
       @date_issued as datetime,
       @Product_id as int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

IF @Product_id = 0
BEGIN
  SET @Product_id = NULL
END
   
    -- Insert statements for procedure here
UPDATE [dbo].[food]
   SET [food_voucher_id] = @food_voucher_id,
       [clients_served] = @clients_served,
       [food_voucher_number] = @food_voucher_number,
       [date_issued] = @date_issued, 
       [Product_id] = @Product_id
 WHERE food_voucher_id = @food_voucher_id
        
End

GO
/****** Object:  StoredProcedure [dbo].[SP_DMCS_Update_house]    Script Date: 3/7/2014 5:04:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Edward Sobanski
-- Create date: 5/22/2012
-- Description:	Update Row on house table
-- =============================================
create PROCEDURE [dbo].[SP_DMCS_Update_house]
	-- Add the parameters for the stored procedure here
      
       @house_id as int,
       @house_name as varchar(50),
       @house_eligibility as varchar(15),
       @house_request_date as datetime,
       @house_voucher_amt as money,
       @house_voucher_begin_date as datetime,
       @house_voucher_exp_date as datetime,
       @house_voucher_num as int,
       @house_voucher_schedule as varchar(10),
       @house_wait_list as int
       
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
UPDATE [dbo].[house]
   SET [house_name] = @house_name, 
       [house_eligibility] = @house_eligibility,
       [house_request_date] = @house_request_date, 
       [house_voucher_amt] = @house_voucher_amt,
       [house_voucher_begin_date] = @house_voucher_begin_date, 
       [house_voucher_exp_date] = @house_voucher_exp_date, 
       [house_voucher_num] = @house_voucher_num, 
       [house_voucher_schedule] = @house_voucher_schedule, 
       [house_wait_list] = @house_wait_list
 WHERE house_id = @house_id
        
End

GO
/****** Object:  StoredProcedure [dbo].[SP_DMCS_Update_House_Choice]    Script Date: 3/7/2014 5:04:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Edward Sobanski
-- Create date: 5/22/2012
-- Description:	Update Row on house choice table
-- =============================================
CREATE PROCEDURE [dbo].[SP_DMCS_Update_House_Choice]
	-- Add the parameters for the stored procedure here
      
       @house_choice_id as int,
       @house_id as int,
       @address_id as int,
       @house_choice_bathrooms as int,
       @house_choice_comments as varchar(30),
       @house_choice_contact_person_id as int,
       @house_choice_laundry as varchar(15),
       @house_choice_no_floors as int,
       @house_choice_parking as varchar(15),
       @house_choice_rent as money,
       @house_choice_type as varchar(30),
       @house_choice_units_avail as int
       
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
IF @house_id = 0
BEGIN
  SET @house_id = NULL
END
   
IF @address_id = 0
BEGIN
  SET @address_id = NULL
END
   
IF @house_choice_contact_person_id = 0
BEGIN
  SET @house_choice_contact_person_id = NULL
END
   
    -- Insert statements for procedure here
UPDATE [dbo].[house_choice]
   SET [house_id] = @house_id,
       [address_id] = @address_id, 
       [house_choice_bathrooms] = @house_choice_bathrooms, 
       [house_choice_comments] = @house_choice_comments, 
       [house_choice_contact_person_id] = @house_choice_contact_person_id, 
       [house_choice_laundry] = @house_choice_laundry, 
       [house_choice_no_floors] = @house_choice_no_floors, 
       [house_choice_parking] = @house_choice_parking, 
       [house_choice_rent] = @house_choice_rent, 
       [house_choice_type] = @house_choice_type, 
       [house_choice_units_avail] = @house_choice_units_avail
 WHERE house_choice_id = @house_choice_id
        
End

GO
/****** Object:  StoredProcedure [dbo].[SP_DMCS_Update_Income_Source]    Script Date: 3/7/2014 5:04:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Edward Sobanski
-- Create date: 5/22/2012
-- Description:	Update Row on Income_Source table
-- =============================================
CREATE PROCEDURE [dbo].[SP_DMCS_Update_Income_Source]
	-- Add the parameters for the stored procedure here
      
       @income_source_id as int,
       @case_id as int,
       @cash_amt as money,
       @cash_on_hand as char(1) = 'N',
       @wages_stopped as char(1) = 'N',
       @waiting_on_income as char(1) = 'N',
       @recieving_income as char(1) = 'N',
       @no_income as char(1) = 'N',
       @currently_working as char(1) = 'N',
       @laid_off as char(1) = 'N',
       @never_worked as char(1) = 'N',
       @quit as char(1) = 'N',
       @fired as char(1) = 'N',
       @sick_leave as char(1) = 'N',
       @maternity_leave as char(1) = 'N',
       @on_strike as char(1) = 'N',
       @trying_to_find_work as char(1) = 'N',
       @ckg_acct as char(1) = 'N',
       @ckg_balance as money,
       @ckg_bank as varchar(30) = null,
       @claims as char(1) = 'N',
       @claims_memo as text = 'N',
       @client_id as int,
       @gifts_amt as money,
       @gifts_inc as char(1) = 'N',
       @investments as char(1) = 'N',
       @life_ins as char(1) = 'N',
       @other_ins as char(1) = 'N',
       @pension_amt as money,
       @pension_inc as char(1) = 'N',
       @strike_benefits_amt as money,
       @strike_benefits_inc as char(1) = 'N',
       @support_amt as money,
       @support_inc as char(1) = 'N',
       @SSI_Amt as money,
       @SSI_Inc as char(1) = 'N',
       @svgs_acct as char(1) = 'N',
       @svgs_balance as money,
       @svgs_bank as varchar(30) = null,
       @wages_amt as money,
       @wages_inc as char(1) = 'N'
       
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
IF @client_id = 0
BEGIN
  SET @client_id = NULL
END
   
   IF @case_id = 0
BEGIN
  SET @case_id = NULL
END
   
    -- Insert statements for procedure here
UPDATE [dbo].[income_source]
   SET[case_id] = @case_id, 
      [cash_amt] = @cash_amt,
      [cash_on_hand] = @cash_on_hand,
      [wages_stopped] = @wages_stopped,
      [waiting_on_income] = @waiting_on_income,
      [recieving_income] = @recieving_income,
      [no_income] = @no_income,
      [currently_working] = @currently_working, 
      [laid_off] = @laid_off, 
      [never_worked] = @never_worked, 
      [quit] = @quit,
      [fired] = @fired, 
      [sick_leave] = @sick_leave, 
      [maternity_leave] = @maternity_leave, 
      [on_strike] = @on_strike, 
      [trying_to_find_work] = @trying_to_find_work, 
      [ckg_acct] = @ckg_acct, 
      [ckg_balance] = @ckg_balance, 
      [ckg_bank] = @ckg_bank,
      [claims] = @claims, 
      [claims_memo] = @claims_memo, 
      [client_id] = @client_id, 
      [gifts_amt] = @gifts_amt, 
      [gifts_inc] = @gifts_inc, 
      [investments] = @investments, 
      [life_ins] = @life_ins, 
      [other_ins] = @other_ins, 
      [pension_amt] = @pension_amt, 
      [pension_inc] = @pension_inc, 
      [strike_benefits_amt] = @strike_benefits_amt, 
      [strike_benefits_inc] = @strike_benefits_inc, 
      [support_amt] = @support_amt,
      [support_inc] = @support_inc, 
      [SSI_Amt] = @SSI_Amt,
      [SSI_Inc] = @SSI_Inc, 
      [svgs_acct] = @svgs_acct, 
      [svgs_balance] = @svgs_balance,
      [svgs_bank] = @svgs_bank, 
      [wages_amt] = @wages_amt,
      [wages_inc] = @wages_inc
 WHERE income_source_id = @income_source_id
        
End

GO
/****** Object:  StoredProcedure [dbo].[SP_DMCS_Update_Job]    Script Date: 3/7/2014 5:04:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Edward Sobanski
-- Create date: 5/22/2012
-- Description:	Update Row on Job table
-- =============================================
CREATE PROCEDURE [dbo].[SP_DMCS_Update_Job]
	-- Add the parameters for the stored procedure here
           
           @Job_id as int,
           @address_id AS int,
           @company_id AS int,
           @job_cat_id AS int,
           @job_posted_date AS datetime,
           @job_status AS varchar(10),
           @job_title AS varchar(15),
           @Work_Classification_Full_time AS varchar(15),
           @Work_Classification_Part_time AS varchar(15),
           @Work_Payment_Freq_Weekly AS varchar(15),
           @Work_Payment_Freq_BiWeekly AS varchar(15),
           @Work_Payment_Freq_Monthly AS varchar(15),
           @Work_Payment_Freq_BiMonthly AS varchar(15)
       
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
IF @address_id = 0
BEGIN
  SET @address_id = NULL
END

IF @company_id = 0
BEGIN
  SET @company_id = NULL
END

IF @job_cat_id = 0
BEGIN
  SET @job_cat_id = NULL
END
   
    -- Insert statements for procedure here
UPDATE [dbo].[job]
   SET [address_id] = @address_id, 
       [job_cat_id] = @job_cat_id, 
       [job_posted_date] = @job_posted_date,
       [job_status] = @job_status, 
       [job_title] = @job_title, 
       [Work_Classification_Full_time] = @Work_Classification_Full_time, 
       [Work_Classification_Part_time] = @Work_Classification_Part_time, 
       [Work_Payment_Freq_Weekly] = @Work_Payment_Freq_Weekly, 
       [Work_Payment_Freq_Bi-Weekly] = @Work_Payment_Freq_BiWeekly, 
       [Work_Payment_Freq_Monthly] = @Work_Payment_Freq_Monthly, 
       [Work_Payment_Freq_Bi-Monthly] = @Work_Payment_Freq_BiMonthly 
 WHERE job_id = @job_id
        
End

GO
/****** Object:  StoredProcedure [dbo].[SP_DMCS_Update_Job_Category]    Script Date: 3/7/2014 5:04:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Edward Sobanski
-- Create date: 5/22/2012
-- Description:	Update Row on Job Category table
-- =============================================
create PROCEDURE [dbo].[SP_DMCS_Update_Job_Category]
	-- Add the parameters for the stored procedure here
           
           @Job_cat_id as int,
           @job_category_name as varchar(30)
       
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
UPDATE [dbo].[job_category]
   SET [job_category_name] = @job_category_name
 WHERE job_cat_id = @job_cat_id
        
End

GO
/****** Object:  StoredProcedure [dbo].[SP_DMCS_Update_location]    Script Date: 3/7/2014 5:04:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




-- =============================================
-- Author:		Justin Gamble
-- Create date: 2/26/2013
-- Description:	update Rows on Location table
-- =============================================
CREATE PROCEDURE [dbo].[SP_DMCS_Update_location]
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
/****** Object:  StoredProcedure [dbo].[SP_DMCS_Update_Lot]    Script Date: 3/7/2014 5:04:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Edward Sobanski
-- Create date: 5/22/2012
-- Description:	Update Row on Lot table
-- =============================================
CREATE PROCEDURE [dbo].[SP_DMCS_Update_Lot]
	-- Add the parameters for the stored procedure here
           
           @lot_id as int,
           @product_id as int,
           @manufactured_date as datetime,
           @expiration_date as datetime,
           @manufacture_name as varchar(50)
       
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
IF @product_id = 0
BEGIN
  SET @product_id = NULL
END
   
    -- Insert statements for procedure here
UPDATE [dbo].[lot]
   SET [product_id] = @product_id,
       [manufactured_date] = @manufactured_date,
       [expiration_date] = @expiration_date,
       [manufacture_name] = @manufacture_name
 WHERE lot_id = @lot_id
        
End

GO
/****** Object:  StoredProcedure [dbo].[SP_DMCS_Update_Medical_Assistance]    Script Date: 3/7/2014 5:04:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Edward Sobanski
-- Create date: 5/22/2012
-- Description:	Update Medical Assistance on Lot table
-- =============================================
CREATE PROCEDURE [dbo].[SP_DMCS_Update_Medical_Assistance]
	-- Add the parameters for the stored procedure here
           
      @medical_assist_order_id as int,
      @em_id as int,
      @medical_assist_date as datetime,
      @medical_assist_doctor_id as int,
      @medical_assist_hosp_price as money,
      @medical_assist_hospital_name as varchar(50),
      @medical_assist_script_meds as varchar(30),
      @medical_assist_script_price as money,
      @medical_assist_script_quantity as int
       
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

IF @em_id = 0
BEGIN
  SET @em_id = NULL
END
   
   IF @medical_assist_doctor_id = 0
BEGIN
  SET @medical_assist_doctor_id = NULL
END
   
    -- Insert statements for procedure here
UPDATE [dbo].[medical_assistance]
   SET [em_id] = @em_id, 
       [medical_assist_date] = @medical_assist_date,
       [medical_assist_doctor_id] = @medical_assist_doctor_id,
       [medical_assist_hosp_price] = @medical_assist_hosp_price, 
       [medical_assist_hospital_name] = @medical_assist_hospital_name, 
       [medical_assist_script_meds] = @medical_assist_script_meds, 
       [medical_assist_script_price] = @medical_assist_script_price, 
       [medical_assist_script_quantity] = @medical_assist_script_quantity
 WHERE medical_assist_order_id = @medical_assist_order_id
        
End

GO
/****** Object:  StoredProcedure [dbo].[SP_DMCS_Update_Medicine]    Script Date: 3/7/2014 5:04:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Edward Sobanski
-- Create date: 5/22/2012
-- Description:	Update Medicine on Lot table
-- =============================================
CREATE PROCEDURE [dbo].[SP_DMCS_Update_Medicine]
	-- Add the parameters for the stored procedure here
           
           @medicine_id as int,
           @Medication_type as varchar(30),
           @Medication_name as varchar(50),
           @Clients_Served as int
       
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
IF @medicine_id = 0
BEGIN
  SET @medicine_id = NULL
END
   
    -- Insert statements for procedure here
UPDATE [dbo].[medicine]
   SET [Medication_type] = @Medication_type, 
       [Medication_name] = @Medication_name, 
       [Clients_Served] = @Clients_Served 
 WHERE Medicine_Id = @medicine_id
        
End

GO
/****** Object:  StoredProcedure [dbo].[SP_DMCS_Update_Military]    Script Date: 3/7/2014 5:04:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Edward Sobanski
-- Create date: 5/22/2012
-- Description:	Update Military on Lot table
-- =============================================
CREATE PROCEDURE [dbo].[SP_DMCS_Update_Military]
	-- Add the parameters for the stored procedure here
           
         @military_id as int,
         @case_id as int,
         @client_id as int,
         @discharge_date as datetime,
         @enlistment_date as datetime,
         @military_branch as varchar(30),
         @serial_num as int
       
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

IF @client_id = 0
BEGIN
  SET @client_id = NULL
END
   
IF @case_id = 0
BEGIN
  SET @case_id = NULL
END
   
    -- Insert statements for procedure here
UPDATE [dbo].[military]
   SET [case_id] = @case_id, 
       [client_id] = @client_id,
       [discharge_date] = @discharge_date, 
       [enlistment_date] = @enlistment_date, 
       [military_branch] = @military_branch, 
       [serial_num] = @serial_num
 WHERE military_id = @military_id
        
End

GO
/****** Object:  StoredProcedure [dbo].[SP_DMCS_Update_Missing]    Script Date: 3/7/2014 5:04:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Edward Sobanski
-- Create date: 5/22/2012
-- Description:	Update row on Missing  table
-- =============================================
create PROCEDURE [dbo].[SP_DMCS_Update_Missing]
	-- Add the parameters for the stored procedure here
           
           @Missing_id as int,
           @client_other_info as varchar(30),
           @clothing as varchar(30),
           @date_of_disappearance as datetime,
           @last_known_location as varchar(30)
       
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
UPDATE [dbo].[missing]
   SET [Missing_id] = @Missing_id, 
       [client_other_info] = @client_other_info, 
       [clothing] = @clothing, 
       [date_of_disappearance] = @date_of_disappearance, 
       [last_known_location] = @last_known_location
 WHERE missing_id = @missing_id
        
End

GO
/****** Object:  StoredProcedure [dbo].[SP_DMCS_Update_Mobile_Employees]    Script Date: 3/7/2014 5:04:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Edward Sobanski
-- Create date: 5/22/2012
-- Description:	Update row on mobile employees table
-- =============================================
CREATE PROCEDURE [dbo].[SP_DMCS_Update_Mobile_Employees]
	-- Add the parameters for the stored procedure here
           
         @mobile_employee_id as int,
         @mobile_unit_id as int,
         @employee_id as int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

IF @mobile_unit_id = 0
BEGIN
  SET @mobile_unit_id = NULL
END
   
IF @employee_id = 0
BEGIN
  SET @employee_id = NULL
END
   
    -- Insert statements for procedure here
UPDATE [dbo].[mobile_employees]
   SET [mobile_unit_id] = @mobile_unit_id,
       [employee_id] = @employee_id
 WHERE mobile_employee_id = @mobile_employee_id
        
End

GO
/****** Object:  StoredProcedure [dbo].[SP_DMCS_Update_Mobile_Product]    Script Date: 3/7/2014 5:04:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Edward Sobanski
-- Create date: 6/20/2012
-- Description:	Update row on mobile product table
-- =============================================
CREATE PROCEDURE [dbo].[SP_DMCS_Update_Mobile_Product]
	-- Add the parameters for the stored procedure here
       
       @Mobile_Product_id as int,   
       @Mobile_Unit_id as int,
       @Product_id as int,
       @Case_id as int,
       @Lot_id as int,
       @Min_inv as int,
       @Quantity as int,
       @Experiation_Date as datetime
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
IF @Mobile_Unit_id = 0
BEGIN
  SET @Mobile_Unit_id = NULL
END
   
IF @Product_id = 0
BEGIN
  SET @Product_id = NULL
END

IF @Case_id = 0
BEGIN
  SET @Case_id = NULL
END
  
IF @Lot_id = 0
BEGIN
  SET @Lot_id = NULL
END
    -- Insert statements for procedure here
UPDATE [dbo].[Mobile_Product]
   SET [Mobile_Unit_id] = @Mobile_Unit_id, 
       [Product_id] = @Product_id,
       [Case_id] = @Case_id,
       [Lot_id] = @Lot_id,
       [Min_inv] = @Min_inv, 
       [Quantity] = @Quantity,
       [Experiation_Date] = @Experiation_Date
 WHERE Mobile_Product_id = @Mobile_Product_id
        
End

GO
/****** Object:  StoredProcedure [dbo].[SP_DMCS_Update_Mobile_Unit]    Script Date: 3/7/2014 5:04:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Edward Sobanski
-- Create date: 5/22/2012
-- Description:	Update row on mobile Unit table
-- =============================================
CREATE PROCEDURE [dbo].[SP_DMCS_Update_Mobile_Unit]
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
/****** Object:  StoredProcedure [dbo].[SP_DMCS_Update_Order_Product]    Script Date: 3/7/2014 5:04:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Edward Sobanski
-- Create date: 5/22/2012
-- Description:	Update row on order product table
-- =============================================
CREATE PROCEDURE [dbo].[SP_DMCS_Update_Order_Product]
	-- Add the parameters for the stored procedure here
           
       @order_Product_ID as int,
       @orderID as int,
       @ProductID as int,
       @Quantity as int,
       @warehouseid as int,
       @DatePicked as date,
       @Qtypicked as int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
IF @orderID = 0
BEGIN
  SET @orderID = NULL
END
   
IF @ProductID = 0
BEGIN
  SET @ProductID = NULL
END

IF @warehouseid = 0
BEGIN
  SET @warehouseid = NULL
END
   
    -- Insert statements for procedure here
UPDATE [dbo].[Order_Product]
   SET [orderID] = @orderID, 
       [ProductID] = @ProductID,
       [Quantity] = @Quantity,
       [warehouseid] = @warehouseid,
       [DatePicked] = @DatePicked, 
       [Qtypicked] = @Qtypicked 
 WHERE order_Product_ID = @order_Product_ID
        
End

GO
/****** Object:  StoredProcedure [dbo].[SP_DMCS_Update_Person]    Script Date: 3/7/2014 5:04:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Edward Sobanski
-- Create date: 5/22/2012
-- Description:	Update row on person table
-- =============================================
CREATE PROCEDURE [dbo].[SP_DMCS_Update_Person]
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
/****** Object:  StoredProcedure [dbo].[SP_DMCS_Update_pet]    Script Date: 3/7/2014 5:04:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




-- =============================================
-- Author:		Jianwang Xing
-- Create date: 3/29/2013
-- Description:	update Row on pet table
-- =============================================
CREATE PROCEDURE [dbo].[SP_DMCS_Update_pet]
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
/****** Object:  StoredProcedure [dbo].[SP_DMCS_Update_Pet_Deceased]    Script Date: 3/7/2014 5:04:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




-- =============================================
-- Author:		Mike Phillips
-- Create date: 3/29/2013
-- Description:	Update Row on pet deceased table
-- =============================================
CREATE PROCEDURE [dbo].[SP_DMCS_Update_Pet_Deceased]
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
/****** Object:  StoredProcedure [dbo].[SP_DMCS_Update_Pet_Missing]    Script Date: 3/7/2014 5:04:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




-- =============================================
-- Author:		Jianwang Xing
-- Create date:3/29/2013
-- Description:	Update Row on missing pet table
-- =============================================
CREATE PROCEDURE [dbo].[SP_DMCS_Update_Pet_Missing]
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
  UPDATE [dbo].[Pet_Missing]
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
/****** Object:  StoredProcedure [dbo].[SP_DMCS_Update_Pet_Type]    Script Date: 3/7/2014 5:04:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		Jianwang Xing
-- Create date: 3/29/2013
-- Description:	update Row on pet type table
-- =============================================
CREATE PROCEDURE [dbo].[SP_DMCS_Update_Pet_Type]
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
/****** Object:  StoredProcedure [dbo].[SP_DMCS_Update_Pet_Vaccine]    Script Date: 3/7/2014 5:04:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Mike Phillips
-- Create date: 3/29/2013
-- Description:	Update Row on pet vaccines table
-- =============================================
create PROCEDURE [dbo].[SP_DMCS_Update_Pet_Vaccine]
	-- Add the parameters for the stored procedure here
			
			@Pet_Vaccine_ID as int,
			@Last_Vaccine_Given as DateTime,
            @Pet_Record_ID AS int,
            @Datetime AS DateTime,
			@Vaccine_Type_ID as int
       
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
  UPDATE [dbo].[Pet_Vaccine]
   SET [Last_Vaccine_Given] = @Last_Vaccine_Given
      ,[Pet_Record_ID] = @Pet_Record_ID
      ,[Datetime] = @Datetime
      ,[Vaccine_Type_ID] = @Vaccine_Type_ID
 WHERE Pet_Vaccine.Pet_Vaccine_ID = @Pet_Vaccine_ID
        
End

GO
/****** Object:  StoredProcedure [dbo].[SP_DMCS_Update_Products]    Script Date: 3/7/2014 5:04:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Edward Sobanski
-- Create date: 5/22/2012
-- Description:	Update row on products table
-- =============================================
CREATE PROCEDURE [dbo].[SP_DMCS_Update_Products]
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
/****** Object:  StoredProcedure [dbo].[SP_DMCS_Update_Property]    Script Date: 3/7/2014 5:04:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Edward Sobanski
-- Create date: 5/22/2012
-- Description:	Update row on property table
-- =============================================
CREATE PROCEDURE [dbo].[SP_DMCS_Update_Property]
	-- Add the parameters for the stored procedure here
           
            @property_id as int,
            @approx_mrkt_value as money,
            @address_id as int,
            @case_id as int,
            @client_id as int,
            @Homeowners_Insurance_Payment as money,
            @monthly_property_payment as money,
            @mortg_comp as varchar(30),
            @Property_Tax_Payment as money,
            @own_prop as char(1),
            @rent_prop as char(1),
            @date_purchased as int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
IF @client_id = 0
BEGIN
  SET @client_id = NULL
END
   
   IF @case_id = 0
BEGIN
  SET @case_id = NULL
END
   
   IF @address_id = 0
BEGIN
  SET @address_id = NULL
END
   
    -- Insert statements for procedure here
UPDATE [dbo].[property]
   SET [approx_mrkt_value] = @approx_mrkt_value,
       [address_id] = @address_id, 
       [case_id] = @case_id, 
       [client_id] = @client_id, 
       [Homeowners_Insurance _Payment] = @Homeowners_Insurance_Payment, 
       [monthly_property_payment] = @monthly_property_payment, 
       [mortg_comp] = @mortg_comp, 
       [Property_Tax _Payment] = @Property_Tax_Payment, 
       [own_prop] = @own_prop, 
       [rent_prop] = @rent_prop, 
       [date_purchased] = @date_purchased
 WHERE property_id = @property_id
        
End

GO
/****** Object:  StoredProcedure [dbo].[SP_DMCS_Update_Pvaccine]    Script Date: 3/7/2014 5:04:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Mike Phillips
-- Create date: 3/29/2013
-- Description:	Update Row on pvaccine table
-- =============================================
create PROCEDURE [dbo].[SP_DMCS_Update_Pvaccine]
	-- Add the parameters for the stored procedure here
			
			@Vaccine_Type_ID as int,
			@Vaccine_Name as varchar,
            @Vaccine_Reactions AS text,
            @Vaccine_Type AS text
       
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
  UPDATE [dbo].[Pvaccine]
   SET [Vaccine_Name] = @Vaccine_Name
      ,[Vaccine_Reactions] = @Vaccine_Reactions
      ,[Vaccine_Type] = @Vaccine_Type
 WHERE Pvaccine.Vaccine_Type_ID = @Vaccine_Type_ID
        
End

GO
/****** Object:  StoredProcedure [dbo].[SP_DMCS_Update_Receipt]    Script Date: 3/7/2014 5:04:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		James Miller
-- Create date: 2/28/2013
-- Description:	update Rows on Receipt table
-- =============================================
CREATE PROCEDURE [dbo].[SP_DMCS_Update_Receipt]
	-- Add the parameters for the stored procedure here
	  @Receipt_ID as int,
	  @Account_ID as int,
      @Check_Num as int,
      @DLN as int,
      @Phone as int,
      @Pay_Type as int,
      @Amount as int,
      @Transfer as bit,
      @Recieve as bit
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
if @Receipt_ID = 0
begin
   set @Receipt_ID = null
end

 -- Insert statements for procedure here
UPDATE [dbo].[receipt]
   SET [Account_ID] = @Account_ID,
      [Check_Num] = @Check_Num, 
      [DLN] = @DLN,
      [Phone] = @Phone,
      [Pay_Type] = @Pay_Type,
      [Amount] = @Amount,
      [Transfer] = @Transfer,
      [Recieve] = @Recieve 
      
 WHERE Receipt_ID = @Receipt_ID
 END

GO
/****** Object:  StoredProcedure [dbo].[SP_DMCS_Update_Relative]    Script Date: 3/7/2014 5:04:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Edward Sobanski
-- Create date: 5/22/2012
-- Description:	Update row on relative table
-- =============================================
CREATE PROCEDURE [dbo].[SP_DMCS_Update_Relative]
	-- Add the parameters for the stored procedure here
           
            @relative_id as int,
            @case_id as int,
            @client_id as int,
            @address_id as int,
            @relative_help_memo as text,
            @will_help as char(1)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
IF @client_id = 0
BEGIN
  SET @client_id = NULL
END
   
IF @case_id = 0
BEGIN
  SET @case_id = NULL
END
   
IF @address_id = 0
BEGIN
  SET @address_id = NULL
END
   
    -- Insert statements for procedure here
UPDATE [dbo].[relative]
   SET [case_id] = @case_id,
       [client_id] = @client_id,
       [address_id] = @address_id, 
       [relative_help_memo] = @relative_help_memo, 
       [will_help] = @will_help
 WHERE relative_id = @relative_id
        
End

GO
/****** Object:  StoredProcedure [dbo].[SP_DMCS_Update_Requestor]    Script Date: 3/7/2014 5:04:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Edward Sobanski
-- Create date: 5/22/2012
-- Description:	Update row on Requestor table
-- =============================================
CREATE PROCEDURE [dbo].[SP_DMCS_Update_Requestor]
	-- Add the parameters for the stored procedure here
           @requestorid as int,
           @EncounterID as int,
           @Requestor_Type as char(1),
           @MobilUnitID as int,
           @PersonID as int,
           @AgencyID as int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
IF @EncounterID = 0
BEGIN
  SET @EncounterID = NULL
END
   
IF @MobilUnitID = 0
BEGIN
  SET @MobilUnitID = NULL
END

IF @PersonID = 0
BEGIN
  SET @PersonID = NULL
END

IF @AgencyID = 0
BEGIN
  SET @AgencyID = NULL
END
   
    -- Insert statements for procedure here
UPDATE [dbo].[requestor]
   SET [EncounterID] = @EncounterID,
       [Requestor_Type] = @Requestor_Type, 
       [MobilUnitID] = @MobilUnitID, 
       [PersonID] = @PersonID, 
       [AgencyID] = @AgencyID 
 WHERE requestorid = @requestorid
        
End

GO
/****** Object:  StoredProcedure [dbo].[SP_DMCS_Update_Requestor_Order]    Script Date: 3/7/2014 5:04:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Edward Sobanski
-- Create date: 5/22/2012
-- Description:	Update row on Requestor order table
-- =============================================
CREATE PROCEDURE [dbo].[SP_DMCS_Update_Requestor_Order]
	-- Add the parameters for the stored procedure here
           @OrderID as int,
           @EncounterID as int,
           @OrderPriority as int,
           @OrderNum as int,
           @ShipToAddressID as int,
           @RequestorID as int,
           @OrderDeliveryType as varchar(20),
           @OrderPickUpDate as date
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
IF @EncounterID = 0
BEGIN
  SET @EncounterID = NULL
END
   
IF @ShipToAddressID = 0
BEGIN
  SET @ShipToAddressID = NULL
END
   
IF @RequestorID = 0
BEGIN
  SET @RequestorID = NULL
END
      

    -- Insert statements for procedure here
UPDATE [dbo].[requestor_Order]
   SET [EncounterID] = @EncounterID,
       [OrderPriority] = @OrderPriority, 
       [OrderNum] = @OrderNum, 
       [ShipToAddressID] = @ShipToAddressID,
       [Requestor_ID] = @RequestorID, 
       [OrderDeliveryType] = @OrderDeliveryType, 
       [OrderPickUpDate] = @OrderPickUpDate
 WHERE OrderID = @OrderID
        
End

GO
/****** Object:  StoredProcedure [dbo].[SP_DMCS_Update_Requirements]    Script Date: 3/7/2014 5:04:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Edward Sobanski
-- Create date: 5/22/2012
-- Description:	Update row on Requirements order table
-- =============================================
create PROCEDURE [dbo].[SP_DMCS_Update_Requirements]
	-- Add the parameters for the stored procedure here
          @req_id as int,
          @requirement_desc as varchar(100)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
UPDATE [dbo].[requirements]
   SET [requirement_desc] = @requirement_desc
 WHERE req_id = @req_id
        
End

GO
/****** Object:  StoredProcedure [dbo].[SP_DMCS_Update_Resource]    Script Date: 3/7/2014 5:04:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		James Miller
-- Create date: 2/26/2013
-- Description:	update Rows on Resource table
-- =============================================
CREATE PROCEDURE [dbo].[SP_DMCS_Update_Resource]
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
/****** Object:  StoredProcedure [dbo].[SP_DMCS_Update_Services]    Script Date: 3/7/2014 5:04:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Edward Sobanski
-- Create date: 5/22/2012
-- Description:	Update row on services table
-- =============================================
create PROCEDURE [dbo].[SP_DMCS_Update_Services]
	-- Add the parameters for the stored procedure here

          @service_id as int,
		  @Company as varchar,
		  @service_type as char,
		  @Estimated_Time as date,
		  @Email as varchar,
		  @Phone_Number as int,
		  @Full_Cost as int,
		  @Estimated_Cost as int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
UPDATE [dbo].[services]
   SET [Company] = @Company,
       [service_type] = @service_type,
	   [Estimated_Time] = @Estimated_Time, 
	   [Email] = @Email,
	   [Phone_Number] = @Phone_Number,
	   [Full_Cost] = @Full_Cost,
	   [Estimated_Cost] = @Estimated_Cost
		  
 WHERE service_id = @service_id
        
End

GO
/****** Object:  StoredProcedure [dbo].[SP_DMCS_Update_Shipment]    Script Date: 3/7/2014 5:04:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Edward Sobanski
-- Create date: 5/22/2012
-- Description:	Update row on shipment table
-- =============================================
CREATE PROCEDURE [dbo].[SP_DMCS_Update_Shipment]
	-- Add the parameters for the stored procedure here

           @shipmentid as int,
           @WarehouseID as int,
           @Tracking_Num as varchar(128),
           @Ship_Method as varchar(30),
           @Other as text,
           @OrderRecByID as int,
           @FullOrderReceived as char(1)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
IF @WarehouseID = 0
BEGIN
  SET @WarehouseID = NULL
END
   
   IF @OrderRecByID = 0
BEGIN
  SET @OrderRecByID = NULL
END
   
    -- Insert statements for procedure here
UPDATE [dbo].[Shipment]
   SET [WarehouseID] = @WarehouseID, 
       [Tracking_Num] = @Tracking_Num, 
       [Ship_Method] = @Ship_Method, 
       [Other] = @Other, 
       [OrderRecByID] = @OrderRecByID, 
       [FullOrderReceived] = @FullOrderReceived
 WHERE shipmentid = @shipmentid
 
End

GO
/****** Object:  StoredProcedure [dbo].[SP_DMCS_Update_Tier]    Script Date: 3/7/2014 5:04:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Edward Sobanski
-- Create date: 5/22/2012
-- Description:	Update row on Tier table
-- =============================================
CREATE PROCEDURE [dbo].[SP_DMCS_Update_Tier]
	-- Add the parameters for the stored procedure here

           @tier_id as int,
           @include_req as char(1),
           @campaign_id as int,
           @Tier_Age_Begin_Month as int,
           @Tier_Age_Begin_Year as int,
           @Tier_Age_End_Month as int,
           @Tier_Age_End_Year as int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

IF @campaign_id = 0
BEGIN
  SET @campaign_id = NULL
END
   
    -- Insert statements for procedure here
UPDATE [dbo].[tier]
   SET [include_req] = @include_req, 
       [campaign_id] = @campaign_id, 
       [Tier_Age_Begin_Month] = @Tier_Age_Begin_Month, 
       [Tier_Age_Begin_Year] = @Tier_Age_Begin_Year, 
       [Tier_Age_End_Month] = @Tier_Age_End_Month, 
       [Tier_Age_End_Year] = @Tier_Age_End_Year
 WHERE tier_id = @tier_id
 
End

GO
/****** Object:  StoredProcedure [dbo].[SP_DMCS_Update_Tier_Req]    Script Date: 3/7/2014 5:04:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Edward Sobanski
-- Create date: 5/22/2012
-- Description:	Update row on Tier req table
-- =============================================
CREATE PROCEDURE [dbo].[SP_DMCS_Update_Tier_Req]
	-- Add the parameters for the stored procedure here
             
            @tier_req_id as int,
            @req_id as int,
            @tier_id as int
        
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
IF @req_id = 0
BEGIN
  SET @req_id = NULL
END
   
IF @tier_id = 0
BEGIN
  SET @tier_id = NULL
END
      
    -- Insert statements for procedure here
UPDATE [dbo].[tier_req]
   SET [req_id] = @req_id, 
       [tier_id] = @tier_id
 WHERE tier_req_id = @tier_req_id
 
End

GO
/****** Object:  StoredProcedure [dbo].[SP_DMCS_Update_Transportation]    Script Date: 3/7/2014 5:04:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Edward Sobanski
-- Create date: 5/22/2012
-- Description:	Update row on transportation table
-- =============================================
CREATE PROCEDURE [dbo].[SP_DMCS_Update_Transportation]
	-- Add the parameters for the stored procedure here
             
         @transport_id as int,
         @location_from as varchar(30),
         @location_to as varchar(30),
         @no_of_passangers as int,
         @pickup_date as datetime,
         @trans_type as varchar(3),
         @Vehicle_id as int
        
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

if @Vehicle_id = 0
begin
   set @Vehicle_id = null
end
    -- Insert statements for procedure here
UPDATE [dbo].[transportation]
   SET [transport_id] = @transport_id,
       [location_from] = @location_from,
       [location_to] = @location_to, 
       [no_of_passangers] = @no_of_passangers, 
       [pickup_date] = @pickup_date,
       [trans_type] = @trans_type,
       [Vehicle_id] = @Vehicle_id
 WHERE transport_id = @transport_id
 
End

GO
/****** Object:  StoredProcedure [dbo].[SP_DMCS_Update_Vaccine]    Script Date: 3/7/2014 5:04:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Edward Sobanski
-- Create date: 5/22/2012
-- Description:	Update row on vaccine table
-- =============================================
CREATE PROCEDURE [dbo].[SP_DMCS_Update_Vaccine]
	-- Add the parameters for the stored procedure here
             
            @vaccine_id as int,
            @medicine_id as int,
            @Num_of_reg_doses as int,
            @vaccine_name as varchar(50)
        
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
IF @medicine_id = 0
BEGIN
  SET @medicine_id = NULL
END
   
    -- Insert statements for procedure here
UPDATE [dbo].[vaccine]
   SET [medicine_id] = @medicine_id,
       [Num_of_reg_doses] = @Num_of_reg_doses,
       [vaccine_name] = @vaccine_name
 WHERE vaccine_id = @vaccine_id
 
End

GO
/****** Object:  StoredProcedure [dbo].[SP_DMCS_Update_Vehicle]    Script Date: 3/7/2014 5:04:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Edward Sobanski
-- Create date: 5/22/2012
-- Description:	Update row on vehicle table
-- =============================================
CREATE PROCEDURE [dbo].[SP_DMCS_Update_Vehicle]
	-- Add the parameters for the stored procedure here
             
            @vehicle_id as int,
            @case_id as int,
			@client_id as int,
			@vehicle_make as varchar(15),
            @vehicle_model as varchar(30),
            @vehicle_type as varchar(15),
            @vehicle_year as int,
            @vehicle_desc as varchar(50),
            @vin as varchar(17),
            @start_mileage as int,
            @first_service_date as datetime,
            @last_service_date as datetime,
            @PLATENUMBER as varchar(10),
            @FUELTYPE as char(1),
            @MPH as int,
            @INSURED as char(1)
        
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
IF @case_id = 0
BEGIN
  SET @case_id = NULL
END
   
   IF @client_id = 0
BEGIN
  SET @client_id = NULL
END
   
    -- Insert statements for procedure here
UPDATE [dbo].[vehicle]
   SET [case_id] = @case_id, 
       [client_id] = @client_id, 
       [vehicle_make] = @vehicle_make, 
       [vehicle_model] = @vehicle_model, 
       [vehicle_type] = @vehicle_type,
       [vehicle_year] = @vehicle_year, 
       [vehicle_desc] = @vehicle_desc,
       [vin] = @vin,
       [start_mileage] = @start_mileage,
       [first_service_date] = @first_service_date, 
       [last_service_date] = @last_service_date,
       [PLATENUMBER] = @PLATENUMBER, 
       [FUELTYPE] = @FUELTYPE, 
       [MPH] = @MPH, 
       [INSURED] = @INSURED 
 WHERE vehicle_id = @vehicle_id
 
End

GO
/****** Object:  StoredProcedure [dbo].[SP_DMCS_Update_Vendor]    Script Date: 3/7/2014 5:04:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Edward Sobanski
-- Create date: 5/22/2012
-- Description:	Update row on vendor table
-- =============================================
CREATE PROCEDURE [dbo].[SP_DMCS_Update_Vendor]
	-- Add the parameters for the stored procedure here
             
            @vendor_id as int,
            @vendor_name as varchar(50),
            @phone_num as varchar(11),
            @email as varchar(50),
            @address_id as int,
            @Vendor_address2 as int,
            @vendor_job_assign as varchar(30),
            @vendor_start_date as datetime,
            @vendor_end_date as datetime,
            @vendor_meth_of_contact as char(1),
            @vendor_status as varchar(10),
            @vendor_meth_of_pay as varchar(15),
            @vendor_type as varchar(20),
            @vendor_comments as text
        
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
IF @address_id = 0
BEGIN
  SET @address_id = NULL
END
   
IF @Vendor_address2 = 0
BEGIN
  SET @Vendor_address2 = NULL
END
   
    -- Insert statements for procedure here
UPDATE [dbo].[vendor]
   SET [vendor_name] = @vendor_name, 
       [phone_num] = @phone_num,
       [email] = @email,
       [address_id] = @address_id, 
       [Vendor_address2] = @Vendor_address2,
       [vendor_job_assign] = @vendor_job_assign, 
       [vendor_start_date] = @vendor_start_date, 
       [vendor_end_date] = @vendor_end_date,
       [vendor_meth_of_contact] = @vendor_meth_of_contact, 
       [vendor_status] = @vendor_status, 
       [vendor_meth_of_pay] = @vendor_meth_of_pay, 
       [vendor_type] = @vendor_type, 
       [vendor_comments] = @vendor_comments 
 WHERE vendor_id = @vendor_id 
 
End

GO
/****** Object:  StoredProcedure [dbo].[SP_DMCS_Update_Vendor_Product]    Script Date: 3/7/2014 5:04:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Edward Sobanski
-- Create date: 5/22/2012
-- Description:	Update row on vendor Product table
-- =============================================
CREATE PROCEDURE [dbo].[SP_DMCS_Update_Vendor_Product]
	-- Add the parameters for the stored procedure here
             
            @vendor_prod_id as int,
            @vendor_id as int,
			@product_id as int,
			@product_qty as int,
			@Product_exp_date as bit,
			@lot_id as int
        
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

IF @vendor_id = 0
BEGIN
  SET @vendor_id = NULL
END
   
IF @product_id = 0
BEGIN
  SET @product_id = NULL
END

IF @lot_id = 0
BEGIN
  SET @lot_id = NULL
END
   
    -- Insert statements for procedure here
UPDATE [dbo].[vendor_products]
   SET [vendor_id] = @vendor_id, 
       [product_id] = @product_id, 
       [product_qty] = @product_qty, 
       [Product_exp_date] = @Product_exp_date, 
       [lot_id] = @lot_id
 WHERE vendor_prod_id = @vendor_prod_id 
 
End

GO
/****** Object:  StoredProcedure [dbo].[SP_DMCS_Update_Vendor_Product_Shipment]    Script Date: 3/7/2014 5:04:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Edward Sobanski
-- Create date: 5/22/2012
-- Description:	Update row on vendor Product shipment table
-- =============================================
CREATE PROCEDURE [dbo].[SP_DMCS_Update_Vendor_Product_Shipment]
	-- Add the parameters for the stored procedure here
             
            @PO_Order_no as int,
            @ShipmentID as int,
            @VendorID as int,
            @ProductID as int,
            @Expect_Delivery_Date as datetime,
            @orderdate as datetime,
            @quantity as int,
            @OtherInfo as varchar(100),
            @DateReceived as datetime,
            @AmountReceived as int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
IF @ShipmentID = 0
BEGIN
  SET @ShipmentID = NULL
END

IF @ProductID = 0
BEGIN
  SET @ProductID = NULL
END
   
IF @VendorID = 0
BEGIN
  SET @VendorID = NULL
END
   
    -- Insert statements for procedure here
UPDATE [dbo].[Vendor_Products_shipments]
   SET [ShipmentID] = @ShipmentID, 
       [VendorID] = @VendorID, 
       [ProductID] = @ProductID, 
       [Expect_Delivery_Date] = @Expect_Delivery_Date, 
       [orderdate] = @orderdate, 
       [quantity] = @quantity, 
       [OtherInfo] = @OtherInfo, 
       [DateReceived] = @DateReceived, 
       [AmountReceived] = @AmountReceived
 WHERE PO_Order_no = @PO_Order_no
End

GO
/****** Object:  StoredProcedure [dbo].[SP_DMCS_Update_Warehouse]    Script Date: 3/7/2014 5:04:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		Edward Sobanski
-- Create date: 5/22/2012
-- Description:	Update row on warehouse table
-- =============================================
CREATE PROCEDURE [dbo].[SP_DMCS_Update_Warehouse]
	-- Add the parameters for the stored procedure here
             
            @warehouse_id as int,
            @warehouse_name as varchar(50),
            @address_id as int,
            @warehouse_type as varchar(10),
			@Location_ID as int
            
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
UPDATE [dbo].[warehouse]
   SET [warehouse_name] = @warehouse_name, 
       [address_id] = @address_id,
       [warehouse_type]	= @warehouse_type,
	   [Location_ID] = @Location_ID
 WHERE warehouse_id = @warehouse_id
End


GO
/****** Object:  StoredProcedure [dbo].[SP_DMCS_Update_Warehouse_Product_Location]    Script Date: 3/7/2014 5:04:02 PM ******/
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
	@encounter_id as int,
	@address_id as int
            
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
UPDATE [dbo].[warehouse_product_Location]
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
	   ,[address_id] = @address_id 


 WHERE warehouse_product_location_id = @warehouse_product_location_id
           
End


GO
/****** Object:  StoredProcedure [dbo].[SP_DMCS_Update_Warehouse_Product_Location_QTY]    Script Date: 3/7/2014 5:04:02 PM ******/
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
/****** Object:  StoredProcedure [dbo].[SP_DMCS_Update_Warehouse_Products]    Script Date: 3/7/2014 5:04:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		Edward Sobanski
-- Create date: 5/22/2012
-- Description:	Update row on warehouse products table
-- =============================================
CREATE PROCEDURE [dbo].[SP_DMCS_Update_Warehouse_Products]
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
	@encounter_id as int,
	@address_id as int
            
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
UPDATE [dbo].[warehouse_product_Location]
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
	   ,[address_id] = address_id 
 WHERE warehouse_product_location_id = @warehouse_product_location_id
           
End



GO
/****** Object:  StoredProcedure [dbo].[SP_DMCS_WC_Location_Resources]    Script Date: 3/7/2014 5:04:02 PM ******/
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
/****** Object:  StoredProcedure [dbo].[SP_DMCS_WC_Location_Resources_nonFEMA]    Script Date: 3/7/2014 5:04:02 PM ******/
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
/****** Object:  StoredProcedure [dbo].[SP_DMCS_WC_Location_Resources_Not_In_Warehouse]    Script Date: 3/7/2014 5:04:02 PM ******/
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
/****** Object:  StoredProcedure [dbo].[SP_DMCS_WC_Location_Resources_Warehouse_Inventory]    Script Date: 3/7/2014 5:04:02 PM ******/
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
/*** Mod and New Table creation for Evacation	*/
/*** Date: 4/23/2014							*/
/*** Author/s: ITS 458 - Graduate Students		*/

/*
Mod Changes:	('-' = Droped/'+' = Added)
Disaster_Encounter Table

	- Disaster_Encounter.[Address_ID]
	+ Disaster_Encounter.[Location_ID]

Client Table

	+ Client.[Client_Shelter_ID]
	+ Client.[Emergency_Contact_Name]
	+ Client.[Emergency_Contact_Number]
	+ Client.[Subscribed_Alerts]
*/
/*****************************************************************************/
/*****************************************************************************/
/********************************START MOD************************************/
/*****************************************************************************/
/*****************************************************************************/
DROP TABLE [dbo].[case_client]
DROP TABLE [dbo].[clientWPets]
DROP TABLE [dbo].[debt]
DROP TABLE [dbo].[medical_assistance]
DROP TABLE [dbo].[emergency_medical]
DROP TABLE [dbo].[employee_clients]
DROP TABLE [dbo].[employer]
DROP TABLE [dbo].[disaster_encounter]
DROP TABLE [dbo].[encounter_client_vaccine]
DROP TABLE [dbo].[encounter_services]
DROP TABLE [dbo].[Order_Product]
DROP TABLE [dbo].[requestor_Order]
DROP TABLE [dbo].[requestor]
DROP TABLE [dbo].[warehouse_product_Location]
DROP TABLE [dbo].[encounter]
DROP TABLE [dbo].[expense]
DROP TABLE [dbo].[income_source]
DROP TABLE [dbo].[military]
DROP TABLE [dbo].[property]
DROP TABLE [dbo].[relative]
DROP TABLE [dbo].[mobile_employees]
DROP TABLE [dbo].[Mobile_Product]
DROP TABLE [dbo].[mobile_unit]
DROP TABLE [dbo].[transportation]
DROP TABLE [dbo].[vehicle]
DROP TABLE [dbo].[client]


/****** Object:  Table [dbo].[client]    Script Date: 3/27/2014 1:28:40 PM ******/
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
	[Client_Shelter_ID] [int] NULL,
	[Emergency_Contact_Name] [varchar] (25) NULL,
	[Emergency_Contact_Number] [varchar](11) NULL,
	[Subscribed_Alerts] [char](1) NOT NULL,

 CONSTRAINT [client_client_id_pk] PRIMARY KEY CLUSTERED 
(
	[client_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

ALTER TABLE [dbo].[client]  WITH CHECK ADD  CONSTRAINT [client_person_id_fk] FOREIGN KEY([client_id])
REFERENCES [dbo].[person] ([person_id])
GO

ALTER TABLE [dbo].[client] CHECK CONSTRAINT [client_person_id_fk]
GO




/****** Object:  Table [dbo].[vehicle]    Script Date: 3/27/2014 1:39:52 PM ******/
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



/****** Object:  Table [dbo].[transportation]    Script Date: 3/27/2014 1:40:22 PM ******/
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

ALTER TABLE [dbo].[transportation]  WITH CHECK ADD  CONSTRAINT [FK_transportation_vehicle] FOREIGN KEY([Vehicle_id])
REFERENCES [dbo].[vehicle] ([vehicle_id])
GO

ALTER TABLE [dbo].[transportation] CHECK CONSTRAINT [FK_transportation_vehicle]
GO


/****** Object:  Table [dbo].[mobile_unit]    Script Date: 3/27/2014 1:40:44 PM ******/
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



/****** Object:  Table [dbo].[Mobile_Product]    Script Date: 3/27/2014 1:40:58 PM ******/
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



/****** Object:  Table [dbo].[mobile_employees]    Script Date: 3/27/2014 1:41:07 PM ******/
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



/****** Object:  Table [dbo].[relative]    Script Date: 3/27/2014 1:41:30 PM ******/
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


/****** Object:  Table [dbo].[property]    Script Date: 3/27/2014 1:41:41 PM ******/
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


/****** Object:  Table [dbo].[military]    Script Date: 3/27/2014 1:41:54 PM ******/
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

/****** Object:  Table [dbo].[income_source]    Script Date: 3/27/2014 1:42:19 PM ******/
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


/****** Object:  Table [dbo].[expense]    Script Date: 3/27/2014 1:42:29 PM ******/
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


/****** Object:  Table [dbo].[encounter]    Script Date: 3/27/2014 1:42:49 PM ******/
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


/****** Object:  Table [dbo].[warehouse_product_Location]    Script Date: 3/27/2014 1:42:56 PM ******/
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
	[address_id] [int] NULL,
 CONSTRAINT [warehouse_product_pk] PRIMARY KEY CLUSTERED 
(
	[warehouse_product_location_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

ALTER TABLE [dbo].[warehouse_product_Location]  WITH CHECK ADD  CONSTRAINT [w_p_address_id_fk] FOREIGN KEY([address_id])
REFERENCES [dbo].[address] ([address_id])
GO

ALTER TABLE [dbo].[warehouse_product_Location] CHECK CONSTRAINT [w_p_address_id_fk]
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


/****** Object:  Table [dbo].[requestor]    Script Date: 3/27/2014 1:43:08 PM ******/
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

/****** Object:  Table [dbo].[requestor_Order]    Script Date: 3/27/2014 1:43:14 PM ******/
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
	[Call_In_Order_Description] [varchar](8000) NULL,
 CONSTRAINT [OrderID_pk] PRIMARY KEY CLUSTERED 
(
	[OrderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
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

/****** Object:  Table [dbo].[Order_Product]    Script Date: 3/27/2014 1:43:26 PM ******/
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


/****** Object:  Table [dbo].[encounter_services]    Script Date: 3/27/2014 1:43:43 PM ******/
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


/****** Object:  Table [dbo].[encounter_client_vaccine]    Script Date: 3/27/2014 1:43:55 PM ******/
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

SET ANSI_PADDING OFF
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


/****** Object:  Table [dbo].[disaster_encounter]    Script Date: 3/27/2014 1:44:17 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[disaster_encounter](
	[disaster_encounter_id] [int] IDENTITY(1,1) NOT NULL,
	[disaster_id] [int] NOT NULL,
	[encounter_id] [int] NOT NULL,
	[Address_ID] [int] NULL,
	[location_id] [int] NOT NULL,
 CONSTRAINT [dis_enc_id_pk] PRIMARY KEY CLUSTERED 
(
	[disaster_encounter_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

ALTER TABLE [dbo].[disaster_encounter]  WITH CHECK ADD  CONSTRAINT [disaster_Encounter_Location_id_fk] FOREIGN KEY([Location_id])
REFERENCES [dbo].[Location] ([Location_id])
GO

ALTER TABLE [dbo].[disaster_encounter] CHECK CONSTRAINT [disaster_Encounter_Location_id_fk]
GO

ALTER TABLE [dbo].[disaster_encounter]  WITH CHECK ADD  CONSTRAINT [disaster_Encounter_Address_id_fk] FOREIGN KEY([Address_id])
REFERENCES [dbo].[Address] ([Address_id])
GO

ALTER TABLE [dbo].[disaster_encounter] CHECK CONSTRAINT [disaster_Encounter_Address_id_fk]
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



/****** Object:  Table [dbo].[employer]    Script Date: 3/27/2014 1:44:35 PM ******/
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


/****** Object:  Table [dbo].[employee_clients]    Script Date: 3/27/2014 1:44:45 PM ******/
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


/****** Object:  Table [dbo].[emergency_medical]    Script Date: 3/27/2014 1:45:02 PM ******/
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


/****** Object:  Table [dbo].[medical_assistance]    Script Date: 3/27/2014 1:45:09 PM ******/
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


/****** Object:  Table [dbo].[debt]    Script Date: 3/27/2014 1:45:23 PM ******/
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



/****** Object:  Table [dbo].[ClientWPets]    Script Date: 3/27/2014 1:45:38 PM ******/
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



/****** Object:  Table [dbo].[case_client]    Script Date: 3/27/2014 1:45:46 PM ******/
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












































/****** Object:  StoredProcedure [dbo].[SP_DMCS_Insert_Client]    Script Date: 3/27/2014 2:00:15 PM ******/
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
            @weight as int = Null,
            @skin_color as varchar(15)= null,
            @Info_Field as text = Null,
			@Client_Shelter_ID as int = Null,
			@Emergency_Contact_Name as varchar(15) = Null,
			@Emergency_Contact_Number as varchar (11) = Null,
			@Subscribed_Alerts as char (1)


      
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
INSERT INTO [dbo].[client]
           ([client_id]
           ,[client_status]
           ,[ethnicity]
           ,[eye_color]
           ,[hair_color]
           ,[height]
           ,[picture]
           ,[weight]
           ,[skin_color]
           ,[Info_Field]
		   ,[Client_Shelter_ID]
		   ,[Emergency_Contact_Name]
		   ,[Emergency_Contact_Number]
		   ,[Subscribed_Alerts])
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
            @Info_Field,
			@Client_Shelter_ID,
			@Emergency_Contact_Name ,
			@Emergency_Contact_Number,
			@Subscribed_Alerts)

 End



GO

/****** Object:  StoredProcedure [dbo].[SP_DMCS_Select_Client]    Script Date: 3/27/2014 2:05:19 PM ******/
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
	  ,[Client_Shelter_ID]
	  ,[Emergency_Contact_Name]
	  ,[Emergency_Contact_Number]
	  ,[Subscribed_Alerts]
  FROM [dbo].[client]
  where client_id = @client_id
  
End



GO


/****** Object:  StoredProcedure [dbo].[SP_DMCS_Update_Client]    Script Date: 3/27/2014 2:06:21 PM ******/
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
            @Info_Field as Text = Null,
			@Client_Shelter_ID as int = null,
			@Emergency_Contact_Name as varchar = null,
			@Emergency_Contact_Number as varchar = null,
			@Subscribed_Alerts as char
      
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Update statements for procedure here
Update [dbo].[client]
   Set [client_status] = @client_status,
       [ethnicity] = @ethnicity,
       [eye_color] = @eye_color,
       [hair_color] = @hair_color,
       [height] = @hair_color,
       [picture] = @picture,
       [weight] = @weight,
       [skin_color] = @skin_color,
       [Info_field] = @Info_Field,
	   [Client_Shelter_ID] = @Client_Shelter_ID
  FROM [dbo].[client]
  where client_id = @client_id
  
End



GO


/****** Object:  StoredProcedure [dbo].[SP_DMCS_get_Disaster_EncounterID]    Script Date: 3/31/2014 12:28:58 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Edward Sobanski
-- Create date: 6/1/2013
-- Description:	Select Row on disaster encounter table
-- =============================================
ALTER PROCEDURE [dbo].[SP_DMCS_get_Disaster_EncounterID]
	-- Add the parameters for the stored procedure here
       @disaster_id as int,
       @encounter_id as int,
	   @Address_ID as int,
       @location_id as int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
   SELECT [disaster_encounter_id] 
   FROM [dbo].[disaster_encounter] 
   where ([disaster_id] = @disaster_id or [disaster_id] is null)
     and ([encounter_id] = @encounter_id or [encounter_id] is null) 
     and ([location_id] = @location_id or [location_id] is null)
     and ([Address_ID] = @Address_ID or [Address_ID] is null)
      
End

GO



/****** Object:  StoredProcedure [dbo].[SP_DMCS_Insert_Disaster_Encounter]    Script Date: 3/31/2014 12:29:51 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Edward Sobanski
-- Create date: 5/21/2012
-- Description:	Insert Row on disaster encounter table
-- =============================================
ALTER PROCEDURE [dbo].[SP_DMCS_Insert_Disaster_Encounter]
	-- Add the parameters for the stored procedure here
     
       @disaster_id int,
       @encounter_id int,
	   @Address_ID as int,
       @Location_id int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

if @disaster_id = 0
begin
   set @disaster_id = null
end

if @encounter_id = 0
Begin
   set @encounter_id = Null
end

if @Location_id = 0
begin
   set @Location_id = NULL
end

if @Address_ID = 0
begin
   set @Address_ID = NULL
end


    -- Insert statements for procedure here
INSERT INTO [dbo].[disaster_encounter]
           ([disaster_id]
           ,[encounter_id]
           ,[Location_id]
		   ,[Address_ID])
     VALUES
           (@disaster_id,
            @encounter_id,
            @Location_id,
			@Address_ID)
  
End

GO




/****** Object:  StoredProcedure [dbo].[SP_DMCS_Select_Disaster_Encounter]    Script Date: 3/31/2014 12:30:30 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Edward Sobanski
-- Create date: 5/21/2012
-- Description:	Select Row on disaster encounter table
-- =============================================
ALTER PROCEDURE [dbo].[SP_DMCS_Select_Disaster_Encounter]
	-- Add the parameters for the stored procedure here
       @disaster_encounter_id as int 
       
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
SELECT [disaster_encounter_id]
      ,[disaster_id]
      ,[encounter_id]
      ,[location_id]
	  ,[Address_ID]
  FROM [dbo].[disaster_encounter]
 WHERE disaster_encounter_id = @disaster_encounter_id
  
End

GO




/****** Object:  StoredProcedure [dbo].[SP_DMCS_Update_Disaster_Encounter]    Script Date: 3/31/2014 12:32:09 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Edward Sobanski
-- Create date: 5/21/2012
-- Description:	Update Row on disaster encounter table
-- =============================================
ALTER PROCEDURE [dbo].[SP_DMCS_Update_Disaster_Encounter]
	-- Add the parameters for the stored procedure here
       @disaster_encounter_id as int, 
       @disaster_id int,
       @encounter_id int,
	   @Address_ID int,
       @Location_id int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
if @Location_id = 0
Begin 
   set @Location_id = null
end

if @Address_ID = 0
Begin 
   set @Address_ID = null
end

if @disaster_id = 0
Begin 
   set @disaster_id = null
end

if @encounter_id = 0
Begin 
   set @encounter_id = null
end

    -- Insert statements for procedure here
UPDATE [dbo].[disaster_encounter]
   SET [disaster_id] = @disaster_id,
       [encounter_id] = @encounter_id, 
	   [Address_ID] = @Address_ID,
       [Location_id] = @Location_id
 WHERE disaster_encounter_id = @disaster_encounter_id
  
End

GO


/*****************************************************************************/
/*****************************************************************************/
/*************END OF MOD************************************/
/*****************************************************************************/
/*****************************************************************************/



/*****************************************************************************/
/*****************************************************************************/
/*************CREATE NEW EVACUATION TABLES AND STORED PROCEDURES**************/
/*****************************************************************************/
/*****************************************************************************/
/****** Object:  Table [dbo].[Alert]    Script Date: 4/23/2014 11:58:02 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Alert](
	[Alert_ID] [int] IDENTITY(1,1) NOT NULL,
	[Alert_Message] [varchar](MAX) NOT NULL,
	[Alert_Type] [varchar](15) NOT NULL,
	[Date] [DateTime] NOT NULL,
	[Person_ID] [int] NOT NULL,
 CONSTRAINT [Alert_Alert_ID_pk] PRIMARY KEY CLUSTERED 
(
	[Alert_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] 
GO
SET ANSI_PADDING OFF
GO
/*************************************************/
/****** FK TEMPLATE - NEEDS ACCURATE DATA - ******/
/*************************************************/
/**********    ALTER TABLE [dbo].[THIS_TABLE_NAME]  WITH CHECK ADD  CONSTRAINT [NAME_OF_CONSTRAINT] FOREIGN KEY([FK_ON_THIS_TABLE])    **********/
/**********    REFERENCES [dbo].[OTHER_TABLE_NAME] ([OTHER_TABLE_FK])    **********/
/**********    GO    **********/
/**********    ALTER TABLE [dbo].[THIS_TABLE_NAME] CHECK CONSTRAINT [NAME_OF_CONSTRAINT]    **********/
/**********    GO    **********/
/***********************************************************/
/*************************************************/
/****** - SELECT STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_Select_Alert]    Script Date: 4/23/2014 11:58:02 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_Select_Alert]
           @Alert_ID as [int]
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
SELECT [Alert_ID]
      ,[Alert_Message]
      ,[Alert_Type]
      ,[Date]
      ,[Person_ID]
  FROM [dbo].[Alert]
 WHERE Alert_ID = @Alert_ID
End
GO
/***********************************************************/
/*************************************************/
/****** - INSERT STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_Insert_Alert]    Script Date: 4/23/2014 11:58:02 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_Insert_Alert]
	  @Alert_Message as [varchar](MAX),
	  @Alert_Type as [varchar](15),
	  @Date as [DateTime],
	  @Person_ID as [int]
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	Insert INTO [dbo].[Alert]
           (
            [Alert_Message]
           ,[Alert_Type]
           ,[Date]
           ,[Person_ID]
            )
     VALUES (
            @Alert_Message
           ,@Alert_Type
           ,@Date
           ,@Person_ID
            )
END
GO
/***********************************************************/
/*************************************************/
/****** - GET STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_Get_Alert]    Script Date: 4/23/2014 11:58:02 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_Get_Alert]
		   @Alert_Message as [varchar](MAX),
		   @Alert_Type as [varchar](15),
		   @Date as [DateTime],
		   @Person_ID as [int]
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
    SELECT [Alert_ID] 
      FROM [dbo].[Alert] 
     WHERE [Alert_Message] = @Alert_Message
       AND [Alert_Type] = @Alert_Type
       AND [Date] = @Date
       AND [Person_ID] = @Person_ID
END
GO
/***********************************************************/
/*************************************************/
/****** - UPDATE STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_Update_Alert]    Script Date: 4/23/2014 11:58:02 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_Update_Alert]
	  @Alert_ID as [int],
	  @Alert_Message as [varchar](MAX),
	  @Alert_Type as [varchar](15),
	  @Date as [DateTime],
	  @Person_ID as [int]
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	UPDATE [dbo].[Alert]
       SET
		   [Alert_Message] = @Alert_Message,
		   [Alert_Type] = @Alert_Type,
		   [Date] = @Date,
		   [Person_ID] = @Person_ID
       WHERE Alert_ID = @Alert_ID
END
GO
/***********************************************************/
/*************************************************/
/****** - DELETE STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_Delete_Alert]    Script Date: 4/23/2014 11:58:02 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_Delete_Alert]
	@Alert_ID [int]
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	Delete dbo.Alert
	where Alert_ID = @Alert_ID
END
GO
/***********************************************************/
/*************************************************/
/****** - WHERE CLAUSE STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_Select_Alert_WC]    Script Date: 4/23/2014 11:58:02 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_Select_Alert_WC]
	  @wareclause as varchar(MAX)
AS
Begin
    Declare @string as varchar(MAX)
	Set @string = 'Select * from Alert where ' + @wareclause
	Exec(@string)
END
GO

/***********************************************************************************************************************************/
/****** Object:  Table [dbo].[Client_Shelter]    Script Date: 4/23/2014 11:58:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Client_Shelter](
	[Client_Shelter_ID] [int] IDENTITY(1,1) NOT NULL,
	[Shelter_ID] [int] NOT NULL,
	[Client_ID] [int] NOT NULL,
	[Current_address] [varchar](30) NOT NULL,
	[Current_State] [varchar](3) NOT NULL,
	[Current_City] [varchar](30) NOT NULL,
	[Current_Zip] [int] NOT NULL,
	[Client_registration_status] [varchar](30) NOT NULL,
	[Household_size] [int] NOT NULL,
	[Shelter_supplies] [varchar](30) NULL,
	[Shelter_occupancy_current] [varchar](30) NOT NULL,
	[New_household_registered] [varchar](30) NULL,
	[New_Shelter_address] [varchar](30) NULL,
	[New_Shelter_city] [varchar](30) NULL,
	[New_Shelter_State] [varchar](30) NULL,
	[New_Shelter_Zip] [int] NULL,
	[New_Contact_Number] [int] NULL,
	[Current_household_members_safe] [varchar](30) NULL,
	[CheckIn_Date] [DateTime] NOT NULL,
	[CheckOut_Date] [DateTime] NULL,
 CONSTRAINT [Client_Shelter_Client_Shelter_ID_pk] PRIMARY KEY CLUSTERED 
(
	[Client_Shelter_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] 
GO
SET ANSI_PADDING OFF
GO
/*************************************************/
/****** FK TEMPLATE - NEEDS ACCURATE DATA - ******/
/*************************************************/
/**********    ALTER TABLE [dbo].[THIS_TABLE_NAME]  WITH CHECK ADD  CONSTRAINT [NAME_OF_CONSTRAINT] FOREIGN KEY([FK_ON_THIS_TABLE])    **********/
/**********    REFERENCES [dbo].[OTHER_TABLE_NAME] ([OTHER_TABLE_FK])    **********/
/**********    GO    **********/
/**********    ALTER TABLE [dbo].[THIS_TABLE_NAME] CHECK CONSTRAINT [NAME_OF_CONSTRAINT]    **********/
/**********    GO    **********/
/***********************************************************/
/*************************************************/
/****** - SELECT STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_Select_Client_Shelter]    Script Date: 4/23/2014 11:58:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_Select_Client_Shelter]
           @Client_Shelter_ID as [int]
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
SELECT [Client_Shelter_ID]
      ,[Shelter_ID]
      ,[Client_ID]
      ,[Current_address]
      ,[Current_State]
      ,[Current_City]
      ,[Current_Zip]
      ,[Client_registration_status]
      ,[Household_size]
      ,[Shelter_supplies]
      ,[Shelter_occupancy_current]
      ,[New_household_registered]
      ,[New_Shelter_address]
      ,[New_Shelter_city]
      ,[New_Shelter_State]
      ,[New_Shelter_Zip]
      ,[New_Contact_Number]
      ,[Current_household_members_safe]
      ,[CheckIn_Date]
      ,[CheckOut_Date]
  FROM [dbo].[Client_Shelter]
 WHERE Client_Shelter_ID = @Client_Shelter_ID
End
GO
/***********************************************************/
/*************************************************/
/****** - INSERT STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_Insert_Client_Shelter]    Script Date: 4/23/2014 11:58:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_Insert_Client_Shelter]
	  @Shelter_ID as [int],
	  @Client_ID as [int],
	  @Current_address as [varchar](30),
	  @Current_State as [varchar](3),
	  @Current_City as [varchar](30),
	  @Current_Zip as [int],
	  @Client_registration_status as [varchar](30),
	  @Household_size as [int],
	  @Shelter_supplies as [varchar](30),
	  @Shelter_occupancy_current as [varchar](30),
	  @New_household_registered as [varchar](30),
	  @New_Shelter_address as [varchar](30),
	  @New_Shelter_city as [varchar](30),
	  @New_Shelter_State as [varchar](30),
	  @New_Shelter_Zip as [int],
	  @New_Contact_Number as [int],
	  @Current_household_members_safe as [varchar](30),
	  @CheckIn_Date as [DateTime],
	  @CheckOut_Date as [DateTime]
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	Insert INTO [dbo].[Client_Shelter]
           (
            [Shelter_ID]
           ,[Client_ID]
           ,[Current_address]
           ,[Current_State]
           ,[Current_City]
           ,[Current_Zip]
           ,[Client_registration_status]
           ,[Household_size]
           ,[Shelter_supplies]
           ,[Shelter_occupancy_current]
           ,[New_household_registered]
           ,[New_Shelter_address]
           ,[New_Shelter_city]
           ,[New_Shelter_State]
           ,[New_Shelter_Zip]
           ,[New_Contact_Number]
           ,[Current_household_members_safe]
           ,[CheckIn_Date]
           ,[CheckOut_Date]
            )
     VALUES (
            @Shelter_ID
           ,@Client_ID
           ,@Current_address
           ,@Current_State
           ,@Current_City
           ,@Current_Zip
           ,@Client_registration_status
           ,@Household_size
           ,@Shelter_supplies
           ,@Shelter_occupancy_current
           ,@New_household_registered
           ,@New_Shelter_address
           ,@New_Shelter_city
           ,@New_Shelter_State
           ,@New_Shelter_Zip
           ,@New_Contact_Number
           ,@Current_household_members_safe
           ,@CheckIn_Date
           ,@CheckOut_Date
            )
END
GO
/***********************************************************/
/*************************************************/
/****** - GET STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_Get_Client_Shelter]    Script Date: 4/23/2014 11:58:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_Get_Client_Shelter]
		   @Shelter_ID as [int],
		   @Client_ID as [int],
		   @Current_address as [varchar](30),
		   @Current_State as [varchar](3),
		   @Current_City as [varchar](30),
		   @Current_Zip as [int],
		   @Client_registration_status as [varchar](30),
		   @Household_size as [int],
		   @Shelter_supplies as [varchar](30),
		   @Shelter_occupancy_current as [varchar](30),
		   @New_household_registered as [varchar](30),
		   @New_Shelter_address as [varchar](30),
		   @New_Shelter_city as [varchar](30),
		   @New_Shelter_State as [varchar](30),
		   @New_Shelter_Zip as [int],
		   @New_Contact_Number as [int],
		   @Current_household_members_safe as [varchar](30),
		   @CheckIn_Date as [DateTime],
		   @CheckOut_Date as [DateTime]
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
    SELECT [Client_Shelter_ID] 
      FROM [dbo].[Client_Shelter] 
     WHERE [Shelter_ID] = @Shelter_ID
       AND [Client_ID] = @Client_ID
       AND [Current_address] = @Current_address
       AND [Current_State] = @Current_State
       AND [Current_City] = @Current_City
       AND [Current_Zip] = @Current_Zip
       AND [Client_registration_status] = @Client_registration_status
       AND [Household_size] = @Household_size
       AND [Shelter_supplies] = @Shelter_supplies
       AND [Shelter_occupancy_current] = @Shelter_occupancy_current
       AND [New_household_registered] = @New_household_registered
       AND [New_Shelter_address] = @New_Shelter_address
       AND [New_Shelter_city] = @New_Shelter_city
       AND [New_Shelter_State] = @New_Shelter_State
       AND [New_Shelter_Zip] = @New_Shelter_Zip
       AND [New_Contact_Number] = @New_Contact_Number
       AND [Current_household_members_safe] = @Current_household_members_safe
       AND [CheckIn_Date] = @CheckIn_Date
       AND [CheckOut_Date] = @CheckOut_Date
END
GO
/***********************************************************/
/*************************************************/
/****** - UPDATE STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_Update_Client_Shelter]    Script Date: 4/23/2014 11:58:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_Update_Client_Shelter]
	  @Client_Shelter_ID as [int],
	  @Shelter_ID as [int],
	  @Client_ID as [int],
	  @Current_address as [varchar](30),
	  @Current_State as [varchar](3),
	  @Current_City as [varchar](30),
	  @Current_Zip as [int],
	  @Client_registration_status as [varchar](30),
	  @Household_size as [int],
	  @Shelter_supplies as [varchar](30),
	  @Shelter_occupancy_current as [varchar](30),
	  @New_household_registered as [varchar](30),
	  @New_Shelter_address as [varchar](30),
	  @New_Shelter_city as [varchar](30),
	  @New_Shelter_State as [varchar](30),
	  @New_Shelter_Zip as [int],
	  @New_Contact_Number as [int],
	  @Current_household_members_safe as [varchar](30),
	  @CheckIn_Date as [DateTime],
	  @CheckOut_Date as [DateTime]
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	UPDATE [dbo].[Client_Shelter]
       SET
		   [Shelter_ID] = @Shelter_ID,
		   [Client_ID] = @Client_ID,
		   [Current_address] = @Current_address,
		   [Current_State] = @Current_State,
		   [Current_City] = @Current_City,
		   [Current_Zip] = @Current_Zip,
		   [Client_registration_status] = @Client_registration_status,
		   [Household_size] = @Household_size,
		   [Shelter_supplies] = @Shelter_supplies,
		   [Shelter_occupancy_current] = @Shelter_occupancy_current,
		   [New_household_registered] = @New_household_registered,
		   [New_Shelter_address] = @New_Shelter_address,
		   [New_Shelter_city] = @New_Shelter_city,
		   [New_Shelter_State] = @New_Shelter_State,
		   [New_Shelter_Zip] = @New_Shelter_Zip,
		   [New_Contact_Number] = @New_Contact_Number,
		   [Current_household_members_safe] = @Current_household_members_safe,
		   [CheckIn_Date] = @CheckIn_Date,
		   [CheckOut_Date] = @CheckOut_Date
       WHERE Client_Shelter_ID = @Client_Shelter_ID
END
GO
/***********************************************************/
/*************************************************/
/****** - DELETE STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_Delete_Client_Shelter]    Script Date: 4/23/2014 11:58:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_Delete_Client_Shelter]
	@Client_Shelter_ID [int]
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	Delete dbo.Client_Shelter
	where Client_Shelter_ID = @Client_Shelter_ID
END
GO
/***********************************************************/
/*************************************************/
/****** - WHERE CLAUSE STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_Select_Client_Shelter_WC]    Script Date: 4/23/2014 11:58:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_Select_Client_Shelter_WC]
	  @wareclause as varchar(MAX)
AS
Begin
    Declare @string as varchar(MAX)
	Set @string = 'Select * from Client_Shelter where ' + @wareclause
	Exec(@string)
END
GO

/***********************************************************************************************************************************/

/****** Object:  Table [dbo].[Evacuation_Area]    Script Date: 4/23/2014 11:58:21 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Evacuation_Area](
	[Evacuation_Area_ID] [int] IDENTITY(1,1) NOT NULL,
	[Location_ID] [int] NOT NULL,
 CONSTRAINT [Evacuation_Area_Evacuation_Area_ID_pk] PRIMARY KEY CLUSTERED 
(
	[Evacuation_Area_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] 
GO
SET ANSI_PADDING OFF
GO
/*************************************************/
/****** FK TEMPLATE - NEEDS ACCURATE DATA - ******/
/*************************************************/
/**********    ALTER TABLE [dbo].[THIS_TABLE_NAME]  WITH CHECK ADD  CONSTRAINT [NAME_OF_CONSTRAINT] FOREIGN KEY([FK_ON_THIS_TABLE])    **********/
/**********    REFERENCES [dbo].[OTHER_TABLE_NAME] ([OTHER_TABLE_FK])    **********/
/**********    GO    **********/
/**********    ALTER TABLE [dbo].[THIS_TABLE_NAME] CHECK CONSTRAINT [NAME_OF_CONSTRAINT]    **********/
/**********    GO    **********/
/***********************************************************/
/*************************************************/
/****** - SELECT STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_Select_Evacuation_Area]    Script Date: 4/23/2014 11:58:21 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_Select_Evacuation_Area]
           @Evacuation_Area_ID as [int]
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
SELECT [Evacuation_Area_ID]
      ,[Location_ID]
  FROM [dbo].[Evacuation_Area]
 WHERE Evacuation_Area_ID = @Evacuation_Area_ID
End
GO
/***********************************************************/
/*************************************************/
/****** - INSERT STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_Insert_Evacuation_Area]    Script Date: 4/23/2014 11:58:21 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_Insert_Evacuation_Area]
	  @Location_ID as [int]
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	Insert INTO [dbo].[Evacuation_Area]
           (
            [Location_ID]
            )
     VALUES (
            @Location_ID
            )
END
GO
/***********************************************************/
/*************************************************/
/****** - GET STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_Get_Evacuation_Area]    Script Date: 4/23/2014 11:58:21 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_Get_Evacuation_Area]
		   @Location_ID as [int]
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
    SELECT [Evacuation_Area_ID] 
      FROM [dbo].[Evacuation_Area] 
     WHERE [Location_ID] = @Location_ID
END
GO
/***********************************************************/
/*************************************************/
/****** - UPDATE STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_Update_Evacuation_Area]    Script Date: 4/23/2014 11:58:21 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_Update_Evacuation_Area]
	  @Evacuation_Area_ID as [int],
	  @Location_ID as [int]
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	UPDATE [dbo].[Evacuation_Area]
       SET
		   [Location_ID] = @Location_ID
       WHERE Evacuation_Area_ID = @Evacuation_Area_ID
END
GO
/***********************************************************/
/*************************************************/
/****** - DELETE STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_Delete_Evacuation_Area]    Script Date: 4/23/2014 11:58:21 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_Delete_Evacuation_Area]
	@Evacuation_Area_ID [int]
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	Delete dbo.Evacuation_Area
	where Evacuation_Area_ID = @Evacuation_Area_ID
END
GO
/***********************************************************/
/*************************************************/
/****** - WHERE CLAUSE STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_Select_Evacuation_Area_WC]    Script Date: 4/23/2014 11:58:21 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_Select_Evacuation_Area_WC]
	  @wareclause as varchar(MAX)
AS
Begin
    Declare @string as varchar(MAX)
	Set @string = 'Select * from Evacuation_Area where ' + @wareclause
	Exec(@string)
END
GO

/***********************************************************************************************************************************/

/****** Object:  Table [dbo].[Evacuation_Encounter_Shelter_Client]    Script Date: 4/23/2014 11:58:12 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Evacuation_Encounter_Shelter_Client](
	[Evacuation_Encounter_Shelter_Client_ID] [int] IDENTITY(1,1) NOT NULL,
	[Evacuation_Area_ID] [int] NOT NULL,
	[Encounter_Id] [int] NOT NULL,
	[Start_Date] [DateTime] NOT NULL,
	[End_Date] [DateTime] NULL,
	[Shelter_ID] [int] NOT NULL,
	[Client_ID] [int] NOT NULL,
 CONSTRAINT [Evacuation_Encounter_Shelter_Client_Evacuation_Encounter_Shelter_Client_ID_pk] PRIMARY KEY CLUSTERED 
(
	[Evacuation_Encounter_Shelter_Client_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] 
GO
SET ANSI_PADDING OFF
GO
/*************************************************/
/****** FK TEMPLATE - NEEDS ACCURATE DATA - ******/
/*************************************************/
/**********    ALTER TABLE [dbo].[THIS_TABLE_NAME]  WITH CHECK ADD  CONSTRAINT [NAME_OF_CONSTRAINT] FOREIGN KEY([FK_ON_THIS_TABLE])    **********/
/**********    REFERENCES [dbo].[OTHER_TABLE_NAME] ([OTHER_TABLE_FK])    **********/
/**********    GO    **********/
/**********    ALTER TABLE [dbo].[THIS_TABLE_NAME] CHECK CONSTRAINT [NAME_OF_CONSTRAINT]    **********/
/**********    GO    **********/
/***********************************************************/
/*************************************************/
/****** - SELECT STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_Select_Evacuation_Encounter_Shelter_Client]    Script Date: 4/23/2014 11:58:12 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_Select_Evacuation_Encounter_Shelter_Client]
           @Evacuation_Encounter_Shelter_Client_ID as [int]
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
SELECT [Evacuation_Encounter_Shelter_Client_ID]
      ,[Evacuation_Area_ID]
      ,[Encounter_Id]
      ,[Start_Date]
      ,[End_Date]
      ,[Shelter_ID]
      ,[Client_ID]
  FROM [dbo].[Evacuation_Encounter_Shelter_Client]
 WHERE Evacuation_Encounter_Shelter_Client_ID = @Evacuation_Encounter_Shelter_Client_ID
End
GO
/***********************************************************/
/*************************************************/
/****** - INSERT STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_Insert_Evacuation_Encounter_Shelter_Client]    Script Date: 4/23/2014 11:58:12 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_Insert_Evacuation_Encounter_Shelter_Client]
	  @Evacuation_Area_ID as [int],
	  @Encounter_Id as [int],
	  @Start_Date as [DateTime],
	  @End_Date as [DateTime],
	  @Shelter_ID as [int],
	  @Client_ID as [int]
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	Insert INTO [dbo].[Evacuation_Encounter_Shelter_Client]
           (
            [Evacuation_Area_ID]
           ,[Encounter_Id]
           ,[Start_Date]
           ,[End_Date]
           ,[Shelter_ID]
           ,[Client_ID]
            )
     VALUES (
            @Evacuation_Area_ID
           ,@Encounter_Id
           ,@Start_Date
           ,@End_Date
           ,@Shelter_ID
           ,@Client_ID
            )
END
GO
/***********************************************************/
/*************************************************/
/****** - GET STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_Get_Evacuation_Encounter_Shelter_Client]    Script Date: 4/23/2014 11:58:12 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_Get_Evacuation_Encounter_Shelter_Client]
		   @Evacuation_Area_ID as [int],
		   @Encounter_Id as [int],
		   @Start_Date as [DateTime],
		   @End_Date as [DateTime],
		   @Shelter_ID as [int],
		   @Client_ID as [int]
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
    SELECT [Evacuation_Encounter_Shelter_Client_ID] 
      FROM [dbo].[Evacuation_Encounter_Shelter_Client] 
     WHERE [Evacuation_Area_ID] = @Evacuation_Area_ID
       AND [Encounter_Id] = @Encounter_Id
       AND [Start_Date] = @Start_Date
       AND [End_Date] = @End_Date
       AND [Shelter_ID] = @Shelter_ID
       AND [Client_ID] = @Client_ID
END
GO
/***********************************************************/
/*************************************************/
/****** - UPDATE STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_Update_Evacuation_Encounter_Shelter_Client]    Script Date: 4/23/2014 11:58:12 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_Update_Evacuation_Encounter_Shelter_Client]
	  @Evacuation_Encounter_Shelter_Client_ID as [int],
	  @Evacuation_Area_ID as [int],
	  @Encounter_Id as [int],
	  @Start_Date as [DateTime],
	  @End_Date as [DateTime],
	  @Shelter_ID as [int],
	  @Client_ID as [int]
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	UPDATE [dbo].[Evacuation_Encounter_Shelter_Client]
       SET
		   [Evacuation_Area_ID] = @Evacuation_Area_ID,
		   [Encounter_Id] = @Encounter_Id,
		   [Start_Date] = @Start_Date,
		   [End_Date] = @End_Date,
		   [Shelter_ID] = @Shelter_ID,
		   [Client_ID] = @Client_ID
       WHERE Evacuation_Encounter_Shelter_Client_ID = @Evacuation_Encounter_Shelter_Client_ID
END
GO
/***********************************************************/
/*************************************************/
/****** - DELETE STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_Delete_Evacuation_Encounter_Shelter_Client]    Script Date: 4/23/2014 11:58:12 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_Delete_Evacuation_Encounter_Shelter_Client]
	@Evacuation_Encounter_Shelter_Client_ID [int]
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	Delete dbo.Evacuation_Encounter_Shelter_Client
	where Evacuation_Encounter_Shelter_Client_ID = @Evacuation_Encounter_Shelter_Client_ID
END
GO
/***********************************************************/
/*************************************************/
/****** - WHERE CLAUSE STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_Select_Evacuation_Encounter_Shelter_Client_WC]    Script Date: 4/23/2014 11:58:12 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_Select_Evacuation_Encounter_Shelter_Client_WC]
	  @wareclause as varchar(MAX)
AS
Begin
    Declare @string as varchar(MAX)
	Set @string = 'Select * from Evacuation_Encounter_Shelter_Client where ' + @wareclause
	Exec(@string)
END
GO

/***********************************************************************************************************************************/

/****** Object:  Table [dbo].[Evacuation_Encounter_Shelter_Employee]    Script Date: 4/23/2014 11:58:15 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Evacuation_Encounter_Shelter_Employee](
	[Evacuation_Encounter_Shelter_Employee_ID] [int] IDENTITY(1,1) NOT NULL,
	[Shelter_ID] [int] NOT NULL,
	[Employee_ID] [int] NOT NULL,
	[Evacuation_Area_ID] [int] NULL,
	[Encounter_ID] [int] NOT NULL,
 CONSTRAINT [Evacuation_Encounter_Shelter_Employee_Evacuation_Encounter_Shelter_Employee_ID_pk] PRIMARY KEY CLUSTERED 
(
	[Evacuation_Encounter_Shelter_Employee_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] 
GO
SET ANSI_PADDING OFF
GO
/*************************************************/
/****** FK TEMPLATE - NEEDS ACCURATE DATA - ******/
/*************************************************/
/**********    ALTER TABLE [dbo].[THIS_TABLE_NAME]  WITH CHECK ADD  CONSTRAINT [NAME_OF_CONSTRAINT] FOREIGN KEY([FK_ON_THIS_TABLE])    **********/
/**********    REFERENCES [dbo].[OTHER_TABLE_NAME] ([OTHER_TABLE_FK])    **********/
/**********    GO    **********/
/**********    ALTER TABLE [dbo].[THIS_TABLE_NAME] CHECK CONSTRAINT [NAME_OF_CONSTRAINT]    **********/
/**********    GO    **********/
/***********************************************************/
/*************************************************/
/****** - SELECT STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_Select_Evacuation_Encounter_Shelter_Employee]    Script Date: 4/23/2014 11:58:15 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_Select_Evacuation_Encounter_Shelter_Employee]
           @Evacuation_Encounter_Shelter_Employee_ID as [int]
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
SELECT [Evacuation_Encounter_Shelter_Employee_ID]
      ,[Shelter_ID]
      ,[Employee_ID]
      ,[Evacuation_Area_ID]
      ,[Encounter_ID]
  FROM [dbo].[Evacuation_Encounter_Shelter_Employee]
 WHERE Evacuation_Encounter_Shelter_Employee_ID = @Evacuation_Encounter_Shelter_Employee_ID
End
GO
/***********************************************************/
/*************************************************/
/****** - INSERT STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_Insert_Evacuation_Encounter_Shelter_Employee]    Script Date: 4/23/2014 11:58:15 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_Insert_Evacuation_Encounter_Shelter_Employee]
	  @Shelter_ID as [int],
	  @Employee_ID as [int],
	  @Evacuation_Area_ID as [int],
	  @Encounter_ID as [int]
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	Insert INTO [dbo].[Evacuation_Encounter_Shelter_Employee]
           (
            [Shelter_ID]
           ,[Employee_ID]
           ,[Evacuation_Area_ID]
           ,[Encounter_ID]
            )
     VALUES (
            @Shelter_ID
           ,@Employee_ID
           ,@Evacuation_Area_ID
           ,@Encounter_ID
            )
END
GO
/***********************************************************/
/*************************************************/
/****** - GET STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_Get_Evacuation_Encounter_Shelter_Employee]    Script Date: 4/23/2014 11:58:15 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_Get_Evacuation_Encounter_Shelter_Employee]
		   @Shelter_ID as [int],
		   @Employee_ID as [int],
		   @Evacuation_Area_ID as [int],
		   @Encounter_ID as [int]
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
    SELECT [Evacuation_Encounter_Shelter_Employee_ID] 
      FROM [dbo].[Evacuation_Encounter_Shelter_Employee] 
     WHERE [Shelter_ID] = @Shelter_ID
       AND [Employee_ID] = @Employee_ID
       AND [Evacuation_Area_ID] = @Evacuation_Area_ID
       AND [Encounter_ID] = @Encounter_ID
END
GO
/***********************************************************/
/*************************************************/
/****** - UPDATE STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_Update_Evacuation_Encounter_Shelter_Employee]    Script Date: 4/23/2014 11:58:15 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_Update_Evacuation_Encounter_Shelter_Employee]
	  @Evacuation_Encounter_Shelter_Employee_ID as [int],
	  @Shelter_ID as [int],
	  @Employee_ID as [int],
	  @Evacuation_Area_ID as [int],
	  @Encounter_ID as [int]
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	UPDATE [dbo].[Evacuation_Encounter_Shelter_Employee]
       SET
		   [Shelter_ID] = @Shelter_ID,
		   [Employee_ID] = @Employee_ID,
		   [Evacuation_Area_ID] = @Evacuation_Area_ID,
		   [Encounter_ID] = @Encounter_ID
       WHERE Evacuation_Encounter_Shelter_Employee_ID = @Evacuation_Encounter_Shelter_Employee_ID
END
GO
/***********************************************************/
/*************************************************/
/****** - DELETE STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_Delete_Evacuation_Encounter_Shelter_Employee]    Script Date: 4/23/2014 11:58:15 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_Delete_Evacuation_Encounter_Shelter_Employee]
	@Evacuation_Encounter_Shelter_Employee_ID [int]
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	Delete dbo.Evacuation_Encounter_Shelter_Employee
	where Evacuation_Encounter_Shelter_Employee_ID = @Evacuation_Encounter_Shelter_Employee_ID
END
GO
/***********************************************************/
/*************************************************/
/****** - WHERE CLAUSE STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_Select_Evacuation_Encounter_Shelter_Employee_WC]    Script Date: 4/23/2014 11:58:15 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_Select_Evacuation_Encounter_Shelter_Employee_WC]
	  @wareclause as varchar(MAX)
AS
Begin
    Declare @string as varchar(MAX)
	Set @string = 'Select * from Evacuation_Encounter_Shelter_Employee where ' + @wareclause
	Exec(@string)
END
GO

/***********************************************************************************************************************************/

/****** Object:  Table [dbo].[Inspection_Status]    Script Date: 4/23/2014 11:58:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Inspection_Status](
	[InspectionStatus_ID] [int] IDENTITY(1,1) NOT NULL,
	[Evacuation_Area_ID] [int] NOT NULL,
	[Address_ID] [int] NOT NULL,
	[Inspection_Code] [varchar](30) NULL,
	[Client_Found] [varchar](3) NOT NULL,
	[Client_Found_Status] [varchar](30) NULL,
 CONSTRAINT [Inspection_Status_InspectionStatus_ID_pk] PRIMARY KEY CLUSTERED 
(
	[InspectionStatus_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] 
GO
SET ANSI_PADDING OFF
GO
/*************************************************/
/****** FK TEMPLATE - NEEDS ACCURATE DATA - ******/
/*************************************************/
/**********    ALTER TABLE [dbo].[THIS_TABLE_NAME]  WITH CHECK ADD  CONSTRAINT [NAME_OF_CONSTRAINT] FOREIGN KEY([FK_ON_THIS_TABLE])    **********/
/**********    REFERENCES [dbo].[OTHER_TABLE_NAME] ([OTHER_TABLE_FK])    **********/
/**********    GO    **********/
/**********    ALTER TABLE [dbo].[THIS_TABLE_NAME] CHECK CONSTRAINT [NAME_OF_CONSTRAINT]    **********/
/**********    GO    **********/
/***********************************************************/
/*************************************************/
/****** - SELECT STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_Select_Inspection_Status]    Script Date: 4/23/2014 11:58:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_Select_Inspection_Status]
           @InspectionStatus_ID as [int]
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
SELECT [InspectionStatus_ID]
      ,[Evacuation_Area_ID]
      ,[Address_ID]
      ,[Inspection_Code]
      ,[Client_Found]
      ,[Client_Found_Status]
  FROM [dbo].[Inspection_Status]
 WHERE InspectionStatus_ID = @InspectionStatus_ID
End
GO
/***********************************************************/
/*************************************************/
/****** - INSERT STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_Insert_Inspection_Status]    Script Date: 4/23/2014 11:58:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_Insert_Inspection_Status]
	  @Evacuation_Area_ID as [int],
	  @Address_ID as [int],
	  @Inspection_Code as [varchar](30),
	  @Client_Found as [varchar](3),
	  @Client_Found_Status as [varchar](30)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	Insert INTO [dbo].[Inspection_Status]
           (
            [Evacuation_Area_ID]
           ,[Address_ID]
           ,[Inspection_Code]
           ,[Client_Found]
           ,[Client_Found_Status]
            )
     VALUES (
            @Evacuation_Area_ID
           ,@Address_ID
           ,@Inspection_Code
           ,@Client_Found
           ,@Client_Found_Status
            )
END
GO
/***********************************************************/
/*************************************************/
/****** - GET STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_Get_Inspection_Status]    Script Date: 4/23/2014 11:58:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_Get_Inspection_Status]
		   @Evacuation_Area_ID as [int],
		   @Address_ID as [int],
		   @Inspection_Code as [varchar](30),
		   @Client_Found as [varchar](3),
		   @Client_Found_Status as [varchar](30)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
    SELECT [InspectionStatus_ID] 
      FROM [dbo].[Inspection_Status] 
     WHERE [Evacuation_Area_ID] = @Evacuation_Area_ID
       AND [Address_ID] = @Address_ID
       AND [Inspection_Code] = @Inspection_Code
       AND [Client_Found] = @Client_Found
       AND [Client_Found_Status] = @Client_Found_Status
END
GO
/***********************************************************/
/*************************************************/
/****** - UPDATE STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_Update_Inspection_Status]    Script Date: 4/23/2014 11:58:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_Update_Inspection_Status]
	  @InspectionStatus_ID as [int],
	  @Evacuation_Area_ID as [int],
	  @Address_ID as [int],
	  @Inspection_Code as [varchar](30),
	  @Client_Found as [varchar](3),
	  @Client_Found_Status as [varchar](30)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	UPDATE [dbo].[Inspection_Status]
       SET
		   [Evacuation_Area_ID] = @Evacuation_Area_ID,
		   [Address_ID] = @Address_ID,
		   [Inspection_Code] = @Inspection_Code,
		   [Client_Found] = @Client_Found,
		   [Client_Found_Status] = @Client_Found_Status
       WHERE InspectionStatus_ID = @InspectionStatus_ID
END
GO
/***********************************************************/
/*************************************************/
/****** - DELETE STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_Delete_Inspection_Status]    Script Date: 4/23/2014 11:58:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_Delete_Inspection_Status]
	@InspectionStatus_ID [int]
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	Delete dbo.Inspection_Status
	where InspectionStatus_ID = @InspectionStatus_ID
END
GO
/***********************************************************/
/*************************************************/
/****** - WHERE CLAUSE STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_Select_Inspection_Status_WC]    Script Date: 4/23/2014 11:58:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_Select_Inspection_Status_WC]
	  @wareclause as varchar(MAX)
AS
Begin
    Declare @string as varchar(MAX)
	Set @string = 'Select * from Inspection_Status where ' + @wareclause
	Exec(@string)
END
GO

/***********************************************************************************************************************************/

/****** Object:  Table [dbo].[Obstruction]    Script Date: 4/23/2014 11:58:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Obstruction](
	[Obstruction_ID] [int] IDENTITY(1,1) NOT NULL,
	[Evacuation_Area_ID] [int] NOT NULL,
	[Location_ID] [int] NOT NULL,
	[Date_Reported] [DateTime] NOT NULL,
	[Expected_Recovery_Date] [DateTime] NULL,
	[Type] [varchar](15) NOT NULL,
	[Severity] [varchar](15) NOT NULL,
 CONSTRAINT [Obstruction_Obstruction_ID_pk] PRIMARY KEY CLUSTERED 
(
	[Obstruction_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] 
GO
SET ANSI_PADDING OFF
GO
/*************************************************/
/****** FK TEMPLATE - NEEDS ACCURATE DATA - ******/
/*************************************************/
/**********    ALTER TABLE [dbo].[THIS_TABLE_NAME]  WITH CHECK ADD  CONSTRAINT [NAME_OF_CONSTRAINT] FOREIGN KEY([FK_ON_THIS_TABLE])    **********/
/**********    REFERENCES [dbo].[OTHER_TABLE_NAME] ([OTHER_TABLE_FK])    **********/
/**********    GO    **********/
/**********    ALTER TABLE [dbo].[THIS_TABLE_NAME] CHECK CONSTRAINT [NAME_OF_CONSTRAINT]    **********/
/**********    GO    **********/
/***********************************************************/
/*************************************************/
/****** - SELECT STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_Select_Obstruction]    Script Date: 4/23/2014 11:58:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_Select_Obstruction]
           @Obstruction_ID as [int]
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
SELECT [Obstruction_ID]
      ,[Evacuation_Area_ID]
      ,[Location_ID]
      ,[Date_Reported]
      ,[Expected_Recovery_Date]
      ,[Type]
      ,[Severity]
  FROM [dbo].[Obstruction]
 WHERE Obstruction_ID = @Obstruction_ID
End
GO
/***********************************************************/
/*************************************************/
/****** - INSERT STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_Insert_Obstruction]    Script Date: 4/23/2014 11:58:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_Insert_Obstruction]
	  @Evacuation_Area_ID as [int],
	  @Location_ID as [int],
	  @Date_Reported as [DateTime],
	  @Expected_Recovery_Date as [DateTime],
	  @Type as [varchar](15),
	  @Severity as [varchar](15)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	Insert INTO [dbo].[Obstruction]
           (
            [Evacuation_Area_ID]
           ,[Location_ID]
           ,[Date_Reported]
           ,[Expected_Recovery_Date]
           ,[Type]
           ,[Severity]
            )
     VALUES (
            @Evacuation_Area_ID
           ,@Location_ID
           ,@Date_Reported
           ,@Expected_Recovery_Date
           ,@Type
           ,@Severity
            )
END
GO
/***********************************************************/
/*************************************************/
/****** - GET STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_Get_Obstruction]    Script Date: 4/23/2014 11:58:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_Get_Obstruction]
		   @Evacuation_Area_ID as [int],
		   @Location_ID as [int],
		   @Date_Reported as [DateTime],
		   @Expected_Recovery_Date as [DateTime],
		   @Type as [varchar](15),
		   @Severity as [varchar](15)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
    SELECT [Obstruction_ID] 
      FROM [dbo].[Obstruction] 
     WHERE [Evacuation_Area_ID] = @Evacuation_Area_ID
       AND [Location_ID] = @Location_ID
       AND [Date_Reported] = @Date_Reported
       AND [Expected_Recovery_Date] = @Expected_Recovery_Date
       AND [Type] = @Type
       AND [Severity] = @Severity
END
GO
/***********************************************************/
/*************************************************/
/****** - UPDATE STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_Update_Obstruction]    Script Date: 4/23/2014 11:58:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_Update_Obstruction]
	  @Obstruction_ID as [int],
	  @Evacuation_Area_ID as [int],
	  @Location_ID as [int],
	  @Date_Reported as [DateTime],
	  @Expected_Recovery_Date as [DateTime],
	  @Type as [varchar](15),
	  @Severity as [varchar](15)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	UPDATE [dbo].[Obstruction]
       SET
		   [Evacuation_Area_ID] = @Evacuation_Area_ID,
		   [Location_ID] = @Location_ID,
		   [Date_Reported] = @Date_Reported,
		   [Expected_Recovery_Date] = @Expected_Recovery_Date,
		   [Type] = @Type,
		   [Severity] = @Severity
       WHERE Obstruction_ID = @Obstruction_ID
END
GO
/***********************************************************/
/*************************************************/
/****** - DELETE STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_Delete_Obstruction]    Script Date: 4/23/2014 11:58:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_Delete_Obstruction]
	@Obstruction_ID [int]
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	Delete dbo.Obstruction
	where Obstruction_ID = @Obstruction_ID
END
GO
/***********************************************************/
/*************************************************/
/****** - WHERE CLAUSE STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_Select_Obstruction_WC]    Script Date: 4/23/2014 11:58:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_Select_Obstruction_WC]
	  @wareclause as varchar(MAX)
AS
Begin
    Declare @string as varchar(MAX)
	Set @string = 'Select * from Obstruction where ' + @wareclause
	Exec(@string)
END
GO

/***********************************************************************************************************************************/

/****** Object:  Table [dbo].[Shelter]    Script Date: 4/23/2014 11:58:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Shelter](
	[Shelter_ID] [int] IDENTITY(1,1) NOT NULL,
	[Address_ID] [int] NOT NULL,
	[Shelter_Type] [varchar](15) NOT NULL,
	[Max_Capacity] [int] NOT NULL,
	[AllowsPets] [varchar](3) NOT NULL,
 CONSTRAINT [Shelter_Shelter_ID_pk] PRIMARY KEY CLUSTERED 
(
	[Shelter_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] 
GO
SET ANSI_PADDING OFF
GO
/*************************************************/
/****** FK TEMPLATE - NEEDS ACCURATE DATA - ******/
/*************************************************/
/**********    ALTER TABLE [dbo].[THIS_TABLE_NAME]  WITH CHECK ADD  CONSTRAINT [NAME_OF_CONSTRAINT] FOREIGN KEY([FK_ON_THIS_TABLE])    **********/
/**********    REFERENCES [dbo].[OTHER_TABLE_NAME] ([OTHER_TABLE_FK])    **********/
/**********    GO    **********/
/**********    ALTER TABLE [dbo].[THIS_TABLE_NAME] CHECK CONSTRAINT [NAME_OF_CONSTRAINT]    **********/
/**********    GO    **********/
/***********************************************************/
/*************************************************/
/****** - SELECT STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_Select_Shelter]    Script Date: 4/23/2014 11:58:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_Select_Shelter]
           @Shelter_ID as [int]
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
SELECT [Shelter_ID]
      ,[Address_ID]
      ,[Shelter_Type]
      ,[Max_Capacity]
      ,[AllowsPets]
  FROM [dbo].[Shelter]
 WHERE Shelter_ID = @Shelter_ID
End
GO
/***********************************************************/
/*************************************************/
/****** - INSERT STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_Insert_Shelter]    Script Date: 4/23/2014 11:58:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_Insert_Shelter]
	  @Address_ID as [int],
	  @Shelter_Type as [varchar](15),
	  @Max_Capacity as [int],
	  @AllowsPets as [varchar](3)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	Insert INTO [dbo].[Shelter]
           (
            [Address_ID]
           ,[Shelter_Type]
           ,[Max_Capacity]
           ,[AllowsPets]
            )
     VALUES (
            @Address_ID
           ,@Shelter_Type
           ,@Max_Capacity
           ,@AllowsPets
            )
END
GO
/***********************************************************/
/*************************************************/
/****** - GET STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_Get_Shelter]    Script Date: 4/23/2014 11:58:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_Get_Shelter]
		   @Address_ID as [int],
		   @Shelter_Type as [varchar](15),
		   @Max_Capacity as [int],
		   @AllowsPets as [varchar](3)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
    SELECT [Shelter_ID] 
      FROM [dbo].[Shelter] 
     WHERE [Address_ID] = @Address_ID
       AND [Shelter_Type] = @Shelter_Type
       AND [Max_Capacity] = @Max_Capacity
       AND [AllowsPets] = @AllowsPets
END
GO
/***********************************************************/
/*************************************************/
/****** - UPDATE STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_Update_Shelter]    Script Date: 4/23/2014 11:58:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_Update_Shelter]
	  @Shelter_ID as [int],
	  @Address_ID as [int],
	  @Shelter_Type as [varchar](15),
	  @Max_Capacity as [int],
	  @AllowsPets as [varchar](3)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	UPDATE [dbo].[Shelter]
       SET
		   [Address_ID] = @Address_ID,
		   [Shelter_Type] = @Shelter_Type,
		   [Max_Capacity] = @Max_Capacity,
		   [AllowsPets] = @AllowsPets
       WHERE Shelter_ID = @Shelter_ID
END
GO
/***********************************************************/
/*************************************************/
/****** - DELETE STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_Delete_Shelter]    Script Date: 4/23/2014 11:58:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_Delete_Shelter]
	@Shelter_ID [int]
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	Delete dbo.Shelter
	where Shelter_ID = @Shelter_ID
END
GO
/***********************************************************/
/*************************************************/
/****** - WHERE CLAUSE STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_Select_Shelter_WC]    Script Date: 4/23/2014 11:58:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_Select_Shelter_WC]
	  @wareclause as varchar(MAX)
AS
Begin
    Declare @string as varchar(MAX)
	Set @string = 'Select * from Shelter where ' + @wareclause
	Exec(@string)
END
GO

/***********************************************************************************************************************************/



/*****************************************************************************/
/*****************************************************************************/
/*****************************ATTACH FKs**************************************/
/*****************************************************************************/
/*****************************************************************************/

--------------
--------------[Evacuation_Encounter_Shelter_Employee]
--------------
ALTER TABLE [dbo].[Evacuation_Encounter_Shelter_Employee]  WITH CHECK ADD  CONSTRAINT [Evacuation_Encounter_Shelter_Employee_Shelter_id_fk] FOREIGN KEY([Shelter_ID])
REFERENCES [dbo].[Shelter] ([Shelter_ID])
ALTER TABLE [dbo].[Evacuation_Encounter_Shelter_Employee] CHECK CONSTRAINT [Evacuation_Encounter_Shelter_Employee_Shelter_id_fk]
GO

ALTER TABLE [dbo].[Evacuation_Encounter_Shelter_Employee]  WITH CHECK ADD  CONSTRAINT [Evacuation_Encounter_Shelter_Employee_Employee_id_fk] FOREIGN KEY([Employee_ID])
REFERENCES [dbo].[Employee] ([Employee_ID])
ALTER TABLE [dbo].[Evacuation_Encounter_Shelter_Employee] CHECK CONSTRAINT [Evacuation_Encounter_Shelter_Employee_Employee_id_fk]
GO

ALTER TABLE [dbo].[Evacuation_Encounter_Shelter_Employee]  WITH CHECK ADD  CONSTRAINT [Evacuation_Encounter_Shelter_Employee_Evacuation_Area_id_fk] FOREIGN KEY([Evacuation_Area_ID])
REFERENCES [dbo].[Evacuation_Area] ([Evacuation_Area_ID])
ALTER TABLE [dbo].[Evacuation_Encounter_Shelter_Employee] CHECK CONSTRAINT [Evacuation_Encounter_Shelter_Employee_Evacuation_Area_id_fk]
GO

ALTER TABLE [dbo].[Evacuation_Encounter_Shelter_Employee]  WITH CHECK ADD  CONSTRAINT [Evacuation_Encounter_Shelter_Employee_Encounter_id_fk] FOREIGN KEY([Encounter_ID])
REFERENCES [dbo].[Encounter] ([Encounter_ID])
ALTER TABLE [dbo].[Evacuation_Encounter_Shelter_Employee] CHECK CONSTRAINT [Evacuation_Encounter_Shelter_Employee_Encounter_id_fk]
GO
--------------
--------------[Alert]
--------------
ALTER TABLE [dbo].[Alert]  WITH CHECK ADD  CONSTRAINT [Alert_Person_id_fk] FOREIGN KEY([person_ID])
REFERENCES [dbo].[person] ([person_ID])
ALTER TABLE [dbo].[Alert] CHECK CONSTRAINT [Alert_Person_id_fk]
GO
--------------
--------------[Client_Shelter]
--------------
ALTER TABLE [dbo].[Client_Shelter]  WITH CHECK ADD  CONSTRAINT [Client_Shelter_Client_id_fk] FOREIGN KEY([Client_ID])
REFERENCES [dbo].[Client] ([Client_ID])
ALTER TABLE [dbo].[Client_Shelter] CHECK CONSTRAINT [Client_Shelter_Client_id_fk]
GO

ALTER TABLE [dbo].[Client_Shelter]  WITH CHECK ADD  CONSTRAINT [Client_Shelter_Shelter_id_fk] FOREIGN KEY([Shelter_ID])
REFERENCES [dbo].[Shelter] ([Shelter_ID])
ALTER TABLE [dbo].[Client_Shelter] CHECK CONSTRAINT [Client_Shelter_Shelter_id_fk]
GO
--------------
--------------[Evacuation_Encounter_Shelter_Client]
--------------
ALTER TABLE [dbo].[Evacuation_Encounter_Shelter_Client]  WITH CHECK ADD CONSTRAINT [Evacuation_Encounter_Encounter_fk] FOREIGN KEY(Encounter_ID) 
REFERENCES [dbo].[Encounter] ([Encounter_ID])
ALTER TABLE [dbo].[Evacuation_Encounter_Shelter_Client]  CHECK CONSTRAINT [Evacuation_Encounter_Encounter_fk]
GO

ALTER TABLE [dbo].[Evacuation_Encounter_Shelter_Client]  WITH CHECK ADD CONSTRAINT [Evacuation_Encounter_Encounter_ID_fk] FOREIGN KEY(Evacuation_Area_ID) 
REFERENCES [dbo].[Evacuation_Area] ([Evacuation_Area_ID])
ALTER TABLE [dbo].[Evacuation_Encounter_Shelter_Client]  CHECK CONSTRAINT [Evacuation_Encounter_Encounter_ID_fk]
GO

ALTER TABLE [dbo].[Evacuation_Encounter_Shelter_Client]  WITH CHECK ADD CONSTRAINT [Evacuation_Encounter_Shelter_ID_fk] FOREIGN KEY(Shelter_ID) 
REFERENCES [dbo].[Shelter] ([Shelter_ID])
ALTER TABLE [dbo].[Evacuation_Encounter_Shelter_Client]  CHECK CONSTRAINT [Evacuation_Encounter_Shelter_ID_fk]
GO

ALTER TABLE [dbo].[Evacuation_Encounter_Shelter_Client]  WITH CHECK ADD CONSTRAINT [Evacuation_Encounter_Client_ID_fk] FOREIGN KEY(Client_ID) 
REFERENCES [dbo].Client  ([Client_ID])
ALTER TABLE [dbo].[Evacuation_Encounter_Shelter_Client]  CHECK CONSTRAINT [Evacuation_Encounter_Client_ID_fk]
GO
--------------
--------------[Evacuation_Area]
--------------
ALTER TABLE [dbo].Evacuation_Area WITH CHECK ADD CONSTRAINT FK_Evacuation_Area_Location_ID FOREIGN KEY (Location_ID)
REFERENCES [dbo].Location (Location_ID)   
GO

--------------
--------------[Inspection_Status]
--------------
ALTER TABLE [dbo].[Inspection_Status]  WITH CHECK ADD  CONSTRAINT [Inspection_Status_address_ID_fk] FOREIGN KEY([Address_ID])
REFERENCES [dbo].[ADDRESS] ([Address_ID])
GO

ALTER TABLE [dbo].[Inspection_Status]  WITH CHECK ADD  CONSTRAINT [Inspection_Status_Evacuation_Area_ID_fk] FOREIGN KEY([Evacuation_Area_ID])
REFERENCES [dbo].[Evacuation_Area] ([Evacuation_Area_ID])
GO
--------------
--------------[shelter]
--------------
Alter TAble [dbo].[shelter] with check add constraint [fk_shelter_address_ID] foreign key ([Address_ID])
References [dbo].[address] ([address_ID])
Alter Table [dbo].[shelter] check constraint [fk_shelter_address_ID]
Go
--------------
--------------[Obstruction]
--------------
ALTER TABLE [dbo].[Obstruction]
WITH CHECK ADD CONSTRAINT FK_Obstruction_Evacuation_Area_ID FOREIGN KEY (Evacuation_Area_ID)
REFERENCES [dbo].Evacuation_Area (Evacuation_Area_ID)
GO

ALTER TABLE [dbo].[Obstruction]
WITH CHECK ADD CONSTRAINT FK_Obstruction_Location_ID FOREIGN KEY (Location_ID)
REFERENCES [dbo].Location (Location_ID)
GO