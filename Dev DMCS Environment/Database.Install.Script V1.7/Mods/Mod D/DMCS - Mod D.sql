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

BEGIN TRANSACTION 

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


COMMIT