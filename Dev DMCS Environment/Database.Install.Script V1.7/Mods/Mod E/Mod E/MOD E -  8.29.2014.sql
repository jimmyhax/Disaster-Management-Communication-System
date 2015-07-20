/*** Mod E (Recreation Mod)	*/
/*** datetime: 7/14/2014							*/
/*** Author/s:  James Miller		*/

/*
	Missing	
Add:
Relationship: Missing.Missing_ID -> Client.Client_ID

	Deceased
Delete:
Relationship: Deceased.Coroner_ID -> Person.Person_ID
Object: Coroner
	Add:
		Relationship: Deceased.Deceased_ID -> Client.Client_ID
	campaign – medicine – vaccine
Delete: 
Object: campaign.medicine_ID
Relationship: Medicine.medicine_ID -> Campaign.medicine_ID
Add:
Object: Medicine.campaign_ID
Relationship: Campaign. campaign_ID -> Medicine.campaign_ID
	Disaster_Encounter – Location – Address
Delete:
Object: Disaster_Encounter.Address_ID
Relationship: Disaster_Encounter.Address_ID -> Address.address_ID
	Encounter_client_vaccine
Rename:
	Object: medicine to Current_Client_Medicine
	Pet – Pet_Deceased - Pet_Missing
Delete:
	Objects: Pet.Pet_Deceased_ID and Pet.Pet_Missing_ID
	Relationships: Pet.Pet_Deceased_ID -> Pet_Deceased.Pet_Deceased_ID 
    And Pet.Pet_Missing -> Pet_Missing.Pet_Missing_ID
Add: 
	Relationships: Pet.Pet_ID -> Pet_Deceased.Pet_Deceased_ID 
    And Pet.Pet_ID -> Pet_Missing.Pet_Missing_ID
	Pet – Pet_Vaccine
Delete:
	Object: Pet.Medical_ID and Pet_Vaccine.Pet_Record
	Relationship: Pet.Pet_Record_ID -> Pet_Vaccine.Pet_Record_ID  
Add:
	Relationship: Pet.Pet_Vaccine_ID -> Pet_Vaccine.Pet_Vaccine_ID
(delete Pvaccine table??)
	Services – all subtypes
Add:
	Relationships: 
Job.Job_ID = PK/FK Service.service_ID
Medicine.Medicine_ID = PK/FK Service.service_ID
Emergency_Medical_ID = PK/FK Service.service_ID
Transportation.Transportation_ID = PK/FK Service.service_ID
House.House_ID = PK/FK Service.service_ID
Food.Food_ID = PK/FK Service.service_ID
	Property – Case_Client – Case_Intake
Delete:
	Relationship: Property.Case_ID -> Case_Intake.Case_ID
		Products - Fema
Delete:
	Object: Products.FEMA_ID 
	Relationship: Products.FEMA_ID -> FEMA.FEMA_ID

Add:
	Relationships: Products.Product_ID -> FEMA.FEMA_ID 
	Case_Client
Delete:
	Relationship: Case_Client.Case_ID -> Case_Client.Case_ID
		  And Case_Client.Client_ID -> Case_Client.Client_ID
Dustins request- 
Products
	Product_exp_date = datetime
	Prod_Barcode = varcar max
	Fix GPS

*/
/*****************************************************************************/
/*****************************************************************************/
/******************************START MOD E************************************/
/*****************************************************************************/
/*****************************************************************************/

















/***********************************************************************/
ALTER TABLE [dbo].[tier_req] DROP CONSTRAINT [tier_id_fk]
GO

ALTER TABLE [dbo].[tier_req] DROP CONSTRAINT [t_req_id_fk]
GO

/****** Object:  Table [dbo].[tier_req]    Script datetime: 7/14/2014 12:08:49 PM ******/
DROP TABLE [dbo].[tier_req]
GO
ALTER TABLE [dbo].[tier] DROP CONSTRAINT [tier_campaign_id]
GO

/****** Object:  Table [dbo].[tier]    Script datetime: 7/14/2014 12:07:12 PM ******/
DROP TABLE [dbo].[tier]
GO
ALTER TABLE [dbo].[campaign] DROP CONSTRAINT [campaign_vaccine_id_fk]
GO

/****** Object:  Table [dbo].[campaign]    Script datetime: 7/14/2014 12:05:25 PM ******/
DROP TABLE [dbo].[campaign]
GO

/*********************************************************************************************/
ALTER TABLE [dbo].[medical_assistance] DROP CONSTRAINT [med_ass_em_id_fk]
GO

ALTER TABLE [dbo].[medical_assistance] DROP CONSTRAINT [med_ass_doc_id_fk]
GO

/****** Object:  Table [dbo].[medical_assistance]    Script datetime: 7/14/2014 12:31:34 PM ******/
DROP TABLE [dbo].[medical_assistance]
GO

ALTER TABLE [dbo].[emergency_medical] DROP CONSTRAINT [emer_med_driver_id_fk]
GO

ALTER TABLE [dbo].[emergency_medical] DROP CONSTRAINT [emer_med_doctor_id_fk]
GO

ALTER TABLE [dbo].[emergency_medical] DROP CONSTRAINT [emer_med_deceased_id_fk]
GO

ALTER TABLE [dbo].[emergency_medical] DROP CONSTRAINT [emer_med_client_id_fk]
GO

/****** Object:  Table [dbo].[emergency_medical]    Script datetime: 7/14/2014 12:30:19 PM ******/
DROP TABLE [dbo].[emergency_medical]
GO

ALTER TABLE [dbo].[deceased] DROP CONSTRAINT [deceased_coroner_id_fk]
GO

/****** Object:  Table [dbo].[deceased]    Script datetime: 7/14/2014 12:27:21 PM ******/
DROP TABLE [dbo].[deceased]
GO
/*********************************************************************************************/
ALTER TABLE [dbo].[disaster_encounter] DROP CONSTRAINT [disaster_Encounter_Location_id_fk]
GO

ALTER TABLE [dbo].[disaster_encounter] DROP CONSTRAINT [disaster_Encounter_Address_id_fk]
GO

ALTER TABLE [dbo].[disaster_encounter] DROP CONSTRAINT [dis_enc_id_fk]
GO

ALTER TABLE [dbo].[disaster_encounter] DROP CONSTRAINT [dis_dis_id_fk]
GO

/****** Object:  Table [dbo].[disaster_encounter]    Script datetime: 7/14/2014 12:35:41 PM ******/
DROP TABLE [dbo].[disaster_encounter]
GO
/*********************************************************************************************/
ALTER TABLE [dbo].[encounter_client_vaccine] DROP CONSTRAINT [encntr_clnt_vac_vaccine_id_fk]
GO

ALTER TABLE [dbo].[encounter_client_vaccine] DROP CONSTRAINT [encntr_clnt_vac_encounter_id_fk]
GO

/****** Object:  Table [dbo].[encounter_client_vaccine]    Script datetime: 7/14/2014 12:43:57 PM ******/
DROP TABLE [dbo].[encounter_client_vaccine]
GO

/*********************************************************************************************/
ALTER TABLE [dbo].[Pet_Vaccine] DROP CONSTRAINT [Pets_vaccine_type_id_fk]
GO

ALTER TABLE [dbo].[Pet_Vaccine] DROP CONSTRAINT [Pets_pet_record_id_fk]
GO

/****** Object:  Table [dbo].[Pet_Vaccine]    Script datetime: 7/14/2014 1:09:20 PM ******/
DROP TABLE [dbo].[Pet_Vaccine]
GO

DROP TABLE [dbo].[Pvaccine]
GO

ALTER TABLE [dbo].[warehouse_product_Location] DROP CONSTRAINT [w_p_warehouse_id_fk]
GO

ALTER TABLE [dbo].[warehouse_product_Location] DROP CONSTRAINT [w_p_service_id_fk]
GO

ALTER TABLE [dbo].[warehouse_product_Location] DROP CONSTRAINT [w_p_product_id_fk]
GO

ALTER TABLE [dbo].[warehouse_product_Location] DROP CONSTRAINT [w_p_Location_id_fk]
GO

ALTER TABLE [dbo].[warehouse_product_Location] DROP CONSTRAINT [w_p_Encounter_id_fk]
GO

ALTER TABLE [dbo].[warehouse_product_Location] DROP CONSTRAINT [w_p_address_id_fk]
GO

/****** Object:  Table [dbo].[warehouse_product_Location]    Script datetime: 7/14/2014 1:06:54 PM ******/
DROP TABLE [dbo].[warehouse_product_Location]
GO

ALTER TABLE [dbo].[Order_Product] DROP CONSTRAINT [order_product_warehouse_id_fk]
GO

ALTER TABLE [dbo].[Order_Product] DROP CONSTRAINT [order_product_product_id_fk]
GO

ALTER TABLE [dbo].[Order_Product] DROP CONSTRAINT [order_product_Order_id_fk]
GO

/****** Object:  Table [dbo].[Order_Product]    Script datetime: 7/14/2014 1:05:20 PM ******/
DROP TABLE [dbo].[Order_Product]
GO

ALTER TABLE [dbo].[requestor_Order] DROP CONSTRAINT [order_requestor_id_fk]
GO

ALTER TABLE [dbo].[requestor_Order] DROP CONSTRAINT [order_Encounter_id_fk]
GO

ALTER TABLE [dbo].[requestor_Order] DROP CONSTRAINT [order_add_id_fk]
GO

/****** Object:  Table [dbo].[requestor_Order]    Script datetime: 7/14/2014 1:04:36 PM ******/
DROP TABLE [dbo].[requestor_Order]
GO

ALTER TABLE [dbo].[requestor] DROP CONSTRAINT [requestor_person_id_fk]
GO

ALTER TABLE [dbo].[requestor] DROP CONSTRAINT [requestor_mobile_unit_id_fk]
GO

ALTER TABLE [dbo].[requestor] DROP CONSTRAINT [requestor_Encounter_id_fk]
GO

ALTER TABLE [dbo].[requestor] DROP CONSTRAINT [requestor_agency_id_fk]
GO

/****** Object:  Table [dbo].[requestor]    Script datetime: 7/14/2014 1:03:36 PM ******/
DROP TABLE [dbo].[requestor]
GO
ALTER TABLE [dbo].[Evacuation_Encounter_Shelter_Employee] DROP CONSTRAINT [Evacuation_Encounter_Shelter_Employee_Shelter_id_fk]
GO

ALTER TABLE [dbo].[Evacuation_Encounter_Shelter_Employee] DROP CONSTRAINT [Evacuation_Encounter_Shelter_Employee_Evacuation_Area_id_fk]
GO

ALTER TABLE [dbo].[Evacuation_Encounter_Shelter_Employee] DROP CONSTRAINT [Evacuation_Encounter_Shelter_Employee_Encounter_id_fk]
GO

ALTER TABLE [dbo].[Evacuation_Encounter_Shelter_Employee] DROP CONSTRAINT [Evacuation_Encounter_Shelter_Employee_Employee_id_fk]
GO

/****** Object:  Table [dbo].[Evacuation_Encounter_Shelter_Employee]    Script datetime: 7/14/2014 1:02:42 PM ******/
DROP TABLE [dbo].[Evacuation_Encounter_Shelter_Employee]
GO

ALTER TABLE [dbo].[Evacuation_Encounter_Shelter_Client] DROP CONSTRAINT [Evacuation_Encounter_Shelter_ID_fk]
GO

ALTER TABLE [dbo].[Evacuation_Encounter_Shelter_Client] DROP CONSTRAINT [Evacuation_Encounter_Encounter_ID_fk]
GO

ALTER TABLE [dbo].[Evacuation_Encounter_Shelter_Client] DROP CONSTRAINT [Evacuation_Encounter_Encounter_fk]
GO

ALTER TABLE [dbo].[Evacuation_Encounter_Shelter_Client] DROP CONSTRAINT [Evacuation_Encounter_Client_ID_fk]
GO

/****** Object:  Table [dbo].[Evacuation_Encounter_Shelter_Client]    Script datetime: 7/14/2014 1:01:55 PM ******/
DROP TABLE [dbo].[Evacuation_Encounter_Shelter_Client]
GO

ALTER TABLE [dbo].[encounter_services] DROP CONSTRAINT [enctr_serv_service_id_fk]
GO

ALTER TABLE [dbo].[encounter_services] DROP CONSTRAINT [enctr_serv_mobile_unit_id_fk]
GO

ALTER TABLE [dbo].[encounter_services] DROP CONSTRAINT [enctr_serv_encounter_id_fk]
GO

/****** Object:  Table [dbo].[encounter_services]    Script datetime: 7/14/2014 1:01:03 PM ******/
DROP TABLE [dbo].[encounter_services]
GO

ALTER TABLE [dbo].[encounter] DROP CONSTRAINT [enctr_Pet_Record_ID_fk]
GO

ALTER TABLE [dbo].[encounter] DROP CONSTRAINT [enctr_Location_ID_fk]
GO

ALTER TABLE [dbo].[encounter] DROP CONSTRAINT [enctr_disaster_ID_fk]
GO

ALTER TABLE [dbo].[encounter] DROP CONSTRAINT [enctr_client_id_fk]
GO

ALTER TABLE [dbo].[encounter] DROP CONSTRAINT [enctr_case_id_fk]
GO

ALTER TABLE [dbo].[encounter] DROP CONSTRAINT [enctr_call_center_id_fk]
GO

ALTER TABLE [dbo].[encounter] DROP CONSTRAINT [enctr_agency_id_fk]
GO

/****** Object:  Table [dbo].[encounter]    Script datetime: 7/14/2014 12:57:55 PM ******/
DROP TABLE [dbo].[encounter]
GO

ALTER TABLE [dbo].[ClientWPets] DROP CONSTRAINT [FK_ClientWPets_Pets]
GO

ALTER TABLE [dbo].[ClientWPets] DROP CONSTRAINT [FK_ClientWPets_client]
GO

ALTER TABLE [dbo].[ClientWPets] DROP CONSTRAINT [ClientWPets_Location_ID_FK]
GO

/****** Object:  Table [dbo].[ClientWPets]    Script datetime: 7/14/2014 12:56:39 PM ******/
DROP TABLE [dbo].[ClientWPets]
GO
ALTER TABLE [dbo].[Pet] DROP CONSTRAINT [Pets_pets_deceased_id_fk]
GO

ALTER TABLE [dbo].[Pet] DROP CONSTRAINT [Pets_Pet_Type_id_fk]
GO

ALTER TABLE [dbo].[Pet] DROP CONSTRAINT [Pets_pet_missing_id_fk]
GO

/****** Object:  Table [dbo].[Pet]    Script datetime: 7/14/2014 12:51:32 PM ******/
DROP TABLE [dbo].[Pet]
GO

/****** Object:  Table [dbo].[Pet_Missing]    Script datetime: 7/20/2014 4:50:18 PM ******/
DROP TABLE [dbo].[Pet_Missing]
GO

/****** Object:  Table [dbo].[Pet_Deceased]    Script datetime: 7/20/2014 6:12:12 PM ******/
DROP TABLE [dbo].[Pet_Deceased]
GO

/******************************************************************************/
ALTER TABLE [dbo].[services] DROP CONSTRAINT [fk_services_service_id]
GO

/****** Object:  Table [dbo].[services]    Script datetime: 7/14/2014 1:30:15 PM ******/
DROP TABLE [dbo].[services]
GO

/****** Object:  Table [dbo].[job]    Script Date: 8/29/2014 3:51:53 PM ******/
DROP TABLE [dbo].[job]
GO

/******************************************************************************/
ALTER TABLE [dbo].[Mobile_Product] DROP CONSTRAINT [FK_Mobile_Product_products]
GO

ALTER TABLE [dbo].[Mobile_Product] DROP CONSTRAINT [FK_Mobile_Product_mobile_unit]
GO

ALTER TABLE [dbo].[Mobile_Product] DROP CONSTRAINT [FK_Mobile_Product_lot]
GO

ALTER TABLE [dbo].[Mobile_Product] DROP CONSTRAINT [FK_Mobile_Product_case_intake]
GO

/****** Object:  Table [dbo].[Mobile_Product]    Script datetime: 7/14/2014 2:25:00 PM ******/
DROP TABLE [dbo].[Mobile_Product]
GO

ALTER TABLE [dbo].[vaccine] DROP CONSTRAINT [vaccine_medicine_id_fk]
GO

/****** Object:  Table [dbo].[vaccine]    Script datetime: 7/14/2014 2:20:26 PM ******/
DROP TABLE [dbo].[vaccine]
GO

ALTER TABLE [dbo].[medicine] DROP CONSTRAINT [fk_medicine_Medicine_Id]
GO

/****** Object:  Table [dbo].[medicine]    Script datetime: 7/14/2014 2:17:36 PM ******/
DROP TABLE [dbo].[medicine]
GO

ALTER TABLE [dbo].[lot] DROP CONSTRAINT [product_id_fk]
GO

/****** Object:  Table [dbo].[lot]    Script datetime: 7/14/2014 2:16:25 PM ******/
DROP TABLE [dbo].[lot]
GO

ALTER TABLE [dbo].[food] DROP CONSTRAINT [Food_Product_id_fk]
GO

/****** Object:  Table [dbo].[food]    Script datetime: 7/14/2014 2:14:53 PM ******/
DROP TABLE [dbo].[food]
GO
ALTER TABLE [dbo].[Donor_Product] DROP CONSTRAINT [donprod_prod_fk]
GO

ALTER TABLE [dbo].[Donor_Product] DROP CONSTRAINT [donprod_donor_fk]
GO

/****** Object:  Table [dbo].[Donor_Product]    Script datetime: 7/14/2014 2:13:39 PM ******/
DROP TABLE [dbo].[Donor_Product]
GO

ALTER TABLE [dbo].[vendor_products] DROP CONSTRAINT [vndr_prds_vndrid_fk]
GO

ALTER TABLE [dbo].[vendor_products] DROP CONSTRAINT [vndr_prds_prodid_fk]
GO

/****** Object:  Table [dbo].[vendor_products]    Script datetime: 7/14/2014 2:30:39 PM ******/
DROP TABLE [dbo].[vendor_products]
GO

ALTER TABLE [dbo].[Vendor_Products_shipments] DROP CONSTRAINT [vndr_prds_ship_vndrid_fk]
GO

ALTER TABLE [dbo].[Vendor_Products_shipments] DROP CONSTRAINT [vndr_prds_ship_shipmntsid_fk]
GO

ALTER TABLE [dbo].[Vendor_Products_shipments] DROP CONSTRAINT [vndr_prds_ship_prodid_fk]
GO

/****** Object:  Table [dbo].[Vendor_Products_shipments]    Script datetime: 7/14/2014 2:32:15 PM ******/
DROP TABLE [dbo].[Vendor_Products_shipments]
GO

ALTER TABLE [dbo].[products] DROP CONSTRAINT [fk_products_Resource_ID]
GO

ALTER TABLE [dbo].[products] DROP CONSTRAINT [fk_products_FEMA_ID]
GO

/****** Object:  Table [dbo].[products]    Script datetime: 7/14/2014 2:10:05 PM ******/
DROP TABLE [dbo].[products]
GO
/******************************************************************************/

ALTER TABLE [dbo].[case_client] DROP CONSTRAINT [FK_case_client_case_client]
GO

/******************************************************************************/

/******************************************************************************/
/******************************************************************************/
/******************************************************************************/
/*********************Start recreating tables**********************************/
/******************************************************************************/
/******************************************************************************/

/******************************************************************************/
/****** Object:  Table [dbo].[products]    Script datetime: 7/14/2014 2:10:05 PM ******/
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
	[Product_exp_date] [datetime] NULL,
	[Product_Alergy_info] [varchar](50) NULL,
	[Product_refrigde] [char](1) NULL,
	[Product_Flammable] [char](1) NULL,
	[Product_Hazard] [char](1) NULL,
	[Product_Other] [varchar](1) NULL,
	[Product_Min_Inv] [int] NULL,
	[Product_Barcode] [varchar](Max) NULL,
	[Product_subtype] [varchar](50) NULL,
	[Make] [varchar](50) NULL,
	[Model] [varchar](50) NULL,
	[FEMA_Description] [varchar](2000) NULL,
	[Year] [varchar](20) NULL,
	[RFID] [varchar](20) NULL,
	[GPS] [geography] NULL,
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
/****** Object:  Table [dbo].[Donor_Product]    Script datetime: 7/14/2014 2:13:39 PM ******/
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
/****** Object:  Table [dbo].[food]    Script datetime: 7/14/2014 2:14:53 PM ******/
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

/****** Object:  Table [dbo].[lot]    Script datetime: 7/14/2014 2:16:25 PM ******/
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
/****** Object:  Table [dbo].[medicine]    Script datetime: 7/14/2014 2:17:36 PM ******/
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
/****** Object:  Table [dbo].[vaccine]    Script datetime: 7/14/2014 2:20:26 PM ******/
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

/****** Object:  Table [dbo].[Mobile_Product]    Script datetime: 7/14/2014 2:25:00 PM ******/
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
/****** Object:  Table [dbo].[vendor_products]    Script datetime: 7/14/2014 2:30:39 PM ******/
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
/****** Object:  Table [dbo].[Vendor_Products_shipments]    Script datetime: 7/14/2014 2:32:15 PM ******/
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















/*********************************************************************************************/
/****** Object:  Table [dbo].[Pet_Vaccine]    Script datetime: 7/14/2014 1:09:20 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Pet_Vaccine](
	[Pet_Vaccine_ID] [int] IDENTITY(1,1) NOT NULL,
	[Vaccine_Type_ID] [int] NOT NULL,
	[Allergies] [varchar](MAX) NULL,
	[Current_Medacations] [varchar](MAX) NULL,
	[Last_Vaccine_Given] [datetime] NULL,
	[Date_Time_Stamp] [datetime] NOT NULL,
 CONSTRAINT [Pet_vaccine_id_pk] PRIMARY KEY CLUSTERED 
(
	[Pet_Vaccine_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO


/****** Object:  Table [dbo].[Pet_Vaccine_Type]    Script datetime: 7/20/2014 4:24:58 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING OFF
GO

CREATE TABLE [dbo].[Pet_Vaccine_Type](
	[Vaccine_Type_ID] [int] IDENTITY(1,1) NOT NULL,
	[Vaccine_Name] [varchar](50) NOT NULL,
	[Vaccine_Reactions] [varchar](50) NULL,
	[Vaccine_Type] [varchar](50) NOT NULL,
	[Vaccine_Description] [varchar](MAX) NULL,
 CONSTRAINT [Vaccine_Type_id_pk] PRIMARY KEY CLUSTERED 
(
	[Vaccine_Type_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO


/****** Object:  Table [dbo].[warehouse_product_Location]    Script datetime: 7/14/2014 1:06:54 PM ******/
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

/****** Object:  Table [dbo].[Order_Product]    Script datetime: 7/14/2014 1:05:20 PM ******/
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
	[DatePicked] [datetime] NULL,
	[Qtypicked] [int] NULL,
 CONSTRAINT [order_Product_ID_pk] PRIMARY KEY CLUSTERED 
(
	[order_Product_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

/****** Object:  Table [dbo].[requestor_Order]    Script datetime: 7/14/2014 1:04:36 PM ******/
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
	[OrderPickUpDate] [datetime] NULL,
 CONSTRAINT [OrderID_pk] PRIMARY KEY CLUSTERED 
(
	[OrderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

/****** Object:  Table [dbo].[requestor]    Script datetime: 7/14/2014 1:03:36 PM ******/
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

/****** Object:  Table [dbo].[Evacuation_Encounter_Shelter_Employee]    Script datetime: 7/14/2014 1:02:42 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
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
/****** Object:  Table [dbo].[Evacuation_Encounter_Shelter_Client]    Script datetime: 7/14/2014 1:01:55 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Evacuation_Encounter_Shelter_Client](
	[Evacuation_Encounter_Shelter_Client_ID] [int] IDENTITY(1,1) NOT NULL,
	[Evacuation_Area_ID] [int] NOT NULL,
	[Encounter_Id] [int] NOT NULL,
	[Start_Date] [datetime] NOT NULL,
	[End_Date] [datetime] NULL,
	[Shelter_ID] [int] NOT NULL,
	[Client_ID] [int] NOT NULL,
 CONSTRAINT [Evacuation_Encounter_Shelter_Client_Evacuation_Encounter_Shelter_Client_ID_pk] PRIMARY KEY CLUSTERED 
(
	[Evacuation_Encounter_Shelter_Client_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

/****** Object:  Table [dbo].[encounter_services]    Script datetime: 7/14/2014 1:01:03 PM ******/
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
/****** Object:  Table [dbo].[encounter_client_vaccine]    Script datetime: 7/14/2014 1:00:06 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[encounter_client_vaccine](
	[encounter_id] [int] NOT NULL,
	[vaccine_id] [int] NOT NULL,
	[current_client_medicine] [varchar](30) NULL,
	[assistance] [char](1) NOT NULL,
	[quantity] [int] NULL,
	[Under_six_months_old] [char](1) NOT NULL,
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
/****** Object:  Table [dbo].[disaster_encounter]    Script datetime: 7/14/2014 12:59:05 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[disaster_encounter](
	[disaster_encounter_id] [int] IDENTITY(1,1) NOT NULL,
	[disaster_id] [int] NOT NULL,
	[encounter_id] [int] NOT NULL,
	[location_id] [int] NOT NULL,
 CONSTRAINT [dis_enc_id_pk] PRIMARY KEY CLUSTERED 
(
	[disaster_encounter_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[encounter]    Script datetime: 7/14/2014 12:57:55 PM ******/
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

/****** Object:  Table [dbo].[ClientWPets]    Script datetime: 7/14/2014 12:56:39 PM ******/
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
	[cp_Date] [datetime] NOT NULL,
	[ownership] [char](1) NULL,
 CONSTRAINT [PK_clientwpets_id] PRIMARY KEY CLUSTERED 
(
	[CLIENTWPETS_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Pet]    Script datetime: 7/14/2014 12:51:32 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[Pet](
	[Pet_Record_ID] [int] IDENTITY(1,1) NOT NULL,
	[Pet_Location_Found_ID] [int] NULL,
	[Pet_Type_ID] [int] NULL,
	[Pet_Vet_ID] [varchar](50) NULL,
	[Pet_License_Tag] [varchar](50) NULL,
	[Pet_RFID] [varchar](MAX) NULL,
	[Pet_Tatoo_No] [varchar](50) NULL,
	[Pet_Name] [varchar](50) NOT NULL,
	[Pet_Gender] [char](1) NOT NULL,
	[Pet_Color] [varchar](50) NOT NULL,
	[Pet_Weight] [int] NULL,
	[Pet_Description] [varchar](Max) NOT NULL,
	[Pet_Condition] [varchar](Max) NOT NULL,
	[Pet_Status] [varchar](Max) NOT NULL,
	[Pet_Date_Of_Birth] [datetime] NULL,
	[Pet_Picture] [varbinary](max) NULL,
	[Pet_Sterilized] [char](1) NULL,
	[Date_Modified] [datetime] NOT NULL,
	[Date_Created] [datetime] NOT NULL,
 CONSTRAINT [Peta_Pet_Record_id_pk] PRIMARY KEY CLUSTERED 
(
	[Pet_Record_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

/****** Object:  Table [dbo].[Pet_Missing]    Script datetime: 7/20/2014 4:50:18 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[Pet_Missing](
	[Pet_Missing_ID] [int] NOT NULL,
	[Last_Known_Location_ID] [int] NOT NULL,
	[Date_Missing] [datetime] NULL,
	[Date_Reported] [datetime] NULL,
	[Collar_Description] [varchar](50) NULL,
	[Time_Lost] [datetime] NULL,
	[Lost_Explanation] [varchar](MAX) NULL,
	[Length_Owned] [int] NULL,
	[Reward_Amt] [money] NULL,
	[Breeder] [varchar](50) NULL,
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


/****** Object:  Table [dbo].[Pet_Deceased]    Script datetime: 7/20/2014 6:12:12 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[Pet_Deceased](
	[Pet_Deceased_ID] [int] NOT NULL,
	[Date_Deceased] [datetime] NOT NULL,
	[Location_ID] [int] NULL,
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



/*********************************************************************************************/
/****** Object:  Table [dbo].[medical_assistance]    Script datetime: 7/14/2014 12:31:34 PM ******/
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

/****** Object:  Table [dbo].[emergency_medical]    Script datetime: 7/14/2014 12:30:19 PM ******/
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
/****** Object:  Table [dbo].[deceased]    Script datetime: 7/14/2014 12:27:21 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[deceased](
	[deceased_id] [int] NOT NULL,
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
/***********************************************************************************/
/****** Object:  Table [dbo].[tier_req]    Script datetime: 7/14/2014 12:08:49 PM ******/
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

/****** Object:  Table [dbo].[tier]    Script datetime: 7/14/2014 12:07:12 PM ******/
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

/****** Object:  Table [dbo].[campaign]    Script datetime: 7/14/2014 12:05:25 PM ******/
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
 CONSTRAINT [campaign_campaign_id_pk] PRIMARY KEY CLUSTERED 
(
	[campaign_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[services]    Script datetime: 7/14/2014 1:30:15 PM ******/
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
	[Estimated_Time] [datetime] NOT NULL,
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
/******************************************************************************/
/****** Object:  Table [dbo].[job]    Script Date: 8/29/2014 3:55:39 PM ******/
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
	[Work_Payment_Freq_Bi_Weekly] [varchar](15) NOT NULL,
	[Work_Payment_Freq_Monthly] [varchar](15) NOT NULL,
	[Work_Payment_Freq_Bi_Monthly] [varchar](15) NOT NULL,
 CONSTRAINT [job_job_id_pk] PRIMARY KEY CLUSTERED 
(
	[job_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO
/******************************************************************************/
/******************************************************************************/
/******************************************************************************/
/**************Start Recreating All FKs****************************************/
/******************************************************************************/
/******************************************************************************/

/******************************************************************************/
ALTER TABLE [dbo].[FEMA]  WITH CHECK ADD  CONSTRAINT [fk_products_FEMA_ID] FOREIGN KEY([FEMA_ID])
REFERENCES [dbo].[products] ([product_id])
GO

ALTER TABLE [dbo].[FEMA] CHECK CONSTRAINT [fk_products_FEMA_ID]
GO

ALTER TABLE [dbo].[products]  WITH CHECK ADD  CONSTRAINT [fk_products_Resource_ID] FOREIGN KEY([Resource_ID])
REFERENCES [dbo].[resource] ([Resource_ID])
GO

ALTER TABLE [dbo].[products] CHECK CONSTRAINT [fk_products_Resource_ID]
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

ALTER TABLE [dbo].[medicine]  WITH CHECK ADD  CONSTRAINT [fk_medicine_Medicine_Id] FOREIGN KEY([Medicine_Id])
REFERENCES [dbo].[products] ([product_id])
GO

ALTER TABLE [dbo].[medicine] CHECK CONSTRAINT [fk_medicine_Medicine_Id]
GO

ALTER TABLE [dbo].[vaccine]  WITH CHECK ADD  CONSTRAINT [vaccine_medicine_id_fk] FOREIGN KEY([medicine_id])
REFERENCES [dbo].[medicine] ([Medicine_Id])
GO

ALTER TABLE [dbo].[vaccine] CHECK CONSTRAINT [vaccine_medicine_id_fk]
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












/*********************************************************************************************/

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



ALTER TABLE [dbo].[services]  WITH CHECK ADD  CONSTRAINT [services_Food_id_fk] FOREIGN KEY([service_ID])
REFERENCES [dbo].[Food] ([food_voucher_id])
GO

ALTER TABLE [dbo].[services] CHECK CONSTRAINT [services_Food_id_fk]
GO

ALTER TABLE [dbo].[services]  WITH CHECK ADD  CONSTRAINT [services_House_id_fk] FOREIGN KEY([service_ID])
REFERENCES [dbo].[House] ([House_id])
GO

ALTER TABLE [dbo].[services] CHECK CONSTRAINT [services_House_id_fk]
GO


ALTER TABLE [dbo].[services]  WITH CHECK ADD  CONSTRAINT [services_Transportation_id_fk] FOREIGN KEY([service_ID])
REFERENCES [dbo].[Transportation] ([transport_id])
GO

ALTER TABLE [dbo].[services] CHECK CONSTRAINT [services_Transportation_id_fk]
GO


ALTER TABLE [dbo].[services]  WITH CHECK ADD  CONSTRAINT [services_Emergency_Medical_id_fk] FOREIGN KEY([service_ID])
REFERENCES [dbo].[Emergency_Medical] ([em_id])
GO

ALTER TABLE [dbo].[services] CHECK CONSTRAINT [services_Emergency_Medical_id_fk]
GO


ALTER TABLE [dbo].[services]  WITH CHECK ADD  CONSTRAINT [services_medicine_id_fk] FOREIGN KEY([service_ID])
REFERENCES [dbo].[medicine] ([medicine_ID])
GO

ALTER TABLE [dbo].[services] CHECK CONSTRAINT [services_medicine_id_fk]
GO


ALTER TABLE [dbo].[services]  WITH CHECK ADD  CONSTRAINT [services_job_id_fk] FOREIGN KEY([service_ID])
REFERENCES [dbo].[job] ([job_ID])
GO

ALTER TABLE [dbo].[services] CHECK CONSTRAINT [services_job_id_fk]
GO


/*********************************************************************************************/

ALTER TABLE [dbo].[Pet_Vaccine]  WITH CHECK ADD  CONSTRAINT [Pets_Pet_vaccine_type_id_fk] FOREIGN KEY([Vaccine_Type_ID])
REFERENCES [dbo].[Pet_Vaccine_Type] ([Vaccine_Type_ID])
GO

ALTER TABLE [dbo].[Pet_Vaccine] CHECK CONSTRAINT [Pets_Pet_vaccine_type_id_fk]
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

ALTER TABLE [dbo].[Evacuation_Encounter_Shelter_Employee]  WITH CHECK ADD  CONSTRAINT [Evacuation_Encounter_Shelter_Employee_Employee_id_fk] FOREIGN KEY([Employee_ID])
REFERENCES [dbo].[employee] ([employee_id])
GO

ALTER TABLE [dbo].[Evacuation_Encounter_Shelter_Employee] CHECK CONSTRAINT [Evacuation_Encounter_Shelter_Employee_Employee_id_fk]
GO

ALTER TABLE [dbo].[Evacuation_Encounter_Shelter_Employee]  WITH CHECK ADD  CONSTRAINT [Evacuation_Encounter_Shelter_Employee_Encounter_id_fk] FOREIGN KEY([Encounter_ID])
REFERENCES [dbo].[encounter] ([encounter_id])
GO

ALTER TABLE [dbo].[Evacuation_Encounter_Shelter_Employee] CHECK CONSTRAINT [Evacuation_Encounter_Shelter_Employee_Encounter_id_fk]
GO

ALTER TABLE [dbo].[Evacuation_Encounter_Shelter_Employee]  WITH CHECK ADD  CONSTRAINT [Evacuation_Encounter_Shelter_Employee_Evacuation_Area_id_fk] FOREIGN KEY([Evacuation_Area_ID])
REFERENCES [dbo].[Evacuation_Area] ([Evacuation_Area_ID])
GO

ALTER TABLE [dbo].[Evacuation_Encounter_Shelter_Employee] CHECK CONSTRAINT [Evacuation_Encounter_Shelter_Employee_Evacuation_Area_id_fk]
GO

ALTER TABLE [dbo].[Evacuation_Encounter_Shelter_Employee]  WITH CHECK ADD  CONSTRAINT [Evacuation_Encounter_Shelter_Employee_Shelter_id_fk] FOREIGN KEY([Shelter_ID])
REFERENCES [dbo].[Shelter] ([Shelter_ID])
GO

ALTER TABLE [dbo].[Evacuation_Encounter_Shelter_Employee] CHECK CONSTRAINT [Evacuation_Encounter_Shelter_Employee_Shelter_id_fk]
GO

ALTER TABLE [dbo].[Evacuation_Encounter_Shelter_Client]  WITH CHECK ADD  CONSTRAINT [Evacuation_Encounter_Client_ID_fk] FOREIGN KEY([Client_ID])
REFERENCES [dbo].[client] ([client_id])
GO

ALTER TABLE [dbo].[Evacuation_Encounter_Shelter_Client] CHECK CONSTRAINT [Evacuation_Encounter_Client_ID_fk]
GO

ALTER TABLE [dbo].[Evacuation_Encounter_Shelter_Client]  WITH CHECK ADD  CONSTRAINT [Evacuation_Encounter_Encounter_fk] FOREIGN KEY([Encounter_Id])
REFERENCES [dbo].[encounter] ([encounter_id])
GO

ALTER TABLE [dbo].[Evacuation_Encounter_Shelter_Client] CHECK CONSTRAINT [Evacuation_Encounter_Encounter_fk]
GO

ALTER TABLE [dbo].[Evacuation_Encounter_Shelter_Client]  WITH CHECK ADD  CONSTRAINT [Evacuation_Encounter_Encounter_ID_fk] FOREIGN KEY([Evacuation_Area_ID])
REFERENCES [dbo].[Evacuation_Area] ([Evacuation_Area_ID])
GO

ALTER TABLE [dbo].[Evacuation_Encounter_Shelter_Client] CHECK CONSTRAINT [Evacuation_Encounter_Encounter_ID_fk]
GO

ALTER TABLE [dbo].[Evacuation_Encounter_Shelter_Client]  WITH CHECK ADD  CONSTRAINT [Evacuation_Encounter_Shelter_ID_fk] FOREIGN KEY([Shelter_ID])
REFERENCES [dbo].[Shelter] ([Shelter_ID])
GO

ALTER TABLE [dbo].[Evacuation_Encounter_Shelter_Client] CHECK CONSTRAINT [Evacuation_Encounter_Shelter_ID_fk]
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

ALTER TABLE [dbo].[disaster_encounter]  WITH CHECK ADD  CONSTRAINT [disaster_Encounter_Location_id_fk] FOREIGN KEY([location_id])
REFERENCES [dbo].[location] ([Location_ID])
GO

ALTER TABLE [dbo].[disaster_encounter] CHECK CONSTRAINT [disaster_Encounter_Location_id_fk]
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

ALTER TABLE [dbo].[Pet_Missing]  WITH CHECK ADD  CONSTRAINT [Pets_missing_id_fk] FOREIGN KEY([Pet_Missing_ID])
REFERENCES [dbo].[Pet] ([Pet_Record_ID])
GO

ALTER TABLE [dbo].[Pet_Missing] CHECK CONSTRAINT [Pets_missing_id_fk]
GO

ALTER TABLE [dbo].[Pet]  WITH CHECK ADD  CONSTRAINT [Pets_Pet_Type_id_fk] FOREIGN KEY([Pet_Type_ID])
REFERENCES [dbo].[Pet_type] ([Pet_Type_ID])
GO

ALTER TABLE [dbo].[Pet] CHECK CONSTRAINT [Pets_Pet_Type_id_fk]
GO

ALTER TABLE [dbo].[Pet]  WITH CHECK ADD  CONSTRAINT [Pets_Location_Found_id_fk] FOREIGN KEY([Pet_Location_Found_ID])
REFERENCES [dbo].[Location] ([Location_ID])
GO

ALTER TABLE [dbo].[Pet] CHECK CONSTRAINT [Pets_Location_Found_id_fk]
GO

ALTER TABLE [dbo].[Pet_Deceased]  WITH CHECK ADD  CONSTRAINT [Pets_deceased_id_fk] FOREIGN KEY([Pet_Deceased_ID])
REFERENCES [dbo].[Pet] ([Pet_Record_ID])
GO

ALTER TABLE [dbo].[Pet_Deceased] CHECK CONSTRAINT [Pets_deceased_id_fk]
GO

ALTER TABLE [dbo].[Pet_Vaccine]  WITH CHECK ADD  CONSTRAINT [Pets_vaccine_id_fk] FOREIGN KEY([Pet_Vaccine_ID])
REFERENCES [dbo].[Pet] ([Pet_Record_ID])
GO

ALTER TABLE [dbo].[Pet_Vaccine] CHECK CONSTRAINT [Pets_vaccine_id_fk]
GO

ALTER TABLE [dbo].[Pet_Missing]  WITH CHECK ADD  CONSTRAINT [Pet_Missing_Last_Known_Location_id_fk] FOREIGN KEY([Last_Known_Location_ID])
REFERENCES [dbo].[Location] ([Location_ID])
GO

ALTER TABLE [dbo].[Pet_Missing] CHECK CONSTRAINT [Pet_Missing_Last_Known_Location_id_fk]
GO

ALTER TABLE [dbo].[Pet_Deceased]  WITH CHECK ADD  CONSTRAINT [Pet_Deceased_Last_Known_Location_id_fk] FOREIGN KEY([Location_ID])
REFERENCES [dbo].[Location] ([Location_ID])
GO

ALTER TABLE [dbo].[Pet_Deceased] CHECK CONSTRAINT [Pet_Deceased_Last_Known_Location_id_fk]
GO

/***********************************************************************************************/
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
ALTER TABLE [dbo].[deceased]  WITH CHECK ADD  CONSTRAINT [deceased_client_id_fk] FOREIGN KEY([deceased_id])
REFERENCES [dbo].[client] ([client_id])
GO

ALTER TABLE [dbo].[deceased] CHECK CONSTRAINT [deceased_client_id_fk]
GO

ALTER TABLE [dbo].[missing]  WITH CHECK ADD  CONSTRAINT [missing_client_id_fk] FOREIGN KEY([missing_id])
REFERENCES [dbo].[client] ([client_Id])
GO

ALTER TABLE [dbo].[missing] CHECK CONSTRAINT [missing_client_id_fk]
GO
/*********************************************************************************/
ALTER TABLE [dbo].[campaign]  WITH CHECK ADD  CONSTRAINT [campaign_medicine_id_fk] FOREIGN KEY([campaign_id])
REFERENCES [dbo].[medicine] ([Medicine_Id])
GO

ALTER TABLE [dbo].[campaign] CHECK CONSTRAINT [campaign_medicine_id_fk]
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
ALTER TABLE [dbo].[services]  WITH CHECK ADD  CONSTRAINT [fk_services_service_id] FOREIGN KEY([service_id])
REFERENCES [dbo].[resource] ([Resource_ID])
GO

ALTER TABLE [dbo].[services] CHECK CONSTRAINT [fk_services_service_id]
GO


/*********************************************************************/
/*MOD E Clean Up Patch*/
/***********************************************************/
/*************************************************/
/****** - SELECT STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_SELECT_SHELTER]    Script Date: 8/29/2014 2:04:03 PM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_SELECT_SHELTER]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_SELECT_SHELTER]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_SELECT_SHELTER]
           @Shelter_ID as int
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
/****** Object:  StoredProcedure [dbo].[SP_DMCS_INSERT_SHELTER]    Script Date: 8/29/2014 2:04:03 PM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_INSERT_SHELTER]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_INSERT_SHELTER]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_INSERT_SHELTER]
	  @Address_ID as int,
	  @Shelter_Type as varchar(15),
	  @Max_Capacity as int,
	  @AllowsPets as varchar(3)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	  IF @Address_ID = 0
    BEGIN
    SET @Address_ID = null
    END
	  IF @Shelter_Type = ''
    BEGIN
    SET @Shelter_Type = null
    END
	  IF @Max_Capacity = 0
    BEGIN
    SET @Max_Capacity = null
    END
	  IF @AllowsPets = ''
    BEGIN
    SET @AllowsPets = null
    END
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
/****** Object:  StoredProcedure [dbo].[SP_DMCS_GET_SHELTER]    Script Date: 8/29/2014 2:04:03 PM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_GET_SHELTER]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_GET_SHELTER]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_GET_SHELTER]
	  @Address_ID as int,
	  @Shelter_Type as varchar(15),
	  @Max_Capacity as int,
	  @AllowsPets as varchar(3)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	  IF @Address_ID = 0
    BEGIN
    SET @Address_ID = null
    END
	  IF @Shelter_Type = ''
    BEGIN
    SET @Shelter_Type = null
    END
	  IF @Max_Capacity = 0
    BEGIN
    SET @Max_Capacity = null
    END
	  IF @AllowsPets = ''
    BEGIN
    SET @AllowsPets = null
    END
    SELECT [Shelter_ID] 
      FROM [dbo].[Shelter] 
       WHERE ([Address_ID] = @Address_ID)
       AND ([Shelter_Type] like @Shelter_Type)
       AND ([Max_Capacity] = @Max_Capacity)
       AND ([AllowsPets] like @AllowsPets)
END
GO
/***********************************************************/
/*************************************************/
/****** - UPDATE STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_UPDATE_SHELTER]    Script Date: 8/29/2014 2:04:03 PM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_UPDATE_SHELTER]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_UPDATE_SHELTER]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_UPDATE_SHELTER]
	  @Shelter_ID as int,
	  @Address_ID as int,
	  @Shelter_Type as varchar(15),
	  @Max_Capacity as int,
	  @AllowsPets as varchar(3)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	  IF @Address_ID = 0
    BEGIN
    SET @Address_ID = null
    END
	  IF @Shelter_Type = ''
    BEGIN
    SET @Shelter_Type = null
    END
	  IF @Max_Capacity = 0
    BEGIN
    SET @Max_Capacity = null
    END
	  IF @AllowsPets = ''
    BEGIN
    SET @AllowsPets = null
    END
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
/****** Object:  StoredProcedure [dbo].[SP_DMCS_DELETE_SHELTER]    Script Date: 8/29/2014 2:04:03 PM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_DELETE_SHELTER]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_DELETE_SHELTER]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_DELETE_SHELTER]
	@Shelter_ID int
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
/****** Object:  StoredProcedure [dbo].[SP_DMCS_SELECT_SHELTER_WC]    Script Date: 8/29/2014 2:04:03 PM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_SELECT_SHELTER_WC]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_SELECT_SHELTER_WC]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_SELECT_SHELTER_WC]
	  @wareclause as varchar(MAX)
AS
Begin
    Declare @string as varchar(MAX)
	Set @string = 'Select * from Shelter where ' + @wareclause
	Exec(@string)
END
GO

/***********************************************************/
/*************************************************/
/****** - SELECT STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_SELECT_SHIPMENT]    Script Date: 8/29/2014 2:04:04 PM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_SELECT_SHIPMENT]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_SELECT_SHIPMENT]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_SELECT_SHIPMENT]
           @ShipmentID as int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
SELECT [ShipmentID]
      ,[WarehouseID]
      ,[Tracking_Num]
      ,[Ship_Method]
      ,[Other]
      ,[OrderRecByID]
      ,[FullOrderReceived]
  FROM [dbo].[Shipment]
 WHERE ShipmentID = @ShipmentID
End
GO
/***********************************************************/
/*************************************************/
/****** - INSERT STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_INSERT_SHIPMENT]    Script Date: 8/29/2014 2:04:04 PM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_INSERT_SHIPMENT]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_INSERT_SHIPMENT]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_INSERT_SHIPMENT]
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
    SET @WarehouseID = null
    END
	  IF @Tracking_Num = ''
    BEGIN
    SET @Tracking_Num = null
    END
	  IF @Ship_Method = ''
    BEGIN
    SET @Ship_Method = null
    END
	  IF @OrderRecByID = 0
    BEGIN
    SET @OrderRecByID = null
    END
	  IF @FullOrderReceived = ''
    BEGIN
    SET @FullOrderReceived = null
    END
	Insert INTO [dbo].[Shipment]
           (
            [WarehouseID]
           ,[Tracking_Num]
           ,[Ship_Method]
           ,[Other]
           ,[OrderRecByID]
           ,[FullOrderReceived]
            )
     VALUES (
            @WarehouseID
           ,@Tracking_Num
           ,@Ship_Method
           ,@Other
           ,@OrderRecByID
           ,@FullOrderReceived
            )
END
GO
/***********************************************************/
/*************************************************/
/****** - GET STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_GET_SHIPMENT]    Script Date: 8/29/2014 2:04:04 PM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_GET_SHIPMENT]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_GET_SHIPMENT]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_GET_SHIPMENT]
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
    SET @WarehouseID = null
    END
	  IF @Tracking_Num = ''
    BEGIN
    SET @Tracking_Num = null
    END
	  IF @Ship_Method = ''
    BEGIN
    SET @Ship_Method = null
    END
	  IF @OrderRecByID = 0
    BEGIN
    SET @OrderRecByID = null
    END
	  IF @FullOrderReceived = ''
    BEGIN
    SET @FullOrderReceived = null
    END
    SELECT [ShipmentID] 
      FROM [dbo].[Shipment] 
       WHERE ([WarehouseID] = @WarehouseID)
       AND ([Tracking_Num] like @Tracking_Num)
       AND ([Ship_Method] like @Ship_Method)
       AND ([Other] like @Other or [Other] is null)
       AND ([OrderRecByID] = @OrderRecByID or [OrderRecByID] is null)
       AND ([FullOrderReceived] = @FullOrderReceived or [FullOrderReceived] is null)
END
GO
/***********************************************************/
/*************************************************/
/****** - UPDATE STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_UPDATE_SHIPMENT]    Script Date: 8/29/2014 2:04:04 PM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_UPDATE_SHIPMENT]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_UPDATE_SHIPMENT]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_UPDATE_SHIPMENT]
	  @ShipmentID as int,
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
    SET @WarehouseID = null
    END
	  IF @Tracking_Num = ''
    BEGIN
    SET @Tracking_Num = null
    END
	  IF @Ship_Method = ''
    BEGIN
    SET @Ship_Method = null
    END
	  IF @OrderRecByID = 0
    BEGIN
    SET @OrderRecByID = null
    END
	  IF @FullOrderReceived = ''
    BEGIN
    SET @FullOrderReceived = null
    END
	UPDATE [dbo].[Shipment]
       SET
		   [WarehouseID] = @WarehouseID,
		   [Tracking_Num] = @Tracking_Num,
		   [Ship_Method] = @Ship_Method,
		   [Other] = @Other,
		   [OrderRecByID] = @OrderRecByID,
		   [FullOrderReceived] = @FullOrderReceived
       WHERE ShipmentID = @ShipmentID
END
GO
/***********************************************************/
/*************************************************/
/****** - DELETE STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_DELETE_SHIPMENT]    Script Date: 8/29/2014 2:04:04 PM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_DELETE_SHIPMENT]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_DELETE_SHIPMENT]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_DELETE_SHIPMENT]
	@ShipmentID int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	Delete dbo.Shipment
	where ShipmentID = @ShipmentID
END
GO
/***********************************************************/
/*************************************************/
/****** - WHERE CLAUSE STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_SELECT_SHIPMENT_WC]    Script Date: 8/29/2014 2:04:04 PM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_SELECT_SHIPMENT_WC]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_SELECT_SHIPMENT_WC]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_SELECT_SHIPMENT_WC]
	  @wareclause as varchar(MAX)
AS
Begin
    Declare @string as varchar(MAX)
	Set @string = 'Select * from Shipment where ' + @wareclause
	Exec(@string)
END
GO

/***********************************************************/
/*************************************************/
/****** - SELECT STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_SELECT_VENDOR]    Script Date: 8/29/2014 2:04:07 PM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_SELECT_VENDOR]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_SELECT_VENDOR]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_SELECT_VENDOR]
           @vendor_id as int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
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
      ,[primary_fName]
      ,[primary_lName]
      ,[primary_phone]
      ,[sec_fName]
      ,[sec_lName]
      ,[sec_phone]
  FROM [dbo].[vendor]
 WHERE vendor_id = @vendor_id
End
GO
/***********************************************************/
/*************************************************/
/****** - INSERT STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_INSERT_VENDOR]    Script Date: 8/29/2014 2:04:07 PM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_INSERT_VENDOR]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_INSERT_VENDOR]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_INSERT_VENDOR]
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
	  @vendor_comments as text,
	  @primary_fName as varchar(50),
	  @primary_lName as varchar(50),
	  @primary_phone as varchar(50),
	  @sec_fName as varchar(50),
	  @sec_lName as varchar(50),
	  @sec_phone as varchar(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	  IF @vendor_name = ''
    BEGIN
    SET @vendor_name = null
    END
	  IF @phone_num = ''
    BEGIN
    SET @phone_num = null
    END
	  IF @email = ''
    BEGIN
    SET @email = null
    END
	  IF @address_id = 0
    BEGIN
    SET @address_id = null
    END
	  IF @Vendor_address2 = 0
    BEGIN
    SET @Vendor_address2 = null
    END
	  IF @vendor_job_assign = ''
    BEGIN
    SET @vendor_job_assign = null
    END
	  IF @vendor_start_date = '9/9/1900 12:00:00 AM'
    BEGIN
    SET @vendor_start_date = null
    END
	  IF @vendor_end_date = '9/9/1900 12:00:00 AM'
    BEGIN
    SET @vendor_end_date = null
    END
	  IF @vendor_meth_of_contact = ''
    BEGIN
    SET @vendor_meth_of_contact = null
    END
	  IF @vendor_status = ''
    BEGIN
    SET @vendor_status = null
    END
	  IF @vendor_meth_of_pay = ''
    BEGIN
    SET @vendor_meth_of_pay = null
    END
	  IF @vendor_type = ''
    BEGIN
    SET @vendor_type = null
    END
	  IF @primary_fName = ''
    BEGIN
    SET @primary_fName = null
    END
	  IF @primary_lName = ''
    BEGIN
    SET @primary_lName = null
    END
	  IF @primary_phone = ''
    BEGIN
    SET @primary_phone = null
    END
	  IF @sec_fName = ''
    BEGIN
    SET @sec_fName = null
    END
	  IF @sec_lName = ''
    BEGIN
    SET @sec_lName = null
    END
	  IF @sec_phone = ''
    BEGIN
    SET @sec_phone = null
    END
	Insert INTO [dbo].[vendor]
           (
            [vendor_name]
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
           ,[primary_fName]
           ,[primary_lName]
           ,[primary_phone]
           ,[sec_fName]
           ,[sec_lName]
           ,[sec_phone]
            )
     VALUES (
            @vendor_name
           ,@phone_num
           ,@email
           ,@address_id
           ,@Vendor_address2
           ,@vendor_job_assign
           ,@vendor_start_date
           ,@vendor_end_date
           ,@vendor_meth_of_contact
           ,@vendor_status
           ,@vendor_meth_of_pay
           ,@vendor_type
           ,@vendor_comments
           ,@primary_fName
           ,@primary_lName
           ,@primary_phone
           ,@sec_fName
           ,@sec_lName
           ,@sec_phone
            )
END
GO
/***********************************************************/
/*************************************************/
/****** - GET STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_GET_VENDOR]    Script Date: 8/29/2014 2:04:07 PM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_GET_VENDOR]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_GET_VENDOR]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_GET_VENDOR]
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
	  @vendor_comments as text,
	  @primary_fName as varchar(50),
	  @primary_lName as varchar(50),
	  @primary_phone as varchar(50),
	  @sec_fName as varchar(50),
	  @sec_lName as varchar(50),
	  @sec_phone as varchar(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	  IF @vendor_name = ''
    BEGIN
    SET @vendor_name = null
    END
	  IF @phone_num = ''
    BEGIN
    SET @phone_num = null
    END
	  IF @email = ''
    BEGIN
    SET @email = null
    END
	  IF @address_id = 0
    BEGIN
    SET @address_id = null
    END
	  IF @Vendor_address2 = 0
    BEGIN
    SET @Vendor_address2 = null
    END
	  IF @vendor_job_assign = ''
    BEGIN
    SET @vendor_job_assign = null
    END
	  IF @vendor_start_date = '9/9/1900 12:00:00 AM'
    BEGIN
    SET @vendor_start_date = null
    END
	  IF @vendor_end_date = '9/9/1900 12:00:00 AM'
    BEGIN
    SET @vendor_end_date = null
    END
	  IF @vendor_meth_of_contact = ''
    BEGIN
    SET @vendor_meth_of_contact = null
    END
	  IF @vendor_status = ''
    BEGIN
    SET @vendor_status = null
    END
	  IF @vendor_meth_of_pay = ''
    BEGIN
    SET @vendor_meth_of_pay = null
    END
	  IF @vendor_type = ''
    BEGIN
    SET @vendor_type = null
    END
	  IF @primary_fName = ''
    BEGIN
    SET @primary_fName = null
    END
	  IF @primary_lName = ''
    BEGIN
    SET @primary_lName = null
    END
	  IF @primary_phone = ''
    BEGIN
    SET @primary_phone = null
    END
	  IF @sec_fName = ''
    BEGIN
    SET @sec_fName = null
    END
	  IF @sec_lName = ''
    BEGIN
    SET @sec_lName = null
    END
	  IF @sec_phone = ''
    BEGIN
    SET @sec_phone = null
    END
    SELECT [vendor_id] 
      FROM [dbo].[vendor] 
       WHERE ([vendor_name] like @vendor_name)
       AND ([phone_num] like @phone_num)
       AND ([email] like @email or [email] is null)
       AND ([address_id] = @address_id)
       AND ([Vendor_address2] = @Vendor_address2 or [Vendor_address2] is null)
       AND ([vendor_job_assign] like @vendor_job_assign or [vendor_job_assign] is null)
       AND ([vendor_start_date] = @vendor_start_date)
       AND ([vendor_end_date] = @vendor_end_date or [vendor_end_date] is null)
       AND ([vendor_meth_of_contact] = @vendor_meth_of_contact)
       AND ([vendor_status] like @vendor_status)
       AND ([vendor_meth_of_pay] like @vendor_meth_of_pay or [vendor_meth_of_pay] is null)
       AND ([vendor_type] like @vendor_type)
       AND ([vendor_comments] like @vendor_comments or [vendor_comments] is null)
       AND ([primary_fName] like @primary_fName or [primary_fName] is null)
       AND ([primary_lName] like @primary_lName or [primary_lName] is null)
       AND ([primary_phone] like @primary_phone or [primary_phone] is null)
       AND ([sec_fName] like @sec_fName or [sec_fName] is null)
       AND ([sec_lName] like @sec_lName or [sec_lName] is null)
       AND ([sec_phone] like @sec_phone or [sec_phone] is null)
END
GO
/***********************************************************/
/*************************************************/
/****** - UPDATE STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_UPDATE_VENDOR]    Script Date: 8/29/2014 2:04:07 PM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_UPDATE_VENDOR]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_UPDATE_VENDOR]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_UPDATE_VENDOR]
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
	  @vendor_comments as text,
	  @primary_fName as varchar(50),
	  @primary_lName as varchar(50),
	  @primary_phone as varchar(50),
	  @sec_fName as varchar(50),
	  @sec_lName as varchar(50),
	  @sec_phone as varchar(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	  IF @vendor_name = ''
    BEGIN
    SET @vendor_name = null
    END
	  IF @phone_num = ''
    BEGIN
    SET @phone_num = null
    END
	  IF @email = ''
    BEGIN
    SET @email = null
    END
	  IF @address_id = 0
    BEGIN
    SET @address_id = null
    END
	  IF @Vendor_address2 = 0
    BEGIN
    SET @Vendor_address2 = null
    END
	  IF @vendor_job_assign = ''
    BEGIN
    SET @vendor_job_assign = null
    END
	  IF @vendor_start_date = '9/9/1900 12:00:00 AM'
    BEGIN
    SET @vendor_start_date = null
    END
	  IF @vendor_end_date = '9/9/1900 12:00:00 AM'
    BEGIN
    SET @vendor_end_date = null
    END
	  IF @vendor_meth_of_contact = ''
    BEGIN
    SET @vendor_meth_of_contact = null
    END
	  IF @vendor_status = ''
    BEGIN
    SET @vendor_status = null
    END
	  IF @vendor_meth_of_pay = ''
    BEGIN
    SET @vendor_meth_of_pay = null
    END
	  IF @vendor_type = ''
    BEGIN
    SET @vendor_type = null
    END
	  IF @primary_fName = ''
    BEGIN
    SET @primary_fName = null
    END
	  IF @primary_lName = ''
    BEGIN
    SET @primary_lName = null
    END
	  IF @primary_phone = ''
    BEGIN
    SET @primary_phone = null
    END
	  IF @sec_fName = ''
    BEGIN
    SET @sec_fName = null
    END
	  IF @sec_lName = ''
    BEGIN
    SET @sec_lName = null
    END
	  IF @sec_phone = ''
    BEGIN
    SET @sec_phone = null
    END
	UPDATE [dbo].[vendor]
       SET
		   [vendor_name] = @vendor_name,
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
		   [vendor_comments] = @vendor_comments,
		   [primary_fName] = @primary_fName,
		   [primary_lName] = @primary_lName,
		   [primary_phone] = @primary_phone,
		   [sec_fName] = @sec_fName,
		   [sec_lName] = @sec_lName,
		   [sec_phone] = @sec_phone
       WHERE vendor_id = @vendor_id
END
GO
/***********************************************************/
/*************************************************/
/****** - DELETE STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_DELETE_VENDOR]    Script Date: 8/29/2014 2:04:07 PM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_DELETE_VENDOR]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_DELETE_VENDOR]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_DELETE_VENDOR]
	@vendor_id int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	Delete dbo.vendor
	where vendor_id = @vendor_id
END
GO
/***********************************************************/
/*************************************************/
/****** - WHERE CLAUSE STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_SELECT_VENDOR_WC]    Script Date: 8/29/2014 2:04:07 PM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_SELECT_VENDOR_WC]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_SELECT_VENDOR_WC]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_SELECT_VENDOR_WC]
	  @wareclause as varchar(MAX)
AS
Begin
    Declare @string as varchar(MAX)
	Set @string = 'Select * from vendor where ' + @wareclause
	Exec(@string)
END
GO

/***********************************************************/
/*************************************************/
/****** - SELECT STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_SELECT_ACCOUNT]    Script Date: 8/29/2014 2:04:09 PM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_SELECT_ACCOUNT]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_SELECT_ACCOUNT]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_SELECT_ACCOUNT]
           @Account_ID as int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
SELECT [Account_ID]
      ,[Bank_ID]
      ,[Account_Num]
      ,[Type]
  FROM [dbo].[account]
 WHERE Account_ID = @Account_ID
End
GO
/***********************************************************/
/*************************************************/
/****** - INSERT STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_INSERT_ACCOUNT]    Script Date: 8/29/2014 2:04:09 PM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_INSERT_ACCOUNT]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_INSERT_ACCOUNT]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_INSERT_ACCOUNT]
	  @Bank_ID as int,
	  @Account_Num as varchar(15),
	  @Type as varchar(20)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	  IF @Bank_ID = 0
    BEGIN
    SET @Bank_ID = null
    END
	  IF @Account_Num = ''
    BEGIN
    SET @Account_Num = null
    END
	  IF @Type = ''
    BEGIN
    SET @Type = null
    END
	Insert INTO [dbo].[account]
           (
            [Bank_ID]
           ,[Account_Num]
           ,[Type]
            )
     VALUES (
            @Bank_ID
           ,@Account_Num
           ,@Type
            )
END
GO
/***********************************************************/
/*************************************************/
/****** - GET STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_GET_ACCOUNT]    Script Date: 8/29/2014 2:04:09 PM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_GET_ACCOUNT]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_GET_ACCOUNT]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_GET_ACCOUNT]
	  @Bank_ID as int,
	  @Account_Num as varchar(15),
	  @Type as varchar(20)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	  IF @Bank_ID = 0
    BEGIN
    SET @Bank_ID = null
    END
	  IF @Account_Num = ''
    BEGIN
    SET @Account_Num = null
    END
	  IF @Type = ''
    BEGIN
    SET @Type = null
    END
    SELECT [Account_ID] 
      FROM [dbo].[account] 
       WHERE ([Bank_ID] = @Bank_ID)
       AND ([Account_Num] like @Account_Num)
       AND ([Type] like @Type)
END
GO
/***********************************************************/
/*************************************************/
/****** - UPDATE STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_UPDATE_ACCOUNT]    Script Date: 8/29/2014 2:04:09 PM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_UPDATE_ACCOUNT]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_UPDATE_ACCOUNT]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_UPDATE_ACCOUNT]
	  @Account_ID as int,
	  @Bank_ID as int,
	  @Account_Num as varchar(15),
	  @Type as varchar(20)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	  IF @Bank_ID = 0
    BEGIN
    SET @Bank_ID = null
    END
	  IF @Account_Num = ''
    BEGIN
    SET @Account_Num = null
    END
	  IF @Type = ''
    BEGIN
    SET @Type = null
    END
	UPDATE [dbo].[account]
       SET
		   [Bank_ID] = @Bank_ID,
		   [Account_Num] = @Account_Num,
		   [Type] = @Type
       WHERE Account_ID = @Account_ID
END
GO
/***********************************************************/
/*************************************************/
/****** - DELETE STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_DELETE_ACCOUNT]    Script Date: 8/29/2014 2:04:09 PM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_DELETE_ACCOUNT]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_DELETE_ACCOUNT]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_DELETE_ACCOUNT]
	@Account_ID int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	Delete dbo.account
	where Account_ID = @Account_ID
END
GO
/***********************************************************/
/*************************************************/
/****** - WHERE CLAUSE STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_SELECT_ACCOUNT_WC]    Script Date: 8/29/2014 2:04:09 PM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_SELECT_ACCOUNT_WC]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_SELECT_ACCOUNT_WC]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_SELECT_ACCOUNT_WC]
	  @wareclause as varchar(MAX)
AS
Begin
    Declare @string as varchar(MAX)
	Set @string = 'Select * from account where ' + @wareclause
	Exec(@string)
END
GO

/***********************************************************/
/*************************************************/
/****** - SELECT STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_SELECT_ADDRESS]    Script Date: 8/29/2014 2:04:11 PM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_SELECT_ADDRESS]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_SELECT_ADDRESS]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_SELECT_ADDRESS]
           @address_id as int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
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
End
GO
/***********************************************************/
/*************************************************/
/****** - INSERT STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_INSERT_ADDRESS]    Script Date: 8/29/2014 2:04:11 PM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_INSERT_ADDRESS]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_INSERT_ADDRESS]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_INSERT_ADDRESS]
	  @address_type_id as int,
	  @city as varchar(30),
	  @country as varchar(30),
	  @County_Township as varchar(30),
	  @longitude as decimal,
	  @latitude as decimal,
	  @state as char(2),
	  @str_add as varchar(30),
	  @str_add2 as varchar(30),
	  @zip_plus_four as varchar(10)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	  IF @address_type_id = 0
    BEGIN
    SET @address_type_id = null
    END
	  IF @city = ''
    BEGIN
    SET @city = null
    END
	  IF @country = ''
    BEGIN
    SET @country = null
    END
	  IF @County_Township = ''
    BEGIN
    SET @County_Township = null
    END
	  IF @longitude = 0
    BEGIN
    SET @longitude = null
    END
	  IF @latitude = 0
    BEGIN
    SET @latitude = null
    END
	  IF @state = ''
    BEGIN
    SET @state = null
    END
	  IF @str_add = ''
    BEGIN
    SET @str_add = null
    END
	  IF @str_add2 = ''
    BEGIN
    SET @str_add2 = null
    END
	  IF @zip_plus_four = ''
    BEGIN
    SET @zip_plus_four = null
    END
	Insert INTO [dbo].[address]
           (
            [address_type_id]
           ,[city]
           ,[country]
           ,[County_Township]
           ,[longitude]
           ,[latitude]
           ,[state]
           ,[str_add]
           ,[str_add2]
           ,[zip_plus_four]
            )
     VALUES (
            @address_type_id
           ,@city
           ,@country
           ,@County_Township
           ,@longitude
           ,@latitude
           ,@state
           ,@str_add
           ,@str_add2
           ,@zip_plus_four
            )
END
GO
/***********************************************************/
/*************************************************/
/****** - GET STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_GET_ADDRESS]    Script Date: 8/29/2014 2:04:11 PM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_GET_ADDRESS]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_GET_ADDRESS]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_GET_ADDRESS]
	  @address_type_id as int,
	  @city as varchar(30),
	  @country as varchar(30),
	  @County_Township as varchar(30),
	  @longitude as decimal,
	  @latitude as decimal,
	  @state as char(2),
	  @str_add as varchar(30),
	  @str_add2 as varchar(30),
	  @zip_plus_four as varchar(10)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	  IF @address_type_id = 0
    BEGIN
    SET @address_type_id = null
    END
	  IF @city = ''
    BEGIN
    SET @city = null
    END
	  IF @country = ''
    BEGIN
    SET @country = null
    END
	  IF @County_Township = ''
    BEGIN
    SET @County_Township = null
    END
	  IF @longitude = 0
    BEGIN
    SET @longitude = null
    END
	  IF @latitude = 0
    BEGIN
    SET @latitude = null
    END
	  IF @state = ''
    BEGIN
    SET @state = null
    END
	  IF @str_add = ''
    BEGIN
    SET @str_add = null
    END
	  IF @str_add2 = ''
    BEGIN
    SET @str_add2 = null
    END
	  IF @zip_plus_four = ''
    BEGIN
    SET @zip_plus_four = null
    END
    SELECT [address_id] 
      FROM [dbo].[address] 
       WHERE ([address_type_id] = @address_type_id)
       AND ([city] like @city)
       AND ([country] like @country)
       AND ([County_Township] like @County_Township or [County_Township] is null)
       AND ([longitude] = @longitude or [longitude] is null)
       AND ([latitude] = @latitude or [latitude] is null)
       AND ([state] = @state)
       AND ([str_add] like @str_add)
       AND ([str_add2] like @str_add2 or [str_add2] is null)
       AND ([zip_plus_four] like @zip_plus_four or [zip_plus_four] is null)
END
GO
/***********************************************************/
/*************************************************/
/****** - UPDATE STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_UPDATE_ADDRESS]    Script Date: 8/29/2014 2:04:11 PM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_UPDATE_ADDRESS]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_UPDATE_ADDRESS]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_UPDATE_ADDRESS]
	  @address_id as int,
	  @address_type_id as int,
	  @city as varchar(30),
	  @country as varchar(30),
	  @County_Township as varchar(30),
	  @longitude as decimal,
	  @latitude as decimal,
	  @state as char(2),
	  @str_add as varchar(30),
	  @str_add2 as varchar(30),
	  @zip_plus_four as varchar(10)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	  IF @address_type_id = 0
    BEGIN
    SET @address_type_id = null
    END
	  IF @city = ''
    BEGIN
    SET @city = null
    END
	  IF @country = ''
    BEGIN
    SET @country = null
    END
	  IF @County_Township = ''
    BEGIN
    SET @County_Township = null
    END
	  IF @longitude = 0
    BEGIN
    SET @longitude = null
    END
	  IF @latitude = 0
    BEGIN
    SET @latitude = null
    END
	  IF @state = ''
    BEGIN
    SET @state = null
    END
	  IF @str_add = ''
    BEGIN
    SET @str_add = null
    END
	  IF @str_add2 = ''
    BEGIN
    SET @str_add2 = null
    END
	  IF @zip_plus_four = ''
    BEGIN
    SET @zip_plus_four = null
    END
	UPDATE [dbo].[address]
       SET
		   [address_type_id] = @address_type_id,
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
/***********************************************************/
/*************************************************/
/****** - DELETE STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_DELETE_ADDRESS]    Script Date: 8/29/2014 2:04:11 PM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_DELETE_ADDRESS]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_DELETE_ADDRESS]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_DELETE_ADDRESS]
	@address_id int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	Delete dbo.address
	where address_id = @address_id
END
GO
/***********************************************************/
/*************************************************/
/****** - WHERE CLAUSE STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_SELECT_ADDRESS_WC]    Script Date: 8/29/2014 2:04:11 PM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_SELECT_ADDRESS_WC]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_SELECT_ADDRESS_WC]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_SELECT_ADDRESS_WC]
	  @wareclause as varchar(MAX)
AS
Begin
    Declare @string as varchar(MAX)
	Set @string = 'Select * from address where ' + @wareclause
	Exec(@string)
END
GO

/***********************************************************/
/*************************************************/
/****** - SELECT STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_SELECT_WAREHOUSE]    Script Date: 8/29/2014 2:04:12 PM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_SELECT_WAREHOUSE]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_SELECT_WAREHOUSE]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_SELECT_WAREHOUSE]
           @warehouse_id as int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
SELECT [warehouse_id]
      ,[warehouse_name]
      ,[address_id]
      ,[warehouse_type]
      ,[Location_ID]
  FROM [dbo].[warehouse]
 WHERE warehouse_id = @warehouse_id
End
GO
/***********************************************************/
/*************************************************/
/****** - INSERT STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_INSERT_WAREHOUSE]    Script Date: 8/29/2014 2:04:12 PM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_INSERT_WAREHOUSE]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_INSERT_WAREHOUSE]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_INSERT_WAREHOUSE]
	  @warehouse_name as varchar(50),
	  @address_id as int,
	  @warehouse_type as varchar(10),
	  @Location_ID as int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	  IF @warehouse_name = ''
    BEGIN
    SET @warehouse_name = null
    END
	  IF @address_id = 0
    BEGIN
    SET @address_id = null
    END
	  IF @warehouse_type = ''
    BEGIN
    SET @warehouse_type = null
    END
	  IF @Location_ID = 0
    BEGIN
    SET @Location_ID = null
    END
	Insert INTO [dbo].[warehouse]
           (
            [warehouse_name]
           ,[address_id]
           ,[warehouse_type]
           ,[Location_ID]
            )
     VALUES (
            @warehouse_name
           ,@address_id
           ,@warehouse_type
           ,@Location_ID
            )
END
GO
/***********************************************************/
/*************************************************/
/****** - GET STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_GET_WAREHOUSE]    Script Date: 8/29/2014 2:04:12 PM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_GET_WAREHOUSE]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_GET_WAREHOUSE]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_GET_WAREHOUSE]
	  @warehouse_name as varchar(50),
	  @address_id as int,
	  @warehouse_type as varchar(10),
	  @Location_ID as int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	  IF @warehouse_name = ''
    BEGIN
    SET @warehouse_name = null
    END
	  IF @address_id = 0
    BEGIN
    SET @address_id = null
    END
	  IF @warehouse_type = ''
    BEGIN
    SET @warehouse_type = null
    END
	  IF @Location_ID = 0
    BEGIN
    SET @Location_ID = null
    END
    SELECT [warehouse_id] 
      FROM [dbo].[warehouse] 
       WHERE ([warehouse_name] like @warehouse_name)
       AND ([address_id] = @address_id or [address_id] is null)
       AND ([warehouse_type] like @warehouse_type)
       AND ([Location_ID] = @Location_ID or [Location_ID] is null)
END
GO
/***********************************************************/
/*************************************************/
/****** - UPDATE STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_UPDATE_WAREHOUSE]    Script Date: 8/29/2014 2:04:12 PM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_UPDATE_WAREHOUSE]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_UPDATE_WAREHOUSE]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_UPDATE_WAREHOUSE]
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
	  IF @warehouse_name = ''
    BEGIN
    SET @warehouse_name = null
    END
	  IF @address_id = 0
    BEGIN
    SET @address_id = null
    END
	  IF @warehouse_type = ''
    BEGIN
    SET @warehouse_type = null
    END
	  IF @Location_ID = 0
    BEGIN
    SET @Location_ID = null
    END
	UPDATE [dbo].[warehouse]
       SET
		   [warehouse_name] = @warehouse_name,
		   [address_id] = @address_id,
		   [warehouse_type] = @warehouse_type,
		   [Location_ID] = @Location_ID
       WHERE warehouse_id = @warehouse_id
END
GO
/***********************************************************/
/*************************************************/
/****** - DELETE STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_DELETE_WAREHOUSE]    Script Date: 8/29/2014 2:04:12 PM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_DELETE_WAREHOUSE]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_DELETE_WAREHOUSE]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_DELETE_WAREHOUSE]
	@warehouse_id int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	Delete dbo.warehouse
	where warehouse_id = @warehouse_id
END
GO
/***********************************************************/
/*************************************************/
/****** - WHERE CLAUSE STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_SELECT_WAREHOUSE_WC]    Script Date: 8/29/2014 2:04:12 PM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_SELECT_WAREHOUSE_WC]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_SELECT_WAREHOUSE_WC]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_SELECT_WAREHOUSE_WC]
	  @wareclause as varchar(MAX)
AS
Begin
    Declare @string as varchar(MAX)
	Set @string = 'Select * from warehouse where ' + @wareclause
	Exec(@string)
END
GO

/***********************************************************/
/*************************************************/
/****** - SELECT STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_SELECT_AGENCY]    Script Date: 8/29/2014 2:04:13 PM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_SELECT_AGENCY]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_SELECT_AGENCY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_SELECT_AGENCY]
           @agency_id as int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
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
End
GO
/***********************************************************/
/*************************************************/
/****** - INSERT STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_INSERT_AGENCY]    Script Date: 8/29/2014 2:04:13 PM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_INSERT_AGENCY]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_INSERT_AGENCY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_INSERT_AGENCY]
	  @address_id as int,
	  @agency_name as varchar(50),
	  @primary_fName as varchar(50),
	  @primary_lName as varchar(50),
	  @primary_phone as varchar(50),
	  @sec_fName as varchar(50),
	  @sec_lName as varchar(50),
	  @sec_phone as varchar(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	  IF @address_id = 0
    BEGIN
    SET @address_id = null
    END
	  IF @agency_name = ''
    BEGIN
    SET @agency_name = null
    END
	  IF @primary_fName = ''
    BEGIN
    SET @primary_fName = null
    END
	  IF @primary_lName = ''
    BEGIN
    SET @primary_lName = null
    END
	  IF @primary_phone = ''
    BEGIN
    SET @primary_phone = null
    END
	  IF @sec_fName = ''
    BEGIN
    SET @sec_fName = null
    END
	  IF @sec_lName = ''
    BEGIN
    SET @sec_lName = null
    END
	  IF @sec_phone = ''
    BEGIN
    SET @sec_phone = null
    END
	Insert INTO [dbo].[agency]
           (
            [address_id]
           ,[agency_name]
           ,[primary_fName]
           ,[primary_lName]
           ,[primary_phone]
           ,[sec_fName]
           ,[sec_lName]
           ,[sec_phone]
            )
     VALUES (
            @address_id
           ,@agency_name
           ,@primary_fName
           ,@primary_lName
           ,@primary_phone
           ,@sec_fName
           ,@sec_lName
           ,@sec_phone
            )
END
GO
/***********************************************************/
/*************************************************/
/****** - GET STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_GET_AGENCY]    Script Date: 8/29/2014 2:04:13 PM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_GET_AGENCY]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_GET_AGENCY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_GET_AGENCY]
	  @address_id as int,
	  @agency_name as varchar(50),
	  @primary_fName as varchar(50),
	  @primary_lName as varchar(50),
	  @primary_phone as varchar(50),
	  @sec_fName as varchar(50),
	  @sec_lName as varchar(50),
	  @sec_phone as varchar(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	  IF @address_id = 0
    BEGIN
    SET @address_id = null
    END
	  IF @agency_name = ''
    BEGIN
    SET @agency_name = null
    END
	  IF @primary_fName = ''
    BEGIN
    SET @primary_fName = null
    END
	  IF @primary_lName = ''
    BEGIN
    SET @primary_lName = null
    END
	  IF @primary_phone = ''
    BEGIN
    SET @primary_phone = null
    END
	  IF @sec_fName = ''
    BEGIN
    SET @sec_fName = null
    END
	  IF @sec_lName = ''
    BEGIN
    SET @sec_lName = null
    END
	  IF @sec_phone = ''
    BEGIN
    SET @sec_phone = null
    END
    SELECT [agency_id] 
      FROM [dbo].[agency] 
       WHERE ([address_id] = @address_id)
       AND ([agency_name] like @agency_name)
       AND ([primary_fName] like @primary_fName)
       AND ([primary_lName] like @primary_lName)
       AND ([primary_phone] like @primary_phone)
       AND ([sec_fName] like @sec_fName or [sec_fName] is null)
       AND ([sec_lName] like @sec_lName or [sec_lName] is null)
       AND ([sec_phone] like @sec_phone or [sec_phone] is null)
END
GO
/***********************************************************/
/*************************************************/
/****** - UPDATE STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_UPDATE_AGENCY]    Script Date: 8/29/2014 2:04:13 PM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_UPDATE_AGENCY]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_UPDATE_AGENCY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_UPDATE_AGENCY]
	  @agency_id as int,
	  @address_id as int,
	  @agency_name as varchar(50),
	  @primary_fName as varchar(50),
	  @primary_lName as varchar(50),
	  @primary_phone as varchar(50),
	  @sec_fName as varchar(50),
	  @sec_lName as varchar(50),
	  @sec_phone as varchar(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	  IF @address_id = 0
    BEGIN
    SET @address_id = null
    END
	  IF @agency_name = ''
    BEGIN
    SET @agency_name = null
    END
	  IF @primary_fName = ''
    BEGIN
    SET @primary_fName = null
    END
	  IF @primary_lName = ''
    BEGIN
    SET @primary_lName = null
    END
	  IF @primary_phone = ''
    BEGIN
    SET @primary_phone = null
    END
	  IF @sec_fName = ''
    BEGIN
    SET @sec_fName = null
    END
	  IF @sec_lName = ''
    BEGIN
    SET @sec_lName = null
    END
	  IF @sec_phone = ''
    BEGIN
    SET @sec_phone = null
    END
	UPDATE [dbo].[agency]
       SET
		   [address_id] = @address_id,
		   [agency_name] = @agency_name,
		   [primary_fName] = @primary_fName,
		   [primary_lName] = @primary_lName,
		   [primary_phone] = @primary_phone,
		   [sec_fName] = @sec_fName,
		   [sec_lName] = @sec_lName,
		   [sec_phone] = @sec_phone
       WHERE agency_id = @agency_id
END
GO
/***********************************************************/
/*************************************************/
/****** - DELETE STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_DELETE_AGENCY]    Script Date: 8/29/2014 2:04:13 PM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_DELETE_AGENCY]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_DELETE_AGENCY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_DELETE_AGENCY]
	@agency_id int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	Delete dbo.agency
	where agency_id = @agency_id
END
GO
/***********************************************************/
/*************************************************/
/****** - WHERE CLAUSE STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_SELECT_AGENCY_WC]    Script Date: 8/29/2014 2:04:13 PM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_SELECT_AGENCY_WC]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_SELECT_AGENCY_WC]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_SELECT_AGENCY_WC]
	  @wareclause as varchar(MAX)
AS
Begin
    Declare @string as varchar(MAX)
	Set @string = 'Select * from agency where ' + @wareclause
	Exec(@string)
END
GO

/***********************************************************/
/*************************************************/
/****** - SELECT STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_SELECT_AGENCY_EMPLOYEES]    Script Date: 8/29/2014 2:04:14 PM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_SELECT_AGENCY_EMPLOYEES]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_SELECT_AGENCY_EMPLOYEES]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_SELECT_AGENCY_EMPLOYEES]
           @agency_empl_id as int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
SELECT [agency_empl_id]
      ,[agency_id]
      ,[employee_id]
  FROM [dbo].[agency_employees]
 WHERE agency_empl_id = @agency_empl_id
End
GO
/***********************************************************/
/*************************************************/
/****** - INSERT STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_INSERT_AGENCY_EMPLOYEES]    Script Date: 8/29/2014 2:04:14 PM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_INSERT_AGENCY_EMPLOYEES]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_INSERT_AGENCY_EMPLOYEES]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_INSERT_AGENCY_EMPLOYEES]
	  @agency_id as int,
	  @employee_id as int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	  IF @agency_id = 0
    BEGIN
    SET @agency_id = null
    END
	  IF @employee_id = 0
    BEGIN
    SET @employee_id = null
    END
	Insert INTO [dbo].[agency_employees]
           (
            [agency_id]
           ,[employee_id]
            )
     VALUES (
            @agency_id
           ,@employee_id
            )
END
GO
/***********************************************************/
/*************************************************/
/****** - GET STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_GET_AGENCY_EMPLOYEES]    Script Date: 8/29/2014 2:04:14 PM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_GET_AGENCY_EMPLOYEES]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_GET_AGENCY_EMPLOYEES]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_GET_AGENCY_EMPLOYEES]
	  @agency_id as int,
	  @employee_id as int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	  IF @agency_id = 0
    BEGIN
    SET @agency_id = null
    END
	  IF @employee_id = 0
    BEGIN
    SET @employee_id = null
    END
    SELECT [agency_empl_id] 
      FROM [dbo].[agency_employees] 
       WHERE ([agency_id] = @agency_id)
       AND ([employee_id] = @employee_id)
END
GO
/***********************************************************/
/*************************************************/
/****** - UPDATE STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_UPDATE_AGENCY_EMPLOYEES]    Script Date: 8/29/2014 2:04:14 PM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_UPDATE_AGENCY_EMPLOYEES]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_UPDATE_AGENCY_EMPLOYEES]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_UPDATE_AGENCY_EMPLOYEES]
	  @agency_empl_id as int,
	  @agency_id as int,
	  @employee_id as int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	  IF @agency_id = 0
    BEGIN
    SET @agency_id = null
    END
	  IF @employee_id = 0
    BEGIN
    SET @employee_id = null
    END
	UPDATE [dbo].[agency_employees]
       SET
		   [agency_id] = @agency_id,
		   [employee_id] = @employee_id
       WHERE agency_empl_id = @agency_empl_id
END
GO
/***********************************************************/
/*************************************************/
/****** - DELETE STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_DELETE_AGENCY_EMPLOYEES]    Script Date: 8/29/2014 2:04:14 PM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_DELETE_AGENCY_EMPLOYEES]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_DELETE_AGENCY_EMPLOYEES]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_DELETE_AGENCY_EMPLOYEES]
	@agency_empl_id int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	Delete dbo.agency_employees
	where agency_empl_id = @agency_empl_id
END
GO
/***********************************************************/
/*************************************************/
/****** - WHERE CLAUSE STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_SELECT_AGENCY_EMPLOYEES_WC]    Script Date: 8/29/2014 2:04:14 PM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_SELECT_AGENCY_EMPLOYEES_WC]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_SELECT_AGENCY_EMPLOYEES_WC]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_SELECT_AGENCY_EMPLOYEES_WC]
	  @wareclause as varchar(MAX)
AS
Begin
    Declare @string as varchar(MAX)
	Set @string = 'Select * from agency_employees where ' + @wareclause
	Exec(@string)
END
GO

/***********************************************************/
/*************************************************/
/****** - SELECT STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_SELECT_BANK]    Script Date: 8/29/2014 2:04:16 PM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_SELECT_BANK]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_SELECT_BANK]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_SELECT_BANK]
           @Bank_ID as int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
SELECT [Bank_ID]
      ,[Routing_Num]
      ,[Name]
      ,[IsFDIC]
  FROM [dbo].[bank]
 WHERE Bank_ID = @Bank_ID
End
GO
/***********************************************************/
/*************************************************/
/****** - INSERT STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_INSERT_BANK]    Script Date: 8/29/2014 2:04:16 PM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_INSERT_BANK]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_INSERT_BANK]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_INSERT_BANK]
	  @Routing_Num as varchar(20),
	  @Name as varchar(50),
	  @IsFDIC as bit
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	  IF @Routing_Num = ''
    BEGIN
    SET @Routing_Num = null
    END
	  IF @Name = ''
    BEGIN
    SET @Name = null
    END
	  IF @IsFDIC = 0
    BEGIN
    SET @IsFDIC = null
    END
	Insert INTO [dbo].[bank]
           (
            [Routing_Num]
           ,[Name]
           ,[IsFDIC]
            )
     VALUES (
            @Routing_Num
           ,@Name
           ,@IsFDIC
            )
END
GO
/***********************************************************/
/*************************************************/
/****** - GET STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_GET_BANK]    Script Date: 8/29/2014 2:04:16 PM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_GET_BANK]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_GET_BANK]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_GET_BANK]
	  @Routing_Num as varchar(20),
	  @Name as varchar(50),
	  @IsFDIC as bit
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	  IF @Routing_Num = ''
    BEGIN
    SET @Routing_Num = null
    END
	  IF @Name = ''
    BEGIN
    SET @Name = null
    END
	  IF @IsFDIC = 0
    BEGIN
    SET @IsFDIC = null
    END
    SELECT [Bank_ID] 
      FROM [dbo].[bank] 
       WHERE ([Routing_Num] like @Routing_Num)
       AND ([Name] like @Name)
       AND ([IsFDIC] = @IsFDIC)
END
GO
/***********************************************************/
/*************************************************/
/****** - UPDATE STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_UPDATE_BANK]    Script Date: 8/29/2014 2:04:16 PM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_UPDATE_BANK]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_UPDATE_BANK]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_UPDATE_BANK]
	  @Bank_ID as int,
	  @Routing_Num as varchar(20),
	  @Name as varchar(50),
	  @IsFDIC as bit
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	  IF @Routing_Num = ''
    BEGIN
    SET @Routing_Num = null
    END
	  IF @Name = ''
    BEGIN
    SET @Name = null
    END
	  IF @IsFDIC = 0
    BEGIN
    SET @IsFDIC = null
    END
	UPDATE [dbo].[bank]
       SET
		   [Routing_Num] = @Routing_Num,
		   [Name] = @Name,
		   [IsFDIC] = @IsFDIC
       WHERE Bank_ID = @Bank_ID
END
GO
/***********************************************************/
/*************************************************/
/****** - DELETE STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_DELETE_BANK]    Script Date: 8/29/2014 2:04:16 PM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_DELETE_BANK]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_DELETE_BANK]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_DELETE_BANK]
	@Bank_ID int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	Delete dbo.bank
	where Bank_ID = @Bank_ID
END
GO
/***********************************************************/
/*************************************************/
/****** - WHERE CLAUSE STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_SELECT_BANK_WC]    Script Date: 8/29/2014 2:04:16 PM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_SELECT_BANK_WC]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_SELECT_BANK_WC]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_SELECT_BANK_WC]
	  @wareclause as varchar(MAX)
AS
Begin
    Declare @string as varchar(MAX)
	Set @string = 'Select * from bank where ' + @wareclause
	Exec(@string)
END
GO

/***********************************************************/
/*************************************************/
/****** - SELECT STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_SELECT_CALL_CENTER]    Script Date: 8/29/2014 2:04:17 PM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_SELECT_CALL_CENTER]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_SELECT_CALL_CENTER]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_SELECT_CALL_CENTER]
           @call_center_id as int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
SELECT [call_center_id]
      ,[address_id]
      ,[call_center_name]
  FROM [dbo].[call_center]
 WHERE call_center_id = @call_center_id
End
GO
/***********************************************************/
/*************************************************/
/****** - INSERT STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_INSERT_CALL_CENTER]    Script Date: 8/29/2014 2:04:17 PM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_INSERT_CALL_CENTER]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_INSERT_CALL_CENTER]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_INSERT_CALL_CENTER]
	  @address_id as int,
	  @call_center_name as varchar(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	  IF @address_id = 0
    BEGIN
    SET @address_id = null
    END
	  IF @call_center_name = ''
    BEGIN
    SET @call_center_name = null
    END
	Insert INTO [dbo].[call_center]
           (
            [address_id]
           ,[call_center_name]
            )
     VALUES (
            @address_id
           ,@call_center_name
            )
END
GO
/***********************************************************/
/*************************************************/
/****** - GET STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_GET_CALL_CENTER]    Script Date: 8/29/2014 2:04:17 PM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_GET_CALL_CENTER]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_GET_CALL_CENTER]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_GET_CALL_CENTER]
	  @address_id as int,
	  @call_center_name as varchar(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	  IF @address_id = 0
    BEGIN
    SET @address_id = null
    END
	  IF @call_center_name = ''
    BEGIN
    SET @call_center_name = null
    END
    SELECT [call_center_id] 
      FROM [dbo].[call_center] 
       WHERE ([address_id] = @address_id)
       AND ([call_center_name] like @call_center_name)
END
GO
/***********************************************************/
/*************************************************/
/****** - UPDATE STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_UPDATE_CALL_CENTER]    Script Date: 8/29/2014 2:04:17 PM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_UPDATE_CALL_CENTER]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_UPDATE_CALL_CENTER]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_UPDATE_CALL_CENTER]
	  @call_center_id as int,
	  @address_id as int,
	  @call_center_name as varchar(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	  IF @address_id = 0
    BEGIN
    SET @address_id = null
    END
	  IF @call_center_name = ''
    BEGIN
    SET @call_center_name = null
    END
	UPDATE [dbo].[call_center]
       SET
		   [address_id] = @address_id,
		   [call_center_name] = @call_center_name
       WHERE call_center_id = @call_center_id
END
GO
/***********************************************************/
/*************************************************/
/****** - DELETE STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_DELETE_CALL_CENTER]    Script Date: 8/29/2014 2:04:17 PM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_DELETE_CALL_CENTER]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_DELETE_CALL_CENTER]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_DELETE_CALL_CENTER]
	@call_center_id int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	Delete dbo.call_center
	where call_center_id = @call_center_id
END
GO
/***********************************************************/
/*************************************************/
/****** - WHERE CLAUSE STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_SELECT_CALL_CENTER_WC]    Script Date: 8/29/2014 2:04:17 PM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_SELECT_CALL_CENTER_WC]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_SELECT_CALL_CENTER_WC]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_SELECT_CALL_CENTER_WC]
	  @wareclause as varchar(MAX)
AS
Begin
    Declare @string as varchar(MAX)
	Set @string = 'Select * from call_center where ' + @wareclause
	Exec(@string)
END
GO

/***********************************************************/
/*************************************************/
/****** - SELECT STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_SELECT_CALL_CENTER_EMPLOYEE]    Script Date: 8/29/2014 2:04:18 PM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_SELECT_CALL_CENTER_EMPLOYEE]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_SELECT_CALL_CENTER_EMPLOYEE]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_SELECT_CALL_CENTER_EMPLOYEE]
           @call_center_employee_id as int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
SELECT [call_center_employee_id]
      ,[call_center_id]
      ,[employee_id]
  FROM [dbo].[call_center_employee]
 WHERE call_center_employee_id = @call_center_employee_id
End
GO
/***********************************************************/
/*************************************************/
/****** - INSERT STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_INSERT_CALL_CENTER_EMPLOYEE]    Script Date: 8/29/2014 2:04:18 PM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_INSERT_CALL_CENTER_EMPLOYEE]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_INSERT_CALL_CENTER_EMPLOYEE]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_INSERT_CALL_CENTER_EMPLOYEE]
	  @call_center_id as int,
	  @employee_id as int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	  IF @call_center_id = 0
    BEGIN
    SET @call_center_id = null
    END
	  IF @employee_id = 0
    BEGIN
    SET @employee_id = null
    END
	Insert INTO [dbo].[call_center_employee]
           (
            [call_center_id]
           ,[employee_id]
            )
     VALUES (
            @call_center_id
           ,@employee_id
            )
END
GO
/***********************************************************/
/*************************************************/
/****** - GET STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_GET_CALL_CENTER_EMPLOYEE]    Script Date: 8/29/2014 2:04:18 PM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_GET_CALL_CENTER_EMPLOYEE]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_GET_CALL_CENTER_EMPLOYEE]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_GET_CALL_CENTER_EMPLOYEE]
	  @call_center_id as int,
	  @employee_id as int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	  IF @call_center_id = 0
    BEGIN
    SET @call_center_id = null
    END
	  IF @employee_id = 0
    BEGIN
    SET @employee_id = null
    END
    SELECT [call_center_employee_id] 
      FROM [dbo].[call_center_employee] 
       WHERE ([call_center_id] = @call_center_id)
       AND ([employee_id] = @employee_id)
END
GO
/***********************************************************/
/*************************************************/
/****** - UPDATE STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_UPDATE_CALL_CENTER_EMPLOYEE]    Script Date: 8/29/2014 2:04:18 PM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_UPDATE_CALL_CENTER_EMPLOYEE]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_UPDATE_CALL_CENTER_EMPLOYEE]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_UPDATE_CALL_CENTER_EMPLOYEE]
	  @call_center_employee_id as int,
	  @call_center_id as int,
	  @employee_id as int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	  IF @call_center_id = 0
    BEGIN
    SET @call_center_id = null
    END
	  IF @employee_id = 0
    BEGIN
    SET @employee_id = null
    END
	UPDATE [dbo].[call_center_employee]
       SET
		   [call_center_id] = @call_center_id,
		   [employee_id] = @employee_id
       WHERE call_center_employee_id = @call_center_employee_id
END
GO
/***********************************************************/
/*************************************************/
/****** - DELETE STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_DELETE_CALL_CENTER_EMPLOYEE]    Script Date: 8/29/2014 2:04:18 PM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_DELETE_CALL_CENTER_EMPLOYEE]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_DELETE_CALL_CENTER_EMPLOYEE]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_DELETE_CALL_CENTER_EMPLOYEE]
	@call_center_employee_id int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	Delete dbo.call_center_employee
	where call_center_employee_id = @call_center_employee_id
END
GO
/***********************************************************/
/*************************************************/
/****** - WHERE CLAUSE STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_SELECT_CALL_CENTER_EMPLOYEE_WC]    Script Date: 8/29/2014 2:04:18 PM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_SELECT_CALL_CENTER_EMPLOYEE_WC]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_SELECT_CALL_CENTER_EMPLOYEE_WC]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_SELECT_CALL_CENTER_EMPLOYEE_WC]
	  @wareclause as varchar(MAX)
AS
Begin
    Declare @string as varchar(MAX)
	Set @string = 'Select * from call_center_employee where ' + @wareclause
	Exec(@string)
END
GO

/***********************************************************/
/*************************************************/
/****** - SELECT STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_SELECT_PRODUCTS]    Script Date: 8/29/2014 2:04:19 PM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_SELECT_PRODUCTS]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_SELECT_PRODUCTS]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_SELECT_PRODUCTS]
           @product_id as int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
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
  FROM [dbo].[products]
 WHERE product_id = @product_id
End
GO
/***********************************************************/
/*************************************************/
/****** - INSERT STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_INSERT_PRODUCTS]    Script Date: 8/29/2014 2:04:19 PM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_INSERT_PRODUCTS]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_INSERT_PRODUCTS]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_INSERT_PRODUCTS]
	  @Resource_ID as int,
	  @product_name as varchar(50),
	  @product_type as varchar(50),
	  @product_qty as int,
	  @product_desc as text,
	  @product_color as varchar(10),
	  @product_size as varchar(50),
	  @product_cost as money,
	  @Product_exp_date as datetime,
	  @Product_Alergy_info as varchar(50),
	  @Product_refrigde as char(1),
	  @Product_Flammable as char(1),
	  @Product_Hazard as char(1),
	  @Product_Other as varchar(1),
	  @Product_Min_Inv as int,
	  @Product_Barcode as varchar(MAX),
	  @Product_subtype as varchar(50),
	  @Make as varchar(50),
	  @Model as varchar(50),
	  @FEMA_Description as varchar(2000),
	  @Year as varchar(20),
	  @RFID as varchar(20),
	  @GPS as geography,
	  @Serial_Number as varchar(20),
	  @Height as varchar(20),
	  @Length as varchar(20),
	  @Depth as varchar(20),
	  @Weight as varchar(20),
	  @OAI as varchar(20),
	  @OAI_Type as varchar(20),
	  @Use as varchar(50),
	  @Brand as varchar(50),
	  @Power_Supply as varchar(20),
	  @Gas_Type as varchar(20),
	  @Needs_Gas as bit,
	  @Needs_Electricity as bit,
	  @Availability as varchar(1),
	  @Datetime as datetime,
	  @OpenStatus as varchar(1)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	  IF @Resource_ID = 0
    BEGIN
    SET @Resource_ID = null
    END
	  IF @product_name = ''
    BEGIN
    SET @product_name = null
    END
	  IF @product_type = ''
    BEGIN
    SET @product_type = null
    END
	  IF @product_qty = 0
    BEGIN
    SET @product_qty = null
    END
	  IF @product_color = ''
    BEGIN
    SET @product_color = null
    END
	  IF @product_size = ''
    BEGIN
    SET @product_size = null
    END
	  IF @product_cost = 0
    BEGIN
    SET @product_cost = null
    END
	  IF @Product_exp_date = '9/9/1900 12:00:00 AM'
    BEGIN
    SET @Product_exp_date = null
    END
	  IF @Product_Alergy_info = ''
    BEGIN
    SET @Product_Alergy_info = null
    END
	  IF @Product_refrigde = ''
    BEGIN
    SET @Product_refrigde = null
    END
	  IF @Product_Flammable = ''
    BEGIN
    SET @Product_Flammable = null
    END
	  IF @Product_Hazard = ''
    BEGIN
    SET @Product_Hazard = null
    END
	  IF @Product_Other = ''
    BEGIN
    SET @Product_Other = null
    END
	  IF @Product_Min_Inv = 0
    BEGIN
    SET @Product_Min_Inv = null
    END
	  IF @Product_Barcode = ''
    BEGIN
    SET @Product_Barcode = null
    END
	  IF @Product_subtype = ''
    BEGIN
    SET @Product_subtype = null
    END
	  IF @Make = ''
    BEGIN
    SET @Make = null
    END
	  IF @Model = ''
    BEGIN
    SET @Model = null
    END
	  IF @FEMA_Description = ''
    BEGIN
    SET @FEMA_Description = null
    END
	  IF @Year = ''
    BEGIN
    SET @Year = null
    END
	  IF @RFID = ''
    BEGIN
    SET @RFID = null
    END
	  IF @Serial_Number = ''
    BEGIN
    SET @Serial_Number = null
    END
	  IF @Height = ''
    BEGIN
    SET @Height = null
    END
	  IF @Length = ''
    BEGIN
    SET @Length = null
    END
	  IF @Depth = ''
    BEGIN
    SET @Depth = null
    END
	  IF @Weight = ''
    BEGIN
    SET @Weight = null
    END
	  IF @OAI = ''
    BEGIN
    SET @OAI = null
    END
	  IF @OAI_Type = ''
    BEGIN
    SET @OAI_Type = null
    END
	  IF @Use = ''
    BEGIN
    SET @Use = null
    END
	  IF @Brand = ''
    BEGIN
    SET @Brand = null
    END
	  IF @Power_Supply = ''
    BEGIN
    SET @Power_Supply = null
    END
	  IF @Gas_Type = ''
    BEGIN
    SET @Gas_Type = null
    END
	  IF @Needs_Gas = 0
    BEGIN
    SET @Needs_Gas = null
    END
	  IF @Needs_Electricity = 0
    BEGIN
    SET @Needs_Electricity = null
    END
	  IF @Availability = ''
    BEGIN
    SET @Availability = null
    END
	  IF @Datetime = '9/9/1900 12:00:00 AM'
    BEGIN
    SET @Datetime = null
    END
	  IF @OpenStatus = ''
    BEGIN
    SET @OpenStatus = null
    END
	Insert INTO [dbo].[products]
           (
            [Resource_ID]
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
            )
     VALUES (
            @Resource_ID
           ,@product_name
           ,@product_type
           ,@product_qty
           ,@product_desc
           ,@product_color
           ,@product_size
           ,@product_cost
           ,@Product_exp_date
           ,@Product_Alergy_info
           ,@Product_refrigde
           ,@Product_Flammable
           ,@Product_Hazard
           ,@Product_Other
           ,@Product_Min_Inv
           ,@Product_Barcode
           ,@Product_subtype
           ,@Make
           ,@Model
           ,@FEMA_Description
           ,@Year
           ,@RFID
           ,@GPS
           ,@Serial_Number
           ,@Height
           ,@Length
           ,@Depth
           ,@Weight
           ,@OAI
           ,@OAI_Type
           ,@Use
           ,@Brand
           ,@Power_Supply
           ,@Gas_Type
           ,@Needs_Gas
           ,@Needs_Electricity
           ,@Availability
           ,@Datetime
           ,@OpenStatus
            )
END
GO
/***********************************************************/
/*************************************************/
/****** - GET STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_GET_PRODUCTS]    Script Date: 8/29/2014 2:04:19 PM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_GET_PRODUCTS]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_GET_PRODUCTS]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_GET_PRODUCTS]
	  @Resource_ID as int,
	  @product_name as varchar(50),
	  @product_type as varchar(50),
	  @product_qty as int,
	  @product_desc as text,
	  @product_color as varchar(10),
	  @product_size as varchar(50),
	  @product_cost as money,
	  @Product_exp_date as datetime,
	  @Product_Alergy_info as varchar(50),
	  @Product_refrigde as char(1),
	  @Product_Flammable as char(1),
	  @Product_Hazard as char(1),
	  @Product_Other as varchar(1),
	  @Product_Min_Inv as int,
	  @Product_Barcode as varchar(MAX),
	  @Product_subtype as varchar(50),
	  @Make as varchar(50),
	  @Model as varchar(50),
	  @FEMA_Description as varchar(2000),
	  @Year as varchar(20),
	  @RFID as varchar(20),
	  @GPS as geography,
	  @Serial_Number as varchar(20),
	  @Height as varchar(20),
	  @Length as varchar(20),
	  @Depth as varchar(20),
	  @Weight as varchar(20),
	  @OAI as varchar(20),
	  @OAI_Type as varchar(20),
	  @Use as varchar(50),
	  @Brand as varchar(50),
	  @Power_Supply as varchar(20),
	  @Gas_Type as varchar(20),
	  @Needs_Gas as bit,
	  @Needs_Electricity as bit,
	  @Availability as varchar(1),
	  @Datetime as datetime,
	  @OpenStatus as varchar(1)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	  IF @Resource_ID = 0
    BEGIN
    SET @Resource_ID = null
    END
	  IF @product_name = ''
    BEGIN
    SET @product_name = null
    END
	  IF @product_type = ''
    BEGIN
    SET @product_type = null
    END
	  IF @product_qty = 0
    BEGIN
    SET @product_qty = null
    END
	  IF @product_color = ''
    BEGIN
    SET @product_color = null
    END
	  IF @product_size = ''
    BEGIN
    SET @product_size = null
    END
	  IF @product_cost = 0
    BEGIN
    SET @product_cost = null
    END
	  IF @Product_exp_date = '9/9/1900 12:00:00 AM'
    BEGIN
    SET @Product_exp_date = null
    END
	  IF @Product_Alergy_info = ''
    BEGIN
    SET @Product_Alergy_info = null
    END
	  IF @Product_refrigde = ''
    BEGIN
    SET @Product_refrigde = null
    END
	  IF @Product_Flammable = ''
    BEGIN
    SET @Product_Flammable = null
    END
	  IF @Product_Hazard = ''
    BEGIN
    SET @Product_Hazard = null
    END
	  IF @Product_Other = ''
    BEGIN
    SET @Product_Other = null
    END
	  IF @Product_Min_Inv = 0
    BEGIN
    SET @Product_Min_Inv = null
    END
	  IF @Product_Barcode = ''
    BEGIN
    SET @Product_Barcode = null
    END
	  IF @Product_subtype = ''
    BEGIN
    SET @Product_subtype = null
    END
	  IF @Make = ''
    BEGIN
    SET @Make = null
    END
	  IF @Model = ''
    BEGIN
    SET @Model = null
    END
	  IF @FEMA_Description = ''
    BEGIN
    SET @FEMA_Description = null
    END
	  IF @Year = ''
    BEGIN
    SET @Year = null
    END
	  IF @RFID = ''
    BEGIN
    SET @RFID = null
    END
	  IF @Serial_Number = ''
    BEGIN
    SET @Serial_Number = null
    END
	  IF @Height = ''
    BEGIN
    SET @Height = null
    END
	  IF @Length = ''
    BEGIN
    SET @Length = null
    END
	  IF @Depth = ''
    BEGIN
    SET @Depth = null
    END
	  IF @Weight = ''
    BEGIN
    SET @Weight = null
    END
	  IF @OAI = ''
    BEGIN
    SET @OAI = null
    END
	  IF @OAI_Type = ''
    BEGIN
    SET @OAI_Type = null
    END
	  IF @Use = ''
    BEGIN
    SET @Use = null
    END
	  IF @Brand = ''
    BEGIN
    SET @Brand = null
    END
	  IF @Power_Supply = ''
    BEGIN
    SET @Power_Supply = null
    END
	  IF @Gas_Type = ''
    BEGIN
    SET @Gas_Type = null
    END
	  IF @Needs_Gas = 0
    BEGIN
    SET @Needs_Gas = null
    END
	  IF @Needs_Electricity = 0
    BEGIN
    SET @Needs_Electricity = null
    END
	  IF @Availability = ''
    BEGIN
    SET @Availability = null
    END
	  IF @Datetime = '9/9/1900 12:00:00 AM'
    BEGIN
    SET @Datetime = null
    END
	  IF @OpenStatus = ''
    BEGIN
    SET @OpenStatus = null
    END
    SELECT [product_id] 
      FROM [dbo].[products] 
       WHERE ([Resource_ID] = @Resource_ID or [Resource_ID] is null)
       AND ([product_name] like @product_name)
       AND ([product_type] like @product_type)
       AND ([product_qty] = @product_qty)
       AND ([product_desc] like @product_desc)
       AND ([product_color] like @product_color or [product_color] is null)
       AND ([product_size] like @product_size or [product_size] is null)
       AND ([product_cost] = @product_cost or [product_cost] is null)
       AND ([Product_exp_date] = @Product_exp_date or [Product_exp_date] is null)
       AND ([Product_Alergy_info] like @Product_Alergy_info or [Product_Alergy_info] is null)
       AND ([Product_refrigde] = @Product_refrigde or [Product_refrigde] is null)
       AND ([Product_Flammable] = @Product_Flammable or [Product_Flammable] is null)
       AND ([Product_Hazard] = @Product_Hazard or [Product_Hazard] is null)
       AND ([Product_Other] like @Product_Other or [Product_Other] is null)
       AND ([Product_Min_Inv] = @Product_Min_Inv or [Product_Min_Inv] is null)
       AND ([Product_Barcode] like @Product_Barcode or [Product_Barcode] is null)
       AND ([Product_subtype] like @Product_subtype or [Product_subtype] is null)
       AND ([Make] like @Make or [Make] is null)
       AND ([Model] like @Model or [Model] is null)
       AND ([FEMA_Description] like @FEMA_Description or [FEMA_Description] is null)
       AND ([Year] like @Year or [Year] is null)
       AND ([RFID] like @RFID or [RFID] is null)
       AND ([Serial_Number] like @Serial_Number or [Serial_Number] is null)
       AND ([Height] like @Height or [Height] is null)
       AND ([Length] like @Length or [Length] is null)
       AND ([Depth] like @Depth or [Depth] is null)
       AND ([Weight] like @Weight or [Weight] is null)
       AND ([OAI] like @OAI or [OAI] is null)
       AND ([OAI_Type] like @OAI_Type or [OAI_Type] is null)
       AND ([Use] like @Use or [Use] is null)
       AND ([Brand] like @Brand or [Brand] is null)
       AND ([Power_Supply] like @Power_Supply or [Power_Supply] is null)
       AND ([Gas_Type] like @Gas_Type or [Gas_Type] is null)
       AND ([Needs_Gas] = @Needs_Gas or [Needs_Gas] is null)
       AND ([Needs_Electricity] = @Needs_Electricity or [Needs_Electricity] is null)
       AND ([Availability] like @Availability or [Availability] is null)
       AND ([Datetime] = @Datetime or [Datetime] is null)
       AND ([OpenStatus] like @OpenStatus or [OpenStatus] is null)
END
GO
/***********************************************************/
/*************************************************/
/****** - UPDATE STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_UPDATE_PRODUCTS]    Script Date: 8/29/2014 2:04:19 PM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_UPDATE_PRODUCTS]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_UPDATE_PRODUCTS]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_UPDATE_PRODUCTS]
	  @product_id as int,
	  @Resource_ID as int,
	  @product_name as varchar(50),
	  @product_type as varchar(50),
	  @product_qty as int,
	  @product_desc as text,
	  @product_color as varchar(10),
	  @product_size as varchar(50),
	  @product_cost as money,
	  @Product_exp_date as datetime,
	  @Product_Alergy_info as varchar(50),
	  @Product_refrigde as char(1),
	  @Product_Flammable as char(1),
	  @Product_Hazard as char(1),
	  @Product_Other as varchar(1),
	  @Product_Min_Inv as int,
	  @Product_Barcode as varchar(MAX),
	  @Product_subtype as varchar(50),
	  @Make as varchar(50),
	  @Model as varchar(50),
	  @FEMA_Description as varchar(2000),
	  @Year as varchar(20),
	  @RFID as varchar(20),
	  @GPS as geography,
	  @Serial_Number as varchar(20),
	  @Height as varchar(20),
	  @Length as varchar(20),
	  @Depth as varchar(20),
	  @Weight as varchar(20),
	  @OAI as varchar(20),
	  @OAI_Type as varchar(20),
	  @Use as varchar(50),
	  @Brand as varchar(50),
	  @Power_Supply as varchar(20),
	  @Gas_Type as varchar(20),
	  @Needs_Gas as bit,
	  @Needs_Electricity as bit,
	  @Availability as varchar(1),
	  @Datetime as datetime,
	  @OpenStatus as varchar(1)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	  IF @Resource_ID = 0
    BEGIN
    SET @Resource_ID = null
    END
	  IF @product_name = ''
    BEGIN
    SET @product_name = null
    END
	  IF @product_type = ''
    BEGIN
    SET @product_type = null
    END
	  IF @product_qty = 0
    BEGIN
    SET @product_qty = null
    END
	  IF @product_color = ''
    BEGIN
    SET @product_color = null
    END
	  IF @product_size = ''
    BEGIN
    SET @product_size = null
    END
	  IF @product_cost = 0
    BEGIN
    SET @product_cost = null
    END
	  IF @Product_exp_date = '9/9/1900 12:00:00 AM'
    BEGIN
    SET @Product_exp_date = null
    END
	  IF @Product_Alergy_info = ''
    BEGIN
    SET @Product_Alergy_info = null
    END
	  IF @Product_refrigde = ''
    BEGIN
    SET @Product_refrigde = null
    END
	  IF @Product_Flammable = ''
    BEGIN
    SET @Product_Flammable = null
    END
	  IF @Product_Hazard = ''
    BEGIN
    SET @Product_Hazard = null
    END
	  IF @Product_Other = ''
    BEGIN
    SET @Product_Other = null
    END
	  IF @Product_Min_Inv = 0
    BEGIN
    SET @Product_Min_Inv = null
    END
	  IF @Product_Barcode = ''
    BEGIN
    SET @Product_Barcode = null
    END
	  IF @Product_subtype = ''
    BEGIN
    SET @Product_subtype = null
    END
	  IF @Make = ''
    BEGIN
    SET @Make = null
    END
	  IF @Model = ''
    BEGIN
    SET @Model = null
    END
	  IF @FEMA_Description = ''
    BEGIN
    SET @FEMA_Description = null
    END
	  IF @Year = ''
    BEGIN
    SET @Year = null
    END
	  IF @RFID = ''
    BEGIN
    SET @RFID = null
    END
	  IF @Serial_Number = ''
    BEGIN
    SET @Serial_Number = null
    END
	  IF @Height = ''
    BEGIN
    SET @Height = null
    END
	  IF @Length = ''
    BEGIN
    SET @Length = null
    END
	  IF @Depth = ''
    BEGIN
    SET @Depth = null
    END
	  IF @Weight = ''
    BEGIN
    SET @Weight = null
    END
	  IF @OAI = ''
    BEGIN
    SET @OAI = null
    END
	  IF @OAI_Type = ''
    BEGIN
    SET @OAI_Type = null
    END
	  IF @Use = ''
    BEGIN
    SET @Use = null
    END
	  IF @Brand = ''
    BEGIN
    SET @Brand = null
    END
	  IF @Power_Supply = ''
    BEGIN
    SET @Power_Supply = null
    END
	  IF @Gas_Type = ''
    BEGIN
    SET @Gas_Type = null
    END
	  IF @Needs_Gas = 0
    BEGIN
    SET @Needs_Gas = null
    END
	  IF @Needs_Electricity = 0
    BEGIN
    SET @Needs_Electricity = null
    END
	  IF @Availability = ''
    BEGIN
    SET @Availability = null
    END
	  IF @Datetime = '9/9/1900 12:00:00 AM'
    BEGIN
    SET @Datetime = null
    END
	  IF @OpenStatus = ''
    BEGIN
    SET @OpenStatus = null
    END
	UPDATE [dbo].[products]
       SET
		   [Resource_ID] = @Resource_ID,
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
		   [OAI_Type] = @OAI_Type,
		   [Use] = @Use,
		   [Brand] = @Brand,
		   [Power_Supply] = @Power_Supply,
		   [Gas_Type] = @Gas_Type,
		   [Needs_Gas] = @Needs_Gas,
		   [Needs_Electricity] = @Needs_Electricity,
		   [Availability] = @Availability,
		   [Datetime] = @Datetime,
		   [OpenStatus] = @OpenStatus
       WHERE product_id = @product_id
END
GO
/***********************************************************/
/*************************************************/
/****** - DELETE STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_DELETE_PRODUCTS]    Script Date: 8/29/2014 2:04:19 PM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_DELETE_PRODUCTS]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_DELETE_PRODUCTS]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_DELETE_PRODUCTS]
	@product_id int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	Delete dbo.products
	where product_id = @product_id
END
GO
/***********************************************************/
/*************************************************/
/****** - WHERE CLAUSE STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_SELECT_PRODUCTS_WC]    Script Date: 8/29/2014 2:04:19 PM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_SELECT_PRODUCTS_WC]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_SELECT_PRODUCTS_WC]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_SELECT_PRODUCTS_WC]
	  @wareclause as varchar(MAX)
AS
Begin
    Declare @string as varchar(MAX)
	Set @string = 'Select * from products where ' + @wareclause
	Exec(@string)
END
GO

/***********************************************************/
/*************************************************/
/****** - SELECT STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_SELECT_CASE_INTAKE]    Script Date: 8/29/2014 2:04:20 PM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_SELECT_CASE_INTAKE]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_SELECT_CASE_INTAKE]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_SELECT_CASE_INTAKE]
           @case_id as int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
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
/***********************************************************/
/*************************************************/
/****** - INSERT STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_INSERT_CASE_INTAKE]    Script Date: 8/29/2014 2:04:20 PM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_INSERT_CASE_INTAKE]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_INSERT_CASE_INTAKE]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_INSERT_CASE_INTAKE]
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
	  IF @applic_end_date_time = '9/9/1900 12:00:00 AM'
    BEGIN
    SET @applic_end_date_time = null
    END
	  IF @applic_start_date_time = '9/9/1900 12:00:00 AM'
    BEGIN
    SET @applic_start_date_time = null
    END
	  IF @circum_emergency_event = ''
    BEGIN
    SET @circum_emergency_event = null
    END
	  IF @circum_income_stolen = ''
    BEGIN
    SET @circum_income_stolen = null
    END
	  IF @circum_no_income = ''
    BEGIN
    SET @circum_no_income = null
    END
	  IF @circum_not_enough_income = ''
    BEGIN
    SET @circum_not_enough_income = null
    END
	  IF @agency_id = 0
    BEGIN
    SET @agency_id = null
    END
	  IF @call_center_id = 0
    BEGIN
    SET @call_center_id = null
    END
	Insert INTO [dbo].[case_intake]
           (
            [applic_end_date_time]
           ,[applic_start_date_time]
           ,[circum_emergency_event]
           ,[circum_help_request_memo]
           ,[circum_income_stolen]
           ,[circum_memo]
           ,[circum_no_income]
           ,[circum_not_enough_income]
           ,[agency_id]
           ,[call_center_id]
            )
     VALUES (
            @applic_end_date_time
           ,@applic_start_date_time
           ,@circum_emergency_event
           ,@circum_help_request_memo
           ,@circum_income_stolen
           ,@circum_memo
           ,@circum_no_income
           ,@circum_not_enough_income
           ,@agency_id
           ,@call_center_id
            )
END
GO
/***********************************************************/
/*************************************************/
/****** - GET STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_GET_CASE_INTAKE]    Script Date: 8/29/2014 2:04:20 PM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_GET_CASE_INTAKE]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_GET_CASE_INTAKE]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_GET_CASE_INTAKE]
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
	  IF @applic_end_date_time = '9/9/1900 12:00:00 AM'
    BEGIN
    SET @applic_end_date_time = null
    END
	  IF @applic_start_date_time = '9/9/1900 12:00:00 AM'
    BEGIN
    SET @applic_start_date_time = null
    END
	  IF @circum_emergency_event = ''
    BEGIN
    SET @circum_emergency_event = null
    END
	  IF @circum_income_stolen = ''
    BEGIN
    SET @circum_income_stolen = null
    END
	  IF @circum_no_income = ''
    BEGIN
    SET @circum_no_income = null
    END
	  IF @circum_not_enough_income = ''
    BEGIN
    SET @circum_not_enough_income = null
    END
	  IF @agency_id = 0
    BEGIN
    SET @agency_id = null
    END
	  IF @call_center_id = 0
    BEGIN
    SET @call_center_id = null
    END
    SELECT [case_id] 
      FROM [dbo].[case_intake] 
       WHERE ([applic_end_date_time] = @applic_end_date_time or [applic_end_date_time] is null)
       AND ([applic_start_date_time] = @applic_start_date_time)
       AND ([circum_emergency_event] like @circum_emergency_event)
       AND ([circum_help_request_memo] like @circum_help_request_memo)
       AND ([circum_income_stolen] like @circum_income_stolen)
       AND ([circum_memo] like @circum_memo)
       AND ([circum_no_income] like @circum_no_income)
       AND ([circum_not_enough_income] like @circum_not_enough_income)
       AND ([agency_id] = @agency_id or [agency_id] is null)
       AND ([call_center_id] = @call_center_id or [call_center_id] is null)
END
GO
/***********************************************************/
/*************************************************/
/****** - UPDATE STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_UPDATE_CASE_INTAKE]    Script Date: 8/29/2014 2:04:20 PM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_UPDATE_CASE_INTAKE]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_UPDATE_CASE_INTAKE]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_UPDATE_CASE_INTAKE]
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
	  IF @applic_end_date_time = '9/9/1900 12:00:00 AM'
    BEGIN
    SET @applic_end_date_time = null
    END
	  IF @applic_start_date_time = '9/9/1900 12:00:00 AM'
    BEGIN
    SET @applic_start_date_time = null
    END
	  IF @circum_emergency_event = ''
    BEGIN
    SET @circum_emergency_event = null
    END
	  IF @circum_income_stolen = ''
    BEGIN
    SET @circum_income_stolen = null
    END
	  IF @circum_no_income = ''
    BEGIN
    SET @circum_no_income = null
    END
	  IF @circum_not_enough_income = ''
    BEGIN
    SET @circum_not_enough_income = null
    END
	  IF @agency_id = 0
    BEGIN
    SET @agency_id = null
    END
	  IF @call_center_id = 0
    BEGIN
    SET @call_center_id = null
    END
	UPDATE [dbo].[case_intake]
       SET
		   [applic_end_date_time] = @applic_end_date_time,
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
END
GO
/***********************************************************/
/*************************************************/
/****** - DELETE STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_DELETE_CASE_INTAKE]    Script Date: 8/29/2014 2:04:20 PM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_DELETE_CASE_INTAKE]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_DELETE_CASE_INTAKE]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_DELETE_CASE_INTAKE]
	@case_id int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	Delete dbo.case_intake
	where case_id = @case_id
END
GO
/***********************************************************/
/*************************************************/
/****** - WHERE CLAUSE STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_SELECT_CASE_INTAKE_WC]    Script Date: 8/29/2014 2:04:20 PM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_SELECT_CASE_INTAKE_WC]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_SELECT_CASE_INTAKE_WC]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_SELECT_CASE_INTAKE_WC]
	  @wareclause as varchar(MAX)
AS
Begin
    Declare @string as varchar(MAX)
	Set @string = 'Select * from case_intake where ' + @wareclause
	Exec(@string)
END
GO

/***********************************************************/
/*************************************************/
/****** - SELECT STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_SELECT_DONOR_PRODUCT]    Script Date: 8/29/2014 2:04:22 PM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_SELECT_DONOR_PRODUCT]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_SELECT_DONOR_PRODUCT]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_SELECT_DONOR_PRODUCT]
           @DonorProductID as int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
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
/***********************************************************/
/*************************************************/
/****** - INSERT STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_INSERT_DONOR_PRODUCT]    Script Date: 8/29/2014 2:04:22 PM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_INSERT_DONOR_PRODUCT]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_INSERT_DONOR_PRODUCT]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_INSERT_DONOR_PRODUCT]
	  @DonorID as int,
	  @ProductID as int,
	  @quantity as int,
	  @other_info as varchar(50),
	  @Product_rec_date as datetime,
	  @AmountOfProdDonated as varchar(1)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	  IF @DonorID = 0
    BEGIN
    SET @DonorID = null
    END
	  IF @ProductID = 0
    BEGIN
    SET @ProductID = null
    END
	  IF @quantity = 0
    BEGIN
    SET @quantity = null
    END
	  IF @other_info = ''
    BEGIN
    SET @other_info = null
    END
	  IF @Product_rec_date = '9/9/1900 12:00:00 AM'
    BEGIN
    SET @Product_rec_date = null
    END
	  IF @AmountOfProdDonated = ''
    BEGIN
    SET @AmountOfProdDonated = null
    END
	Insert INTO [dbo].[Donor_Product]
           (
            [DonorID]
           ,[ProductID]
           ,[quantity]
           ,[other_info]
           ,[Product_rec_date]
           ,[AmountOfProdDonated]
            )
     VALUES (
            @DonorID
           ,@ProductID
           ,@quantity
           ,@other_info
           ,@Product_rec_date
           ,@AmountOfProdDonated
            )
END
GO
/***********************************************************/
/*************************************************/
/****** - GET STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_GET_DONOR_PRODUCT]    Script Date: 8/29/2014 2:04:22 PM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_GET_DONOR_PRODUCT]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_GET_DONOR_PRODUCT]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_GET_DONOR_PRODUCT]
	  @DonorID as int,
	  @ProductID as int,
	  @quantity as int,
	  @other_info as varchar(50),
	  @Product_rec_date as datetime,
	  @AmountOfProdDonated as varchar(1)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	  IF @DonorID = 0
    BEGIN
    SET @DonorID = null
    END
	  IF @ProductID = 0
    BEGIN
    SET @ProductID = null
    END
	  IF @quantity = 0
    BEGIN
    SET @quantity = null
    END
	  IF @other_info = ''
    BEGIN
    SET @other_info = null
    END
	  IF @Product_rec_date = '9/9/1900 12:00:00 AM'
    BEGIN
    SET @Product_rec_date = null
    END
	  IF @AmountOfProdDonated = ''
    BEGIN
    SET @AmountOfProdDonated = null
    END
    SELECT [DonorProductID] 
      FROM [dbo].[Donor_Product] 
       WHERE ([DonorID] = @DonorID)
       AND ([ProductID] = @ProductID)
       AND ([quantity] = @quantity or [quantity] is null)
       AND ([other_info] like @other_info or [other_info] is null)
       AND ([Product_rec_date] = @Product_rec_date)
       AND ([AmountOfProdDonated] like @AmountOfProdDonated or [AmountOfProdDonated] is null)
END
GO
/***********************************************************/
/*************************************************/
/****** - UPDATE STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_UPDATE_DONOR_PRODUCT]    Script Date: 8/29/2014 2:04:22 PM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_UPDATE_DONOR_PRODUCT]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_UPDATE_DONOR_PRODUCT]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_UPDATE_DONOR_PRODUCT]
	  @DonorProductID as int,
	  @DonorID as int,
	  @ProductID as int,
	  @quantity as int,
	  @other_info as varchar(50),
	  @Product_rec_date as datetime,
	  @AmountOfProdDonated as varchar(1)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	  IF @DonorID = 0
    BEGIN
    SET @DonorID = null
    END
	  IF @ProductID = 0
    BEGIN
    SET @ProductID = null
    END
	  IF @quantity = 0
    BEGIN
    SET @quantity = null
    END
	  IF @other_info = ''
    BEGIN
    SET @other_info = null
    END
	  IF @Product_rec_date = '9/9/1900 12:00:00 AM'
    BEGIN
    SET @Product_rec_date = null
    END
	  IF @AmountOfProdDonated = ''
    BEGIN
    SET @AmountOfProdDonated = null
    END
	UPDATE [dbo].[Donor_Product]
       SET
		   [DonorID] = @DonorID,
		   [ProductID] = @ProductID,
		   [quantity] = @quantity,
		   [other_info] = @other_info,
		   [Product_rec_date] = @Product_rec_date,
		   [AmountOfProdDonated] = @AmountOfProdDonated
       WHERE DonorProductID = @DonorProductID
END
GO
/***********************************************************/
/*************************************************/
/****** - DELETE STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_DELETE_DONOR_PRODUCT]    Script Date: 8/29/2014 2:04:22 PM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_DELETE_DONOR_PRODUCT]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_DELETE_DONOR_PRODUCT]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_DELETE_DONOR_PRODUCT]
	@DonorProductID int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	Delete dbo.Donor_Product
	where DonorProductID = @DonorProductID
END
GO
/***********************************************************/
/*************************************************/
/****** - WHERE CLAUSE STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_SELECT_DONOR_PRODUCT_WC]    Script Date: 8/29/2014 2:04:22 PM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_SELECT_DONOR_PRODUCT_WC]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_SELECT_DONOR_PRODUCT_WC]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_SELECT_DONOR_PRODUCT_WC]
	  @wareclause as varchar(MAX)
AS
Begin
    Declare @string as varchar(MAX)
	Set @string = 'Select * from Donor_Product where ' + @wareclause
	Exec(@string)
END
GO

/***********************************************************/
/*************************************************/
/****** - SELECT STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_SELECT_FOOD]    Script Date: 8/29/2014 2:04:23 PM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_SELECT_FOOD]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_SELECT_FOOD]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_SELECT_FOOD]
           @food_voucher_id as int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
SELECT [food_voucher_id]
      ,[clients_served]
      ,[food_voucher_number]
      ,[date_issued]
      ,[Product_id]
  FROM [dbo].[food]
 WHERE food_voucher_id = @food_voucher_id
End
GO
/***********************************************************/
/*************************************************/
/****** - INSERT STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_INSERT_FOOD]    Script Date: 8/29/2014 2:04:23 PM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_INSERT_FOOD]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_INSERT_FOOD]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_INSERT_FOOD]
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
	  IF @clients_served = 0
    BEGIN
    SET @clients_served = null
    END
	  IF @food_voucher_number = 0
    BEGIN
    SET @food_voucher_number = null
    END
	  IF @date_issued = '9/9/1900 12:00:00 AM'
    BEGIN
    SET @date_issued = null
    END
	  IF @Product_id = 0
    BEGIN
    SET @Product_id = null
    END
	Insert INTO [dbo].[food]
           (
            [food_voucher_id]
           ,[clients_served]
           ,[food_voucher_number]
           ,[date_issued]
           ,[Product_id]
            )
     VALUES (
            @food_voucher_id
           ,@clients_served
           ,@food_voucher_number
           ,@date_issued
           ,@Product_id
            )
END
GO
/***********************************************************/
/*************************************************/
/****** - GET STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_GET_FOOD]    Script Date: 8/29/2014 2:04:23 PM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_GET_FOOD]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_GET_FOOD]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_GET_FOOD]
	  @clients_served as int,
	  @food_voucher_number as int,
	  @date_issued as datetime,
	  @Product_id as int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	  IF @clients_served = 0
    BEGIN
    SET @clients_served = null
    END
	  IF @food_voucher_number = 0
    BEGIN
    SET @food_voucher_number = null
    END
	  IF @date_issued = '9/9/1900 12:00:00 AM'
    BEGIN
    SET @date_issued = null
    END
	  IF @Product_id = 0
    BEGIN
    SET @Product_id = null
    END
    SELECT [food_voucher_id] 
      FROM [dbo].[food] 
       WHERE ([clients_served] = @clients_served)
       AND ([food_voucher_number] = @food_voucher_number)
       AND ([date_issued] = @date_issued)
       AND ([Product_id] = @Product_id)
END
GO
/***********************************************************/
/*************************************************/
/****** - UPDATE STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_UPDATE_FOOD]    Script Date: 8/29/2014 2:04:23 PM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_UPDATE_FOOD]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_UPDATE_FOOD]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_UPDATE_FOOD]
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
	  IF @clients_served = 0
    BEGIN
    SET @clients_served = null
    END
	  IF @food_voucher_number = 0
    BEGIN
    SET @food_voucher_number = null
    END
	  IF @date_issued = '9/9/1900 12:00:00 AM'
    BEGIN
    SET @date_issued = null
    END
	  IF @Product_id = 0
    BEGIN
    SET @Product_id = null
    END
	UPDATE [dbo].[food]
       SET
		   [clients_served] = @clients_served,
		   [food_voucher_number] = @food_voucher_number,
		   [date_issued] = @date_issued,
		   [Product_id] = @Product_id
       WHERE food_voucher_id = @food_voucher_id
END
GO
/***********************************************************/
/*************************************************/
/****** - DELETE STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_DELETE_FOOD]    Script Date: 8/29/2014 2:04:23 PM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_DELETE_FOOD]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_DELETE_FOOD]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_DELETE_FOOD]
	@food_voucher_id int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	Delete dbo.food
	where food_voucher_id = @food_voucher_id
END
GO
/***********************************************************/
/*************************************************/
/****** - WHERE CLAUSE STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_SELECT_FOOD_WC]    Script Date: 8/29/2014 2:04:23 PM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_SELECT_FOOD_WC]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_SELECT_FOOD_WC]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_SELECT_FOOD_WC]
	  @wareclause as varchar(MAX)
AS
Begin
    Declare @string as varchar(MAX)
	Set @string = 'Select * from food where ' + @wareclause
	Exec(@string)
END
GO

/***********************************************************/
/*************************************************/
/****** - SELECT STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_SELECT_LOT]    Script Date: 8/29/2014 2:04:25 PM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_SELECT_LOT]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_SELECT_LOT]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_SELECT_LOT]
           @lot_id as int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
SELECT [lot_id]
      ,[product_id]
      ,[manufactured_date]
      ,[expiration_date]
      ,[manufacture_name]
  FROM [dbo].[lot]
 WHERE lot_id = @lot_id
End
GO
/***********************************************************/
/*************************************************/
/****** - INSERT STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_INSERT_LOT]    Script Date: 8/29/2014 2:04:25 PM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_INSERT_LOT]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_INSERT_LOT]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_INSERT_LOT]
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
    SET @product_id = null
    END
	  IF @manufactured_date = '9/9/1900 12:00:00 AM'
    BEGIN
    SET @manufactured_date = null
    END
	  IF @expiration_date = '9/9/1900 12:00:00 AM'
    BEGIN
    SET @expiration_date = null
    END
	  IF @manufacture_name = ''
    BEGIN
    SET @manufacture_name = null
    END
	Insert INTO [dbo].[lot]
           (
            [product_id]
           ,[manufactured_date]
           ,[expiration_date]
           ,[manufacture_name]
            )
     VALUES (
            @product_id
           ,@manufactured_date
           ,@expiration_date
           ,@manufacture_name
            )
END
GO
/***********************************************************/
/*************************************************/
/****** - GET STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_GET_LOT]    Script Date: 8/29/2014 2:04:25 PM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_GET_LOT]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_GET_LOT]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_GET_LOT]
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
    SET @product_id = null
    END
	  IF @manufactured_date = '9/9/1900 12:00:00 AM'
    BEGIN
    SET @manufactured_date = null
    END
	  IF @expiration_date = '9/9/1900 12:00:00 AM'
    BEGIN
    SET @expiration_date = null
    END
	  IF @manufacture_name = ''
    BEGIN
    SET @manufacture_name = null
    END
    SELECT [lot_id] 
      FROM [dbo].[lot] 
       WHERE ([product_id] = @product_id)
       AND ([manufactured_date] = @manufactured_date or [manufactured_date] is null)
       AND ([expiration_date] = @expiration_date or [expiration_date] is null)
       AND ([manufacture_name] like @manufacture_name or [manufacture_name] is null)
END
GO
/***********************************************************/
/*************************************************/
/****** - UPDATE STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_UPDATE_LOT]    Script Date: 8/29/2014 2:04:25 PM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_UPDATE_LOT]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_UPDATE_LOT]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_UPDATE_LOT]
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
    SET @product_id = null
    END
	  IF @manufactured_date = '9/9/1900 12:00:00 AM'
    BEGIN
    SET @manufactured_date = null
    END
	  IF @expiration_date = '9/9/1900 12:00:00 AM'
    BEGIN
    SET @expiration_date = null
    END
	  IF @manufacture_name = ''
    BEGIN
    SET @manufacture_name = null
    END
	UPDATE [dbo].[lot]
       SET
		   [product_id] = @product_id,
		   [manufactured_date] = @manufactured_date,
		   [expiration_date] = @expiration_date,
		   [manufacture_name] = @manufacture_name
       WHERE lot_id = @lot_id
END
GO
/***********************************************************/
/*************************************************/
/****** - DELETE STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_DELETE_LOT]    Script Date: 8/29/2014 2:04:25 PM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_DELETE_LOT]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_DELETE_LOT]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_DELETE_LOT]
	@lot_id int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	Delete dbo.lot
	where lot_id = @lot_id
END
GO
/***********************************************************/
/*************************************************/
/****** - WHERE CLAUSE STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_SELECT_LOT_WC]    Script Date: 8/29/2014 2:04:25 PM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_SELECT_LOT_WC]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_SELECT_LOT_WC]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_SELECT_LOT_WC]
	  @wareclause as varchar(MAX)
AS
Begin
    Declare @string as varchar(MAX)
	Set @string = 'Select * from lot where ' + @wareclause
	Exec(@string)
END
GO

/***********************************************************/
/*************************************************/
/****** - SELECT STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_SELECT_MEDICINE]    Script Date: 8/29/2014 2:04:26 PM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_SELECT_MEDICINE]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_SELECT_MEDICINE]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_SELECT_MEDICINE]
           @Medicine_Id as int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
SELECT [Medicine_Id]
      ,[Medication_type]
      ,[Medication_name]
      ,[Clients_Served]
  FROM [dbo].[medicine]
 WHERE Medicine_Id = @Medicine_Id
End
GO
/***********************************************************/
/*************************************************/
/****** - INSERT STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_INSERT_MEDICINE]    Script Date: 8/29/2014 2:04:26 PM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_INSERT_MEDICINE]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_INSERT_MEDICINE]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_INSERT_MEDICINE]
	  @Medication_type as varchar(30),
	  @Medication_name as varchar(50),
	  @Clients_Served as int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	  IF @Medication_type = ''
    BEGIN
    SET @Medication_type = null
    END
	  IF @Medication_name = ''
    BEGIN
    SET @Medication_name = null
    END
	  IF @Clients_Served = 0
    BEGIN
    SET @Clients_Served = null
    END
	Insert INTO [dbo].[medicine]
           (
            [Medication_type]
           ,[Medication_name]
           ,[Clients_Served]
            )
     VALUES (
            @Medication_type
           ,@Medication_name
           ,@Clients_Served
            )
END
GO
/***********************************************************/
/*************************************************/
/****** - GET STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_GET_MEDICINE]    Script Date: 8/29/2014 2:04:26 PM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_GET_MEDICINE]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_GET_MEDICINE]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_GET_MEDICINE]
	  @Medication_type as varchar(30),
	  @Medication_name as varchar(50),
	  @Clients_Served as int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	  IF @Medication_type = ''
    BEGIN
    SET @Medication_type = null
    END
	  IF @Medication_name = ''
    BEGIN
    SET @Medication_name = null
    END
	  IF @Clients_Served = 0
    BEGIN
    SET @Clients_Served = null
    END
    SELECT [Medicine_Id] 
      FROM [dbo].[medicine] 
       WHERE ([Medication_type] like @Medication_type)
       AND ([Medication_name] like @Medication_name)
       AND ([Clients_Served] = @Clients_Served or [Clients_Served] is null)
END
GO
/***********************************************************/
/*************************************************/
/****** - UPDATE STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_UPDATE_MEDICINE]    Script Date: 8/29/2014 2:04:26 PM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_UPDATE_MEDICINE]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_UPDATE_MEDICINE]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_UPDATE_MEDICINE]
	  @Medicine_Id as int,
	  @Medication_type as varchar(30),
	  @Medication_name as varchar(50),
	  @Clients_Served as int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	  IF @Medication_type = ''
    BEGIN
    SET @Medication_type = null
    END
	  IF @Medication_name = ''
    BEGIN
    SET @Medication_name = null
    END
	  IF @Clients_Served = 0
    BEGIN
    SET @Clients_Served = null
    END
	UPDATE [dbo].[medicine]
       SET
		   [Medication_type] = @Medication_type,
		   [Medication_name] = @Medication_name,
		   [Clients_Served] = @Clients_Served
       WHERE Medicine_Id = @Medicine_Id
END
GO
/***********************************************************/
/*************************************************/
/****** - DELETE STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_DELETE_MEDICINE]    Script Date: 8/29/2014 2:04:26 PM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_DELETE_MEDICINE]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_DELETE_MEDICINE]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_DELETE_MEDICINE]
	@Medicine_Id int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	Delete dbo.medicine
	where Medicine_Id = @Medicine_Id
END
GO
/***********************************************************/
/*************************************************/
/****** - WHERE CLAUSE STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_SELECT_MEDICINE_WC]    Script Date: 8/29/2014 2:04:26 PM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_SELECT_MEDICINE_WC]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_SELECT_MEDICINE_WC]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_SELECT_MEDICINE_WC]
	  @wareclause as varchar(MAX)
AS
Begin
    Declare @string as varchar(MAX)
	Set @string = 'Select * from medicine where ' + @wareclause
	Exec(@string)
END
GO

/***********************************************************/
/*************************************************/
/****** - SELECT STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_SELECT_VACCINE]    Script Date: 8/29/2014 2:04:27 PM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_SELECT_VACCINE]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_SELECT_VACCINE]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_SELECT_VACCINE]
           @vaccine_id as int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
SELECT [vaccine_id]
      ,[medicine_id]
      ,[Num_of_reg_doses]
      ,[vaccine_name]
  FROM [dbo].[vaccine]
 WHERE vaccine_id = @vaccine_id
End
GO
/***********************************************************/
/*************************************************/
/****** - INSERT STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_INSERT_VACCINE]    Script Date: 8/29/2014 2:04:27 PM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_INSERT_VACCINE]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_INSERT_VACCINE]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_INSERT_VACCINE]
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
    SET @medicine_id = null
    END
	  IF @Num_of_reg_doses = 0
    BEGIN
    SET @Num_of_reg_doses = null
    END
	  IF @vaccine_name = ''
    BEGIN
    SET @vaccine_name = null
    END
	Insert INTO [dbo].[vaccine]
           (
            [medicine_id]
           ,[Num_of_reg_doses]
           ,[vaccine_name]
            )
     VALUES (
            @medicine_id
           ,@Num_of_reg_doses
           ,@vaccine_name
            )
END
GO
/***********************************************************/
/*************************************************/
/****** - GET STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_GET_VACCINE]    Script Date: 8/29/2014 2:04:27 PM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_GET_VACCINE]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_GET_VACCINE]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_GET_VACCINE]
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
    SET @medicine_id = null
    END
	  IF @Num_of_reg_doses = 0
    BEGIN
    SET @Num_of_reg_doses = null
    END
	  IF @vaccine_name = ''
    BEGIN
    SET @vaccine_name = null
    END
    SELECT [vaccine_id] 
      FROM [dbo].[vaccine] 
       WHERE ([medicine_id] = @medicine_id)
       AND ([Num_of_reg_doses] = @Num_of_reg_doses or [Num_of_reg_doses] is null)
       AND ([vaccine_name] like @vaccine_name)
END
GO
/***********************************************************/
/*************************************************/
/****** - UPDATE STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_UPDATE_VACCINE]    Script Date: 8/29/2014 2:04:27 PM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_UPDATE_VACCINE]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_UPDATE_VACCINE]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_UPDATE_VACCINE]
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
    SET @medicine_id = null
    END
	  IF @Num_of_reg_doses = 0
    BEGIN
    SET @Num_of_reg_doses = null
    END
	  IF @vaccine_name = ''
    BEGIN
    SET @vaccine_name = null
    END
	UPDATE [dbo].[vaccine]
       SET
		   [medicine_id] = @medicine_id,
		   [Num_of_reg_doses] = @Num_of_reg_doses,
		   [vaccine_name] = @vaccine_name
       WHERE vaccine_id = @vaccine_id
END
GO
/***********************************************************/
/*************************************************/
/****** - DELETE STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_DELETE_VACCINE]    Script Date: 8/29/2014 2:04:27 PM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_DELETE_VACCINE]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_DELETE_VACCINE]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_DELETE_VACCINE]
	@vaccine_id int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	Delete dbo.vaccine
	where vaccine_id = @vaccine_id
END
GO
/***********************************************************/
/*************************************************/
/****** - WHERE CLAUSE STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_SELECT_VACCINE_WC]    Script Date: 8/29/2014 2:04:27 PM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_SELECT_VACCINE_WC]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_SELECT_VACCINE_WC]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_SELECT_VACCINE_WC]
	  @wareclause as varchar(MAX)
AS
Begin
    Declare @string as varchar(MAX)
	Set @string = 'Select * from vaccine where ' + @wareclause
	Exec(@string)
END
GO

/***********************************************************/
/*************************************************/
/****** - SELECT STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_SELECT_DISASTER]    Script Date: 8/29/2014 2:04:33 PM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_SELECT_DISASTER]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_SELECT_DISASTER]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_SELECT_DISASTER]
           @disaster_id as int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
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
/***********************************************************/
/*************************************************/
/****** - INSERT STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_INSERT_DISASTER]    Script Date: 8/29/2014 2:04:33 PM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_INSERT_DISASTER]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_INSERT_DISASTER]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_INSERT_DISASTER]
	  @disaster_name as varchar(50),
	  @disaster_type as varchar(30),
	  @disaster_start_date as datetime,
	  @disaster_end_date as datetime,
	  @disaster_north_latitude as decimal,
	  @disaster_north_longitude as decimal,
	  @disaster_south_latitude as decimal,
	  @disaster_south_longitude as decimal,
	  @disaster_east_latitude as decimal,
	  @disaster_east_longitude as decimal,
	  @disaster_west_latitude as decimal,
	  @disaster_west_longitude as decimal
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	  IF @disaster_name = ''
    BEGIN
    SET @disaster_name = null
    END
	  IF @disaster_type = ''
    BEGIN
    SET @disaster_type = null
    END
	  IF @disaster_start_date = '9/9/1900 12:00:00 AM'
    BEGIN
    SET @disaster_start_date = null
    END
	  IF @disaster_end_date = '9/9/1900 12:00:00 AM'
    BEGIN
    SET @disaster_end_date = null
    END
	  IF @disaster_north_latitude = 0
    BEGIN
    SET @disaster_north_latitude = null
    END
	  IF @disaster_north_longitude = 0
    BEGIN
    SET @disaster_north_longitude = null
    END
	  IF @disaster_south_latitude = 0
    BEGIN
    SET @disaster_south_latitude = null
    END
	  IF @disaster_south_longitude = 0
    BEGIN
    SET @disaster_south_longitude = null
    END
	  IF @disaster_east_latitude = 0
    BEGIN
    SET @disaster_east_latitude = null
    END
	  IF @disaster_east_longitude = 0
    BEGIN
    SET @disaster_east_longitude = null
    END
	  IF @disaster_west_latitude = 0
    BEGIN
    SET @disaster_west_latitude = null
    END
	  IF @disaster_west_longitude = 0
    BEGIN
    SET @disaster_west_longitude = null
    END
	Insert INTO [dbo].[disaster]
           (
            [disaster_name]
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
            )
     VALUES (
            @disaster_name
           ,@disaster_type
           ,@disaster_start_date
           ,@disaster_end_date
           ,@disaster_north_latitude
           ,@disaster_north_longitude
           ,@disaster_south_latitude
           ,@disaster_south_longitude
           ,@disaster_east_latitude
           ,@disaster_east_longitude
           ,@disaster_west_latitude
           ,@disaster_west_longitude
            )
END
GO
/***********************************************************/
/*************************************************/
/****** - GET STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_GET_DISASTER]    Script Date: 8/29/2014 2:04:33 PM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_GET_DISASTER]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_GET_DISASTER]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_GET_DISASTER]
	  @disaster_name as varchar(50),
	  @disaster_type as varchar(30),
	  @disaster_start_date as datetime,
	  @disaster_end_date as datetime,
	  @disaster_north_latitude as decimal,
	  @disaster_north_longitude as decimal,
	  @disaster_south_latitude as decimal,
	  @disaster_south_longitude as decimal,
	  @disaster_east_latitude as decimal,
	  @disaster_east_longitude as decimal,
	  @disaster_west_latitude as decimal,
	  @disaster_west_longitude as decimal
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	  IF @disaster_name = ''
    BEGIN
    SET @disaster_name = null
    END
	  IF @disaster_type = ''
    BEGIN
    SET @disaster_type = null
    END
	  IF @disaster_start_date = '9/9/1900 12:00:00 AM'
    BEGIN
    SET @disaster_start_date = null
    END
	  IF @disaster_end_date = '9/9/1900 12:00:00 AM'
    BEGIN
    SET @disaster_end_date = null
    END
	  IF @disaster_north_latitude = 0
    BEGIN
    SET @disaster_north_latitude = null
    END
	  IF @disaster_north_longitude = 0
    BEGIN
    SET @disaster_north_longitude = null
    END
	  IF @disaster_south_latitude = 0
    BEGIN
    SET @disaster_south_latitude = null
    END
	  IF @disaster_south_longitude = 0
    BEGIN
    SET @disaster_south_longitude = null
    END
	  IF @disaster_east_latitude = 0
    BEGIN
    SET @disaster_east_latitude = null
    END
	  IF @disaster_east_longitude = 0
    BEGIN
    SET @disaster_east_longitude = null
    END
	  IF @disaster_west_latitude = 0
    BEGIN
    SET @disaster_west_latitude = null
    END
	  IF @disaster_west_longitude = 0
    BEGIN
    SET @disaster_west_longitude = null
    END
    SELECT [disaster_id] 
      FROM [dbo].[disaster] 
       WHERE ([disaster_name] like @disaster_name)
       AND ([disaster_type] like @disaster_type)
       AND ([disaster_start_date] = @disaster_start_date)
       AND ([disaster_end_date] = @disaster_end_date or [disaster_end_date] is null)
       AND ([disaster_north_latitude] = @disaster_north_latitude or [disaster_north_latitude] is null)
       AND ([disaster_north_longitude] = @disaster_north_longitude or [disaster_north_longitude] is null)
       AND ([disaster_south_latitude] = @disaster_south_latitude or [disaster_south_latitude] is null)
       AND ([disaster_south_longitude] = @disaster_south_longitude or [disaster_south_longitude] is null)
       AND ([disaster_east_latitude] = @disaster_east_latitude or [disaster_east_latitude] is null)
       AND ([disaster_east_longitude] = @disaster_east_longitude or [disaster_east_longitude] is null)
       AND ([disaster_west_latitude] = @disaster_west_latitude or [disaster_west_latitude] is null)
       AND ([disaster_west_longitude] = @disaster_west_longitude or [disaster_west_longitude] is null)
END
GO
/***********************************************************/
/*************************************************/
/****** - UPDATE STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_UPDATE_DISASTER]    Script Date: 8/29/2014 2:04:33 PM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_UPDATE_DISASTER]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_UPDATE_DISASTER]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_UPDATE_DISASTER]
	  @disaster_id as int,
	  @disaster_name as varchar(50),
	  @disaster_type as varchar(30),
	  @disaster_start_date as datetime,
	  @disaster_end_date as datetime,
	  @disaster_north_latitude as decimal,
	  @disaster_north_longitude as decimal,
	  @disaster_south_latitude as decimal,
	  @disaster_south_longitude as decimal,
	  @disaster_east_latitude as decimal,
	  @disaster_east_longitude as decimal,
	  @disaster_west_latitude as decimal,
	  @disaster_west_longitude as decimal
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	  IF @disaster_name = ''
    BEGIN
    SET @disaster_name = null
    END
	  IF @disaster_type = ''
    BEGIN
    SET @disaster_type = null
    END
	  IF @disaster_start_date = '9/9/1900 12:00:00 AM'
    BEGIN
    SET @disaster_start_date = null
    END
	  IF @disaster_end_date = '9/9/1900 12:00:00 AM'
    BEGIN
    SET @disaster_end_date = null
    END
	  IF @disaster_north_latitude = 0
    BEGIN
    SET @disaster_north_latitude = null
    END
	  IF @disaster_north_longitude = 0
    BEGIN
    SET @disaster_north_longitude = null
    END
	  IF @disaster_south_latitude = 0
    BEGIN
    SET @disaster_south_latitude = null
    END
	  IF @disaster_south_longitude = 0
    BEGIN
    SET @disaster_south_longitude = null
    END
	  IF @disaster_east_latitude = 0
    BEGIN
    SET @disaster_east_latitude = null
    END
	  IF @disaster_east_longitude = 0
    BEGIN
    SET @disaster_east_longitude = null
    END
	  IF @disaster_west_latitude = 0
    BEGIN
    SET @disaster_west_latitude = null
    END
	  IF @disaster_west_longitude = 0
    BEGIN
    SET @disaster_west_longitude = null
    END
	UPDATE [dbo].[disaster]
       SET
		   [disaster_name] = @disaster_name,
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
END
GO
/***********************************************************/
/*************************************************/
/****** - DELETE STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_DELETE_DISASTER]    Script Date: 8/29/2014 2:04:33 PM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_DELETE_DISASTER]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_DELETE_DISASTER]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_DELETE_DISASTER]
	@disaster_id int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	Delete dbo.disaster
	where disaster_id = @disaster_id
END
GO
/***********************************************************/
/*************************************************/
/****** - WHERE CLAUSE STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_SELECT_DISASTER_WC]    Script Date: 8/29/2014 2:04:33 PM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_SELECT_DISASTER_WC]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_SELECT_DISASTER_WC]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_SELECT_DISASTER_WC]
	  @wareclause as varchar(MAX)
AS
Begin
    Declare @string as varchar(MAX)
	Set @string = 'Select * from disaster where ' + @wareclause
	Exec(@string)
END
GO

/***********************************************************/
/*************************************************/
/****** - SELECT STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_SELECT_MOBILE_PRODUCT]    Script Date: 8/29/2014 2:04:34 PM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_SELECT_MOBILE_PRODUCT]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_SELECT_MOBILE_PRODUCT]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_SELECT_MOBILE_PRODUCT]
           @Mobile_Product_id as int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
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
/***********************************************************/
/*************************************************/
/****** - INSERT STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_INSERT_MOBILE_PRODUCT]    Script Date: 8/29/2014 2:04:34 PM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_INSERT_MOBILE_PRODUCT]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_INSERT_MOBILE_PRODUCT]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_INSERT_MOBILE_PRODUCT]
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
    SET @Mobile_Unit_id = null
    END
	  IF @Product_id = 0
    BEGIN
    SET @Product_id = null
    END
	  IF @Case_id = 0
    BEGIN
    SET @Case_id = null
    END
	  IF @Lot_id = 0
    BEGIN
    SET @Lot_id = null
    END
	  IF @Min_inv = 0
    BEGIN
    SET @Min_inv = null
    END
	  IF @Quantity = 0
    BEGIN
    SET @Quantity = null
    END
	  IF @Experiation_Date = '9/9/1900 12:00:00 AM'
    BEGIN
    SET @Experiation_Date = null
    END
	Insert INTO [dbo].[Mobile_Product]
           (
            [Mobile_Unit_id]
           ,[Product_id]
           ,[Case_id]
           ,[Lot_id]
           ,[Min_inv]
           ,[Quantity]
           ,[Experiation_Date]
            )
     VALUES (
            @Mobile_Unit_id
           ,@Product_id
           ,@Case_id
           ,@Lot_id
           ,@Min_inv
           ,@Quantity
           ,@Experiation_Date
            )
END
GO
/***********************************************************/
/*************************************************/
/****** - GET STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_GET_MOBILE_PRODUCT]    Script Date: 8/29/2014 2:04:34 PM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_GET_MOBILE_PRODUCT]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_GET_MOBILE_PRODUCT]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_GET_MOBILE_PRODUCT]
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
    SET @Mobile_Unit_id = null
    END
	  IF @Product_id = 0
    BEGIN
    SET @Product_id = null
    END
	  IF @Case_id = 0
    BEGIN
    SET @Case_id = null
    END
	  IF @Lot_id = 0
    BEGIN
    SET @Lot_id = null
    END
	  IF @Min_inv = 0
    BEGIN
    SET @Min_inv = null
    END
	  IF @Quantity = 0
    BEGIN
    SET @Quantity = null
    END
	  IF @Experiation_Date = '9/9/1900 12:00:00 AM'
    BEGIN
    SET @Experiation_Date = null
    END
    SELECT [Mobile_Product_id] 
      FROM [dbo].[Mobile_Product] 
       WHERE ([Mobile_Unit_id] = @Mobile_Unit_id)
       AND ([Product_id] = @Product_id)
       AND ([Case_id] = @Case_id or [Case_id] is null)
       AND ([Lot_id] = @Lot_id or [Lot_id] is null)
       AND ([Min_inv] = @Min_inv or [Min_inv] is null)
       AND ([Quantity] = @Quantity or [Quantity] is null)
       AND ([Experiation_Date] = @Experiation_Date or [Experiation_Date] is null)
END
GO
/***********************************************************/
/*************************************************/
/****** - UPDATE STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_UPDATE_MOBILE_PRODUCT]    Script Date: 8/29/2014 2:04:34 PM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_UPDATE_MOBILE_PRODUCT]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_UPDATE_MOBILE_PRODUCT]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_UPDATE_MOBILE_PRODUCT]
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
    SET @Mobile_Unit_id = null
    END
	  IF @Product_id = 0
    BEGIN
    SET @Product_id = null
    END
	  IF @Case_id = 0
    BEGIN
    SET @Case_id = null
    END
	  IF @Lot_id = 0
    BEGIN
    SET @Lot_id = null
    END
	  IF @Min_inv = 0
    BEGIN
    SET @Min_inv = null
    END
	  IF @Quantity = 0
    BEGIN
    SET @Quantity = null
    END
	  IF @Experiation_Date = '9/9/1900 12:00:00 AM'
    BEGIN
    SET @Experiation_Date = null
    END
	UPDATE [dbo].[Mobile_Product]
       SET
		   [Mobile_Unit_id] = @Mobile_Unit_id,
		   [Product_id] = @Product_id,
		   [Case_id] = @Case_id,
		   [Lot_id] = @Lot_id,
		   [Min_inv] = @Min_inv,
		   [Quantity] = @Quantity,
		   [Experiation_Date] = @Experiation_Date
       WHERE Mobile_Product_id = @Mobile_Product_id
END
GO
/***********************************************************/
/*************************************************/
/****** - DELETE STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_DELETE_MOBILE_PRODUCT]    Script Date: 8/29/2014 2:04:34 PM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_DELETE_MOBILE_PRODUCT]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_DELETE_MOBILE_PRODUCT]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_DELETE_MOBILE_PRODUCT]
	@Mobile_Product_id int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	Delete dbo.Mobile_Product
	where Mobile_Product_id = @Mobile_Product_id
END
GO
/***********************************************************/
/*************************************************/
/****** - WHERE CLAUSE STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_SELECT_MOBILE_PRODUCT_WC]    Script Date: 8/29/2014 2:04:34 PM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_SELECT_MOBILE_PRODUCT_WC]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_SELECT_MOBILE_PRODUCT_WC]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_SELECT_MOBILE_PRODUCT_WC]
	  @wareclause as varchar(MAX)
AS
Begin
    Declare @string as varchar(MAX)
	Set @string = 'Select * from Mobile_Product where ' + @wareclause
	Exec(@string)
END
GO

/***********************************************************/
/*************************************************/
/****** - SELECT STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_SELECT_VENDOR_PRODUCTS]    Script Date: 8/29/2014 2:04:36 PM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_SELECT_VENDOR_PRODUCTS]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_SELECT_VENDOR_PRODUCTS]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_SELECT_VENDOR_PRODUCTS]
           @vendor_prod_id as int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
SELECT [vendor_prod_id]
      ,[vendor_id]
      ,[product_id]
      ,[product_qty]
      ,[Product_exp_date]
      ,[lot_id]
      ,[Department]
  FROM [dbo].[vendor_products]
 WHERE vendor_prod_id = @vendor_prod_id
End
GO
/***********************************************************/
/*************************************************/
/****** - INSERT STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_INSERT_VENDOR_PRODUCTS]    Script Date: 8/29/2014 2:04:36 PM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_INSERT_VENDOR_PRODUCTS]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_INSERT_VENDOR_PRODUCTS]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_INSERT_VENDOR_PRODUCTS]
	  @vendor_id as int,
	  @product_id as int,
	  @product_qty as int,
	  @Product_exp_date as char(1),
	  @lot_id as int,
	  @Department as varchar(100)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	  IF @vendor_id = 0
    BEGIN
    SET @vendor_id = null
    END
	  IF @product_id = 0
    BEGIN
    SET @product_id = null
    END
	  IF @product_qty = 0
    BEGIN
    SET @product_qty = null
    END
	  IF @Product_exp_date = ''
    BEGIN
    SET @Product_exp_date = null
    END
	  IF @lot_id = 0
    BEGIN
    SET @lot_id = null
    END
	  IF @Department = ''
    BEGIN
    SET @Department = null
    END
	Insert INTO [dbo].[vendor_products]
           (
            [vendor_id]
           ,[product_id]
           ,[product_qty]
           ,[Product_exp_date]
           ,[lot_id]
           ,[Department]
            )
     VALUES (
            @vendor_id
           ,@product_id
           ,@product_qty
           ,@Product_exp_date
           ,@lot_id
           ,@Department
            )
END
GO
/***********************************************************/
/*************************************************/
/****** - GET STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_GET_VENDOR_PRODUCTS]    Script Date: 8/29/2014 2:04:36 PM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_GET_VENDOR_PRODUCTS]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_GET_VENDOR_PRODUCTS]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_GET_VENDOR_PRODUCTS]
	  @vendor_id as int,
	  @product_id as int,
	  @product_qty as int,
	  @Product_exp_date as char(1),
	  @lot_id as int,
	  @Department as varchar(100)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	  IF @vendor_id = 0
    BEGIN
    SET @vendor_id = null
    END
	  IF @product_id = 0
    BEGIN
    SET @product_id = null
    END
	  IF @product_qty = 0
    BEGIN
    SET @product_qty = null
    END
	  IF @Product_exp_date = ''
    BEGIN
    SET @Product_exp_date = null
    END
	  IF @lot_id = 0
    BEGIN
    SET @lot_id = null
    END
	  IF @Department = ''
    BEGIN
    SET @Department = null
    END
    SELECT [vendor_prod_id] 
      FROM [dbo].[vendor_products] 
       WHERE ([vendor_id] = @vendor_id)
       AND ([product_id] = @product_id)
       AND ([product_qty] = @product_qty)
       AND ([Product_exp_date] = @Product_exp_date or [Product_exp_date] is null)
       AND ([lot_id] = @lot_id or [lot_id] is null)
       AND ([Department] like @Department or [Department] is null)
END
GO
/***********************************************************/
/*************************************************/
/****** - UPDATE STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_UPDATE_VENDOR_PRODUCTS]    Script Date: 8/29/2014 2:04:36 PM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_UPDATE_VENDOR_PRODUCTS]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_UPDATE_VENDOR_PRODUCTS]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_UPDATE_VENDOR_PRODUCTS]
	  @vendor_prod_id as int,
	  @vendor_id as int,
	  @product_id as int,
	  @product_qty as int,
	  @Product_exp_date as char(1),
	  @lot_id as int,
	  @Department as varchar(100)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	  IF @vendor_id = 0
    BEGIN
    SET @vendor_id = null
    END
	  IF @product_id = 0
    BEGIN
    SET @product_id = null
    END
	  IF @product_qty = 0
    BEGIN
    SET @product_qty = null
    END
	  IF @Product_exp_date = ''
    BEGIN
    SET @Product_exp_date = null
    END
	  IF @lot_id = 0
    BEGIN
    SET @lot_id = null
    END
	  IF @Department = ''
    BEGIN
    SET @Department = null
    END
	UPDATE [dbo].[vendor_products]
       SET
		   [vendor_id] = @vendor_id,
		   [product_id] = @product_id,
		   [product_qty] = @product_qty,
		   [Product_exp_date] = @Product_exp_date,
		   [lot_id] = @lot_id,
		   [Department] = @Department
       WHERE vendor_prod_id = @vendor_prod_id
END
GO
/***********************************************************/
/*************************************************/
/****** - DELETE STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_DELETE_VENDOR_PRODUCTS]    Script Date: 8/29/2014 2:04:36 PM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_DELETE_VENDOR_PRODUCTS]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_DELETE_VENDOR_PRODUCTS]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_DELETE_VENDOR_PRODUCTS]
	@vendor_prod_id int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	Delete dbo.vendor_products
	where vendor_prod_id = @vendor_prod_id
END
GO
/***********************************************************/
/*************************************************/
/****** - WHERE CLAUSE STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_SELECT_VENDOR_PRODUCTS_WC]    Script Date: 8/29/2014 2:04:36 PM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_SELECT_VENDOR_PRODUCTS_WC]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_SELECT_VENDOR_PRODUCTS_WC]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_SELECT_VENDOR_PRODUCTS_WC]
	  @wareclause as varchar(MAX)
AS
Begin
    Declare @string as varchar(MAX)
	Set @string = 'Select * from vendor_products where ' + @wareclause
	Exec(@string)
END
GO

/***********************************************************/
/*************************************************/
/****** - SELECT STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_SELECT_DONATION]    Script Date: 8/29/2014 2:04:37 PM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_SELECT_DONATION]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_SELECT_DONATION]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_SELECT_DONATION]
           @Donation_ID as int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
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
End
GO
/***********************************************************/
/*************************************************/
/****** - INSERT STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_INSERT_DONATION]    Script Date: 8/29/2014 2:04:37 PM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_INSERT_DONATION]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_INSERT_DONATION]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_INSERT_DONATION]
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
	  IF @Receipt_ID = 0
    BEGIN
    SET @Receipt_ID = null
    END
	  IF @Resource_ID = 0
    BEGIN
    SET @Resource_ID = null
    END
	  IF @Donor_ID = 0
    BEGIN
    SET @Donor_ID = null
    END
	  IF @Date = '9/9/1900 12:00:00 AM'
    BEGIN
    SET @Date = null
    END
	  IF @Quantity = 0
    BEGIN
    SET @Quantity = null
    END
	  IF @Agency_ID = 0
    BEGIN
    SET @Agency_ID = null
    END
	  IF @Is_Monetary = 0
    BEGIN
    SET @Is_Monetary = null
    END
	  IF @Is_FEMA = 0
    BEGIN
    SET @Is_FEMA = null
    END
	Insert INTO [dbo].[donation]
           (
            [Receipt_ID]
           ,[Resource_ID]
           ,[Donor_ID]
           ,[Date]
           ,[Quantity]
           ,[Agency_ID]
           ,[Is_Monetary]
           ,[Is_FEMA]
            )
     VALUES (
            @Receipt_ID
           ,@Resource_ID
           ,@Donor_ID
           ,@Date
           ,@Quantity
           ,@Agency_ID
           ,@Is_Monetary
           ,@Is_FEMA
            )
END
GO
/***********************************************************/
/*************************************************/
/****** - GET STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_GET_DONATION]    Script Date: 8/29/2014 2:04:37 PM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_GET_DONATION]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_GET_DONATION]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_GET_DONATION]
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
	  IF @Receipt_ID = 0
    BEGIN
    SET @Receipt_ID = null
    END
	  IF @Resource_ID = 0
    BEGIN
    SET @Resource_ID = null
    END
	  IF @Donor_ID = 0
    BEGIN
    SET @Donor_ID = null
    END
	  IF @Date = '9/9/1900 12:00:00 AM'
    BEGIN
    SET @Date = null
    END
	  IF @Quantity = 0
    BEGIN
    SET @Quantity = null
    END
	  IF @Agency_ID = 0
    BEGIN
    SET @Agency_ID = null
    END
	  IF @Is_Monetary = 0
    BEGIN
    SET @Is_Monetary = null
    END
	  IF @Is_FEMA = 0
    BEGIN
    SET @Is_FEMA = null
    END
    SELECT [Donation_ID] 
      FROM [dbo].[donation] 
       WHERE ([Receipt_ID] = @Receipt_ID or [Receipt_ID] is null)
       AND ([Resource_ID] = @Resource_ID)
       AND ([Donor_ID] = @Donor_ID)
       AND ([Date] = @Date)
       AND ([Quantity] = @Quantity or [Quantity] is null)
       AND ([Agency_ID] = @Agency_ID or [Agency_ID] is null)
       AND ([Is_Monetary] = @Is_Monetary)
       AND ([Is_FEMA] = @Is_FEMA)
END
GO
/***********************************************************/
/*************************************************/
/****** - UPDATE STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_UPDATE_DONATION]    Script Date: 8/29/2014 2:04:37 PM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_UPDATE_DONATION]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_UPDATE_DONATION]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_UPDATE_DONATION]
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
	  IF @Receipt_ID = 0
    BEGIN
    SET @Receipt_ID = null
    END
	  IF @Resource_ID = 0
    BEGIN
    SET @Resource_ID = null
    END
	  IF @Donor_ID = 0
    BEGIN
    SET @Donor_ID = null
    END
	  IF @Date = '9/9/1900 12:00:00 AM'
    BEGIN
    SET @Date = null
    END
	  IF @Quantity = 0
    BEGIN
    SET @Quantity = null
    END
	  IF @Agency_ID = 0
    BEGIN
    SET @Agency_ID = null
    END
	  IF @Is_Monetary = 0
    BEGIN
    SET @Is_Monetary = null
    END
	  IF @Is_FEMA = 0
    BEGIN
    SET @Is_FEMA = null
    END
	UPDATE [dbo].[donation]
       SET
		   [Receipt_ID] = @Receipt_ID,
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
/***********************************************************/
/*************************************************/
/****** - DELETE STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_DELETE_DONATION]    Script Date: 8/29/2014 2:04:37 PM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_DELETE_DONATION]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_DELETE_DONATION]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_DELETE_DONATION]
	@Donation_ID int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	Delete dbo.donation
	where Donation_ID = @Donation_ID
END
GO
/***********************************************************/
/*************************************************/
/****** - WHERE CLAUSE STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_SELECT_DONATION_WC]    Script Date: 8/29/2014 2:04:37 PM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_SELECT_DONATION_WC]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_SELECT_DONATION_WC]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_SELECT_DONATION_WC]
	  @wareclause as varchar(MAX)
AS
Begin
    Declare @string as varchar(MAX)
	Set @string = 'Select * from donation where ' + @wareclause
	Exec(@string)
END
GO

/***********************************************************/
/*************************************************/
/****** - SELECT STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_SELECT_VENDOR_PRODUCTS_SHIPMENTS]    Script Date: 8/29/2014 2:04:38 PM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_SELECT_VENDOR_PRODUCTS_SHIPMENTS]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_SELECT_VENDOR_PRODUCTS_SHIPMENTS]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_SELECT_VENDOR_PRODUCTS_SHIPMENTS]
           @PO_Order_no as int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
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
End
GO
/***********************************************************/
/*************************************************/
/****** - INSERT STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_INSERT_VENDOR_PRODUCTS_SHIPMENTS]    Script Date: 8/29/2014 2:04:38 PM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_INSERT_VENDOR_PRODUCTS_SHIPMENTS]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_INSERT_VENDOR_PRODUCTS_SHIPMENTS]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_INSERT_VENDOR_PRODUCTS_SHIPMENTS]
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
    SET @ShipmentID = null
    END
	  IF @VendorID = 0
    BEGIN
    SET @VendorID = null
    END
	  IF @ProductID = 0
    BEGIN
    SET @ProductID = null
    END
	  IF @Expect_Delivery_Date = '9/9/1900 12:00:00 AM'
    BEGIN
    SET @Expect_Delivery_Date = null
    END
	  IF @orderdate = '9/9/1900 12:00:00 AM'
    BEGIN
    SET @orderdate = null
    END
	  IF @quantity = 0
    BEGIN
    SET @quantity = null
    END
	  IF @OtherInfo = ''
    BEGIN
    SET @OtherInfo = null
    END
	  IF @DateReceived = '9/9/1900 12:00:00 AM'
    BEGIN
    SET @DateReceived = null
    END
	  IF @AmountReceived = 0
    BEGIN
    SET @AmountReceived = null
    END
	Insert INTO [dbo].[Vendor_Products_shipments]
           (
            [ShipmentID]
           ,[VendorID]
           ,[ProductID]
           ,[Expect_Delivery_Date]
           ,[orderdate]
           ,[quantity]
           ,[OtherInfo]
           ,[DateReceived]
           ,[AmountReceived]
            )
     VALUES (
            @ShipmentID
           ,@VendorID
           ,@ProductID
           ,@Expect_Delivery_Date
           ,@orderdate
           ,@quantity
           ,@OtherInfo
           ,@DateReceived
           ,@AmountReceived
            )
END
GO
/***********************************************************/
/*************************************************/
/****** - GET STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_GET_VENDOR_PRODUCTS_SHIPMENTS]    Script Date: 8/29/2014 2:04:38 PM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_GET_VENDOR_PRODUCTS_SHIPMENTS]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_GET_VENDOR_PRODUCTS_SHIPMENTS]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_GET_VENDOR_PRODUCTS_SHIPMENTS]
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
    SET @ShipmentID = null
    END
	  IF @VendorID = 0
    BEGIN
    SET @VendorID = null
    END
	  IF @ProductID = 0
    BEGIN
    SET @ProductID = null
    END
	  IF @Expect_Delivery_Date = '9/9/1900 12:00:00 AM'
    BEGIN
    SET @Expect_Delivery_Date = null
    END
	  IF @orderdate = '9/9/1900 12:00:00 AM'
    BEGIN
    SET @orderdate = null
    END
	  IF @quantity = 0
    BEGIN
    SET @quantity = null
    END
	  IF @OtherInfo = ''
    BEGIN
    SET @OtherInfo = null
    END
	  IF @DateReceived = '9/9/1900 12:00:00 AM'
    BEGIN
    SET @DateReceived = null
    END
	  IF @AmountReceived = 0
    BEGIN
    SET @AmountReceived = null
    END
    SELECT [PO_Order_no] 
      FROM [dbo].[Vendor_Products_shipments] 
       WHERE ([ShipmentID] = @ShipmentID)
       AND ([VendorID] = @VendorID)
       AND ([ProductID] = @ProductID)
       AND ([Expect_Delivery_Date] = @Expect_Delivery_Date or [Expect_Delivery_Date] is null)
       AND ([orderdate] = @orderdate or [orderdate] is null)
       AND ([quantity] = @quantity)
       AND ([OtherInfo] like @OtherInfo or [OtherInfo] is null)
       AND ([DateReceived] = @DateReceived or [DateReceived] is null)
       AND ([AmountReceived] = @AmountReceived or [AmountReceived] is null)
END
GO
/***********************************************************/
/*************************************************/
/****** - UPDATE STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_UPDATE_VENDOR_PRODUCTS_SHIPMENTS]    Script Date: 8/29/2014 2:04:38 PM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_UPDATE_VENDOR_PRODUCTS_SHIPMENTS]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_UPDATE_VENDOR_PRODUCTS_SHIPMENTS]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_UPDATE_VENDOR_PRODUCTS_SHIPMENTS]
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
    SET @ShipmentID = null
    END
	  IF @VendorID = 0
    BEGIN
    SET @VendorID = null
    END
	  IF @ProductID = 0
    BEGIN
    SET @ProductID = null
    END
	  IF @Expect_Delivery_Date = '9/9/1900 12:00:00 AM'
    BEGIN
    SET @Expect_Delivery_Date = null
    END
	  IF @orderdate = '9/9/1900 12:00:00 AM'
    BEGIN
    SET @orderdate = null
    END
	  IF @quantity = 0
    BEGIN
    SET @quantity = null
    END
	  IF @OtherInfo = ''
    BEGIN
    SET @OtherInfo = null
    END
	  IF @DateReceived = '9/9/1900 12:00:00 AM'
    BEGIN
    SET @DateReceived = null
    END
	  IF @AmountReceived = 0
    BEGIN
    SET @AmountReceived = null
    END
	UPDATE [dbo].[Vendor_Products_shipments]
       SET
		   [ShipmentID] = @ShipmentID,
		   [VendorID] = @VendorID,
		   [ProductID] = @ProductID,
		   [Expect_Delivery_Date] = @Expect_Delivery_Date,
		   [orderdate] = @orderdate,
		   [quantity] = @quantity,
		   [OtherInfo] = @OtherInfo,
		   [DateReceived] = @DateReceived,
		   [AmountReceived] = @AmountReceived
       WHERE PO_Order_no = @PO_Order_no
END
GO
/***********************************************************/
/*************************************************/
/****** - DELETE STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_DELETE_VENDOR_PRODUCTS_SHIPMENTS]    Script Date: 8/29/2014 2:04:38 PM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_DELETE_VENDOR_PRODUCTS_SHIPMENTS]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_DELETE_VENDOR_PRODUCTS_SHIPMENTS]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_DELETE_VENDOR_PRODUCTS_SHIPMENTS]
	@PO_Order_no int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	Delete dbo.Vendor_Products_shipments
	where PO_Order_no = @PO_Order_no
END
GO
/***********************************************************/
/*************************************************/
/****** - WHERE CLAUSE STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_SELECT_VENDOR_PRODUCTS_SHIPMENTS_WC]    Script Date: 8/29/2014 2:04:38 PM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_SELECT_VENDOR_PRODUCTS_SHIPMENTS_WC]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_SELECT_VENDOR_PRODUCTS_SHIPMENTS_WC]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_SELECT_VENDOR_PRODUCTS_SHIPMENTS_WC]
	  @wareclause as varchar(MAX)
AS
Begin
    Declare @string as varchar(MAX)
	Set @string = 'Select * from Vendor_Products_shipments where ' + @wareclause
	Exec(@string)
END
GO

/***********************************************************/
/*************************************************/
/****** - SELECT STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_SELECT_DONOR]    Script Date: 8/29/2014 2:04:39 PM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_SELECT_DONOR]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_SELECT_DONOR]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_SELECT_DONOR]
           @donor_id as int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
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
/***********************************************************/
/*************************************************/
/****** - INSERT STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_INSERT_DONOR]    Script Date: 8/29/2014 2:04:39 PM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_INSERT_DONOR]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_INSERT_DONOR]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_INSERT_DONOR]
	  @PersonID as int,
	  @Status as varchar(30),
	  @DonorType as char(1),
	  @AgencyID as int,
	  @Phone as int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	  IF @PersonID = 0
    BEGIN
    SET @PersonID = null
    END
	  IF @Status = ''
    BEGIN
    SET @Status = null
    END
	  IF @DonorType = ''
    BEGIN
    SET @DonorType = null
    END
	  IF @AgencyID = 0
    BEGIN
    SET @AgencyID = null
    END
	  IF @Phone = 0
    BEGIN
    SET @Phone = null
    END
	Insert INTO [dbo].[Donor]
           (
            [PersonID]
           ,[Status]
           ,[DonorType]
           ,[AgencyID]
           ,[Phone]
            )
     VALUES (
            @PersonID
           ,@Status
           ,@DonorType
           ,@AgencyID
           ,@Phone
            )
END
GO
/***********************************************************/
/*************************************************/
/****** - GET STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_GET_DONOR]    Script Date: 8/29/2014 2:04:39 PM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_GET_DONOR]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_GET_DONOR]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_GET_DONOR]
	  @PersonID as int,
	  @Status as varchar(30),
	  @DonorType as char(1),
	  @AgencyID as int,
	  @Phone as int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	  IF @PersonID = 0
    BEGIN
    SET @PersonID = null
    END
	  IF @Status = ''
    BEGIN
    SET @Status = null
    END
	  IF @DonorType = ''
    BEGIN
    SET @DonorType = null
    END
	  IF @AgencyID = 0
    BEGIN
    SET @AgencyID = null
    END
	  IF @Phone = 0
    BEGIN
    SET @Phone = null
    END
    SELECT [donor_id] 
      FROM [dbo].[Donor] 
       WHERE ([PersonID] = @PersonID or [PersonID] is null)
       AND ([Status] like @Status or [Status] is null)
       AND ([DonorType] = @DonorType or [DonorType] is null)
       AND ([AgencyID] = @AgencyID or [AgencyID] is null)
       AND ([Phone] = @Phone or [Phone] is null)
END
GO
/***********************************************************/
/*************************************************/
/****** - UPDATE STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_UPDATE_DONOR]    Script Date: 8/29/2014 2:04:39 PM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_UPDATE_DONOR]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_UPDATE_DONOR]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_UPDATE_DONOR]
	  @donor_id as int,
	  @PersonID as int,
	  @Status as varchar(30),
	  @DonorType as char(1),
	  @AgencyID as int,
	  @Phone as int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	  IF @PersonID = 0
    BEGIN
    SET @PersonID = null
    END
	  IF @Status = ''
    BEGIN
    SET @Status = null
    END
	  IF @DonorType = ''
    BEGIN
    SET @DonorType = null
    END
	  IF @AgencyID = 0
    BEGIN
    SET @AgencyID = null
    END
	  IF @Phone = 0
    BEGIN
    SET @Phone = null
    END
	UPDATE [dbo].[Donor]
       SET
		   [PersonID] = @PersonID,
		   [Status] = @Status,
		   [DonorType] = @DonorType,
		   [AgencyID] = @AgencyID,
		   [Phone] = @Phone
       WHERE donor_id = @donor_id
END
GO
/***********************************************************/
/*************************************************/
/****** - DELETE STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_DELETE_DONOR]    Script Date: 8/29/2014 2:04:39 PM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_DELETE_DONOR]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_DELETE_DONOR]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_DELETE_DONOR]
	@donor_id int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	Delete dbo.Donor
	where donor_id = @donor_id
END
GO
/***********************************************************/
/*************************************************/
/****** - WHERE CLAUSE STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_SELECT_DONOR_WC]    Script Date: 8/29/2014 2:04:39 PM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_SELECT_DONOR_WC]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_SELECT_DONOR_WC]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_SELECT_DONOR_WC]
	  @wareclause as varchar(MAX)
AS
Begin
    Declare @string as varchar(MAX)
	Set @string = 'Select * from Donor where ' + @wareclause
	Exec(@string)
END
GO

/***********************************************************/
/*************************************************/
/****** - SELECT STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_SELECT_PET_VACCINE]    Script Date: 8/29/2014 2:04:41 PM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_SELECT_PET_VACCINE]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_SELECT_PET_VACCINE]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_SELECT_PET_VACCINE]
           @Pet_Vaccine_ID as int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
SELECT [Pet_Vaccine_ID]
      ,[Vaccine_Type_ID]
      ,[Allergies]
      ,[Current_Medacations]
      ,[Last_Vaccine_Given]
      ,[Date_Time_Stamp]
  FROM [dbo].[Pet_Vaccine]
 WHERE Pet_Vaccine_ID = @Pet_Vaccine_ID
End
GO
/***********************************************************/
/*************************************************/
/****** - INSERT STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_INSERT_PET_VACCINE]    Script Date: 8/29/2014 2:04:41 PM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_INSERT_PET_VACCINE]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_INSERT_PET_VACCINE]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_INSERT_PET_VACCINE]
	  @Vaccine_Type_ID as int,
	  @Allergies as varchar(MAX),
	  @Current_Medacations as varchar(MAX),
	  @Last_Vaccine_Given as datetime,
	  @Date_Time_Stamp as datetime
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	  IF @Vaccine_Type_ID = 0
    BEGIN
    SET @Vaccine_Type_ID = null
    END
	  IF @Allergies = ''
    BEGIN
    SET @Allergies = null
    END
	  IF @Current_Medacations = ''
    BEGIN
    SET @Current_Medacations = null
    END
	  IF @Last_Vaccine_Given = '9/9/1900 12:00:00 AM'
    BEGIN
    SET @Last_Vaccine_Given = null
    END
	  IF @Date_Time_Stamp = '9/9/1900 12:00:00 AM'
    BEGIN
    SET @Date_Time_Stamp = null
    END
	Insert INTO [dbo].[Pet_Vaccine]
           (
            [Vaccine_Type_ID]
           ,[Allergies]
           ,[Current_Medacations]
           ,[Last_Vaccine_Given]
           ,[Date_Time_Stamp]
            )
     VALUES (
            @Vaccine_Type_ID
           ,@Allergies
           ,@Current_Medacations
           ,@Last_Vaccine_Given
           ,@Date_Time_Stamp
            )
END
GO
/***********************************************************/
/*************************************************/
/****** - GET STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_GET_PET_VACCINE]    Script Date: 8/29/2014 2:04:41 PM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_GET_PET_VACCINE]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_GET_PET_VACCINE]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_GET_PET_VACCINE]
	  @Vaccine_Type_ID as int,
	  @Allergies as varchar(MAX),
	  @Current_Medacations as varchar(MAX),
	  @Last_Vaccine_Given as datetime,
	  @Date_Time_Stamp as datetime
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	  IF @Vaccine_Type_ID = 0
    BEGIN
    SET @Vaccine_Type_ID = null
    END
	  IF @Allergies = ''
    BEGIN
    SET @Allergies = null
    END
	  IF @Current_Medacations = ''
    BEGIN
    SET @Current_Medacations = null
    END
	  IF @Last_Vaccine_Given = '9/9/1900 12:00:00 AM'
    BEGIN
    SET @Last_Vaccine_Given = null
    END
	  IF @Date_Time_Stamp = '9/9/1900 12:00:00 AM'
    BEGIN
    SET @Date_Time_Stamp = null
    END
    SELECT [Pet_Vaccine_ID] 
      FROM [dbo].[Pet_Vaccine] 
       WHERE ([Vaccine_Type_ID] = @Vaccine_Type_ID)
       AND ([Allergies] like @Allergies or [Allergies] is null)
       AND ([Current_Medacations] like @Current_Medacations or [Current_Medacations] is null)
       AND ([Last_Vaccine_Given] = @Last_Vaccine_Given or [Last_Vaccine_Given] is null)
       AND ([Date_Time_Stamp] = @Date_Time_Stamp)
END
GO
/***********************************************************/
/*************************************************/
/****** - UPDATE STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_UPDATE_PET_VACCINE]    Script Date: 8/29/2014 2:04:41 PM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_UPDATE_PET_VACCINE]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_UPDATE_PET_VACCINE]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_UPDATE_PET_VACCINE]
	  @Pet_Vaccine_ID as int,
	  @Vaccine_Type_ID as int,
	  @Allergies as varchar(MAX),
	  @Current_Medacations as varchar(MAX),
	  @Last_Vaccine_Given as datetime,
	  @Date_Time_Stamp as datetime
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	  IF @Vaccine_Type_ID = 0
    BEGIN
    SET @Vaccine_Type_ID = null
    END
	  IF @Allergies = ''
    BEGIN
    SET @Allergies = null
    END
	  IF @Current_Medacations = ''
    BEGIN
    SET @Current_Medacations = null
    END
	  IF @Last_Vaccine_Given = '9/9/1900 12:00:00 AM'
    BEGIN
    SET @Last_Vaccine_Given = null
    END
	  IF @Date_Time_Stamp = '9/9/1900 12:00:00 AM'
    BEGIN
    SET @Date_Time_Stamp = null
    END
	UPDATE [dbo].[Pet_Vaccine]
       SET
		   [Vaccine_Type_ID] = @Vaccine_Type_ID,
		   [Allergies] = @Allergies,
		   [Current_Medacations] = @Current_Medacations,
		   [Last_Vaccine_Given] = @Last_Vaccine_Given,
		   [Date_Time_Stamp] = @Date_Time_Stamp
       WHERE Pet_Vaccine_ID = @Pet_Vaccine_ID
END
GO
/***********************************************************/
/*************************************************/
/****** - DELETE STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_DELETE_PET_VACCINE]    Script Date: 8/29/2014 2:04:41 PM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_DELETE_PET_VACCINE]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_DELETE_PET_VACCINE]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_DELETE_PET_VACCINE]
	@Pet_Vaccine_ID int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	Delete dbo.Pet_Vaccine
	where Pet_Vaccine_ID = @Pet_Vaccine_ID
END
GO
/***********************************************************/
/*************************************************/
/****** - WHERE CLAUSE STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_SELECT_PET_VACCINE_WC]    Script Date: 8/29/2014 2:04:41 PM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_SELECT_PET_VACCINE_WC]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_SELECT_PET_VACCINE_WC]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_SELECT_PET_VACCINE_WC]
	  @wareclause as varchar(MAX)
AS
Begin
    Declare @string as varchar(MAX)
	Set @string = 'Select * from Pet_Vaccine where ' + @wareclause
	Exec(@string)
END
GO

/***********************************************************/
/*************************************************/
/****** - SELECT STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_SELECT_EMPLOYER]    Script Date: 8/29/2014 2:04:42 PM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_SELECT_EMPLOYER]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_SELECT_EMPLOYER]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_SELECT_EMPLOYER]
           @emplr_id as int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
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
/***********************************************************/
/*************************************************/
/****** - INSERT STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_INSERT_EMPLOYER]    Script Date: 8/29/2014 2:04:42 PM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_INSERT_EMPLOYER]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_INSERT_EMPLOYER]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_INSERT_EMPLOYER]
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
	  IF @case_id = 0
    BEGIN
    SET @case_id = null
    END
	  IF @client_id = 0
    BEGIN
    SET @client_id = null
    END
	  IF @address_id = 0
    BEGIN
    SET @address_id = null
    END
	  IF @emplr_name = ''
    BEGIN
    SET @emplr_name = null
    END
	  IF @emplr_phone = ''
    BEGIN
    SET @emplr_phone = null
    END
	  IF @end_date = '9/9/1900 12:00:00 AM'
    BEGIN
    SET @end_date = null
    END
	  IF @strt_date = '9/9/1900 12:00:00 AM'
    BEGIN
    SET @strt_date = null
    END
	Insert INTO [dbo].[employer]
           (
            [case_id]
           ,[client_id]
           ,[address_id]
           ,[emplr_name]
           ,[emplr_phone]
           ,[end_date]
           ,[strt_date]
           ,[term_reason]
            )
     VALUES (
            @case_id
           ,@client_id
           ,@address_id
           ,@emplr_name
           ,@emplr_phone
           ,@end_date
           ,@strt_date
           ,@term_reason
            )
END
GO
/***********************************************************/
/*************************************************/
/****** - GET STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_GET_EMPLOYER]    Script Date: 8/29/2014 2:04:42 PM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_GET_EMPLOYER]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_GET_EMPLOYER]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_GET_EMPLOYER]
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
	  IF @case_id = 0
    BEGIN
    SET @case_id = null
    END
	  IF @client_id = 0
    BEGIN
    SET @client_id = null
    END
	  IF @address_id = 0
    BEGIN
    SET @address_id = null
    END
	  IF @emplr_name = ''
    BEGIN
    SET @emplr_name = null
    END
	  IF @emplr_phone = ''
    BEGIN
    SET @emplr_phone = null
    END
	  IF @end_date = '9/9/1900 12:00:00 AM'
    BEGIN
    SET @end_date = null
    END
	  IF @strt_date = '9/9/1900 12:00:00 AM'
    BEGIN
    SET @strt_date = null
    END
    SELECT [emplr_id] 
      FROM [dbo].[employer] 
       WHERE ([case_id] = @case_id)
       AND ([client_id] = @client_id)
       AND ([address_id] = @address_id)
       AND ([emplr_name] like @emplr_name)
       AND ([emplr_phone] like @emplr_phone)
       AND ([end_date] = @end_date or [end_date] is null)
       AND ([strt_date] = @strt_date)
       AND ([term_reason] like @term_reason or [term_reason] is null)
END
GO
/***********************************************************/
/*************************************************/
/****** - UPDATE STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_UPDATE_EMPLOYER]    Script Date: 8/29/2014 2:04:42 PM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_UPDATE_EMPLOYER]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_UPDATE_EMPLOYER]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_UPDATE_EMPLOYER]
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
	  IF @case_id = 0
    BEGIN
    SET @case_id = null
    END
	  IF @client_id = 0
    BEGIN
    SET @client_id = null
    END
	  IF @address_id = 0
    BEGIN
    SET @address_id = null
    END
	  IF @emplr_name = ''
    BEGIN
    SET @emplr_name = null
    END
	  IF @emplr_phone = ''
    BEGIN
    SET @emplr_phone = null
    END
	  IF @end_date = '9/9/1900 12:00:00 AM'
    BEGIN
    SET @end_date = null
    END
	  IF @strt_date = '9/9/1900 12:00:00 AM'
    BEGIN
    SET @strt_date = null
    END
	UPDATE [dbo].[employer]
       SET
		   [case_id] = @case_id,
		   [client_id] = @client_id,
		   [address_id] = @address_id,
		   [emplr_name] = @emplr_name,
		   [emplr_phone] = @emplr_phone,
		   [end_date] = @end_date,
		   [strt_date] = @strt_date,
		   [term_reason] = @term_reason
       WHERE emplr_id = @emplr_id
END
GO
/***********************************************************/
/*************************************************/
/****** - DELETE STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_DELETE_EMPLOYER]    Script Date: 8/29/2014 2:04:42 PM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_DELETE_EMPLOYER]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_DELETE_EMPLOYER]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_DELETE_EMPLOYER]
	@emplr_id int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	Delete dbo.employer
	where emplr_id = @emplr_id
END
GO
/***********************************************************/
/*************************************************/
/****** - WHERE CLAUSE STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_SELECT_EMPLOYER_WC]    Script Date: 8/29/2014 2:04:42 PM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_SELECT_EMPLOYER_WC]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_SELECT_EMPLOYER_WC]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_SELECT_EMPLOYER_WC]
	  @wareclause as varchar(MAX)
AS
Begin
    Declare @string as varchar(MAX)
	Set @string = 'Select * from employer where ' + @wareclause
	Exec(@string)
END
GO

/***********************************************************/
/*************************************************/
/****** - SELECT STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_SELECT_PET_VACCINE_TYPE]    Script Date: 8/29/2014 2:04:43 PM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_SELECT_PET_VACCINE_TYPE]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_SELECT_PET_VACCINE_TYPE]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_SELECT_PET_VACCINE_TYPE]
           @Vaccine_Type_ID as int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
SELECT [Vaccine_Type_ID]
      ,[Vaccine_Name]
      ,[Vaccine_Reactions]
      ,[Vaccine_Type]
      ,[Vaccine_Description]
  FROM [dbo].[Pet_Vaccine_Type]
 WHERE Vaccine_Type_ID = @Vaccine_Type_ID
End
GO
/***********************************************************/
/*************************************************/
/****** - INSERT STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_INSERT_PET_VACCINE_TYPE]    Script Date: 8/29/2014 2:04:43 PM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_INSERT_PET_VACCINE_TYPE]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_INSERT_PET_VACCINE_TYPE]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_INSERT_PET_VACCINE_TYPE]
	  @Vaccine_Name as varchar(50),
	  @Vaccine_Reactions as varchar(50),
	  @Vaccine_Type as varchar(50),
	  @Vaccine_Description as varchar(MAX)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	  IF @Vaccine_Name = ''
    BEGIN
    SET @Vaccine_Name = null
    END
	  IF @Vaccine_Reactions = ''
    BEGIN
    SET @Vaccine_Reactions = null
    END
	  IF @Vaccine_Type = ''
    BEGIN
    SET @Vaccine_Type = null
    END
	  IF @Vaccine_Description = ''
    BEGIN
    SET @Vaccine_Description = null
    END
	Insert INTO [dbo].[Pet_Vaccine_Type]
           (
            [Vaccine_Name]
           ,[Vaccine_Reactions]
           ,[Vaccine_Type]
           ,[Vaccine_Description]
            )
     VALUES (
            @Vaccine_Name
           ,@Vaccine_Reactions
           ,@Vaccine_Type
           ,@Vaccine_Description
            )
END
GO
/***********************************************************/
/*************************************************/
/****** - GET STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_GET_PET_VACCINE_TYPE]    Script Date: 8/29/2014 2:04:43 PM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_GET_PET_VACCINE_TYPE]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_GET_PET_VACCINE_TYPE]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_GET_PET_VACCINE_TYPE]
	  @Vaccine_Name as varchar(50),
	  @Vaccine_Reactions as varchar(50),
	  @Vaccine_Type as varchar(50),
	  @Vaccine_Description as varchar(MAX)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	  IF @Vaccine_Name = ''
    BEGIN
    SET @Vaccine_Name = null
    END
	  IF @Vaccine_Reactions = ''
    BEGIN
    SET @Vaccine_Reactions = null
    END
	  IF @Vaccine_Type = ''
    BEGIN
    SET @Vaccine_Type = null
    END
	  IF @Vaccine_Description = ''
    BEGIN
    SET @Vaccine_Description = null
    END
    SELECT [Vaccine_Type_ID] 
      FROM [dbo].[Pet_Vaccine_Type] 
       WHERE ([Vaccine_Name] like @Vaccine_Name)
       AND ([Vaccine_Reactions] like @Vaccine_Reactions or [Vaccine_Reactions] is null)
       AND ([Vaccine_Type] like @Vaccine_Type)
       AND ([Vaccine_Description] like @Vaccine_Description or [Vaccine_Description] is null)
END
GO
/***********************************************************/
/*************************************************/
/****** - UPDATE STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_UPDATE_PET_VACCINE_TYPE]    Script Date: 8/29/2014 2:04:43 PM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_UPDATE_PET_VACCINE_TYPE]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_UPDATE_PET_VACCINE_TYPE]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_UPDATE_PET_VACCINE_TYPE]
	  @Vaccine_Type_ID as int,
	  @Vaccine_Name as varchar(50),
	  @Vaccine_Reactions as varchar(50),
	  @Vaccine_Type as varchar(50),
	  @Vaccine_Description as varchar(MAX)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	  IF @Vaccine_Name = ''
    BEGIN
    SET @Vaccine_Name = null
    END
	  IF @Vaccine_Reactions = ''
    BEGIN
    SET @Vaccine_Reactions = null
    END
	  IF @Vaccine_Type = ''
    BEGIN
    SET @Vaccine_Type = null
    END
	  IF @Vaccine_Description = ''
    BEGIN
    SET @Vaccine_Description = null
    END
	UPDATE [dbo].[Pet_Vaccine_Type]
       SET
		   [Vaccine_Name] = @Vaccine_Name,
		   [Vaccine_Reactions] = @Vaccine_Reactions,
		   [Vaccine_Type] = @Vaccine_Type,
		   [Vaccine_Description] = @Vaccine_Description
       WHERE Vaccine_Type_ID = @Vaccine_Type_ID
END
GO
/***********************************************************/
/*************************************************/
/****** - DELETE STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_DELETE_PET_VACCINE_TYPE]    Script Date: 8/29/2014 2:04:43 PM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_DELETE_PET_VACCINE_TYPE]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_DELETE_PET_VACCINE_TYPE]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_DELETE_PET_VACCINE_TYPE]
	@Vaccine_Type_ID int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	Delete dbo.Pet_Vaccine_Type
	where Vaccine_Type_ID = @Vaccine_Type_ID
END
GO
/***********************************************************/
/*************************************************/
/****** - WHERE CLAUSE STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_SELECT_PET_VACCINE_TYPE_WC]    Script Date: 8/29/2014 2:04:43 PM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_SELECT_PET_VACCINE_TYPE_WC]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_SELECT_PET_VACCINE_TYPE_WC]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_SELECT_PET_VACCINE_TYPE_WC]
	  @wareclause as varchar(MAX)
AS
Begin
    Declare @string as varchar(MAX)
	Set @string = 'Select * from Pet_Vaccine_Type where ' + @wareclause
	Exec(@string)
END
GO

/***********************************************************/
/*************************************************/
/****** - SELECT STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_SELECT_WAREHOUSE_PRODUCT_LOCATION]    Script Date: 8/29/2014 2:04:44 PM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_SELECT_WAREHOUSE_PRODUCT_LOCATION]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_SELECT_WAREHOUSE_PRODUCT_LOCATION]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_SELECT_WAREHOUSE_PRODUCT_LOCATION]
           @warehouse_product_location_id as int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
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
/***********************************************************/
/*************************************************/
/****** - INSERT STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_INSERT_WAREHOUSE_PRODUCT_LOCATION]    Script Date: 8/29/2014 2:04:44 PM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_INSERT_WAREHOUSE_PRODUCT_LOCATION]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_INSERT_WAREHOUSE_PRODUCT_LOCATION]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_INSERT_WAREHOUSE_PRODUCT_LOCATION]
	  @warehouse_id as int,
	  @product_id as int,
	  @Location_ID as int,
	  @service_id as int,
	  @Time_Date_MIA as datetime,
	  @Experiation_Date as datetime,
	  @min_inv as int,
	  @status as varchar(1),
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
    SET @warehouse_id = null
    END
	  IF @product_id = 0
    BEGIN
    SET @product_id = null
    END
	  IF @Location_ID = 0
    BEGIN
    SET @Location_ID = null
    END
	  IF @service_id = 0
    BEGIN
    SET @service_id = null
    END
	  IF @Time_Date_MIA = '9/9/1900 12:00:00 AM'
    BEGIN
    SET @Time_Date_MIA = null
    END
	  IF @Experiation_Date = '9/9/1900 12:00:00 AM'
    BEGIN
    SET @Experiation_Date = null
    END
	  IF @min_inv = 0
    BEGIN
    SET @min_inv = null
    END
	  IF @status = ''
    BEGIN
    SET @status = null
    END
	  IF @Exp_delivery_date = '9/9/1900 12:00:00 AM'
    BEGIN
    SET @Exp_delivery_date = null
    END
	  IF @qty_onhand = 0
    BEGIN
    SET @qty_onhand = null
    END
	  IF @qty_commit = 0
    BEGIN
    SET @qty_commit = null
    END
	  IF @qty_order = 0
    BEGIN
    SET @qty_order = null
    END
	  IF @encounter_id = 0
    BEGIN
    SET @encounter_id = null
    END
	  IF @address_id = 0
    BEGIN
    SET @address_id = null
    END
	Insert INTO [dbo].[warehouse_product_Location]
           (
            [warehouse_id]
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
            )
     VALUES (
            @warehouse_id
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
           ,@qty_order
           ,@encounter_id
           ,@address_id
            )
END
GO
/***********************************************************/
/*************************************************/
/****** - GET STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_GET_WAREHOUSE_PRODUCT_LOCATION]    Script Date: 8/29/2014 2:04:44 PM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_GET_WAREHOUSE_PRODUCT_LOCATION]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_GET_WAREHOUSE_PRODUCT_LOCATION]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_GET_WAREHOUSE_PRODUCT_LOCATION]
	  @warehouse_id as int,
	  @product_id as int,
	  @Location_ID as int,
	  @service_id as int,
	  @Time_Date_MIA as datetime,
	  @Experiation_Date as datetime,
	  @min_inv as int,
	  @status as varchar(1),
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
    SET @warehouse_id = null
    END
	  IF @product_id = 0
    BEGIN
    SET @product_id = null
    END
	  IF @Location_ID = 0
    BEGIN
    SET @Location_ID = null
    END
	  IF @service_id = 0
    BEGIN
    SET @service_id = null
    END
	  IF @Time_Date_MIA = '9/9/1900 12:00:00 AM'
    BEGIN
    SET @Time_Date_MIA = null
    END
	  IF @Experiation_Date = '9/9/1900 12:00:00 AM'
    BEGIN
    SET @Experiation_Date = null
    END
	  IF @min_inv = 0
    BEGIN
    SET @min_inv = null
    END
	  IF @status = ''
    BEGIN
    SET @status = null
    END
	  IF @Exp_delivery_date = '9/9/1900 12:00:00 AM'
    BEGIN
    SET @Exp_delivery_date = null
    END
	  IF @qty_onhand = 0
    BEGIN
    SET @qty_onhand = null
    END
	  IF @qty_commit = 0
    BEGIN
    SET @qty_commit = null
    END
	  IF @qty_order = 0
    BEGIN
    SET @qty_order = null
    END
	  IF @encounter_id = 0
    BEGIN
    SET @encounter_id = null
    END
	  IF @address_id = 0
    BEGIN
    SET @address_id = null
    END
    SELECT [warehouse_product_location_id] 
      FROM [dbo].[warehouse_product_Location] 
       WHERE ([warehouse_id] = @warehouse_id)
       AND ([product_id] = @product_id)
       AND ([Location_ID] = @Location_ID or [Location_ID] is null)
       AND ([service_id] = @service_id or [service_id] is null)
       AND ([Time_Date_MIA] = @Time_Date_MIA or [Time_Date_MIA] is null)
       AND ([Experiation_Date] = @Experiation_Date or [Experiation_Date] is null)
       AND ([min_inv] = @min_inv or [min_inv] is null)
       AND ([status] like @status)
       AND ([Exp_delivery_date] = @Exp_delivery_date or [Exp_delivery_date] is null)
       AND ([qty_onhand] = @qty_onhand)
       AND ([qty_commit] = @qty_commit)
       AND ([qty_order] = @qty_order)
       AND ([encounter_id] = @encounter_id or [encounter_id] is null)
       AND ([address_id] = @address_id or [address_id] is null)
END
GO
/***********************************************************/
/*************************************************/
/****** - UPDATE STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_UPDATE_WAREHOUSE_PRODUCT_LOCATION]    Script Date: 8/29/2014 2:04:44 PM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_UPDATE_WAREHOUSE_PRODUCT_LOCATION]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_UPDATE_WAREHOUSE_PRODUCT_LOCATION]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_UPDATE_WAREHOUSE_PRODUCT_LOCATION]
	  @warehouse_product_location_id as int,
	  @warehouse_id as int,
	  @product_id as int,
	  @Location_ID as int,
	  @service_id as int,
	  @Time_Date_MIA as datetime,
	  @Experiation_Date as datetime,
	  @min_inv as int,
	  @status as varchar(1),
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
    SET @warehouse_id = null
    END
	  IF @product_id = 0
    BEGIN
    SET @product_id = null
    END
	  IF @Location_ID = 0
    BEGIN
    SET @Location_ID = null
    END
	  IF @service_id = 0
    BEGIN
    SET @service_id = null
    END
	  IF @Time_Date_MIA = '9/9/1900 12:00:00 AM'
    BEGIN
    SET @Time_Date_MIA = null
    END
	  IF @Experiation_Date = '9/9/1900 12:00:00 AM'
    BEGIN
    SET @Experiation_Date = null
    END
	  IF @min_inv = 0
    BEGIN
    SET @min_inv = null
    END
	  IF @status = ''
    BEGIN
    SET @status = null
    END
	  IF @Exp_delivery_date = '9/9/1900 12:00:00 AM'
    BEGIN
    SET @Exp_delivery_date = null
    END
	  IF @qty_onhand = 0
    BEGIN
    SET @qty_onhand = null
    END
	  IF @qty_commit = 0
    BEGIN
    SET @qty_commit = null
    END
	  IF @qty_order = 0
    BEGIN
    SET @qty_order = null
    END
	  IF @encounter_id = 0
    BEGIN
    SET @encounter_id = null
    END
	  IF @address_id = 0
    BEGIN
    SET @address_id = null
    END
	UPDATE [dbo].[warehouse_product_Location]
       SET
		   [warehouse_id] = @warehouse_id,
		   [product_id] = @product_id,
		   [Location_ID] = @Location_ID,
		   [service_id] = @service_id,
		   [Time_Date_MIA] = @Time_Date_MIA,
		   [Experiation_Date] = @Experiation_Date,
		   [min_inv] = @min_inv,
		   [status] = @status,
		   [Exp_delivery_date] = @Exp_delivery_date,
		   [qty_onhand] = @qty_onhand,
		   [qty_commit] = @qty_commit,
		   [qty_order] = @qty_order,
		   [encounter_id] = @encounter_id,
		   [address_id] = @address_id
       WHERE warehouse_product_location_id = @warehouse_product_location_id
END
GO
/***********************************************************/
/*************************************************/
/****** - DELETE STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_DELETE_WAREHOUSE_PRODUCT_LOCATION]    Script Date: 8/29/2014 2:04:44 PM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_DELETE_WAREHOUSE_PRODUCT_LOCATION]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_DELETE_WAREHOUSE_PRODUCT_LOCATION]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_DELETE_WAREHOUSE_PRODUCT_LOCATION]
	@warehouse_product_location_id int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	Delete dbo.warehouse_product_Location
	where warehouse_product_location_id = @warehouse_product_location_id
END
GO
/***********************************************************/
/*************************************************/
/****** - WHERE CLAUSE STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_SELECT_WAREHOUSE_PRODUCT_LOCATION_WC]    Script Date: 8/29/2014 2:04:44 PM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_SELECT_WAREHOUSE_PRODUCT_LOCATION_WC]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_SELECT_WAREHOUSE_PRODUCT_LOCATION_WC]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_SELECT_WAREHOUSE_PRODUCT_LOCATION_WC]
	  @wareclause as varchar(MAX)
AS
Begin
    Declare @string as varchar(MAX)
	Set @string = 'Select * from warehouse_product_Location where ' + @wareclause
	Exec(@string)
END
GO

/***********************************************************/
/*************************************************/
/****** - SELECT STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_SELECT_EMPLOYEE_CLIENTS]    Script Date: 8/29/2014 2:04:46 PM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_SELECT_EMPLOYEE_CLIENTS]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_SELECT_EMPLOYEE_CLIENTS]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_SELECT_EMPLOYEE_CLIENTS]
           @emp_client_id as int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
SELECT [emp_client_id]
      ,[client_id]
      ,[employee_id]
  FROM [dbo].[employee_clients]
 WHERE emp_client_id = @emp_client_id
End
GO
/***********************************************************/
/*************************************************/
/****** - INSERT STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_INSERT_EMPLOYEE_CLIENTS]    Script Date: 8/29/2014 2:04:46 PM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_INSERT_EMPLOYEE_CLIENTS]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_INSERT_EMPLOYEE_CLIENTS]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_INSERT_EMPLOYEE_CLIENTS]
	  @client_id as int,
	  @employee_id as int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	  IF @client_id = 0
    BEGIN
    SET @client_id = null
    END
	  IF @employee_id = 0
    BEGIN
    SET @employee_id = null
    END
	Insert INTO [dbo].[employee_clients]
           (
            [client_id]
           ,[employee_id]
            )
     VALUES (
            @client_id
           ,@employee_id
            )
END
GO
/***********************************************************/
/*************************************************/
/****** - GET STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_GET_EMPLOYEE_CLIENTS]    Script Date: 8/29/2014 2:04:46 PM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_GET_EMPLOYEE_CLIENTS]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_GET_EMPLOYEE_CLIENTS]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_GET_EMPLOYEE_CLIENTS]
	  @client_id as int,
	  @employee_id as int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	  IF @client_id = 0
    BEGIN
    SET @client_id = null
    END
	  IF @employee_id = 0
    BEGIN
    SET @employee_id = null
    END
    SELECT [emp_client_id] 
      FROM [dbo].[employee_clients] 
       WHERE ([client_id] = @client_id)
       AND ([employee_id] = @employee_id)
END
GO
/***********************************************************/
/*************************************************/
/****** - UPDATE STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_UPDATE_EMPLOYEE_CLIENTS]    Script Date: 8/29/2014 2:04:46 PM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_UPDATE_EMPLOYEE_CLIENTS]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_UPDATE_EMPLOYEE_CLIENTS]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_UPDATE_EMPLOYEE_CLIENTS]
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
    SET @client_id = null
    END
	  IF @employee_id = 0
    BEGIN
    SET @employee_id = null
    END
	UPDATE [dbo].[employee_clients]
       SET
		   [client_id] = @client_id,
		   [employee_id] = @employee_id
       WHERE emp_client_id = @emp_client_id
END
GO
/***********************************************************/
/*************************************************/
/****** - DELETE STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_DELETE_EMPLOYEE_CLIENTS]    Script Date: 8/29/2014 2:04:46 PM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_DELETE_EMPLOYEE_CLIENTS]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_DELETE_EMPLOYEE_CLIENTS]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_DELETE_EMPLOYEE_CLIENTS]
	@emp_client_id int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	Delete dbo.employee_clients
	where emp_client_id = @emp_client_id
END
GO
/***********************************************************/
/*************************************************/
/****** - WHERE CLAUSE STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_SELECT_EMPLOYEE_CLIENTS_WC]    Script Date: 8/29/2014 2:04:46 PM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_SELECT_EMPLOYEE_CLIENTS_WC]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_SELECT_EMPLOYEE_CLIENTS_WC]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_SELECT_EMPLOYEE_CLIENTS_WC]
	  @wareclause as varchar(MAX)
AS
Begin
    Declare @string as varchar(MAX)
	Set @string = 'Select * from employee_clients where ' + @wareclause
	Exec(@string)
END
GO

/***********************************************************/
/*************************************************/
/****** - SELECT STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_SELECT_EMPLOYEE]    Script Date: 8/29/2014 2:04:47 PM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_SELECT_EMPLOYEE]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_SELECT_EMPLOYEE]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_SELECT_EMPLOYEE]
           @employee_id as int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
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
/***********************************************************/
/*************************************************/
/****** - INSERT STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_INSERT_EMPLOYEE]    Script Date: 8/29/2014 2:04:47 PM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_INSERT_EMPLOYEE]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_INSERT_EMPLOYEE]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_INSERT_EMPLOYEE]
	  @employee_id as int,
	  @employee_date_hired as datetime,
	  @employee_department as varchar(15),
	  @employee_hours_worked as int,
	  @employee_leadership as varchar(30),
	  @employee_motivation as varchar(30),
	  @employee_notes as text,
	  @employee_overall as varchar(30),
	  @employee_payrate as money,
	  @employee_performance as varchar(30),
	  @employee_quality as varchar(30),
	  @employee_timeliness as varchar(30),
	  @username as varchar(50),
	  @pswd as varchar(15)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	  IF @employee_date_hired = '9/9/1900 12:00:00 AM'
    BEGIN
    SET @employee_date_hired = null
    END
	  IF @employee_department = ''
    BEGIN
    SET @employee_department = null
    END
	  IF @employee_hours_worked = 0
    BEGIN
    SET @employee_hours_worked = null
    END
	  IF @employee_leadership = ''
    BEGIN
    SET @employee_leadership = null
    END
	  IF @employee_motivation = ''
    BEGIN
    SET @employee_motivation = null
    END
	  IF @employee_overall = ''
    BEGIN
    SET @employee_overall = null
    END
	  IF @employee_payrate = 0
    BEGIN
    SET @employee_payrate = null
    END
	  IF @employee_performance = ''
    BEGIN
    SET @employee_performance = null
    END
	  IF @employee_quality = ''
    BEGIN
    SET @employee_quality = null
    END
	  IF @employee_timeliness = ''
    BEGIN
    SET @employee_timeliness = null
    END
	  IF @username = ''
    BEGIN
    SET @username = null
    END
	  IF @pswd = ''
    BEGIN
    SET @pswd = null
    END
	Insert INTO [dbo].[employee]
           (
            [employee_id]
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
            )
     VALUES (
            @employee_id
           ,@employee_date_hired
           ,@employee_department
           ,@employee_hours_worked
           ,@employee_leadership
           ,@employee_motivation
           ,@employee_notes
           ,@employee_overall
           ,@employee_payrate
           ,@employee_performance
           ,@employee_quality
           ,@employee_timeliness
           ,@username
           ,@pswd
            )
END
GO
/***********************************************************/
/*************************************************/
/****** - GET STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_GET_EMPLOYEE]    Script Date: 8/29/2014 2:04:47 PM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_GET_EMPLOYEE]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_GET_EMPLOYEE]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_GET_EMPLOYEE]
	  @employee_date_hired as datetime,
	  @employee_department as varchar(15),
	  @employee_hours_worked as int,
	  @employee_leadership as varchar(30),
	  @employee_motivation as varchar(30),
	  @employee_notes as text,
	  @employee_overall as varchar(30),
	  @employee_payrate as money,
	  @employee_performance as varchar(30),
	  @employee_quality as varchar(30),
	  @employee_timeliness as varchar(30),
	  @username as varchar(50),
	  @pswd as varchar(15)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	  IF @employee_date_hired = '9/9/1900 12:00:00 AM'
    BEGIN
    SET @employee_date_hired = null
    END
	  IF @employee_department = ''
    BEGIN
    SET @employee_department = null
    END
	  IF @employee_hours_worked = 0
    BEGIN
    SET @employee_hours_worked = null
    END
	  IF @employee_leadership = ''
    BEGIN
    SET @employee_leadership = null
    END
	  IF @employee_motivation = ''
    BEGIN
    SET @employee_motivation = null
    END
	  IF @employee_overall = ''
    BEGIN
    SET @employee_overall = null
    END
	  IF @employee_payrate = 0
    BEGIN
    SET @employee_payrate = null
    END
	  IF @employee_performance = ''
    BEGIN
    SET @employee_performance = null
    END
	  IF @employee_quality = ''
    BEGIN
    SET @employee_quality = null
    END
	  IF @employee_timeliness = ''
    BEGIN
    SET @employee_timeliness = null
    END
	  IF @username = ''
    BEGIN
    SET @username = null
    END
	  IF @pswd = ''
    BEGIN
    SET @pswd = null
    END
    SELECT [employee_id] 
      FROM [dbo].[employee] 
       WHERE ([employee_date_hired] = @employee_date_hired)
       AND ([employee_department] like @employee_department)
       AND ([employee_hours_worked] = @employee_hours_worked or [employee_hours_worked] is null)
       AND ([employee_leadership] like @employee_leadership)
       AND ([employee_motivation] like @employee_motivation or [employee_motivation] is null)
       AND ([employee_notes] like @employee_notes or [employee_notes] is null)
       AND ([employee_overall] like @employee_overall or [employee_overall] is null)
       AND ([employee_payrate] = @employee_payrate)
       AND ([employee_performance] like @employee_performance or [employee_performance] is null)
       AND ([employee_quality] like @employee_quality or [employee_quality] is null)
       AND ([employee_timeliness] like @employee_timeliness or [employee_timeliness] is null)
       AND ([username] like @username or [username] is null)
       AND ([pswd] like @pswd or [pswd] is null)
END
GO
/***********************************************************/
/*************************************************/
/****** - UPDATE STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_UPDATE_EMPLOYEE]    Script Date: 8/29/2014 2:04:47 PM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_UPDATE_EMPLOYEE]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_UPDATE_EMPLOYEE]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_UPDATE_EMPLOYEE]
	  @employee_id as int,
	  @employee_date_hired as datetime,
	  @employee_department as varchar(15),
	  @employee_hours_worked as int,
	  @employee_leadership as varchar(30),
	  @employee_motivation as varchar(30),
	  @employee_notes as text,
	  @employee_overall as varchar(30),
	  @employee_payrate as money,
	  @employee_performance as varchar(30),
	  @employee_quality as varchar(30),
	  @employee_timeliness as varchar(30),
	  @username as varchar(50),
	  @pswd as varchar(15)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	  IF @employee_date_hired = '9/9/1900 12:00:00 AM'
    BEGIN
    SET @employee_date_hired = null
    END
	  IF @employee_department = ''
    BEGIN
    SET @employee_department = null
    END
	  IF @employee_hours_worked = 0
    BEGIN
    SET @employee_hours_worked = null
    END
	  IF @employee_leadership = ''
    BEGIN
    SET @employee_leadership = null
    END
	  IF @employee_motivation = ''
    BEGIN
    SET @employee_motivation = null
    END
	  IF @employee_overall = ''
    BEGIN
    SET @employee_overall = null
    END
	  IF @employee_payrate = 0
    BEGIN
    SET @employee_payrate = null
    END
	  IF @employee_performance = ''
    BEGIN
    SET @employee_performance = null
    END
	  IF @employee_quality = ''
    BEGIN
    SET @employee_quality = null
    END
	  IF @employee_timeliness = ''
    BEGIN
    SET @employee_timeliness = null
    END
	  IF @username = ''
    BEGIN
    SET @username = null
    END
	  IF @pswd = ''
    BEGIN
    SET @pswd = null
    END
	UPDATE [dbo].[employee]
       SET
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
END
GO
/***********************************************************/
/*************************************************/
/****** - DELETE STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_DELETE_EMPLOYEE]    Script Date: 8/29/2014 2:04:47 PM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_DELETE_EMPLOYEE]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_DELETE_EMPLOYEE]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_DELETE_EMPLOYEE]
	@employee_id int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	Delete dbo.employee
	where employee_id = @employee_id
END
GO
/***********************************************************/
/*************************************************/
/****** - WHERE CLAUSE STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_SELECT_EMPLOYEE_WC]    Script Date: 8/29/2014 2:04:47 PM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_SELECT_EMPLOYEE_WC]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_SELECT_EMPLOYEE_WC]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_SELECT_EMPLOYEE_WC]
	  @wareclause as varchar(MAX)
AS
Begin
    Declare @string as varchar(MAX)
	Set @string = 'Select * from employee where ' + @wareclause
	Exec(@string)
END
GO

/***********************************************************/
/*************************************************/
/****** - SELECT STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_SELECT_ORDER_PRODUCT]    Script Date: 8/29/2014 2:04:49 PM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_SELECT_ORDER_PRODUCT]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_SELECT_ORDER_PRODUCT]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_SELECT_ORDER_PRODUCT]
           @order_Product_ID as int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
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
/***********************************************************/
/*************************************************/
/****** - INSERT STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_INSERT_ORDER_PRODUCT]    Script Date: 8/29/2014 2:04:49 PM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_INSERT_ORDER_PRODUCT]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_INSERT_ORDER_PRODUCT]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_INSERT_ORDER_PRODUCT]
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
	  IF @orderID = 0
    BEGIN
    SET @orderID = null
    END
	  IF @ProductID = 0
    BEGIN
    SET @ProductID = null
    END
	  IF @Quantity = 0
    BEGIN
    SET @Quantity = null
    END
	  IF @warehouseid = 0
    BEGIN
    SET @warehouseid = null
    END
	  IF @DatePicked = '9/9/1900 12:00:00 AM'
    BEGIN
    SET @DatePicked = null
    END
	  IF @Qtypicked = 0
    BEGIN
    SET @Qtypicked = null
    END
	Insert INTO [dbo].[Order_Product]
           (
            [orderID]
           ,[ProductID]
           ,[Quantity]
           ,[warehouseid]
           ,[DatePicked]
           ,[Qtypicked]
            )
     VALUES (
            @orderID
           ,@ProductID
           ,@Quantity
           ,@warehouseid
           ,@DatePicked
           ,@Qtypicked
            )
END
GO
/***********************************************************/
/*************************************************/
/****** - GET STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_GET_ORDER_PRODUCT]    Script Date: 8/29/2014 2:04:49 PM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_GET_ORDER_PRODUCT]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_GET_ORDER_PRODUCT]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_GET_ORDER_PRODUCT]
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
	  IF @orderID = 0
    BEGIN
    SET @orderID = null
    END
	  IF @ProductID = 0
    BEGIN
    SET @ProductID = null
    END
	  IF @Quantity = 0
    BEGIN
    SET @Quantity = null
    END
	  IF @warehouseid = 0
    BEGIN
    SET @warehouseid = null
    END
	  IF @DatePicked = '9/9/1900 12:00:00 AM'
    BEGIN
    SET @DatePicked = null
    END
	  IF @Qtypicked = 0
    BEGIN
    SET @Qtypicked = null
    END
    SELECT [order_Product_ID] 
      FROM [dbo].[Order_Product] 
       WHERE ([orderID] = @orderID)
       AND ([ProductID] = @ProductID)
       AND ([Quantity] = @Quantity)
       AND ([warehouseid] = @warehouseid)
       AND ([DatePicked] = @DatePicked or [DatePicked] is null)
       AND ([Qtypicked] = @Qtypicked or [Qtypicked] is null)
END
GO
/***********************************************************/
/*************************************************/
/****** - UPDATE STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_UPDATE_ORDER_PRODUCT]    Script Date: 8/29/2014 2:04:49 PM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_UPDATE_ORDER_PRODUCT]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_UPDATE_ORDER_PRODUCT]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_UPDATE_ORDER_PRODUCT]
	  @order_Product_ID as int,
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
	  IF @orderID = 0
    BEGIN
    SET @orderID = null
    END
	  IF @ProductID = 0
    BEGIN
    SET @ProductID = null
    END
	  IF @Quantity = 0
    BEGIN
    SET @Quantity = null
    END
	  IF @warehouseid = 0
    BEGIN
    SET @warehouseid = null
    END
	  IF @DatePicked = '9/9/1900 12:00:00 AM'
    BEGIN
    SET @DatePicked = null
    END
	  IF @Qtypicked = 0
    BEGIN
    SET @Qtypicked = null
    END
	UPDATE [dbo].[Order_Product]
       SET
		   [orderID] = @orderID,
		   [ProductID] = @ProductID,
		   [Quantity] = @Quantity,
		   [warehouseid] = @warehouseid,
		   [DatePicked] = @DatePicked,
		   [Qtypicked] = @Qtypicked
       WHERE order_Product_ID = @order_Product_ID
END
GO
/***********************************************************/
/*************************************************/
/****** - DELETE STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_DELETE_ORDER_PRODUCT]    Script Date: 8/29/2014 2:04:49 PM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_DELETE_ORDER_PRODUCT]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_DELETE_ORDER_PRODUCT]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_DELETE_ORDER_PRODUCT]
	@order_Product_ID int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	Delete dbo.Order_Product
	where order_Product_ID = @order_Product_ID
END
GO
/***********************************************************/
/*************************************************/
/****** - WHERE CLAUSE STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_SELECT_ORDER_PRODUCT_WC]    Script Date: 8/29/2014 2:04:49 PM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_SELECT_ORDER_PRODUCT_WC]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_SELECT_ORDER_PRODUCT_WC]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_SELECT_ORDER_PRODUCT_WC]
	  @wareclause as varchar(MAX)
AS
Begin
    Declare @string as varchar(MAX)
	Set @string = 'Select * from Order_Product where ' + @wareclause
	Exec(@string)
END
GO

/***********************************************************/
/*************************************************/
/****** - SELECT STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_SELECT_REQUESTOR_ORDER]    Script Date: 8/29/2014 2:04:50 PM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_SELECT_REQUESTOR_ORDER]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_SELECT_REQUESTOR_ORDER]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_SELECT_REQUESTOR_ORDER]
           @OrderID as int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
SELECT [OrderID]
      ,[Requestor_ID]
      ,[EncounterID]
      ,[OrderPriority]
      ,[OrderNum]
      ,[ShipToAddressID]
      ,[OrderDeliveryType]
      ,[OrderPickUpDate]
  FROM [dbo].[requestor_Order]
 WHERE OrderID = @OrderID
End
GO
/***********************************************************/
/*************************************************/
/****** - INSERT STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_INSERT_REQUESTOR_ORDER]    Script Date: 8/29/2014 2:04:50 PM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_INSERT_REQUESTOR_ORDER]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_INSERT_REQUESTOR_ORDER]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_INSERT_REQUESTOR_ORDER]
	  @Requestor_ID as int,
	  @EncounterID as int,
	  @OrderPriority as int,
	  @OrderNum as int,
	  @ShipToAddressID as int,
	  @OrderDeliveryType as varchar(20),
	  @OrderPickUpDate as datetime
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	  IF @Requestor_ID = 0
    BEGIN
    SET @Requestor_ID = null
    END
	  IF @EncounterID = 0
    BEGIN
    SET @EncounterID = null
    END
	  IF @OrderPriority = 0
    BEGIN
    SET @OrderPriority = null
    END
	  IF @OrderNum = 0
    BEGIN
    SET @OrderNum = null
    END
	  IF @ShipToAddressID = 0
    BEGIN
    SET @ShipToAddressID = null
    END
	  IF @OrderDeliveryType = ''
    BEGIN
    SET @OrderDeliveryType = null
    END
	  IF @OrderPickUpDate = '9/9/1900 12:00:00 AM'
    BEGIN
    SET @OrderPickUpDate = null
    END
	Insert INTO [dbo].[requestor_Order]
           (
            [Requestor_ID]
           ,[EncounterID]
           ,[OrderPriority]
           ,[OrderNum]
           ,[ShipToAddressID]
           ,[OrderDeliveryType]
           ,[OrderPickUpDate]
            )
     VALUES (
            @Requestor_ID
           ,@EncounterID
           ,@OrderPriority
           ,@OrderNum
           ,@ShipToAddressID
           ,@OrderDeliveryType
           ,@OrderPickUpDate
            )
END
GO
/***********************************************************/
/*************************************************/
/****** - GET STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_GET_REQUESTOR_ORDER]    Script Date: 8/29/2014 2:04:50 PM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_GET_REQUESTOR_ORDER]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_GET_REQUESTOR_ORDER]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_GET_REQUESTOR_ORDER]
	  @Requestor_ID as int,
	  @EncounterID as int,
	  @OrderPriority as int,
	  @OrderNum as int,
	  @ShipToAddressID as int,
	  @OrderDeliveryType as varchar(20),
	  @OrderPickUpDate as datetime
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	  IF @Requestor_ID = 0
    BEGIN
    SET @Requestor_ID = null
    END
	  IF @EncounterID = 0
    BEGIN
    SET @EncounterID = null
    END
	  IF @OrderPriority = 0
    BEGIN
    SET @OrderPriority = null
    END
	  IF @OrderNum = 0
    BEGIN
    SET @OrderNum = null
    END
	  IF @ShipToAddressID = 0
    BEGIN
    SET @ShipToAddressID = null
    END
	  IF @OrderDeliveryType = ''
    BEGIN
    SET @OrderDeliveryType = null
    END
	  IF @OrderPickUpDate = '9/9/1900 12:00:00 AM'
    BEGIN
    SET @OrderPickUpDate = null
    END
    SELECT [OrderID] 
      FROM [dbo].[requestor_Order] 
       WHERE ([Requestor_ID] = @Requestor_ID or [Requestor_ID] is null)
       AND ([EncounterID] = @EncounterID or [EncounterID] is null)
       AND ([OrderPriority] = @OrderPriority or [OrderPriority] is null)
       AND ([OrderNum] = @OrderNum or [OrderNum] is null)
       AND ([ShipToAddressID] = @ShipToAddressID or [ShipToAddressID] is null)
       AND ([OrderDeliveryType] like @OrderDeliveryType or [OrderDeliveryType] is null)
       AND ([OrderPickUpDate] = @OrderPickUpDate or [OrderPickUpDate] is null)
END
GO
/***********************************************************/
/*************************************************/
/****** - UPDATE STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_UPDATE_REQUESTOR_ORDER]    Script Date: 8/29/2014 2:04:50 PM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_UPDATE_REQUESTOR_ORDER]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_UPDATE_REQUESTOR_ORDER]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_UPDATE_REQUESTOR_ORDER]
	  @OrderID as int,
	  @Requestor_ID as int,
	  @EncounterID as int,
	  @OrderPriority as int,
	  @OrderNum as int,
	  @ShipToAddressID as int,
	  @OrderDeliveryType as varchar(20),
	  @OrderPickUpDate as datetime
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	  IF @Requestor_ID = 0
    BEGIN
    SET @Requestor_ID = null
    END
	  IF @EncounterID = 0
    BEGIN
    SET @EncounterID = null
    END
	  IF @OrderPriority = 0
    BEGIN
    SET @OrderPriority = null
    END
	  IF @OrderNum = 0
    BEGIN
    SET @OrderNum = null
    END
	  IF @ShipToAddressID = 0
    BEGIN
    SET @ShipToAddressID = null
    END
	  IF @OrderDeliveryType = ''
    BEGIN
    SET @OrderDeliveryType = null
    END
	  IF @OrderPickUpDate = '9/9/1900 12:00:00 AM'
    BEGIN
    SET @OrderPickUpDate = null
    END
	UPDATE [dbo].[requestor_Order]
       SET
		   [Requestor_ID] = @Requestor_ID,
		   [EncounterID] = @EncounterID,
		   [OrderPriority] = @OrderPriority,
		   [OrderNum] = @OrderNum,
		   [ShipToAddressID] = @ShipToAddressID,
		   [OrderDeliveryType] = @OrderDeliveryType,
		   [OrderPickUpDate] = @OrderPickUpDate
       WHERE OrderID = @OrderID
END
GO
/***********************************************************/
/*************************************************/
/****** - DELETE STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_DELETE_REQUESTOR_ORDER]    Script Date: 8/29/2014 2:04:50 PM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_DELETE_REQUESTOR_ORDER]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_DELETE_REQUESTOR_ORDER]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_DELETE_REQUESTOR_ORDER]
	@OrderID int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	Delete dbo.requestor_Order
	where OrderID = @OrderID
END
GO
/***********************************************************/
/*************************************************/
/****** - WHERE CLAUSE STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_SELECT_REQUESTOR_ORDER_WC]    Script Date: 8/29/2014 2:04:50 PM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_SELECT_REQUESTOR_ORDER_WC]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_SELECT_REQUESTOR_ORDER_WC]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_SELECT_REQUESTOR_ORDER_WC]
	  @wareclause as varchar(MAX)
AS
Begin
    Declare @string as varchar(MAX)
	Set @string = 'Select * from requestor_Order where ' + @wareclause
	Exec(@string)
END
GO

/***********************************************************/
/*************************************************/
/****** - SELECT STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_SELECT_REQUESTOR]    Script Date: 8/29/2014 2:04:52 PM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_SELECT_REQUESTOR]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_SELECT_REQUESTOR]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_SELECT_REQUESTOR]
           @RequestorID as int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
SELECT [RequestorID]
      ,[EncounterID]
      ,[Requestor_Type]
      ,[MobilUnitID]
      ,[PersonID]
      ,[AgencyID]
  FROM [dbo].[requestor]
 WHERE RequestorID = @RequestorID
End
GO
/***********************************************************/
/*************************************************/
/****** - INSERT STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_INSERT_REQUESTOR]    Script Date: 8/29/2014 2:04:52 PM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_INSERT_REQUESTOR]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_INSERT_REQUESTOR]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_INSERT_REQUESTOR]
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
    SET @EncounterID = null
    END
	  IF @Requestor_Type = ''
    BEGIN
    SET @Requestor_Type = null
    END
	  IF @MobilUnitID = 0
    BEGIN
    SET @MobilUnitID = null
    END
	  IF @PersonID = 0
    BEGIN
    SET @PersonID = null
    END
	  IF @AgencyID = 0
    BEGIN
    SET @AgencyID = null
    END
	Insert INTO [dbo].[requestor]
           (
            [EncounterID]
           ,[Requestor_Type]
           ,[MobilUnitID]
           ,[PersonID]
           ,[AgencyID]
            )
     VALUES (
            @EncounterID
           ,@Requestor_Type
           ,@MobilUnitID
           ,@PersonID
           ,@AgencyID
            )
END
GO
/***********************************************************/
/*************************************************/
/****** - GET STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_GET_REQUESTOR]    Script Date: 8/29/2014 2:04:52 PM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_GET_REQUESTOR]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_GET_REQUESTOR]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_GET_REQUESTOR]
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
    SET @EncounterID = null
    END
	  IF @Requestor_Type = ''
    BEGIN
    SET @Requestor_Type = null
    END
	  IF @MobilUnitID = 0
    BEGIN
    SET @MobilUnitID = null
    END
	  IF @PersonID = 0
    BEGIN
    SET @PersonID = null
    END
	  IF @AgencyID = 0
    BEGIN
    SET @AgencyID = null
    END
    SELECT [RequestorID] 
      FROM [dbo].[requestor] 
       WHERE ([EncounterID] = @EncounterID)
       AND ([Requestor_Type] = @Requestor_Type)
       AND ([MobilUnitID] = @MobilUnitID or [MobilUnitID] is null)
       AND ([PersonID] = @PersonID or [PersonID] is null)
       AND ([AgencyID] = @AgencyID or [AgencyID] is null)
END
GO
/***********************************************************/
/*************************************************/
/****** - UPDATE STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_UPDATE_REQUESTOR]    Script Date: 8/29/2014 2:04:52 PM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_UPDATE_REQUESTOR]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_UPDATE_REQUESTOR]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_UPDATE_REQUESTOR]
	  @RequestorID as int,
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
    SET @EncounterID = null
    END
	  IF @Requestor_Type = ''
    BEGIN
    SET @Requestor_Type = null
    END
	  IF @MobilUnitID = 0
    BEGIN
    SET @MobilUnitID = null
    END
	  IF @PersonID = 0
    BEGIN
    SET @PersonID = null
    END
	  IF @AgencyID = 0
    BEGIN
    SET @AgencyID = null
    END
	UPDATE [dbo].[requestor]
       SET
		   [EncounterID] = @EncounterID,
		   [Requestor_Type] = @Requestor_Type,
		   [MobilUnitID] = @MobilUnitID,
		   [PersonID] = @PersonID,
		   [AgencyID] = @AgencyID
       WHERE RequestorID = @RequestorID
END
GO
/***********************************************************/
/*************************************************/
/****** - DELETE STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_DELETE_REQUESTOR]    Script Date: 8/29/2014 2:04:52 PM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_DELETE_REQUESTOR]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_DELETE_REQUESTOR]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_DELETE_REQUESTOR]
	@RequestorID int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	Delete dbo.requestor
	where RequestorID = @RequestorID
END
GO
/***********************************************************/
/*************************************************/
/****** - WHERE CLAUSE STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_SELECT_REQUESTOR_WC]    Script Date: 8/29/2014 2:04:52 PM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_SELECT_REQUESTOR_WC]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_SELECT_REQUESTOR_WC]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_SELECT_REQUESTOR_WC]
	  @wareclause as varchar(MAX)
AS
Begin
    Declare @string as varchar(MAX)
	Set @string = 'Select * from requestor where ' + @wareclause
	Exec(@string)
END
GO

/***********************************************************/
/*************************************************/
/****** - SELECT STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_SELECT_EVACUATION_ENCOUNTER_SHELTER_EMPLOYEE]    Script Date: 8/29/2014 2:04:53 PM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_SELECT_EVACUATION_ENCOUNTER_SHELTER_EMPLOYEE]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_SELECT_EVACUATION_ENCOUNTER_SHELTER_EMPLOYEE]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_SELECT_EVACUATION_ENCOUNTER_SHELTER_EMPLOYEE]
           @Evacuation_Encounter_Shelter_Employee_ID as int
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
/****** Object:  StoredProcedure [dbo].[SP_DMCS_INSERT_EVACUATION_ENCOUNTER_SHELTER_EMPLOYEE]    Script Date: 8/29/2014 2:04:53 PM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_INSERT_EVACUATION_ENCOUNTER_SHELTER_EMPLOYEE]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_INSERT_EVACUATION_ENCOUNTER_SHELTER_EMPLOYEE]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_INSERT_EVACUATION_ENCOUNTER_SHELTER_EMPLOYEE]
	  @Shelter_ID as int,
	  @Employee_ID as int,
	  @Evacuation_Area_ID as int,
	  @Encounter_ID as int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	  IF @Shelter_ID = 0
    BEGIN
    SET @Shelter_ID = null
    END
	  IF @Employee_ID = 0
    BEGIN
    SET @Employee_ID = null
    END
	  IF @Evacuation_Area_ID = 0
    BEGIN
    SET @Evacuation_Area_ID = null
    END
	  IF @Encounter_ID = 0
    BEGIN
    SET @Encounter_ID = null
    END
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
/****** Object:  StoredProcedure [dbo].[SP_DMCS_GET_EVACUATION_ENCOUNTER_SHELTER_EMPLOYEE]    Script Date: 8/29/2014 2:04:53 PM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_GET_EVACUATION_ENCOUNTER_SHELTER_EMPLOYEE]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_GET_EVACUATION_ENCOUNTER_SHELTER_EMPLOYEE]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_GET_EVACUATION_ENCOUNTER_SHELTER_EMPLOYEE]
	  @Shelter_ID as int,
	  @Employee_ID as int,
	  @Evacuation_Area_ID as int,
	  @Encounter_ID as int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	  IF @Shelter_ID = 0
    BEGIN
    SET @Shelter_ID = null
    END
	  IF @Employee_ID = 0
    BEGIN
    SET @Employee_ID = null
    END
	  IF @Evacuation_Area_ID = 0
    BEGIN
    SET @Evacuation_Area_ID = null
    END
	  IF @Encounter_ID = 0
    BEGIN
    SET @Encounter_ID = null
    END
    SELECT [Evacuation_Encounter_Shelter_Employee_ID] 
      FROM [dbo].[Evacuation_Encounter_Shelter_Employee] 
       WHERE ([Shelter_ID] = @Shelter_ID)
       AND ([Employee_ID] = @Employee_ID)
       AND ([Evacuation_Area_ID] = @Evacuation_Area_ID or [Evacuation_Area_ID] is null)
       AND ([Encounter_ID] = @Encounter_ID)
END
GO
/***********************************************************/
/*************************************************/
/****** - UPDATE STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_UPDATE_EVACUATION_ENCOUNTER_SHELTER_EMPLOYEE]    Script Date: 8/29/2014 2:04:53 PM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_UPDATE_EVACUATION_ENCOUNTER_SHELTER_EMPLOYEE]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_UPDATE_EVACUATION_ENCOUNTER_SHELTER_EMPLOYEE]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_UPDATE_EVACUATION_ENCOUNTER_SHELTER_EMPLOYEE]
	  @Evacuation_Encounter_Shelter_Employee_ID as int,
	  @Shelter_ID as int,
	  @Employee_ID as int,
	  @Evacuation_Area_ID as int,
	  @Encounter_ID as int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	  IF @Shelter_ID = 0
    BEGIN
    SET @Shelter_ID = null
    END
	  IF @Employee_ID = 0
    BEGIN
    SET @Employee_ID = null
    END
	  IF @Evacuation_Area_ID = 0
    BEGIN
    SET @Evacuation_Area_ID = null
    END
	  IF @Encounter_ID = 0
    BEGIN
    SET @Encounter_ID = null
    END
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
/****** Object:  StoredProcedure [dbo].[SP_DMCS_DELETE_EVACUATION_ENCOUNTER_SHELTER_EMPLOYEE]    Script Date: 8/29/2014 2:04:53 PM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_DELETE_EVACUATION_ENCOUNTER_SHELTER_EMPLOYEE]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_DELETE_EVACUATION_ENCOUNTER_SHELTER_EMPLOYEE]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_DELETE_EVACUATION_ENCOUNTER_SHELTER_EMPLOYEE]
	@Evacuation_Encounter_Shelter_Employee_ID int
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
/****** Object:  StoredProcedure [dbo].[SP_DMCS_SELECT_EVACUATION_ENCOUNTER_SHELTER_EMPLOYEE_WC]    Script Date: 8/29/2014 2:04:53 PM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_SELECT_EVACUATION_ENCOUNTER_SHELTER_EMPLOYEE_WC]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_SELECT_EVACUATION_ENCOUNTER_SHELTER_EMPLOYEE_WC]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_SELECT_EVACUATION_ENCOUNTER_SHELTER_EMPLOYEE_WC]
	  @wareclause as varchar(MAX)
AS
Begin
    Declare @string as varchar(MAX)
	Set @string = 'Select * from Evacuation_Encounter_Shelter_Employee where ' + @wareclause
	Exec(@string)
END
GO

/***********************************************************/
/*************************************************/
/****** - SELECT STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_SELECT_EVACUATION_ENCOUNTER_SHELTER_CLIENT]    Script Date: 8/29/2014 2:04:55 PM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_SELECT_EVACUATION_ENCOUNTER_SHELTER_CLIENT]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_SELECT_EVACUATION_ENCOUNTER_SHELTER_CLIENT]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_SELECT_EVACUATION_ENCOUNTER_SHELTER_CLIENT]
           @Evacuation_Encounter_Shelter_Client_ID as int
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
/****** Object:  StoredProcedure [dbo].[SP_DMCS_INSERT_EVACUATION_ENCOUNTER_SHELTER_CLIENT]    Script Date: 8/29/2014 2:04:55 PM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_INSERT_EVACUATION_ENCOUNTER_SHELTER_CLIENT]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_INSERT_EVACUATION_ENCOUNTER_SHELTER_CLIENT]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_INSERT_EVACUATION_ENCOUNTER_SHELTER_CLIENT]
	  @Evacuation_Area_ID as int,
	  @Encounter_Id as int,
	  @Start_Date as datetime,
	  @End_Date as datetime,
	  @Shelter_ID as int,
	  @Client_ID as int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	  IF @Evacuation_Area_ID = 0
    BEGIN
    SET @Evacuation_Area_ID = null
    END
	  IF @Encounter_Id = 0
    BEGIN
    SET @Encounter_Id = null
    END
	  IF @Start_Date = '9/9/1900 12:00:00 AM'
    BEGIN
    SET @Start_Date = null
    END
	  IF @End_Date = '9/9/1900 12:00:00 AM'
    BEGIN
    SET @End_Date = null
    END
	  IF @Shelter_ID = 0
    BEGIN
    SET @Shelter_ID = null
    END
	  IF @Client_ID = 0
    BEGIN
    SET @Client_ID = null
    END
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
/****** Object:  StoredProcedure [dbo].[SP_DMCS_GET_EVACUATION_ENCOUNTER_SHELTER_CLIENT]    Script Date: 8/29/2014 2:04:55 PM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_GET_EVACUATION_ENCOUNTER_SHELTER_CLIENT]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_GET_EVACUATION_ENCOUNTER_SHELTER_CLIENT]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_GET_EVACUATION_ENCOUNTER_SHELTER_CLIENT]
	  @Evacuation_Area_ID as int,
	  @Encounter_Id as int,
	  @Start_Date as datetime,
	  @End_Date as datetime,
	  @Shelter_ID as int,
	  @Client_ID as int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	  IF @Evacuation_Area_ID = 0
    BEGIN
    SET @Evacuation_Area_ID = null
    END
	  IF @Encounter_Id = 0
    BEGIN
    SET @Encounter_Id = null
    END
	  IF @Start_Date = '9/9/1900 12:00:00 AM'
    BEGIN
    SET @Start_Date = null
    END
	  IF @End_Date = '9/9/1900 12:00:00 AM'
    BEGIN
    SET @End_Date = null
    END
	  IF @Shelter_ID = 0
    BEGIN
    SET @Shelter_ID = null
    END
	  IF @Client_ID = 0
    BEGIN
    SET @Client_ID = null
    END
    SELECT [Evacuation_Encounter_Shelter_Client_ID] 
      FROM [dbo].[Evacuation_Encounter_Shelter_Client] 
       WHERE ([Evacuation_Area_ID] = @Evacuation_Area_ID)
       AND ([Encounter_Id] = @Encounter_Id)
       AND ([Start_Date] = @Start_Date)
       AND ([End_Date] = @End_Date or [End_Date] is null)
       AND ([Shelter_ID] = @Shelter_ID)
       AND ([Client_ID] = @Client_ID)
END
GO
/***********************************************************/
/*************************************************/
/****** - UPDATE STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_UPDATE_EVACUATION_ENCOUNTER_SHELTER_CLIENT]    Script Date: 8/29/2014 2:04:55 PM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_UPDATE_EVACUATION_ENCOUNTER_SHELTER_CLIENT]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_UPDATE_EVACUATION_ENCOUNTER_SHELTER_CLIENT]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_UPDATE_EVACUATION_ENCOUNTER_SHELTER_CLIENT]
	  @Evacuation_Encounter_Shelter_Client_ID as int,
	  @Evacuation_Area_ID as int,
	  @Encounter_Id as int,
	  @Start_Date as datetime,
	  @End_Date as datetime,
	  @Shelter_ID as int,
	  @Client_ID as int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	  IF @Evacuation_Area_ID = 0
    BEGIN
    SET @Evacuation_Area_ID = null
    END
	  IF @Encounter_Id = 0
    BEGIN
    SET @Encounter_Id = null
    END
	  IF @Start_Date = '9/9/1900 12:00:00 AM'
    BEGIN
    SET @Start_Date = null
    END
	  IF @End_Date = '9/9/1900 12:00:00 AM'
    BEGIN
    SET @End_Date = null
    END
	  IF @Shelter_ID = 0
    BEGIN
    SET @Shelter_ID = null
    END
	  IF @Client_ID = 0
    BEGIN
    SET @Client_ID = null
    END
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
/****** Object:  StoredProcedure [dbo].[SP_DMCS_DELETE_EVACUATION_ENCOUNTER_SHELTER_CLIENT]    Script Date: 8/29/2014 2:04:55 PM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_DELETE_EVACUATION_ENCOUNTER_SHELTER_CLIENT]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_DELETE_EVACUATION_ENCOUNTER_SHELTER_CLIENT]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_DELETE_EVACUATION_ENCOUNTER_SHELTER_CLIENT]
	@Evacuation_Encounter_Shelter_Client_ID int
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
/****** Object:  StoredProcedure [dbo].[SP_DMCS_SELECT_EVACUATION_ENCOUNTER_SHELTER_CLIENT_WC]    Script Date: 8/29/2014 2:04:55 PM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_SELECT_EVACUATION_ENCOUNTER_SHELTER_CLIENT_WC]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_SELECT_EVACUATION_ENCOUNTER_SHELTER_CLIENT_WC]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_SELECT_EVACUATION_ENCOUNTER_SHELTER_CLIENT_WC]
	  @wareclause as varchar(MAX)
AS
Begin
    Declare @string as varchar(MAX)
	Set @string = 'Select * from Evacuation_Encounter_Shelter_Client where ' + @wareclause
	Exec(@string)
END
GO

/***********************************************************/
/*************************************************/
/****** - SELECT STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_SELECT_ENCOUNTER_SERVICES]    Script Date: 8/29/2014 2:04:56 PM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_SELECT_ENCOUNTER_SERVICES]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_SELECT_ENCOUNTER_SERVICES]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_SELECT_ENCOUNTER_SERVICES]
           @encounter_serv_id as int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
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
/***********************************************************/
/*************************************************/
/****** - INSERT STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_INSERT_ENCOUNTER_SERVICES]    Script Date: 8/29/2014 2:04:56 PM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_INSERT_ENCOUNTER_SERVICES]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_INSERT_ENCOUNTER_SERVICES]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_INSERT_ENCOUNTER_SERVICES]
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
    SET @encounter_id = null
    END
	  IF @mobile_unit_id = 0
    BEGIN
    SET @mobile_unit_id = null
    END
	  IF @service_id = 0
    BEGIN
    SET @service_id = null
    END
	  IF @service_date = '9/9/1900 12:00:00 AM'
    BEGIN
    SET @service_date = null
    END
	  IF @service_completed = '9/9/1900 12:00:00 AM'
    BEGIN
    SET @service_completed = null
    END
	Insert INTO [dbo].[encounter_services]
           (
            [encounter_id]
           ,[mobile_unit_id]
           ,[service_id]
           ,[service_date]
           ,[service_completed]
            )
     VALUES (
            @encounter_id
           ,@mobile_unit_id
           ,@service_id
           ,@service_date
           ,@service_completed
            )
END
GO
/***********************************************************/
/*************************************************/
/****** - GET STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_GET_ENCOUNTER_SERVICES]    Script Date: 8/29/2014 2:04:56 PM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_GET_ENCOUNTER_SERVICES]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_GET_ENCOUNTER_SERVICES]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_GET_ENCOUNTER_SERVICES]
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
    SET @encounter_id = null
    END
	  IF @mobile_unit_id = 0
    BEGIN
    SET @mobile_unit_id = null
    END
	  IF @service_id = 0
    BEGIN
    SET @service_id = null
    END
	  IF @service_date = '9/9/1900 12:00:00 AM'
    BEGIN
    SET @service_date = null
    END
	  IF @service_completed = '9/9/1900 12:00:00 AM'
    BEGIN
    SET @service_completed = null
    END
    SELECT [encounter_serv_id] 
      FROM [dbo].[encounter_services] 
       WHERE ([encounter_id] = @encounter_id or [encounter_id] is null)
       AND ([mobile_unit_id] = @mobile_unit_id or [mobile_unit_id] is null)
       AND ([service_id] = @service_id)
       AND ([service_date] = @service_date)
       AND ([service_completed] = @service_completed or [service_completed] is null)
END
GO
/***********************************************************/
/*************************************************/
/****** - UPDATE STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_UPDATE_ENCOUNTER_SERVICES]    Script Date: 8/29/2014 2:04:56 PM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_UPDATE_ENCOUNTER_SERVICES]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_UPDATE_ENCOUNTER_SERVICES]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_UPDATE_ENCOUNTER_SERVICES]
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
    SET @encounter_id = null
    END
	  IF @mobile_unit_id = 0
    BEGIN
    SET @mobile_unit_id = null
    END
	  IF @service_id = 0
    BEGIN
    SET @service_id = null
    END
	  IF @service_date = '9/9/1900 12:00:00 AM'
    BEGIN
    SET @service_date = null
    END
	  IF @service_completed = '9/9/1900 12:00:00 AM'
    BEGIN
    SET @service_completed = null
    END
	UPDATE [dbo].[encounter_services]
       SET
		   [encounter_id] = @encounter_id,
		   [mobile_unit_id] = @mobile_unit_id,
		   [service_id] = @service_id,
		   [service_date] = @service_date,
		   [service_completed] = @service_completed
       WHERE encounter_serv_id = @encounter_serv_id
END
GO
/***********************************************************/
/*************************************************/
/****** - DELETE STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_DELETE_ENCOUNTER_SERVICES]    Script Date: 8/29/2014 2:04:56 PM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_DELETE_ENCOUNTER_SERVICES]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_DELETE_ENCOUNTER_SERVICES]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_DELETE_ENCOUNTER_SERVICES]
	@encounter_serv_id int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	Delete dbo.encounter_services
	where encounter_serv_id = @encounter_serv_id
END
GO
/***********************************************************/
/*************************************************/
/****** - WHERE CLAUSE STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_SELECT_ENCOUNTER_SERVICES_WC]    Script Date: 8/29/2014 2:04:56 PM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_SELECT_ENCOUNTER_SERVICES_WC]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_SELECT_ENCOUNTER_SERVICES_WC]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_SELECT_ENCOUNTER_SERVICES_WC]
	  @wareclause as varchar(MAX)
AS
Begin
    Declare @string as varchar(MAX)
	Set @string = 'Select * from encounter_services where ' + @wareclause
	Exec(@string)
END
GO

/***********************************************************/
/*************************************************/
/****** - SELECT STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_SELECT_ENCOUNTER_CLIENT_VACCINE]    Script Date: 8/29/2014 2:04:58 PM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_SELECT_ENCOUNTER_CLIENT_VACCINE]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_SELECT_ENCOUNTER_CLIENT_VACCINE]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_SELECT_ENCOUNTER_CLIENT_VACCINE]
           @encounter_id as int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
SELECT [encounter_id]
      ,[vaccine_id]
      ,[current_client_medicine]
      ,[assistance]
      ,[quantity]
      ,[Under_six_months_old]
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
/***********************************************************/
/*************************************************/
/****** - INSERT STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_INSERT_ENCOUNTER_CLIENT_VACCINE]    Script Date: 8/29/2014 2:04:58 PM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_INSERT_ENCOUNTER_CLIENT_VACCINE]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_INSERT_ENCOUNTER_CLIENT_VACCINE]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_INSERT_ENCOUNTER_CLIENT_VACCINE]
	  @encounter_id as int,
	  @vaccine_id as int,
	  @current_client_medicine as varchar(30),
	  @assistance as char(1),
	  @quantity as int,
	  @Under_six_months_old as char(1),
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
    SET @vaccine_id = null
    END
	  IF @current_client_medicine = ''
    BEGIN
    SET @current_client_medicine = null
    END
	  IF @assistance = ''
    BEGIN
    SET @assistance = null
    END
	  IF @quantity = 0
    BEGIN
    SET @quantity = null
    END
	  IF @Under_six_months_old = ''
    BEGIN
    SET @Under_six_months_old = null
    END
	  IF @pregnant = ''
    BEGIN
    SET @pregnant = null
    END
	  IF @children = 0
    BEGIN
    SET @children = null
    END
	  IF @occupation = ''
    BEGIN
    SET @occupation = null
    END
	  IF @chronic_disease = ''
    BEGIN
    SET @chronic_disease = null
    END
	  IF @qualify = ''
    BEGIN
    SET @qualify = null
    END
	  IF @dose_date1 = '9/9/1900 12:00:00 AM'
    BEGIN
    SET @dose_date1 = null
    END
	  IF @dose_date2 = '9/9/1900 12:00:00 AM'
    BEGIN
    SET @dose_date2 = null
    END
	  IF @vaccine_admin = '9/9/1900 12:00:00 AM'
    BEGIN
    SET @vaccine_admin = null
    END
	  IF @guardian_f_name = ''
    BEGIN
    SET @guardian_f_name = null
    END
	  IF @guardian_l_name = ''
    BEGIN
    SET @guardian_l_name = null
    END
	  IF @guardian_mi = ''
    BEGIN
    SET @guardian_mi = null
    END
	  IF @guardian_phone = ''
    BEGIN
    SET @guardian_phone = null
    END
	  IF @adult_consent_date = '9/9/1900 12:00:00 AM'
    BEGIN
    SET @adult_consent_date = null
    END
	  IF @guard_consent_date = '9/9/1900 12:00:00 AM'
    BEGIN
    SET @guard_consent_date = null
    END
	  IF @dose_form1 = ''
    BEGIN
    SET @dose_form1 = null
    END
	  IF @dose_form2 = ''
    BEGIN
    SET @dose_form2 = null
    END
	Insert INTO [dbo].[encounter_client_vaccine]
           (
            [encounter_id]
           ,[vaccine_id]
           ,[current_client_medicine]
           ,[assistance]
           ,[quantity]
           ,[Under_six_months_old]
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
            )
     VALUES (
            @encounter_id
           ,@vaccine_id
           ,@current_client_medicine
           ,@assistance
           ,@quantity
           ,@Under_six_months_old
           ,@pregnant
           ,@children
           ,@occupation
           ,@chronic_disease
           ,@qualify
           ,@dose_date1
           ,@dose_date2
           ,@adult_consent
           ,@guardian_consent
           ,@vaccine_admin
           ,@guardian_f_name
           ,@guardian_l_name
           ,@guardian_mi
           ,@guardian_phone
           ,@adult_consent_date
           ,@guard_consent_date
           ,@dose_form1
           ,@dose_form2
            )
END
GO
/***********************************************************/
/*************************************************/
/****** - GET STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_GET_ENCOUNTER_CLIENT_VACCINE]    Script Date: 8/29/2014 2:04:58 PM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_GET_ENCOUNTER_CLIENT_VACCINE]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_GET_ENCOUNTER_CLIENT_VACCINE]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_GET_ENCOUNTER_CLIENT_VACCINE]
	  @vaccine_id as int,
	  @current_client_medicine as varchar(30),
	  @assistance as char(1),
	  @quantity as int,
	  @Under_six_months_old as char(1),
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
    SET @vaccine_id = null
    END
	  IF @current_client_medicine = ''
    BEGIN
    SET @current_client_medicine = null
    END
	  IF @assistance = ''
    BEGIN
    SET @assistance = null
    END
	  IF @quantity = 0
    BEGIN
    SET @quantity = null
    END
	  IF @Under_six_months_old = ''
    BEGIN
    SET @Under_six_months_old = null
    END
	  IF @pregnant = ''
    BEGIN
    SET @pregnant = null
    END
	  IF @children = 0
    BEGIN
    SET @children = null
    END
	  IF @occupation = ''
    BEGIN
    SET @occupation = null
    END
	  IF @chronic_disease = ''
    BEGIN
    SET @chronic_disease = null
    END
	  IF @qualify = ''
    BEGIN
    SET @qualify = null
    END
	  IF @dose_date1 = '9/9/1900 12:00:00 AM'
    BEGIN
    SET @dose_date1 = null
    END
	  IF @dose_date2 = '9/9/1900 12:00:00 AM'
    BEGIN
    SET @dose_date2 = null
    END
	  IF @vaccine_admin = '9/9/1900 12:00:00 AM'
    BEGIN
    SET @vaccine_admin = null
    END
	  IF @guardian_f_name = ''
    BEGIN
    SET @guardian_f_name = null
    END
	  IF @guardian_l_name = ''
    BEGIN
    SET @guardian_l_name = null
    END
	  IF @guardian_mi = ''
    BEGIN
    SET @guardian_mi = null
    END
	  IF @guardian_phone = ''
    BEGIN
    SET @guardian_phone = null
    END
	  IF @adult_consent_date = '9/9/1900 12:00:00 AM'
    BEGIN
    SET @adult_consent_date = null
    END
	  IF @guard_consent_date = '9/9/1900 12:00:00 AM'
    BEGIN
    SET @guard_consent_date = null
    END
	  IF @dose_form1 = ''
    BEGIN
    SET @dose_form1 = null
    END
	  IF @dose_form2 = ''
    BEGIN
    SET @dose_form2 = null
    END
    SELECT [encounter_id] 
      FROM [dbo].[encounter_client_vaccine] 
       WHERE ([vaccine_id] = @vaccine_id)
       AND ([current_client_medicine] like @current_client_medicine or [current_client_medicine] is null)
       AND ([assistance] = @assistance)
       AND ([quantity] = @quantity or [quantity] is null)
       AND ([Under_six_months_old] = @Under_six_months_old)
       AND ([pregnant] = @pregnant)
       AND ([children] = @children)
       AND ([occupation] like @occupation or [occupation] is null)
       AND ([chronic_disease] like @chronic_disease or [chronic_disease] is null)
       AND ([qualify] = @qualify)
       AND ([dose_date1] = @dose_date1)
       AND ([dose_date2] = @dose_date2 or [dose_date2] is null)
       AND ([vaccine_admin] = @vaccine_admin)
       AND ([guardian_f_name] like @guardian_f_name or [guardian_f_name] is null)
       AND ([guardian_l_name] like @guardian_l_name or [guardian_l_name] is null)
       AND ([guardian_mi] = @guardian_mi or [guardian_mi] is null)
       AND ([guardian_phone] like @guardian_phone or [guardian_phone] is null)
       AND ([adult_consent_date] = @adult_consent_date or [adult_consent_date] is null)
       AND ([guard_consent_date] = @guard_consent_date or [guard_consent_date] is null)
       AND ([dose_form1] = @dose_form1)
       AND ([dose_form2] = @dose_form2 or [dose_form2] is null)
END
GO
/***********************************************************/
/*************************************************/
/****** - UPDATE STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_UPDATE_ENCOUNTER_CLIENT_VACCINE]    Script Date: 8/29/2014 2:04:58 PM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_UPDATE_ENCOUNTER_CLIENT_VACCINE]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_UPDATE_ENCOUNTER_CLIENT_VACCINE]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_UPDATE_ENCOUNTER_CLIENT_VACCINE]
	  @encounter_id as int,
	  @vaccine_id as int,
	  @current_client_medicine as varchar(30),
	  @assistance as char(1),
	  @quantity as int,
	  @Under_six_months_old as char(1),
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
    SET @vaccine_id = null
    END
	  IF @current_client_medicine = ''
    BEGIN
    SET @current_client_medicine = null
    END
	  IF @assistance = ''
    BEGIN
    SET @assistance = null
    END
	  IF @quantity = 0
    BEGIN
    SET @quantity = null
    END
	  IF @Under_six_months_old = ''
    BEGIN
    SET @Under_six_months_old = null
    END
	  IF @pregnant = ''
    BEGIN
    SET @pregnant = null
    END
	  IF @children = 0
    BEGIN
    SET @children = null
    END
	  IF @occupation = ''
    BEGIN
    SET @occupation = null
    END
	  IF @chronic_disease = ''
    BEGIN
    SET @chronic_disease = null
    END
	  IF @qualify = ''
    BEGIN
    SET @qualify = null
    END
	  IF @dose_date1 = '9/9/1900 12:00:00 AM'
    BEGIN
    SET @dose_date1 = null
    END
	  IF @dose_date2 = '9/9/1900 12:00:00 AM'
    BEGIN
    SET @dose_date2 = null
    END
	  IF @vaccine_admin = '9/9/1900 12:00:00 AM'
    BEGIN
    SET @vaccine_admin = null
    END
	  IF @guardian_f_name = ''
    BEGIN
    SET @guardian_f_name = null
    END
	  IF @guardian_l_name = ''
    BEGIN
    SET @guardian_l_name = null
    END
	  IF @guardian_mi = ''
    BEGIN
    SET @guardian_mi = null
    END
	  IF @guardian_phone = ''
    BEGIN
    SET @guardian_phone = null
    END
	  IF @adult_consent_date = '9/9/1900 12:00:00 AM'
    BEGIN
    SET @adult_consent_date = null
    END
	  IF @guard_consent_date = '9/9/1900 12:00:00 AM'
    BEGIN
    SET @guard_consent_date = null
    END
	  IF @dose_form1 = ''
    BEGIN
    SET @dose_form1 = null
    END
	  IF @dose_form2 = ''
    BEGIN
    SET @dose_form2 = null
    END
	UPDATE [dbo].[encounter_client_vaccine]
       SET
		   [vaccine_id] = @vaccine_id,
		   [current_client_medicine] = @current_client_medicine,
		   [assistance] = @assistance,
		   [quantity] = @quantity,
		   [Under_six_months_old] = @Under_six_months_old,
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
END
GO
/***********************************************************/
/*************************************************/
/****** - DELETE STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_DELETE_ENCOUNTER_CLIENT_VACCINE]    Script Date: 8/29/2014 2:04:58 PM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_DELETE_ENCOUNTER_CLIENT_VACCINE]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_DELETE_ENCOUNTER_CLIENT_VACCINE]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_DELETE_ENCOUNTER_CLIENT_VACCINE]
	@encounter_id int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	Delete dbo.encounter_client_vaccine
	where encounter_id = @encounter_id
END
GO
/***********************************************************/
/*************************************************/
/****** - WHERE CLAUSE STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_SELECT_ENCOUNTER_CLIENT_VACCINE_WC]    Script Date: 8/29/2014 2:04:58 PM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_SELECT_ENCOUNTER_CLIENT_VACCINE_WC]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_SELECT_ENCOUNTER_CLIENT_VACCINE_WC]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_SELECT_ENCOUNTER_CLIENT_VACCINE_WC]
	  @wareclause as varchar(MAX)
AS
Begin
    Declare @string as varchar(MAX)
	Set @string = 'Select * from encounter_client_vaccine where ' + @wareclause
	Exec(@string)
END
GO

/***********************************************************/
/*************************************************/
/****** - SELECT STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_SELECT_DEBT]    Script Date: 8/29/2014 2:04:59 PM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_SELECT_DEBT]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_SELECT_DEBT]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_SELECT_DEBT]
           @debt_id as int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
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
 WHERE debt_id = @debt_id
End
GO
/***********************************************************/
/*************************************************/
/****** - INSERT STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_INSERT_DEBT]    Script Date: 8/29/2014 2:04:59 PM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_INSERT_DEBT]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_INSERT_DEBT]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_INSERT_DEBT]
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
	  IF @amt_paid = 0
    BEGIN
    SET @amt_paid = null
    END
	  IF @case_id = 0
    BEGIN
    SET @case_id = null
    END
	  IF @client_id = 0
    BEGIN
    SET @client_id = null
    END
	  IF @creditor_name = ''
    BEGIN
    SET @creditor_name = null
    END
	  IF @debt_amt = 0
    BEGIN
    SET @debt_amt = null
    END
	  IF @item_purchased = ''
    BEGIN
    SET @item_purchased = null
    END
	  IF @last_payment_date = '9/9/1900 12:00:00 AM'
    BEGIN
    SET @last_payment_date = null
    END
	  IF @purchase_date = '9/9/1900 12:00:00 AM'
    BEGIN
    SET @purchase_date = null
    END
	  IF @value_amt = 0
    BEGIN
    SET @value_amt = null
    END
	Insert INTO [dbo].[debt]
           (
            [amt_paid]
           ,[case_id]
           ,[client_id]
           ,[creditor_name]
           ,[debt_amt]
           ,[item_purchased]
           ,[last_payment_date]
           ,[purchase_date]
           ,[value_amt]
            )
     VALUES (
            @amt_paid
           ,@case_id
           ,@client_id
           ,@creditor_name
           ,@debt_amt
           ,@item_purchased
           ,@last_payment_date
           ,@purchase_date
           ,@value_amt
            )
END
GO
/***********************************************************/
/*************************************************/
/****** - GET STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_GET_DEBT]    Script Date: 8/29/2014 2:04:59 PM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_GET_DEBT]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_GET_DEBT]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_GET_DEBT]
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
	  IF @amt_paid = 0
    BEGIN
    SET @amt_paid = null
    END
	  IF @case_id = 0
    BEGIN
    SET @case_id = null
    END
	  IF @client_id = 0
    BEGIN
    SET @client_id = null
    END
	  IF @creditor_name = ''
    BEGIN
    SET @creditor_name = null
    END
	  IF @debt_amt = 0
    BEGIN
    SET @debt_amt = null
    END
	  IF @item_purchased = ''
    BEGIN
    SET @item_purchased = null
    END
	  IF @last_payment_date = '9/9/1900 12:00:00 AM'
    BEGIN
    SET @last_payment_date = null
    END
	  IF @purchase_date = '9/9/1900 12:00:00 AM'
    BEGIN
    SET @purchase_date = null
    END
	  IF @value_amt = 0
    BEGIN
    SET @value_amt = null
    END
    SELECT [debt_id] 
      FROM [dbo].[debt] 
       WHERE ([amt_paid] = @amt_paid)
       AND ([case_id] = @case_id)
       AND ([client_id] = @client_id)
       AND ([creditor_name] like @creditor_name)
       AND ([debt_amt] = @debt_amt)
       AND ([item_purchased] like @item_purchased)
       AND ([last_payment_date] = @last_payment_date)
       AND ([purchase_date] = @purchase_date)
       AND ([value_amt] = @value_amt)
END
GO
/***********************************************************/
/*************************************************/
/****** - UPDATE STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_UPDATE_DEBT]    Script Date: 8/29/2014 2:04:59 PM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_UPDATE_DEBT]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_UPDATE_DEBT]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_UPDATE_DEBT]
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
	  IF @amt_paid = 0
    BEGIN
    SET @amt_paid = null
    END
	  IF @case_id = 0
    BEGIN
    SET @case_id = null
    END
	  IF @client_id = 0
    BEGIN
    SET @client_id = null
    END
	  IF @creditor_name = ''
    BEGIN
    SET @creditor_name = null
    END
	  IF @debt_amt = 0
    BEGIN
    SET @debt_amt = null
    END
	  IF @item_purchased = ''
    BEGIN
    SET @item_purchased = null
    END
	  IF @last_payment_date = '9/9/1900 12:00:00 AM'
    BEGIN
    SET @last_payment_date = null
    END
	  IF @purchase_date = '9/9/1900 12:00:00 AM'
    BEGIN
    SET @purchase_date = null
    END
	  IF @value_amt = 0
    BEGIN
    SET @value_amt = null
    END
	UPDATE [dbo].[debt]
       SET
		   [amt_paid] = @amt_paid,
		   [case_id] = @case_id,
		   [client_id] = @client_id,
		   [creditor_name] = @creditor_name,
		   [debt_amt] = @debt_amt,
		   [item_purchased] = @item_purchased,
		   [last_payment_date] = @last_payment_date,
		   [purchase_date] = @purchase_date,
		   [value_amt] = @value_amt
       WHERE debt_id = @debt_id
END
GO
/***********************************************************/
/*************************************************/
/****** - DELETE STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_DELETE_DEBT]    Script Date: 8/29/2014 2:04:59 PM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_DELETE_DEBT]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_DELETE_DEBT]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_DELETE_DEBT]
	@debt_id int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	Delete dbo.debt
	where debt_id = @debt_id
END
GO
/***********************************************************/
/*************************************************/
/****** - WHERE CLAUSE STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_SELECT_DEBT_WC]    Script Date: 8/29/2014 2:04:59 PM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_SELECT_DEBT_WC]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_SELECT_DEBT_WC]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_SELECT_DEBT_WC]
	  @wareclause as varchar(MAX)
AS
Begin
    Declare @string as varchar(MAX)
	Set @string = 'Select * from debt where ' + @wareclause
	Exec(@string)
END
GO

/***********************************************************/
/*************************************************/
/****** - SELECT STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_SELECT_FEMA]    Script Date: 8/29/2014 2:05:01 PM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_SELECT_FEMA]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_SELECT_FEMA]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_SELECT_FEMA]
           @FEMA_ID as int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
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
End
GO
/***********************************************************/
/*************************************************/
/****** - INSERT STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_INSERT_FEMA]    Script Date: 8/29/2014 2:05:01 PM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_INSERT_FEMA]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_INSERT_FEMA]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_INSERT_FEMA]
	  @Cost_Code as int,
	  @Equipment as varchar(50),
	  @Specification as varchar(50),
	  @Capacity_Size as varchar(50),
	  @HP as varchar(50),
	  @Notes as varchar(100),
	  @Unit as varchar(50),
	  @Rate as varchar(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	  IF @Cost_Code = 0
    BEGIN
    SET @Cost_Code = null
    END
	  IF @Equipment = ''
    BEGIN
    SET @Equipment = null
    END
	  IF @Specification = ''
    BEGIN
    SET @Specification = null
    END
	  IF @Capacity_Size = ''
    BEGIN
    SET @Capacity_Size = null
    END
	  IF @HP = ''
    BEGIN
    SET @HP = null
    END
	  IF @Notes = ''
    BEGIN
    SET @Notes = null
    END
	  IF @Unit = ''
    BEGIN
    SET @Unit = null
    END
	  IF @Rate = ''
    BEGIN
    SET @Rate = null
    END
	Insert INTO [dbo].[FEMA]
           (
            [Cost_Code]
           ,[Equipment]
           ,[Specification]
           ,[Capacity_Size]
           ,[HP]
           ,[Notes]
           ,[Unit]
           ,[Rate]
            )
     VALUES (
            @Cost_Code
           ,@Equipment
           ,@Specification
           ,@Capacity_Size
           ,@HP
           ,@Notes
           ,@Unit
           ,@Rate
            )
END
GO
/***********************************************************/
/*************************************************/
/****** - GET STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_GET_FEMA]    Script Date: 8/29/2014 2:05:01 PM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_GET_FEMA]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_GET_FEMA]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_GET_FEMA]
	  @Cost_Code as int,
	  @Equipment as varchar(50),
	  @Specification as varchar(50),
	  @Capacity_Size as varchar(50),
	  @HP as varchar(50),
	  @Notes as varchar(100),
	  @Unit as varchar(50),
	  @Rate as varchar(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	  IF @Cost_Code = 0
    BEGIN
    SET @Cost_Code = null
    END
	  IF @Equipment = ''
    BEGIN
    SET @Equipment = null
    END
	  IF @Specification = ''
    BEGIN
    SET @Specification = null
    END
	  IF @Capacity_Size = ''
    BEGIN
    SET @Capacity_Size = null
    END
	  IF @HP = ''
    BEGIN
    SET @HP = null
    END
	  IF @Notes = ''
    BEGIN
    SET @Notes = null
    END
	  IF @Unit = ''
    BEGIN
    SET @Unit = null
    END
	  IF @Rate = ''
    BEGIN
    SET @Rate = null
    END
    SELECT [FEMA_ID] 
      FROM [dbo].[FEMA] 
       WHERE ([Cost_Code] = @Cost_Code)
       AND ([Equipment] like @Equipment)
       AND ([Specification] like @Specification)
       AND ([Capacity_Size] like @Capacity_Size)
       AND ([HP] like @HP)
       AND ([Notes] like @Notes)
       AND ([Unit] like @Unit)
       AND ([Rate] like @Rate)
END
GO
/***********************************************************/
/*************************************************/
/****** - UPDATE STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_UPDATE_FEMA]    Script Date: 8/29/2014 2:05:01 PM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_UPDATE_FEMA]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_UPDATE_FEMA]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_UPDATE_FEMA]
	  @FEMA_ID as int,
	  @Cost_Code as int,
	  @Equipment as varchar(50),
	  @Specification as varchar(50),
	  @Capacity_Size as varchar(50),
	  @HP as varchar(50),
	  @Notes as varchar(100),
	  @Unit as varchar(50),
	  @Rate as varchar(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	  IF @Cost_Code = 0
    BEGIN
    SET @Cost_Code = null
    END
	  IF @Equipment = ''
    BEGIN
    SET @Equipment = null
    END
	  IF @Specification = ''
    BEGIN
    SET @Specification = null
    END
	  IF @Capacity_Size = ''
    BEGIN
    SET @Capacity_Size = null
    END
	  IF @HP = ''
    BEGIN
    SET @HP = null
    END
	  IF @Notes = ''
    BEGIN
    SET @Notes = null
    END
	  IF @Unit = ''
    BEGIN
    SET @Unit = null
    END
	  IF @Rate = ''
    BEGIN
    SET @Rate = null
    END
	UPDATE [dbo].[FEMA]
       SET
		   [Cost_Code] = @Cost_Code,
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
/***********************************************************/
/*************************************************/
/****** - DELETE STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_DELETE_FEMA]    Script Date: 8/29/2014 2:05:01 PM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_DELETE_FEMA]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_DELETE_FEMA]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_DELETE_FEMA]
	@FEMA_ID int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	Delete dbo.FEMA
	where FEMA_ID = @FEMA_ID
END
GO
/***********************************************************/
/*************************************************/
/****** - WHERE CLAUSE STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_SELECT_FEMA_WC]    Script Date: 8/29/2014 2:05:01 PM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_SELECT_FEMA_WC]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_SELECT_FEMA_WC]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_SELECT_FEMA_WC]
	  @wareclause as varchar(MAX)
AS
Begin
    Declare @string as varchar(MAX)
	Set @string = 'Select * from FEMA where ' + @wareclause
	Exec(@string)
END
GO

/***********************************************************/
/*************************************************/
/****** - SELECT STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_SELECT_DISASTER_ENCOUNTER]    Script Date: 8/29/2014 2:05:03 PM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_SELECT_DISASTER_ENCOUNTER]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_SELECT_DISASTER_ENCOUNTER]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_SELECT_DISASTER_ENCOUNTER]
           @disaster_encounter_id as int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
SELECT [disaster_encounter_id]
      ,[disaster_id]
      ,[encounter_id]
      ,[location_id]
  FROM [dbo].[disaster_encounter]
 WHERE disaster_encounter_id = @disaster_encounter_id
End
GO
/***********************************************************/
/*************************************************/
/****** - INSERT STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_INSERT_DISASTER_ENCOUNTER]    Script Date: 8/29/2014 2:05:03 PM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_INSERT_DISASTER_ENCOUNTER]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_INSERT_DISASTER_ENCOUNTER]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_INSERT_DISASTER_ENCOUNTER]
	  @disaster_id as int,
	  @encounter_id as int,
	  @location_id as int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	  IF @disaster_id = 0
    BEGIN
    SET @disaster_id = null
    END
	  IF @encounter_id = 0
    BEGIN
    SET @encounter_id = null
    END
	  IF @location_id = 0
    BEGIN
    SET @location_id = null
    END
	Insert INTO [dbo].[disaster_encounter]
           (
            [disaster_id]
           ,[encounter_id]
           ,[location_id]
            )
     VALUES (
            @disaster_id
           ,@encounter_id
           ,@location_id
            )
END
GO
/***********************************************************/
/*************************************************/
/****** - GET STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_GET_DISASTER_ENCOUNTER]    Script Date: 8/29/2014 2:05:03 PM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_GET_DISASTER_ENCOUNTER]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_GET_DISASTER_ENCOUNTER]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_GET_DISASTER_ENCOUNTER]
	  @disaster_id as int,
	  @encounter_id as int,
	  @location_id as int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	  IF @disaster_id = 0
    BEGIN
    SET @disaster_id = null
    END
	  IF @encounter_id = 0
    BEGIN
    SET @encounter_id = null
    END
	  IF @location_id = 0
    BEGIN
    SET @location_id = null
    END
    SELECT [disaster_encounter_id] 
      FROM [dbo].[disaster_encounter] 
       WHERE ([disaster_id] = @disaster_id)
       AND ([encounter_id] = @encounter_id)
       AND ([location_id] = @location_id)
END
GO
/***********************************************************/
/*************************************************/
/****** - UPDATE STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_UPDATE_DISASTER_ENCOUNTER]    Script Date: 8/29/2014 2:05:03 PM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_UPDATE_DISASTER_ENCOUNTER]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_UPDATE_DISASTER_ENCOUNTER]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_UPDATE_DISASTER_ENCOUNTER]
	  @disaster_encounter_id as int,
	  @disaster_id as int,
	  @encounter_id as int,
	  @location_id as int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	  IF @disaster_id = 0
    BEGIN
    SET @disaster_id = null
    END
	  IF @encounter_id = 0
    BEGIN
    SET @encounter_id = null
    END
	  IF @location_id = 0
    BEGIN
    SET @location_id = null
    END
	UPDATE [dbo].[disaster_encounter]
       SET
		   [disaster_id] = @disaster_id,
		   [encounter_id] = @encounter_id,
		   [location_id] = @location_id
       WHERE disaster_encounter_id = @disaster_encounter_id
END
GO
/***********************************************************/
/*************************************************/
/****** - DELETE STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_DELETE_DISASTER_ENCOUNTER]    Script Date: 8/29/2014 2:05:03 PM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_DELETE_DISASTER_ENCOUNTER]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_DELETE_DISASTER_ENCOUNTER]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_DELETE_DISASTER_ENCOUNTER]
	@disaster_encounter_id int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	Delete dbo.disaster_encounter
	where disaster_encounter_id = @disaster_encounter_id
END
GO
/***********************************************************/
/*************************************************/
/****** - WHERE CLAUSE STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_SELECT_DISASTER_ENCOUNTER_WC]    Script Date: 8/29/2014 2:05:03 PM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_SELECT_DISASTER_ENCOUNTER_WC]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_SELECT_DISASTER_ENCOUNTER_WC]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_SELECT_DISASTER_ENCOUNTER_WC]
	  @wareclause as varchar(MAX)
AS
Begin
    Declare @string as varchar(MAX)
	Set @string = 'Select * from disaster_encounter where ' + @wareclause
	Exec(@string)
END
GO

/***********************************************************/
/*************************************************/
/****** - SELECT STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_SELECT_ENCOUNTER]    Script Date: 8/29/2014 2:05:04 PM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_SELECT_ENCOUNTER]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_SELECT_ENCOUNTER]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_SELECT_ENCOUNTER]
           @encounter_id as int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
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
  FROM [dbo].[encounter]
 WHERE encounter_id = @encounter_id
End
GO
/***********************************************************/
/*************************************************/
/****** - INSERT STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_INSERT_ENCOUNTER]    Script Date: 8/29/2014 2:05:04 PM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_INSERT_ENCOUNTER]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_INSERT_ENCOUNTER]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_INSERT_ENCOUNTER]
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
	  IF @case_id = 0
    BEGIN
    SET @case_id = null
    END
	  IF @agency_id = 0
    BEGIN
    SET @agency_id = null
    END
	  IF @call_center_id = 0
    BEGIN
    SET @call_center_id = null
    END
	  IF @client_id = 0
    BEGIN
    SET @client_id = null
    END
	  IF @create_date = '9/9/1900 12:00:00 AM'
    BEGIN
    SET @create_date = null
    END
	  IF @close_date = '9/9/1900 12:00:00 AM'
    BEGIN
    SET @close_date = null
    END
	  IF @disaster_id = 0
    BEGIN
    SET @disaster_id = null
    END
	  IF @Location_ID = 0
    BEGIN
    SET @Location_ID = null
    END
	  IF @Pet_Record_ID = 0
    BEGIN
    SET @Pet_Record_ID = null
    END
	Insert INTO [dbo].[encounter]
           (
            [case_id]
           ,[agency_id]
           ,[call_center_id]
           ,[client_id]
           ,[create_date]
           ,[close_date]
           ,[disaster_id]
           ,[Location_ID]
           ,[Pet_Record_ID]
            )
     VALUES (
            @case_id
           ,@agency_id
           ,@call_center_id
           ,@client_id
           ,@create_date
           ,@close_date
           ,@disaster_id
           ,@Location_ID
           ,@Pet_Record_ID
            )
END
GO
/***********************************************************/
/*************************************************/
/****** - GET STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_GET_ENCOUNTER]    Script Date: 8/29/2014 2:05:04 PM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_GET_ENCOUNTER]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_GET_ENCOUNTER]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_GET_ENCOUNTER]
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
	  IF @case_id = 0
    BEGIN
    SET @case_id = null
    END
	  IF @agency_id = 0
    BEGIN
    SET @agency_id = null
    END
	  IF @call_center_id = 0
    BEGIN
    SET @call_center_id = null
    END
	  IF @client_id = 0
    BEGIN
    SET @client_id = null
    END
	  IF @create_date = '9/9/1900 12:00:00 AM'
    BEGIN
    SET @create_date = null
    END
	  IF @close_date = '9/9/1900 12:00:00 AM'
    BEGIN
    SET @close_date = null
    END
	  IF @disaster_id = 0
    BEGIN
    SET @disaster_id = null
    END
	  IF @Location_ID = 0
    BEGIN
    SET @Location_ID = null
    END
	  IF @Pet_Record_ID = 0
    BEGIN
    SET @Pet_Record_ID = null
    END
    SELECT [encounter_id] 
      FROM [dbo].[encounter] 
       WHERE ([case_id] = @case_id or [case_id] is null)
       AND ([agency_id] = @agency_id or [agency_id] is null)
       AND ([call_center_id] = @call_center_id or [call_center_id] is null)
       AND ([client_id] = @client_id or [client_id] is null)
       AND ([create_date] = @create_date)
       AND ([close_date] = @close_date or [close_date] is null)
       AND ([disaster_id] = @disaster_id)
       AND ([Location_ID] = @Location_ID or [Location_ID] is null)
       AND ([Pet_Record_ID] = @Pet_Record_ID or [Pet_Record_ID] is null)
END
GO
/***********************************************************/
/*************************************************/
/****** - UPDATE STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_UPDATE_ENCOUNTER]    Script Date: 8/29/2014 2:05:04 PM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_UPDATE_ENCOUNTER]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_UPDATE_ENCOUNTER]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_UPDATE_ENCOUNTER]
	  @encounter_id as int,
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
	  IF @case_id = 0
    BEGIN
    SET @case_id = null
    END
	  IF @agency_id = 0
    BEGIN
    SET @agency_id = null
    END
	  IF @call_center_id = 0
    BEGIN
    SET @call_center_id = null
    END
	  IF @client_id = 0
    BEGIN
    SET @client_id = null
    END
	  IF @create_date = '9/9/1900 12:00:00 AM'
    BEGIN
    SET @create_date = null
    END
	  IF @close_date = '9/9/1900 12:00:00 AM'
    BEGIN
    SET @close_date = null
    END
	  IF @disaster_id = 0
    BEGIN
    SET @disaster_id = null
    END
	  IF @Location_ID = 0
    BEGIN
    SET @Location_ID = null
    END
	  IF @Pet_Record_ID = 0
    BEGIN
    SET @Pet_Record_ID = null
    END
	UPDATE [dbo].[encounter]
       SET
		   [case_id] = @case_id,
		   [agency_id] = @agency_id,
		   [call_center_id] = @call_center_id,
		   [client_id] = @client_id,
		   [create_date] = @create_date,
		   [close_date] = @close_date,
		   [disaster_id] = @disaster_id,
		   [Location_ID] = @Location_ID,
		   [Pet_Record_ID] = @Pet_Record_ID
       WHERE encounter_id = @encounter_id
END
GO
/***********************************************************/
/*************************************************/
/****** - DELETE STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_DELETE_ENCOUNTER]    Script Date: 8/29/2014 2:05:04 PM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_DELETE_ENCOUNTER]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_DELETE_ENCOUNTER]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_DELETE_ENCOUNTER]
	@encounter_id int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	Delete dbo.encounter
	where encounter_id = @encounter_id
END
GO
/***********************************************************/
/*************************************************/
/****** - WHERE CLAUSE STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_SELECT_ENCOUNTER_WC]    Script Date: 8/29/2014 2:05:04 PM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_SELECT_ENCOUNTER_WC]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_SELECT_ENCOUNTER_WC]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_SELECT_ENCOUNTER_WC]
	  @wareclause as varchar(MAX)
AS
Begin
    Declare @string as varchar(MAX)
	Set @string = 'Select * from encounter where ' + @wareclause
	Exec(@string)
END
GO

/***********************************************************/
/*************************************************/
/****** - SELECT STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_SELECT_HOUSE]    Script Date: 8/29/2014 2:05:06 PM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_SELECT_HOUSE]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_SELECT_HOUSE]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_SELECT_HOUSE]
           @house_id as int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
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
/***********************************************************/
/*************************************************/
/****** - INSERT STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_INSERT_HOUSE]    Script Date: 8/29/2014 2:05:06 PM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_INSERT_HOUSE]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_INSERT_HOUSE]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_INSERT_HOUSE]
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
	  IF @house_name = ''
    BEGIN
    SET @house_name = null
    END
	  IF @house_eligibility = ''
    BEGIN
    SET @house_eligibility = null
    END
	  IF @house_request_date = '9/9/1900 12:00:00 AM'
    BEGIN
    SET @house_request_date = null
    END
	  IF @house_voucher_amt = 0
    BEGIN
    SET @house_voucher_amt = null
    END
	  IF @house_voucher_begin_date = '9/9/1900 12:00:00 AM'
    BEGIN
    SET @house_voucher_begin_date = null
    END
	  IF @house_voucher_exp_date = '9/9/1900 12:00:00 AM'
    BEGIN
    SET @house_voucher_exp_date = null
    END
	  IF @house_voucher_num = 0
    BEGIN
    SET @house_voucher_num = null
    END
	  IF @house_voucher_schedule = ''
    BEGIN
    SET @house_voucher_schedule = null
    END
	  IF @house_wait_list = 0
    BEGIN
    SET @house_wait_list = null
    END
	Insert INTO [dbo].[house]
           (
            [house_name]
           ,[house_eligibility]
           ,[house_request_date]
           ,[house_voucher_amt]
           ,[house_voucher_begin_date]
           ,[house_voucher_exp_date]
           ,[house_voucher_num]
           ,[house_voucher_schedule]
           ,[house_wait_list]
            )
     VALUES (
            @house_name
           ,@house_eligibility
           ,@house_request_date
           ,@house_voucher_amt
           ,@house_voucher_begin_date
           ,@house_voucher_exp_date
           ,@house_voucher_num
           ,@house_voucher_schedule
           ,@house_wait_list
            )
END
GO
/***********************************************************/
/*************************************************/
/****** - GET STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_GET_HOUSE]    Script Date: 8/29/2014 2:05:06 PM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_GET_HOUSE]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_GET_HOUSE]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_GET_HOUSE]
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
	  IF @house_name = ''
    BEGIN
    SET @house_name = null
    END
	  IF @house_eligibility = ''
    BEGIN
    SET @house_eligibility = null
    END
	  IF @house_request_date = '9/9/1900 12:00:00 AM'
    BEGIN
    SET @house_request_date = null
    END
	  IF @house_voucher_amt = 0
    BEGIN
    SET @house_voucher_amt = null
    END
	  IF @house_voucher_begin_date = '9/9/1900 12:00:00 AM'
    BEGIN
    SET @house_voucher_begin_date = null
    END
	  IF @house_voucher_exp_date = '9/9/1900 12:00:00 AM'
    BEGIN
    SET @house_voucher_exp_date = null
    END
	  IF @house_voucher_num = 0
    BEGIN
    SET @house_voucher_num = null
    END
	  IF @house_voucher_schedule = ''
    BEGIN
    SET @house_voucher_schedule = null
    END
	  IF @house_wait_list = 0
    BEGIN
    SET @house_wait_list = null
    END
    SELECT [house_id] 
      FROM [dbo].[house] 
       WHERE ([house_name] like @house_name)
       AND ([house_eligibility] like @house_eligibility or [house_eligibility] is null)
       AND ([house_request_date] = @house_request_date)
       AND ([house_voucher_amt] = @house_voucher_amt)
       AND ([house_voucher_begin_date] = @house_voucher_begin_date)
       AND ([house_voucher_exp_date] = @house_voucher_exp_date)
       AND ([house_voucher_num] = @house_voucher_num)
       AND ([house_voucher_schedule] like @house_voucher_schedule)
       AND ([house_wait_list] = @house_wait_list)
END
GO
/***********************************************************/
/*************************************************/
/****** - UPDATE STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_UPDATE_HOUSE]    Script Date: 8/29/2014 2:05:06 PM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_UPDATE_HOUSE]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_UPDATE_HOUSE]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_UPDATE_HOUSE]
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
	  IF @house_name = ''
    BEGIN
    SET @house_name = null
    END
	  IF @house_eligibility = ''
    BEGIN
    SET @house_eligibility = null
    END
	  IF @house_request_date = '9/9/1900 12:00:00 AM'
    BEGIN
    SET @house_request_date = null
    END
	  IF @house_voucher_amt = 0
    BEGIN
    SET @house_voucher_amt = null
    END
	  IF @house_voucher_begin_date = '9/9/1900 12:00:00 AM'
    BEGIN
    SET @house_voucher_begin_date = null
    END
	  IF @house_voucher_exp_date = '9/9/1900 12:00:00 AM'
    BEGIN
    SET @house_voucher_exp_date = null
    END
	  IF @house_voucher_num = 0
    BEGIN
    SET @house_voucher_num = null
    END
	  IF @house_voucher_schedule = ''
    BEGIN
    SET @house_voucher_schedule = null
    END
	  IF @house_wait_list = 0
    BEGIN
    SET @house_wait_list = null
    END
	UPDATE [dbo].[house]
       SET
		   [house_name] = @house_name,
		   [house_eligibility] = @house_eligibility,
		   [house_request_date] = @house_request_date,
		   [house_voucher_amt] = @house_voucher_amt,
		   [house_voucher_begin_date] = @house_voucher_begin_date,
		   [house_voucher_exp_date] = @house_voucher_exp_date,
		   [house_voucher_num] = @house_voucher_num,
		   [house_voucher_schedule] = @house_voucher_schedule,
		   [house_wait_list] = @house_wait_list
       WHERE house_id = @house_id
END
GO
/***********************************************************/
/*************************************************/
/****** - DELETE STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_DELETE_HOUSE]    Script Date: 8/29/2014 2:05:06 PM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_DELETE_HOUSE]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_DELETE_HOUSE]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_DELETE_HOUSE]
	@house_id int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	Delete dbo.house
	where house_id = @house_id
END
GO
/***********************************************************/
/*************************************************/
/****** - WHERE CLAUSE STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_SELECT_HOUSE_WC]    Script Date: 8/29/2014 2:05:06 PM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_SELECT_HOUSE_WC]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_SELECT_HOUSE_WC]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_SELECT_HOUSE_WC]
	  @wareclause as varchar(MAX)
AS
Begin
    Declare @string as varchar(MAX)
	Set @string = 'Select * from house where ' + @wareclause
	Exec(@string)
END
GO

/***********************************************************/
/*************************************************/
/****** - SELECT STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_SELECT_CLIENTWPETS]    Script Date: 8/29/2014 2:05:07 PM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_SELECT_CLIENTWPETS]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_SELECT_CLIENTWPETS]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_SELECT_CLIENTWPETS]
           @CLIENTWPETS_ID as int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
SELECT [CLIENTWPETS_ID]
      ,[Pet_Record_ID]
      ,[Client_id]
      ,[Location_ID]
      ,[cp_Date]
      ,[ownership]
  FROM [dbo].[ClientWPets]
 WHERE CLIENTWPETS_ID = @CLIENTWPETS_ID
End
GO
/***********************************************************/
/*************************************************/
/****** - INSERT STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_INSERT_CLIENTWPETS]    Script Date: 8/29/2014 2:05:07 PM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_INSERT_CLIENTWPETS]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_INSERT_CLIENTWPETS]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_INSERT_CLIENTWPETS]
	  @Pet_Record_ID as int,
	  @Client_id as int,
	  @Location_ID as int,
	  @cp_Date as datetime,
	  @ownership as char(1)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	  IF @Pet_Record_ID = 0
    BEGIN
    SET @Pet_Record_ID = null
    END
	  IF @Client_id = 0
    BEGIN
    SET @Client_id = null
    END
	  IF @Location_ID = 0
    BEGIN
    SET @Location_ID = null
    END
	  IF @cp_Date = '9/9/1900 12:00:00 AM'
    BEGIN
    SET @cp_Date = null
    END
	  IF @ownership = ''
    BEGIN
    SET @ownership = null
    END
	Insert INTO [dbo].[ClientWPets]
           (
            [Pet_Record_ID]
           ,[Client_id]
           ,[Location_ID]
           ,[cp_Date]
           ,[ownership]
            )
     VALUES (
            @Pet_Record_ID
           ,@Client_id
           ,@Location_ID
           ,@cp_Date
           ,@ownership
            )
END
GO
/***********************************************************/
/*************************************************/
/****** - GET STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_GET_CLIENTWPETS]    Script Date: 8/29/2014 2:05:07 PM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_GET_CLIENTWPETS]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_GET_CLIENTWPETS]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_GET_CLIENTWPETS]
	  @Pet_Record_ID as int,
	  @Client_id as int,
	  @Location_ID as int,
	  @cp_Date as datetime,
	  @ownership as char(1)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	  IF @Pet_Record_ID = 0
    BEGIN
    SET @Pet_Record_ID = null
    END
	  IF @Client_id = 0
    BEGIN
    SET @Client_id = null
    END
	  IF @Location_ID = 0
    BEGIN
    SET @Location_ID = null
    END
	  IF @cp_Date = '9/9/1900 12:00:00 AM'
    BEGIN
    SET @cp_Date = null
    END
	  IF @ownership = ''
    BEGIN
    SET @ownership = null
    END
    SELECT [CLIENTWPETS_ID] 
      FROM [dbo].[ClientWPets] 
       WHERE ([Pet_Record_ID] = @Pet_Record_ID)
       AND ([Client_id] = @Client_id or [Client_id] is null)
       AND ([Location_ID] = @Location_ID)
       AND ([cp_Date] = @cp_Date)
       AND ([ownership] = @ownership or [ownership] is null)
END
GO
/***********************************************************/
/*************************************************/
/****** - UPDATE STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_UPDATE_CLIENTWPETS]    Script Date: 8/29/2014 2:05:07 PM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_UPDATE_CLIENTWPETS]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_UPDATE_CLIENTWPETS]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_UPDATE_CLIENTWPETS]
	  @CLIENTWPETS_ID as int,
	  @Pet_Record_ID as int,
	  @Client_id as int,
	  @Location_ID as int,
	  @cp_Date as datetime,
	  @ownership as char(1)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	  IF @Pet_Record_ID = 0
    BEGIN
    SET @Pet_Record_ID = null
    END
	  IF @Client_id = 0
    BEGIN
    SET @Client_id = null
    END
	  IF @Location_ID = 0
    BEGIN
    SET @Location_ID = null
    END
	  IF @cp_Date = '9/9/1900 12:00:00 AM'
    BEGIN
    SET @cp_Date = null
    END
	  IF @ownership = ''
    BEGIN
    SET @ownership = null
    END
	UPDATE [dbo].[ClientWPets]
       SET
		   [Pet_Record_ID] = @Pet_Record_ID,
		   [Client_id] = @Client_id,
		   [Location_ID] = @Location_ID,
		   [cp_Date] = @cp_Date,
		   [ownership] = @ownership
       WHERE CLIENTWPETS_ID = @CLIENTWPETS_ID
END
GO
/***********************************************************/
/*************************************************/
/****** - DELETE STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_DELETE_CLIENTWPETS]    Script Date: 8/29/2014 2:05:07 PM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_DELETE_CLIENTWPETS]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_DELETE_CLIENTWPETS]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_DELETE_CLIENTWPETS]
	@CLIENTWPETS_ID int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	Delete dbo.ClientWPets
	where CLIENTWPETS_ID = @CLIENTWPETS_ID
END
GO
/***********************************************************/
/*************************************************/
/****** - WHERE CLAUSE STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_SELECT_CLIENTWPETS_WC]    Script Date: 8/29/2014 2:05:07 PM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_SELECT_CLIENTWPETS_WC]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_SELECT_CLIENTWPETS_WC]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_SELECT_CLIENTWPETS_WC]
	  @wareclause as varchar(MAX)
AS
Begin
    Declare @string as varchar(MAX)
	Set @string = 'Select * from ClientWPets where ' + @wareclause
	Exec(@string)
END
GO

/***********************************************************/
/*************************************************/
/****** - SELECT STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_SELECT_HOUSE_CHOICE]    Script Date: 8/29/2014 2:05:09 PM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_SELECT_HOUSE_CHOICE]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_SELECT_HOUSE_CHOICE]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_SELECT_HOUSE_CHOICE]
           @house_choice_id as int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
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
/***********************************************************/
/*************************************************/
/****** - INSERT STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_INSERT_HOUSE_CHOICE]    Script Date: 8/29/2014 2:05:09 PM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_INSERT_HOUSE_CHOICE]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_INSERT_HOUSE_CHOICE]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_INSERT_HOUSE_CHOICE]
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
    SET @house_id = null
    END
	  IF @address_id = 0
    BEGIN
    SET @address_id = null
    END
	  IF @house_choice_bathrooms = 0
    BEGIN
    SET @house_choice_bathrooms = null
    END
	  IF @house_choice_comments = ''
    BEGIN
    SET @house_choice_comments = null
    END
	  IF @house_choice_contact_person_id = 0
    BEGIN
    SET @house_choice_contact_person_id = null
    END
	  IF @house_choice_laundry = ''
    BEGIN
    SET @house_choice_laundry = null
    END
	  IF @house_choice_no_floors = 0
    BEGIN
    SET @house_choice_no_floors = null
    END
	  IF @house_choice_parking = ''
    BEGIN
    SET @house_choice_parking = null
    END
	  IF @house_choice_rent = 0
    BEGIN
    SET @house_choice_rent = null
    END
	  IF @house_choice_type = ''
    BEGIN
    SET @house_choice_type = null
    END
	  IF @house_choice_units_avail = 0
    BEGIN
    SET @house_choice_units_avail = null
    END
	Insert INTO [dbo].[house_choice]
           (
            [house_id]
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
            )
     VALUES (
            @house_id
           ,@address_id
           ,@house_choice_bathrooms
           ,@house_choice_comments
           ,@house_choice_contact_person_id
           ,@house_choice_laundry
           ,@house_choice_no_floors
           ,@house_choice_parking
           ,@house_choice_rent
           ,@house_choice_type
           ,@house_choice_units_avail
            )
END
GO
/***********************************************************/
/*************************************************/
/****** - GET STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_GET_HOUSE_CHOICE]    Script Date: 8/29/2014 2:05:09 PM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_GET_HOUSE_CHOICE]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_GET_HOUSE_CHOICE]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_GET_HOUSE_CHOICE]
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
    SET @house_id = null
    END
	  IF @address_id = 0
    BEGIN
    SET @address_id = null
    END
	  IF @house_choice_bathrooms = 0
    BEGIN
    SET @house_choice_bathrooms = null
    END
	  IF @house_choice_comments = ''
    BEGIN
    SET @house_choice_comments = null
    END
	  IF @house_choice_contact_person_id = 0
    BEGIN
    SET @house_choice_contact_person_id = null
    END
	  IF @house_choice_laundry = ''
    BEGIN
    SET @house_choice_laundry = null
    END
	  IF @house_choice_no_floors = 0
    BEGIN
    SET @house_choice_no_floors = null
    END
	  IF @house_choice_parking = ''
    BEGIN
    SET @house_choice_parking = null
    END
	  IF @house_choice_rent = 0
    BEGIN
    SET @house_choice_rent = null
    END
	  IF @house_choice_type = ''
    BEGIN
    SET @house_choice_type = null
    END
	  IF @house_choice_units_avail = 0
    BEGIN
    SET @house_choice_units_avail = null
    END
    SELECT [house_choice_id] 
      FROM [dbo].[house_choice] 
       WHERE ([house_id] = @house_id)
       AND ([address_id] = @address_id)
       AND ([house_choice_bathrooms] = @house_choice_bathrooms)
       AND ([house_choice_comments] like @house_choice_comments or [house_choice_comments] is null)
       AND ([house_choice_contact_person_id] = @house_choice_contact_person_id or [house_choice_contact_person_id] is null)
       AND ([house_choice_laundry] like @house_choice_laundry)
       AND ([house_choice_no_floors] = @house_choice_no_floors)
       AND ([house_choice_parking] like @house_choice_parking)
       AND ([house_choice_rent] = @house_choice_rent)
       AND ([house_choice_type] like @house_choice_type)
       AND ([house_choice_units_avail] = @house_choice_units_avail)
END
GO
/***********************************************************/
/*************************************************/
/****** - UPDATE STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_UPDATE_HOUSE_CHOICE]    Script Date: 8/29/2014 2:05:09 PM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_UPDATE_HOUSE_CHOICE]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_UPDATE_HOUSE_CHOICE]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_UPDATE_HOUSE_CHOICE]
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
    SET @house_id = null
    END
	  IF @address_id = 0
    BEGIN
    SET @address_id = null
    END
	  IF @house_choice_bathrooms = 0
    BEGIN
    SET @house_choice_bathrooms = null
    END
	  IF @house_choice_comments = ''
    BEGIN
    SET @house_choice_comments = null
    END
	  IF @house_choice_contact_person_id = 0
    BEGIN
    SET @house_choice_contact_person_id = null
    END
	  IF @house_choice_laundry = ''
    BEGIN
    SET @house_choice_laundry = null
    END
	  IF @house_choice_no_floors = 0
    BEGIN
    SET @house_choice_no_floors = null
    END
	  IF @house_choice_parking = ''
    BEGIN
    SET @house_choice_parking = null
    END
	  IF @house_choice_rent = 0
    BEGIN
    SET @house_choice_rent = null
    END
	  IF @house_choice_type = ''
    BEGIN
    SET @house_choice_type = null
    END
	  IF @house_choice_units_avail = 0
    BEGIN
    SET @house_choice_units_avail = null
    END
	UPDATE [dbo].[house_choice]
       SET
		   [house_id] = @house_id,
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
END
GO
/***********************************************************/
/*************************************************/
/****** - DELETE STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_DELETE_HOUSE_CHOICE]    Script Date: 8/29/2014 2:05:09 PM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_DELETE_HOUSE_CHOICE]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_DELETE_HOUSE_CHOICE]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_DELETE_HOUSE_CHOICE]
	@house_choice_id int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	Delete dbo.house_choice
	where house_choice_id = @house_choice_id
END
GO
/***********************************************************/
/*************************************************/
/****** - WHERE CLAUSE STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_SELECT_HOUSE_CHOICE_WC]    Script Date: 8/29/2014 2:05:09 PM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_SELECT_HOUSE_CHOICE_WC]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_SELECT_HOUSE_CHOICE_WC]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_SELECT_HOUSE_CHOICE_WC]
	  @wareclause as varchar(MAX)
AS
Begin
    Declare @string as varchar(MAX)
	Set @string = 'Select * from house_choice where ' + @wareclause
	Exec(@string)
END
GO

/***********************************************************/
/*************************************************/
/****** - SELECT STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_SELECT_PET]    Script Date: 8/29/2014 2:05:11 PM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_SELECT_PET]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_SELECT_PET]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_SELECT_PET]
           @Pet_Record_ID as int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
SELECT [Pet_Record_ID]
      ,[Pet_Location_Found_ID]
      ,[Pet_Type_ID]
      ,[Pet_Vet_ID]
      ,[Pet_License_Tag]
      ,[Pet_RFID]
      ,[Pet_Tatoo_No]
      ,[Pet_Name]
      ,[Pet_Gender]
      ,[Pet_Color]
      ,[Pet_Weight]
      ,[Pet_Description]
      ,[Pet_Condition]
      ,[Pet_Status]
      ,[Pet_Date_Of_Birth]
      ,[Pet_Picture]
      ,[Pet_Sterilized]
      ,[Date_Modified]
      ,[Date_Created]
  FROM [dbo].[Pet]
 WHERE Pet_Record_ID = @Pet_Record_ID
End
GO
/***********************************************************/
/*************************************************/
/****** - INSERT STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_INSERT_PET]    Script Date: 8/29/2014 2:05:11 PM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_INSERT_PET]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_INSERT_PET]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_INSERT_PET]
	  @Pet_Location_Found_ID as int,
	  @Pet_Type_ID as int,
	  @Pet_Vet_ID as varchar(50),
	  @Pet_License_Tag as varchar(50),
	  @Pet_RFID as varchar(MAX),
	  @Pet_Tatoo_No as varchar(50),
	  @Pet_Name as varchar(50),
	  @Pet_Gender as char(1),
	  @Pet_Color as varchar(50),
	  @Pet_Weight as int,
	  @Pet_Description as varchar(MAX),
	  @Pet_Condition as varchar(MAX),
	  @Pet_Status as varchar(MAX),
	  @Pet_Date_Of_Birth as datetime,
	  @Pet_Picture as varbinary(MAX),
	  @Pet_Sterilized as char(1),
	  @Date_Modified as datetime,
	  @Date_Created as datetime
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	  IF @Pet_Location_Found_ID = 0
    BEGIN
    SET @Pet_Location_Found_ID = null
    END
	  IF @Pet_Type_ID = 0
    BEGIN
    SET @Pet_Type_ID = null
    END
	  IF @Pet_Vet_ID = ''
    BEGIN
    SET @Pet_Vet_ID = null
    END
	  IF @Pet_License_Tag = ''
    BEGIN
    SET @Pet_License_Tag = null
    END
	  IF @Pet_RFID = ''
    BEGIN
    SET @Pet_RFID = null
    END
	  IF @Pet_Tatoo_No = ''
    BEGIN
    SET @Pet_Tatoo_No = null
    END
	  IF @Pet_Name = ''
    BEGIN
    SET @Pet_Name = null
    END
	  IF @Pet_Gender = ''
    BEGIN
    SET @Pet_Gender = null
    END
	  IF @Pet_Color = ''
    BEGIN
    SET @Pet_Color = null
    END
	  IF @Pet_Weight = 0
    BEGIN
    SET @Pet_Weight = null
    END
	  IF @Pet_Description = ''
    BEGIN
    SET @Pet_Description = null
    END
	  IF @Pet_Condition = ''
    BEGIN
    SET @Pet_Condition = null
    END
	  IF @Pet_Status = ''
    BEGIN
    SET @Pet_Status = null
    END
	  IF @Pet_Date_Of_Birth = '9/9/1900 12:00:00 AM'
    BEGIN
    SET @Pet_Date_Of_Birth = null
    END
	  IF @Pet_Picture = 0
    BEGIN
    SET @Pet_Picture = null
    END
	  IF @Pet_Sterilized = ''
    BEGIN
    SET @Pet_Sterilized = null
    END
	  IF @Date_Modified = '9/9/1900 12:00:00 AM'
    BEGIN
    SET @Date_Modified = null
    END
	  IF @Date_Created = '9/9/1900 12:00:00 AM'
    BEGIN
    SET @Date_Created = null
    END
	Insert INTO [dbo].[Pet]
           (
            [Pet_Location_Found_ID]
           ,[Pet_Type_ID]
           ,[Pet_Vet_ID]
           ,[Pet_License_Tag]
           ,[Pet_RFID]
           ,[Pet_Tatoo_No]
           ,[Pet_Name]
           ,[Pet_Gender]
           ,[Pet_Color]
           ,[Pet_Weight]
           ,[Pet_Description]
           ,[Pet_Condition]
           ,[Pet_Status]
           ,[Pet_Date_Of_Birth]
           ,[Pet_Picture]
           ,[Pet_Sterilized]
           ,[Date_Modified]
           ,[Date_Created]
            )
     VALUES (
            @Pet_Location_Found_ID
           ,@Pet_Type_ID
           ,@Pet_Vet_ID
           ,@Pet_License_Tag
           ,@Pet_RFID
           ,@Pet_Tatoo_No
           ,@Pet_Name
           ,@Pet_Gender
           ,@Pet_Color
           ,@Pet_Weight
           ,@Pet_Description
           ,@Pet_Condition
           ,@Pet_Status
           ,@Pet_Date_Of_Birth
           ,@Pet_Picture
           ,@Pet_Sterilized
           ,@Date_Modified
           ,@Date_Created
            )
END
GO
/***********************************************************/
/*************************************************/
/****** - GET STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_GET_PET]    Script Date: 8/29/2014 2:05:11 PM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_GET_PET]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_GET_PET]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_GET_PET]
	  @Pet_Location_Found_ID as int,
	  @Pet_Type_ID as int,
	  @Pet_Vet_ID as varchar(50),
	  @Pet_License_Tag as varchar(50),
	  @Pet_RFID as varchar(MAX),
	  @Pet_Tatoo_No as varchar(50),
	  @Pet_Name as varchar(50),
	  @Pet_Gender as char(1),
	  @Pet_Color as varchar(50),
	  @Pet_Weight as int,
	  @Pet_Description as varchar(MAX),
	  @Pet_Condition as varchar(MAX),
	  @Pet_Status as varchar(MAX),
	  @Pet_Date_Of_Birth as datetime,
	  @Pet_Picture as varbinary(MAX),
	  @Pet_Sterilized as char(1),
	  @Date_Modified as datetime,
	  @Date_Created as datetime
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	  IF @Pet_Location_Found_ID = 0
    BEGIN
    SET @Pet_Location_Found_ID = null
    END
	  IF @Pet_Type_ID = 0
    BEGIN
    SET @Pet_Type_ID = null
    END
	  IF @Pet_Vet_ID = ''
    BEGIN
    SET @Pet_Vet_ID = null
    END
	  IF @Pet_License_Tag = ''
    BEGIN
    SET @Pet_License_Tag = null
    END
	  IF @Pet_RFID = ''
    BEGIN
    SET @Pet_RFID = null
    END
	  IF @Pet_Tatoo_No = ''
    BEGIN
    SET @Pet_Tatoo_No = null
    END
	  IF @Pet_Name = ''
    BEGIN
    SET @Pet_Name = null
    END
	  IF @Pet_Gender = ''
    BEGIN
    SET @Pet_Gender = null
    END
	  IF @Pet_Color = ''
    BEGIN
    SET @Pet_Color = null
    END
	  IF @Pet_Weight = 0
    BEGIN
    SET @Pet_Weight = null
    END
	  IF @Pet_Description = ''
    BEGIN
    SET @Pet_Description = null
    END
	  IF @Pet_Condition = ''
    BEGIN
    SET @Pet_Condition = null
    END
	  IF @Pet_Status = ''
    BEGIN
    SET @Pet_Status = null
    END
	  IF @Pet_Date_Of_Birth = '9/9/1900 12:00:00 AM'
    BEGIN
    SET @Pet_Date_Of_Birth = null
    END
	  IF @Pet_Picture = 0
    BEGIN
    SET @Pet_Picture = null
    END
	  IF @Pet_Sterilized = ''
    BEGIN
    SET @Pet_Sterilized = null
    END
	  IF @Date_Modified = '9/9/1900 12:00:00 AM'
    BEGIN
    SET @Date_Modified = null
    END
	  IF @Date_Created = '9/9/1900 12:00:00 AM'
    BEGIN
    SET @Date_Created = null
    END
    SELECT [Pet_Record_ID] 
      FROM [dbo].[Pet] 
       WHERE ([Pet_Location_Found_ID] = @Pet_Location_Found_ID or [Pet_Location_Found_ID] is null)
       AND ([Pet_Type_ID] = @Pet_Type_ID or [Pet_Type_ID] is null)
       AND ([Pet_Vet_ID] like @Pet_Vet_ID or [Pet_Vet_ID] is null)
       AND ([Pet_License_Tag] like @Pet_License_Tag or [Pet_License_Tag] is null)
       AND ([Pet_RFID] like @Pet_RFID or [Pet_RFID] is null)
       AND ([Pet_Tatoo_No] like @Pet_Tatoo_No or [Pet_Tatoo_No] is null)
       AND ([Pet_Name] like @Pet_Name)
       AND ([Pet_Gender] = @Pet_Gender)
       AND ([Pet_Color] like @Pet_Color)
       AND ([Pet_Weight] = @Pet_Weight or [Pet_Weight] is null)
       AND ([Pet_Description] like @Pet_Description)
       AND ([Pet_Condition] like @Pet_Condition)
       AND ([Pet_Status] like @Pet_Status)
       AND ([Pet_Date_Of_Birth] = @Pet_Date_Of_Birth or [Pet_Date_Of_Birth] is null)
       AND ([Pet_Picture] = @Pet_Picture or [Pet_Picture] is null)
       AND ([Pet_Sterilized] = @Pet_Sterilized or [Pet_Sterilized] is null)
       AND ([Date_Modified] = @Date_Modified)
       AND ([Date_Created] = @Date_Created)
END
GO
/***********************************************************/
/*************************************************/
/****** - UPDATE STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_UPDATE_PET]    Script Date: 8/29/2014 2:05:11 PM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_UPDATE_PET]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_UPDATE_PET]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_UPDATE_PET]
	  @Pet_Record_ID as int,
	  @Pet_Location_Found_ID as int,
	  @Pet_Type_ID as int,
	  @Pet_Vet_ID as varchar(50),
	  @Pet_License_Tag as varchar(50),
	  @Pet_RFID as varchar(MAX),
	  @Pet_Tatoo_No as varchar(50),
	  @Pet_Name as varchar(50),
	  @Pet_Gender as char(1),
	  @Pet_Color as varchar(50),
	  @Pet_Weight as int,
	  @Pet_Description as varchar(MAX),
	  @Pet_Condition as varchar(MAX),
	  @Pet_Status as varchar(MAX),
	  @Pet_Date_Of_Birth as datetime,
	  @Pet_Picture as varbinary(MAX),
	  @Pet_Sterilized as char(1),
	  @Date_Modified as datetime,
	  @Date_Created as datetime
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	  IF @Pet_Location_Found_ID = 0
    BEGIN
    SET @Pet_Location_Found_ID = null
    END
	  IF @Pet_Type_ID = 0
    BEGIN
    SET @Pet_Type_ID = null
    END
	  IF @Pet_Vet_ID = ''
    BEGIN
    SET @Pet_Vet_ID = null
    END
	  IF @Pet_License_Tag = ''
    BEGIN
    SET @Pet_License_Tag = null
    END
	  IF @Pet_RFID = ''
    BEGIN
    SET @Pet_RFID = null
    END
	  IF @Pet_Tatoo_No = ''
    BEGIN
    SET @Pet_Tatoo_No = null
    END
	  IF @Pet_Name = ''
    BEGIN
    SET @Pet_Name = null
    END
	  IF @Pet_Gender = ''
    BEGIN
    SET @Pet_Gender = null
    END
	  IF @Pet_Color = ''
    BEGIN
    SET @Pet_Color = null
    END
	  IF @Pet_Weight = 0
    BEGIN
    SET @Pet_Weight = null
    END
	  IF @Pet_Description = ''
    BEGIN
    SET @Pet_Description = null
    END
	  IF @Pet_Condition = ''
    BEGIN
    SET @Pet_Condition = null
    END
	  IF @Pet_Status = ''
    BEGIN
    SET @Pet_Status = null
    END
	  IF @Pet_Date_Of_Birth = '9/9/1900 12:00:00 AM'
    BEGIN
    SET @Pet_Date_Of_Birth = null
    END
	  IF @Pet_Picture = 0
    BEGIN
    SET @Pet_Picture = null
    END
	  IF @Pet_Sterilized = ''
    BEGIN
    SET @Pet_Sterilized = null
    END
	  IF @Date_Modified = '9/9/1900 12:00:00 AM'
    BEGIN
    SET @Date_Modified = null
    END
	  IF @Date_Created = '9/9/1900 12:00:00 AM'
    BEGIN
    SET @Date_Created = null
    END
	UPDATE [dbo].[Pet]
       SET
		   [Pet_Location_Found_ID] = @Pet_Location_Found_ID,
		   [Pet_Type_ID] = @Pet_Type_ID,
		   [Pet_Vet_ID] = @Pet_Vet_ID,
		   [Pet_License_Tag] = @Pet_License_Tag,
		   [Pet_RFID] = @Pet_RFID,
		   [Pet_Tatoo_No] = @Pet_Tatoo_No,
		   [Pet_Name] = @Pet_Name,
		   [Pet_Gender] = @Pet_Gender,
		   [Pet_Color] = @Pet_Color,
		   [Pet_Weight] = @Pet_Weight,
		   [Pet_Description] = @Pet_Description,
		   [Pet_Condition] = @Pet_Condition,
		   [Pet_Status] = @Pet_Status,
		   [Pet_Date_Of_Birth] = @Pet_Date_Of_Birth,
		   [Pet_Picture] = @Pet_Picture,
		   [Pet_Sterilized] = @Pet_Sterilized,
		   [Date_Modified] = @Date_Modified,
		   [Date_Created] = @Date_Created
       WHERE Pet_Record_ID = @Pet_Record_ID
END
GO
/***********************************************************/
/*************************************************/
/****** - DELETE STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_DELETE_PET]    Script Date: 8/29/2014 2:05:11 PM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_DELETE_PET]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_DELETE_PET]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_DELETE_PET]
	@Pet_Record_ID int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	Delete dbo.Pet
	where Pet_Record_ID = @Pet_Record_ID
END
GO
/***********************************************************/
/*************************************************/
/****** - WHERE CLAUSE STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_SELECT_PET_WC]    Script Date: 8/29/2014 2:05:11 PM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_SELECT_PET_WC]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_SELECT_PET_WC]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_SELECT_PET_WC]
	  @wareclause as varchar(MAX)
AS
Begin
    Declare @string as varchar(MAX)
	Set @string = 'Select * from Pet where ' + @wareclause
	Exec(@string)
END
GO

/***********************************************************/
/*************************************************/
/****** - SELECT STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_SELECT_PET_MISSING]    Script Date: 8/29/2014 2:05:12 PM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_SELECT_PET_MISSING]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_SELECT_PET_MISSING]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_SELECT_PET_MISSING]
           @Pet_Missing_ID as int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
SELECT [Pet_Missing_ID]
      ,[Last_Known_Location_ID]
      ,[Date_Missing]
      ,[Date_Reported]
      ,[Collar_Description]
      ,[Time_Lost]
      ,[Lost_Explanation]
      ,[Length_Owned]
      ,[Reward_Amt]
      ,[Breeder]
      ,[Date_Created]
      ,[Date_Modified]
  FROM [dbo].[Pet_Missing]
 WHERE Pet_Missing_ID = @Pet_Missing_ID
End
GO
/***********************************************************/
/*************************************************/
/****** - INSERT STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_INSERT_PET_MISSING]    Script Date: 8/29/2014 2:05:12 PM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_INSERT_PET_MISSING]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_INSERT_PET_MISSING]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_INSERT_PET_MISSING]
	  @Pet_Missing_ID as int,
	  @Last_Known_Location_ID as int,
	  @Date_Missing as datetime,
	  @Date_Reported as datetime,
	  @Collar_Description as varchar(50),
	  @Time_Lost as datetime,
	  @Lost_Explanation as varchar(MAX),
	  @Length_Owned as int,
	  @Reward_Amt as money,
	  @Breeder as varchar(50),
	  @Date_Created as datetime,
	  @Date_Modified as datetime
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	  IF @Last_Known_Location_ID = 0
    BEGIN
    SET @Last_Known_Location_ID = null
    END
	  IF @Date_Missing = '9/9/1900 12:00:00 AM'
    BEGIN
    SET @Date_Missing = null
    END
	  IF @Date_Reported = '9/9/1900 12:00:00 AM'
    BEGIN
    SET @Date_Reported = null
    END
	  IF @Collar_Description = ''
    BEGIN
    SET @Collar_Description = null
    END
	  IF @Time_Lost = '9/9/1900 12:00:00 AM'
    BEGIN
    SET @Time_Lost = null
    END
	  IF @Lost_Explanation = ''
    BEGIN
    SET @Lost_Explanation = null
    END
	  IF @Length_Owned = 0
    BEGIN
    SET @Length_Owned = null
    END
	  IF @Reward_Amt = 0
    BEGIN
    SET @Reward_Amt = null
    END
	  IF @Breeder = ''
    BEGIN
    SET @Breeder = null
    END
	  IF @Date_Created = '9/9/1900 12:00:00 AM'
    BEGIN
    SET @Date_Created = null
    END
	  IF @Date_Modified = '9/9/1900 12:00:00 AM'
    BEGIN
    SET @Date_Modified = null
    END
	Insert INTO [dbo].[Pet_Missing]
           (
            [Pet_Missing_ID]
           ,[Last_Known_Location_ID]
           ,[Date_Missing]
           ,[Date_Reported]
           ,[Collar_Description]
           ,[Time_Lost]
           ,[Lost_Explanation]
           ,[Length_Owned]
           ,[Reward_Amt]
           ,[Breeder]
           ,[Date_Created]
           ,[Date_Modified]
            )
     VALUES (
            @Pet_Missing_ID
           ,@Last_Known_Location_ID
           ,@Date_Missing
           ,@Date_Reported
           ,@Collar_Description
           ,@Time_Lost
           ,@Lost_Explanation
           ,@Length_Owned
           ,@Reward_Amt
           ,@Breeder
           ,@Date_Created
           ,@Date_Modified
            )
END
GO
/***********************************************************/
/*************************************************/
/****** - GET STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_GET_PET_MISSING]    Script Date: 8/29/2014 2:05:12 PM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_GET_PET_MISSING]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_GET_PET_MISSING]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_GET_PET_MISSING]
	  @Last_Known_Location_ID as int,
	  @Date_Missing as datetime,
	  @Date_Reported as datetime,
	  @Collar_Description as varchar(50),
	  @Time_Lost as datetime,
	  @Lost_Explanation as varchar(MAX),
	  @Length_Owned as int,
	  @Reward_Amt as money,
	  @Breeder as varchar(50),
	  @Date_Created as datetime,
	  @Date_Modified as datetime
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	  IF @Last_Known_Location_ID = 0
    BEGIN
    SET @Last_Known_Location_ID = null
    END
	  IF @Date_Missing = '9/9/1900 12:00:00 AM'
    BEGIN
    SET @Date_Missing = null
    END
	  IF @Date_Reported = '9/9/1900 12:00:00 AM'
    BEGIN
    SET @Date_Reported = null
    END
	  IF @Collar_Description = ''
    BEGIN
    SET @Collar_Description = null
    END
	  IF @Time_Lost = '9/9/1900 12:00:00 AM'
    BEGIN
    SET @Time_Lost = null
    END
	  IF @Lost_Explanation = ''
    BEGIN
    SET @Lost_Explanation = null
    END
	  IF @Length_Owned = 0
    BEGIN
    SET @Length_Owned = null
    END
	  IF @Reward_Amt = 0
    BEGIN
    SET @Reward_Amt = null
    END
	  IF @Breeder = ''
    BEGIN
    SET @Breeder = null
    END
	  IF @Date_Created = '9/9/1900 12:00:00 AM'
    BEGIN
    SET @Date_Created = null
    END
	  IF @Date_Modified = '9/9/1900 12:00:00 AM'
    BEGIN
    SET @Date_Modified = null
    END
    SELECT [Pet_Missing_ID] 
      FROM [dbo].[Pet_Missing] 
       WHERE ([Last_Known_Location_ID] = @Last_Known_Location_ID)
       AND ([Date_Missing] = @Date_Missing or [Date_Missing] is null)
       AND ([Date_Reported] = @Date_Reported or [Date_Reported] is null)
       AND ([Collar_Description] like @Collar_Description or [Collar_Description] is null)
       AND ([Time_Lost] = @Time_Lost or [Time_Lost] is null)
       AND ([Lost_Explanation] like @Lost_Explanation or [Lost_Explanation] is null)
       AND ([Length_Owned] = @Length_Owned or [Length_Owned] is null)
       AND ([Reward_Amt] = @Reward_Amt or [Reward_Amt] is null)
       AND ([Breeder] like @Breeder or [Breeder] is null)
       AND ([Date_Created] = @Date_Created or [Date_Created] is null)
       AND ([Date_Modified] = @Date_Modified or [Date_Modified] is null)
END
GO
/***********************************************************/
/*************************************************/
/****** - UPDATE STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_UPDATE_PET_MISSING]    Script Date: 8/29/2014 2:05:12 PM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_UPDATE_PET_MISSING]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_UPDATE_PET_MISSING]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_UPDATE_PET_MISSING]
	  @Pet_Missing_ID as int,
	  @Last_Known_Location_ID as int,
	  @Date_Missing as datetime,
	  @Date_Reported as datetime,
	  @Collar_Description as varchar(50),
	  @Time_Lost as datetime,
	  @Lost_Explanation as varchar(MAX),
	  @Length_Owned as int,
	  @Reward_Amt as money,
	  @Breeder as varchar(50),
	  @Date_Created as datetime,
	  @Date_Modified as datetime
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	  IF @Last_Known_Location_ID = 0
    BEGIN
    SET @Last_Known_Location_ID = null
    END
	  IF @Date_Missing = '9/9/1900 12:00:00 AM'
    BEGIN
    SET @Date_Missing = null
    END
	  IF @Date_Reported = '9/9/1900 12:00:00 AM'
    BEGIN
    SET @Date_Reported = null
    END
	  IF @Collar_Description = ''
    BEGIN
    SET @Collar_Description = null
    END
	  IF @Time_Lost = '9/9/1900 12:00:00 AM'
    BEGIN
    SET @Time_Lost = null
    END
	  IF @Lost_Explanation = ''
    BEGIN
    SET @Lost_Explanation = null
    END
	  IF @Length_Owned = 0
    BEGIN
    SET @Length_Owned = null
    END
	  IF @Reward_Amt = 0
    BEGIN
    SET @Reward_Amt = null
    END
	  IF @Breeder = ''
    BEGIN
    SET @Breeder = null
    END
	  IF @Date_Created = '9/9/1900 12:00:00 AM'
    BEGIN
    SET @Date_Created = null
    END
	  IF @Date_Modified = '9/9/1900 12:00:00 AM'
    BEGIN
    SET @Date_Modified = null
    END
	UPDATE [dbo].[Pet_Missing]
       SET
		   [Last_Known_Location_ID] = @Last_Known_Location_ID,
		   [Date_Missing] = @Date_Missing,
		   [Date_Reported] = @Date_Reported,
		   [Collar_Description] = @Collar_Description,
		   [Time_Lost] = @Time_Lost,
		   [Lost_Explanation] = @Lost_Explanation,
		   [Length_Owned] = @Length_Owned,
		   [Reward_Amt] = @Reward_Amt,
		   [Breeder] = @Breeder,
		   [Date_Created] = @Date_Created,
		   [Date_Modified] = @Date_Modified
       WHERE Pet_Missing_ID = @Pet_Missing_ID
END
GO
/***********************************************************/
/*************************************************/
/****** - DELETE STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_DELETE_PET_MISSING]    Script Date: 8/29/2014 2:05:12 PM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_DELETE_PET_MISSING]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_DELETE_PET_MISSING]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_DELETE_PET_MISSING]
	@Pet_Missing_ID int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	Delete dbo.Pet_Missing
	where Pet_Missing_ID = @Pet_Missing_ID
END
GO
/***********************************************************/
/*************************************************/
/****** - WHERE CLAUSE STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_SELECT_PET_MISSING_WC]    Script Date: 8/29/2014 2:05:12 PM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_SELECT_PET_MISSING_WC]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_SELECT_PET_MISSING_WC]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_SELECT_PET_MISSING_WC]
	  @wareclause as varchar(MAX)
AS
Begin
    Declare @string as varchar(MAX)
	Set @string = 'Select * from Pet_Missing where ' + @wareclause
	Exec(@string)
END
GO

/***********************************************************/
/*************************************************/
/****** - SELECT STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_SELECT_CASE_CLIENT]    Script Date: 8/29/2014 2:05:15 PM ******/
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
/****** Object:  StoredProcedure [dbo].[SP_DMCS_INSERT_CASE_CLIENT]    Script Date: 8/29/2014 2:05:15 PM ******/
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
	  @Client_issue_resolved as char(1),
	  @Client_issue_comments as text
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
/****** - GET STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_GET_CASE_CLIENT]    Script Date: 8/29/2014 2:05:16 PM ******/
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
	  @Client_issue_resolved as char(1),
	  @Client_issue_comments as text
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
       AND ([child_support] like @child_support)
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
       AND ([relationship_to_head_of_household] like @relationship_to_head_of_household)
       AND ([rental_name] like @rental_name or [rental_name] is null)
       AND ([rental_phone] like @rental_phone or [rental_phone] is null)
       AND ([sewage_amt_owed_today] = @sewage_amt_owed_today or [sewage_amt_owed_today] is null)
       AND ([telephone_amt_owed_today] = @telephone_amt_owed_today or [telephone_amt_owed_today] is null)
       AND ([trash_removal_amt_owed_today] = @trash_removal_amt_owed_today or [trash_removal_amt_owed_today] is null)
       AND ([us_status_memo] like @us_status_memo or [us_status_memo] is null)
       AND ([related_ll] = @related_ll)
       AND ([relation_to_ll] = @relation_to_ll)
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
/***********************************************************/
/*************************************************/
/****** - UPDATE STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_UPDATE_CASE_CLIENT]    Script Date: 8/29/2014 2:05:16 PM ******/
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
	  @Client_issue_resolved as char(1),
	  @Client_issue_comments as text
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
/****** Object:  StoredProcedure [dbo].[SP_DMCS_DELETE_CASE_CLIENT]    Script Date: 8/29/2014 2:05:16 PM ******/
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
/****** - WHERE CLAUSE STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_SELECT_CASE_CLIENT_WC]    Script Date: 8/29/2014 2:05:16 PM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_SELECT_CASE_CLIENT_WC]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_SELECT_CASE_CLIENT_WC]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_SELECT_CASE_CLIENT_WC]
	  @wareclause as varchar(MAX)
AS
Begin
    Declare @string as varchar(MAX)
	Set @string = 'Select * from case_client where ' + @wareclause
	Exec(@string)
END
GO

/***********************************************************/
/*************************************************/
/****** - SELECT STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_SELECT_JOB]    Script Date: 8/29/2014 2:05:18 PM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_SELECT_JOB]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_SELECT_JOB]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_SELECT_JOB]
           @job_id as int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
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
      ,[Work_Payment_Freq_Bi_Weekly]
      ,[Work_Payment_Freq_Monthly]
      ,[Work_Payment_Freq_Bi_Monthly]
  FROM [dbo].[job]
 WHERE job_id = @job_id
End
GO
/***********************************************************/
/*************************************************/
/****** - INSERT STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_INSERT_JOB]    Script Date: 8/29/2014 2:05:18 PM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_INSERT_JOB]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_INSERT_JOB]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_INSERT_JOB]
	  @address_id as int,
	  @company_id as int,
	  @job_cat_id as int,
	  @job_posted_date as datetime,
	  @job_status as varchar(10),
	  @job_title as varchar(15),
	  @Work_Classification_Full_time as varchar(15),
	  @Work_Classification_Part_time as varchar(15),
	  @Work_Payment_Freq_Weekly as varchar(15),
	  @Work_Payment_Freq_Bi_Weekly as varchar(15),
	  @Work_Payment_Freq_Monthly as varchar(15),
	  @Work_Payment_Freq_Bi_Monthly as varchar(15)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	  IF @address_id = 0
    BEGIN
    SET @address_id = null
    END
	  IF @company_id = 0
    BEGIN
    SET @company_id = null
    END
	  IF @job_cat_id = 0
    BEGIN
    SET @job_cat_id = null
    END
	  IF @job_posted_date = '9/9/1900 12:00:00 AM'
    BEGIN
    SET @job_posted_date = null
    END
	  IF @job_status = ''
    BEGIN
    SET @job_status = null
    END
	  IF @job_title = ''
    BEGIN
    SET @job_title = null
    END
	  IF @Work_Classification_Full_time = ''
    BEGIN
    SET @Work_Classification_Full_time = null
    END
	  IF @Work_Classification_Part_time = ''
    BEGIN
    SET @Work_Classification_Part_time = null
    END
	  IF @Work_Payment_Freq_Weekly = ''
    BEGIN
    SET @Work_Payment_Freq_Weekly = null
    END
	  IF @Work_Payment_Freq_Bi_Weekly = ''
    BEGIN
    SET @Work_Payment_Freq_Bi_Weekly = null
    END
	  IF @Work_Payment_Freq_Monthly = ''
    BEGIN
    SET @Work_Payment_Freq_Monthly = null
    END
	  IF @Work_Payment_Freq_Bi_Monthly = ''
    BEGIN
    SET @Work_Payment_Freq_Bi_Monthly = null
    END
	Insert INTO [dbo].[job]
           (
            [address_id]
           ,[company_id]
           ,[job_cat_id]
           ,[job_posted_date]
           ,[job_status]
           ,[job_title]
           ,[Work_Classification_Full_time]
           ,[Work_Classification_Part_time]
           ,[Work_Payment_Freq_Weekly]
           ,[Work_Payment_Freq_Bi_Weekly]
           ,[Work_Payment_Freq_Monthly]
           ,[Work_Payment_Freq_Bi_Monthly]
            )
     VALUES (
            @address_id
           ,@company_id
           ,@job_cat_id
           ,@job_posted_date
           ,@job_status
           ,@job_title
           ,@Work_Classification_Full_time
           ,@Work_Classification_Part_time
           ,@Work_Payment_Freq_Weekly
           ,@Work_Payment_Freq_Bi_Weekly
           ,@Work_Payment_Freq_Monthly
           ,@Work_Payment_Freq_Bi_Monthly
            )
END
GO
/***********************************************************/
/*************************************************/
/****** - GET STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_GET_JOB]    Script Date: 8/29/2014 2:05:18 PM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_GET_JOB]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_GET_JOB]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_GET_JOB]
	  @address_id as int,
	  @company_id as int,
	  @job_cat_id as int,
	  @job_posted_date as datetime,
	  @job_status as varchar(10),
	  @job_title as varchar(15),
	  @Work_Classification_Full_time as varchar(15),
	  @Work_Classification_Part_time as varchar(15),
	  @Work_Payment_Freq_Weekly as varchar(15),
	  @Work_Payment_Freq_Bi_Weekly as varchar(15),
	  @Work_Payment_Freq_Monthly as varchar(15),
	  @Work_Payment_Freq_Bi_Monthly as varchar(15)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	  IF @address_id = 0
    BEGIN
    SET @address_id = null
    END
	  IF @company_id = 0
    BEGIN
    SET @company_id = null
    END
	  IF @job_cat_id = 0
    BEGIN
    SET @job_cat_id = null
    END
	  IF @job_posted_date = '9/9/1900 12:00:00 AM'
    BEGIN
    SET @job_posted_date = null
    END
	  IF @job_status = ''
    BEGIN
    SET @job_status = null
    END
	  IF @job_title = ''
    BEGIN
    SET @job_title = null
    END
	  IF @Work_Classification_Full_time = ''
    BEGIN
    SET @Work_Classification_Full_time = null
    END
	  IF @Work_Classification_Part_time = ''
    BEGIN
    SET @Work_Classification_Part_time = null
    END
	  IF @Work_Payment_Freq_Weekly = ''
    BEGIN
    SET @Work_Payment_Freq_Weekly = null
    END
	  IF @Work_Payment_Freq_Bi_Weekly = ''
    BEGIN
    SET @Work_Payment_Freq_Bi_Weekly = null
    END
	  IF @Work_Payment_Freq_Monthly = ''
    BEGIN
    SET @Work_Payment_Freq_Monthly = null
    END
	  IF @Work_Payment_Freq_Bi_Monthly = ''
    BEGIN
    SET @Work_Payment_Freq_Bi_Monthly = null
    END
    SELECT [job_id] 
      FROM [dbo].[job] 
       WHERE ([address_id] = @address_id)
       AND ([company_id] = @company_id)
       AND ([job_cat_id] = @job_cat_id)
       AND ([job_posted_date] = @job_posted_date)
       AND ([job_status] like @job_status)
       AND ([job_title] like @job_title)
       AND ([Work_Classification_Full_time] like @Work_Classification_Full_time)
       AND ([Work_Classification_Part_time] like @Work_Classification_Part_time)
       AND ([Work_Payment_Freq_Weekly] like @Work_Payment_Freq_Weekly)
       AND ([Work_Payment_Freq_Bi_Weekly] like @Work_Payment_Freq_Bi_Weekly)
       AND ([Work_Payment_Freq_Monthly] like @Work_Payment_Freq_Monthly)
       AND ([Work_Payment_Freq_Bi_Monthly] like @Work_Payment_Freq_Bi_Monthly)
END
GO
/***********************************************************/
/*************************************************/
/****** - UPDATE STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_UPDATE_JOB]    Script Date: 8/29/2014 2:05:18 PM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_UPDATE_JOB]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_UPDATE_JOB]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_UPDATE_JOB]
	  @job_id as int,
	  @address_id as int,
	  @company_id as int,
	  @job_cat_id as int,
	  @job_posted_date as datetime,
	  @job_status as varchar(10),
	  @job_title as varchar(15),
	  @Work_Classification_Full_time as varchar(15),
	  @Work_Classification_Part_time as varchar(15),
	  @Work_Payment_Freq_Weekly as varchar(15),
	  @Work_Payment_Freq_Bi_Weekly as varchar(15),
	  @Work_Payment_Freq_Monthly as varchar(15),
	  @Work_Payment_Freq_Bi_Monthly as varchar(15)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	  IF @address_id = 0
    BEGIN
    SET @address_id = null
    END
	  IF @company_id = 0
    BEGIN
    SET @company_id = null
    END
	  IF @job_cat_id = 0
    BEGIN
    SET @job_cat_id = null
    END
	  IF @job_posted_date = '9/9/1900 12:00:00 AM'
    BEGIN
    SET @job_posted_date = null
    END
	  IF @job_status = ''
    BEGIN
    SET @job_status = null
    END
	  IF @job_title = ''
    BEGIN
    SET @job_title = null
    END
	  IF @Work_Classification_Full_time = ''
    BEGIN
    SET @Work_Classification_Full_time = null
    END
	  IF @Work_Classification_Part_time = ''
    BEGIN
    SET @Work_Classification_Part_time = null
    END
	  IF @Work_Payment_Freq_Weekly = ''
    BEGIN
    SET @Work_Payment_Freq_Weekly = null
    END
	  IF @Work_Payment_Freq_Bi_Weekly = ''
    BEGIN
    SET @Work_Payment_Freq_Bi_Weekly = null
    END
	  IF @Work_Payment_Freq_Monthly = ''
    BEGIN
    SET @Work_Payment_Freq_Monthly = null
    END
	  IF @Work_Payment_Freq_Bi_Monthly = ''
    BEGIN
    SET @Work_Payment_Freq_Bi_Monthly = null
    END
	UPDATE [dbo].[job]
       SET
		   [address_id] = @address_id,
		   [company_id] = @company_id,
		   [job_cat_id] = @job_cat_id,
		   [job_posted_date] = @job_posted_date,
		   [job_status] = @job_status,
		   [job_title] = @job_title,
		   [Work_Classification_Full_time] = @Work_Classification_Full_time,
		   [Work_Classification_Part_time] = @Work_Classification_Part_time,
		   [Work_Payment_Freq_Weekly] = @Work_Payment_Freq_Weekly,
		   [Work_Payment_Freq_Bi_Weekly] = @Work_Payment_Freq_Bi_Weekly,
		   [Work_Payment_Freq_Monthly] = @Work_Payment_Freq_Monthly,
		   [Work_Payment_Freq_Bi_Monthly] = @Work_Payment_Freq_Bi_Monthly
       WHERE job_id = @job_id
END
GO
/***********************************************************/
/*************************************************/
/****** - DELETE STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_DELETE_JOB]    Script Date: 8/29/2014 2:05:18 PM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_DELETE_JOB]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_DELETE_JOB]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_DELETE_JOB]
	@job_id int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	Delete dbo.job
	where job_id = @job_id
END
GO
/***********************************************************/
/*************************************************/
/****** - WHERE CLAUSE STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_SELECT_JOB_WC]    Script Date: 8/29/2014 2:05:18 PM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_SELECT_JOB_WC]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_SELECT_JOB_WC]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_SELECT_JOB_WC]
	  @wareclause as varchar(MAX)
AS
Begin
    Declare @string as varchar(MAX)
	Set @string = 'Select * from job where ' + @wareclause
	Exec(@string)
END
GO

/***********************************************************/
/*************************************************/
/****** - SELECT STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_SELECT_PET_DECEASED]    Script Date: 8/29/2014 2:05:20 PM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_SELECT_PET_DECEASED]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_SELECT_PET_DECEASED]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_SELECT_PET_DECEASED]
           @Pet_Deceased_ID as int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
SELECT [Pet_Deceased_ID]
      ,[Date_Deceased]
      ,[Location_ID]
      ,[Funeral]
      ,[Cemetary_Name]
      ,[Deceased_Type]
      ,[Date_Created]
      ,[Date_Modified]
  FROM [dbo].[Pet_Deceased]
 WHERE Pet_Deceased_ID = @Pet_Deceased_ID
End
GO
/***********************************************************/
/*************************************************/
/****** - INSERT STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_INSERT_PET_DECEASED]    Script Date: 8/29/2014 2:05:20 PM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_INSERT_PET_DECEASED]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_INSERT_PET_DECEASED]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_INSERT_PET_DECEASED]
	  @Pet_Deceased_ID as int,
	  @Date_Deceased as datetime,
	  @Location_ID as int,
	  @Funeral as varchar(50),
	  @Cemetary_Name as varchar(50),
	  @Deceased_Type as varchar(50),
	  @Date_Created as datetime,
	  @Date_Modified as datetime
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	  IF @Date_Deceased = '9/9/1900 12:00:00 AM'
    BEGIN
    SET @Date_Deceased = null
    END
	  IF @Location_ID = 0
    BEGIN
    SET @Location_ID = null
    END
	  IF @Funeral = ''
    BEGIN
    SET @Funeral = null
    END
	  IF @Cemetary_Name = ''
    BEGIN
    SET @Cemetary_Name = null
    END
	  IF @Deceased_Type = ''
    BEGIN
    SET @Deceased_Type = null
    END
	  IF @Date_Created = '9/9/1900 12:00:00 AM'
    BEGIN
    SET @Date_Created = null
    END
	  IF @Date_Modified = '9/9/1900 12:00:00 AM'
    BEGIN
    SET @Date_Modified = null
    END
	Insert INTO [dbo].[Pet_Deceased]
           (
            [Pet_Deceased_ID]
           ,[Date_Deceased]
           ,[Location_ID]
           ,[Funeral]
           ,[Cemetary_Name]
           ,[Deceased_Type]
           ,[Date_Created]
           ,[Date_Modified]
            )
     VALUES (
            @Pet_Deceased_ID
           ,@Date_Deceased
           ,@Location_ID
           ,@Funeral
           ,@Cemetary_Name
           ,@Deceased_Type
           ,@Date_Created
           ,@Date_Modified
            )
END
GO
/***********************************************************/
/*************************************************/
/****** - GET STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_GET_PET_DECEASED]    Script Date: 8/29/2014 2:05:20 PM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_GET_PET_DECEASED]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_GET_PET_DECEASED]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_GET_PET_DECEASED]
	  @Date_Deceased as datetime,
	  @Location_ID as int,
	  @Funeral as varchar(50),
	  @Cemetary_Name as varchar(50),
	  @Deceased_Type as varchar(50),
	  @Date_Created as datetime,
	  @Date_Modified as datetime
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	  IF @Date_Deceased = '9/9/1900 12:00:00 AM'
    BEGIN
    SET @Date_Deceased = null
    END
	  IF @Location_ID = 0
    BEGIN
    SET @Location_ID = null
    END
	  IF @Funeral = ''
    BEGIN
    SET @Funeral = null
    END
	  IF @Cemetary_Name = ''
    BEGIN
    SET @Cemetary_Name = null
    END
	  IF @Deceased_Type = ''
    BEGIN
    SET @Deceased_Type = null
    END
	  IF @Date_Created = '9/9/1900 12:00:00 AM'
    BEGIN
    SET @Date_Created = null
    END
	  IF @Date_Modified = '9/9/1900 12:00:00 AM'
    BEGIN
    SET @Date_Modified = null
    END
    SELECT [Pet_Deceased_ID] 
      FROM [dbo].[Pet_Deceased] 
       WHERE ([Date_Deceased] = @Date_Deceased)
       AND ([Location_ID] = @Location_ID or [Location_ID] is null)
       AND ([Funeral] like @Funeral or [Funeral] is null)
       AND ([Cemetary_Name] like @Cemetary_Name or [Cemetary_Name] is null)
       AND ([Deceased_Type] like @Deceased_Type)
       AND ([Date_Created] = @Date_Created or [Date_Created] is null)
       AND ([Date_Modified] = @Date_Modified or [Date_Modified] is null)
END
GO
/***********************************************************/
/*************************************************/
/****** - UPDATE STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_UPDATE_PET_DECEASED]    Script Date: 8/29/2014 2:05:20 PM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_UPDATE_PET_DECEASED]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_UPDATE_PET_DECEASED]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_UPDATE_PET_DECEASED]
	  @Pet_Deceased_ID as int,
	  @Date_Deceased as datetime,
	  @Location_ID as int,
	  @Funeral as varchar(50),
	  @Cemetary_Name as varchar(50),
	  @Deceased_Type as varchar(50),
	  @Date_Created as datetime,
	  @Date_Modified as datetime
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	  IF @Date_Deceased = '9/9/1900 12:00:00 AM'
    BEGIN
    SET @Date_Deceased = null
    END
	  IF @Location_ID = 0
    BEGIN
    SET @Location_ID = null
    END
	  IF @Funeral = ''
    BEGIN
    SET @Funeral = null
    END
	  IF @Cemetary_Name = ''
    BEGIN
    SET @Cemetary_Name = null
    END
	  IF @Deceased_Type = ''
    BEGIN
    SET @Deceased_Type = null
    END
	  IF @Date_Created = '9/9/1900 12:00:00 AM'
    BEGIN
    SET @Date_Created = null
    END
	  IF @Date_Modified = '9/9/1900 12:00:00 AM'
    BEGIN
    SET @Date_Modified = null
    END
	UPDATE [dbo].[Pet_Deceased]
       SET
		   [Date_Deceased] = @Date_Deceased,
		   [Location_ID] = @Location_ID,
		   [Funeral] = @Funeral,
		   [Cemetary_Name] = @Cemetary_Name,
		   [Deceased_Type] = @Deceased_Type,
		   [Date_Created] = @Date_Created,
		   [Date_Modified] = @Date_Modified
       WHERE Pet_Deceased_ID = @Pet_Deceased_ID
END
GO
/***********************************************************/
/*************************************************/
/****** - DELETE STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_DELETE_PET_DECEASED]    Script Date: 8/29/2014 2:05:20 PM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_DELETE_PET_DECEASED]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_DELETE_PET_DECEASED]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_DELETE_PET_DECEASED]
	@Pet_Deceased_ID int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	Delete dbo.Pet_Deceased
	where Pet_Deceased_ID = @Pet_Deceased_ID
END
GO
/***********************************************************/
/*************************************************/
/****** - WHERE CLAUSE STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_SELECT_PET_DECEASED_WC]    Script Date: 8/29/2014 2:05:20 PM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_SELECT_PET_DECEASED_WC]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_SELECT_PET_DECEASED_WC]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_SELECT_PET_DECEASED_WC]
	  @wareclause as varchar(MAX)
AS
Begin
    Declare @string as varchar(MAX)
	Set @string = 'Select * from Pet_Deceased where ' + @wareclause
	Exec(@string)
END
GO

/***********************************************************/
/*************************************************/
/****** - SELECT STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_SELECT_JOB_CATEGORY]    Script Date: 8/29/2014 2:05:22 PM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_SELECT_JOB_CATEGORY]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_SELECT_JOB_CATEGORY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_SELECT_JOB_CATEGORY]
           @job_cat_id as int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
SELECT [job_cat_id]
      ,[job_category_name]
  FROM [dbo].[job_category]
 WHERE job_cat_id = @job_cat_id
End
GO
/***********************************************************/
/*************************************************/
/****** - INSERT STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_INSERT_JOB_CATEGORY]    Script Date: 8/29/2014 2:05:22 PM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_INSERT_JOB_CATEGORY]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_INSERT_JOB_CATEGORY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_INSERT_JOB_CATEGORY]
	  @job_category_name as varchar(30)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	  IF @job_category_name = ''
    BEGIN
    SET @job_category_name = null
    END
	Insert INTO [dbo].[job_category]
           (
            [job_category_name]
            )
     VALUES (
            @job_category_name
            )
END
GO
/***********************************************************/
/*************************************************/
/****** - GET STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_GET_JOB_CATEGORY]    Script Date: 8/29/2014 2:05:22 PM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_GET_JOB_CATEGORY]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_GET_JOB_CATEGORY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_GET_JOB_CATEGORY]
	  @job_category_name as varchar(30)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	  IF @job_category_name = ''
    BEGIN
    SET @job_category_name = null
    END
    SELECT [job_cat_id] 
      FROM [dbo].[job_category] 
       WHERE ([job_category_name] like @job_category_name)
END
GO
/***********************************************************/
/*************************************************/
/****** - UPDATE STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_UPDATE_JOB_CATEGORY]    Script Date: 8/29/2014 2:05:22 PM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_UPDATE_JOB_CATEGORY]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_UPDATE_JOB_CATEGORY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_UPDATE_JOB_CATEGORY]
	  @job_cat_id as int,
	  @job_category_name as varchar(30)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	  IF @job_category_name = ''
    BEGIN
    SET @job_category_name = null
    END
	UPDATE [dbo].[job_category]
       SET
		   [job_category_name] = @job_category_name
       WHERE job_cat_id = @job_cat_id
END
GO
/***********************************************************/
/*************************************************/
/****** - DELETE STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_DELETE_JOB_CATEGORY]    Script Date: 8/29/2014 2:05:22 PM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_DELETE_JOB_CATEGORY]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_DELETE_JOB_CATEGORY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_DELETE_JOB_CATEGORY]
	@job_cat_id int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	Delete dbo.job_category
	where job_cat_id = @job_cat_id
END
GO
/***********************************************************/
/*************************************************/
/****** - WHERE CLAUSE STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_SELECT_JOB_CATEGORY_WC]    Script Date: 8/29/2014 2:05:22 PM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_SELECT_JOB_CATEGORY_WC]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_SELECT_JOB_CATEGORY_WC]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_SELECT_JOB_CATEGORY_WC]
	  @wareclause as varchar(MAX)
AS
Begin
    Declare @string as varchar(MAX)
	Set @string = 'Select * from job_category where ' + @wareclause
	Exec(@string)
END
GO

/***********************************************************/
/*************************************************/
/****** - SELECT STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_SELECT_MEDICAL_ASSISTANCE]    Script Date: 8/29/2014 2:05:24 PM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_SELECT_MEDICAL_ASSISTANCE]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_SELECT_MEDICAL_ASSISTANCE]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_SELECT_MEDICAL_ASSISTANCE]
           @medical_assist_order_id as int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
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
/***********************************************************/
/*************************************************/
/****** - INSERT STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_INSERT_MEDICAL_ASSISTANCE]    Script Date: 8/29/2014 2:05:24 PM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_INSERT_MEDICAL_ASSISTANCE]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_INSERT_MEDICAL_ASSISTANCE]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_INSERT_MEDICAL_ASSISTANCE]
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
    SET @em_id = null
    END
	  IF @medical_assist_date = '9/9/1900 12:00:00 AM'
    BEGIN
    SET @medical_assist_date = null
    END
	  IF @medical_assist_doctor_id = 0
    BEGIN
    SET @medical_assist_doctor_id = null
    END
	  IF @medical_assist_hosp_price = 0
    BEGIN
    SET @medical_assist_hosp_price = null
    END
	  IF @medical_assist_hospital_name = ''
    BEGIN
    SET @medical_assist_hospital_name = null
    END
	  IF @medical_assist_script_meds = ''
    BEGIN
    SET @medical_assist_script_meds = null
    END
	  IF @medical_assist_script_price = 0
    BEGIN
    SET @medical_assist_script_price = null
    END
	  IF @medical_assist_script_quantity = 0
    BEGIN
    SET @medical_assist_script_quantity = null
    END
	Insert INTO [dbo].[medical_assistance]
           (
            [em_id]
           ,[medical_assist_date]
           ,[medical_assist_doctor_id]
           ,[medical_assist_hosp_price]
           ,[medical_assist_hospital_name]
           ,[medical_assist_script_meds]
           ,[medical_assist_script_price]
           ,[medical_assist_script_quantity]
            )
     VALUES (
            @em_id
           ,@medical_assist_date
           ,@medical_assist_doctor_id
           ,@medical_assist_hosp_price
           ,@medical_assist_hospital_name
           ,@medical_assist_script_meds
           ,@medical_assist_script_price
           ,@medical_assist_script_quantity
            )
END
GO
/***********************************************************/
/*************************************************/
/****** - GET STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_GET_MEDICAL_ASSISTANCE]    Script Date: 8/29/2014 2:05:24 PM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_GET_MEDICAL_ASSISTANCE]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_GET_MEDICAL_ASSISTANCE]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_GET_MEDICAL_ASSISTANCE]
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
    SET @em_id = null
    END
	  IF @medical_assist_date = '9/9/1900 12:00:00 AM'
    BEGIN
    SET @medical_assist_date = null
    END
	  IF @medical_assist_doctor_id = 0
    BEGIN
    SET @medical_assist_doctor_id = null
    END
	  IF @medical_assist_hosp_price = 0
    BEGIN
    SET @medical_assist_hosp_price = null
    END
	  IF @medical_assist_hospital_name = ''
    BEGIN
    SET @medical_assist_hospital_name = null
    END
	  IF @medical_assist_script_meds = ''
    BEGIN
    SET @medical_assist_script_meds = null
    END
	  IF @medical_assist_script_price = 0
    BEGIN
    SET @medical_assist_script_price = null
    END
	  IF @medical_assist_script_quantity = 0
    BEGIN
    SET @medical_assist_script_quantity = null
    END
    SELECT [medical_assist_order_id] 
      FROM [dbo].[medical_assistance] 
       WHERE ([em_id] = @em_id)
       AND ([medical_assist_date] = @medical_assist_date)
       AND ([medical_assist_doctor_id] = @medical_assist_doctor_id or [medical_assist_doctor_id] is null)
       AND ([medical_assist_hosp_price] = @medical_assist_hosp_price or [medical_assist_hosp_price] is null)
       AND ([medical_assist_hospital_name] like @medical_assist_hospital_name or [medical_assist_hospital_name] is null)
       AND ([medical_assist_script_meds] like @medical_assist_script_meds or [medical_assist_script_meds] is null)
       AND ([medical_assist_script_price] = @medical_assist_script_price or [medical_assist_script_price] is null)
       AND ([medical_assist_script_quantity] = @medical_assist_script_quantity or [medical_assist_script_quantity] is null)
END
GO
/***********************************************************/
/*************************************************/
/****** - UPDATE STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_UPDATE_MEDICAL_ASSISTANCE]    Script Date: 8/29/2014 2:05:24 PM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_UPDATE_MEDICAL_ASSISTANCE]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_UPDATE_MEDICAL_ASSISTANCE]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_UPDATE_MEDICAL_ASSISTANCE]
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
    SET @em_id = null
    END
	  IF @medical_assist_date = '9/9/1900 12:00:00 AM'
    BEGIN
    SET @medical_assist_date = null
    END
	  IF @medical_assist_doctor_id = 0
    BEGIN
    SET @medical_assist_doctor_id = null
    END
	  IF @medical_assist_hosp_price = 0
    BEGIN
    SET @medical_assist_hosp_price = null
    END
	  IF @medical_assist_hospital_name = ''
    BEGIN
    SET @medical_assist_hospital_name = null
    END
	  IF @medical_assist_script_meds = ''
    BEGIN
    SET @medical_assist_script_meds = null
    END
	  IF @medical_assist_script_price = 0
    BEGIN
    SET @medical_assist_script_price = null
    END
	  IF @medical_assist_script_quantity = 0
    BEGIN
    SET @medical_assist_script_quantity = null
    END
	UPDATE [dbo].[medical_assistance]
       SET
		   [em_id] = @em_id,
		   [medical_assist_date] = @medical_assist_date,
		   [medical_assist_doctor_id] = @medical_assist_doctor_id,
		   [medical_assist_hosp_price] = @medical_assist_hosp_price,
		   [medical_assist_hospital_name] = @medical_assist_hospital_name,
		   [medical_assist_script_meds] = @medical_assist_script_meds,
		   [medical_assist_script_price] = @medical_assist_script_price,
		   [medical_assist_script_quantity] = @medical_assist_script_quantity
       WHERE medical_assist_order_id = @medical_assist_order_id
END
GO
/***********************************************************/
/*************************************************/
/****** - DELETE STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_DELETE_MEDICAL_ASSISTANCE]    Script Date: 8/29/2014 2:05:24 PM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_DELETE_MEDICAL_ASSISTANCE]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_DELETE_MEDICAL_ASSISTANCE]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_DELETE_MEDICAL_ASSISTANCE]
	@medical_assist_order_id int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	Delete dbo.medical_assistance
	where medical_assist_order_id = @medical_assist_order_id
END
GO
/***********************************************************/
/*************************************************/
/****** - WHERE CLAUSE STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_SELECT_MEDICAL_ASSISTANCE_WC]    Script Date: 8/29/2014 2:05:24 PM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_SELECT_MEDICAL_ASSISTANCE_WC]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_SELECT_MEDICAL_ASSISTANCE_WC]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_SELECT_MEDICAL_ASSISTANCE_WC]
	  @wareclause as varchar(MAX)
AS
Begin
    Declare @string as varchar(MAX)
	Set @string = 'Select * from medical_assistance where ' + @wareclause
	Exec(@string)
END
GO

/***********************************************************/
/*************************************************/
/****** - SELECT STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_SELECT_LOCATION]    Script Date: 8/29/2014 2:05:26 PM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_SELECT_LOCATION]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_SELECT_LOCATION]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_SELECT_LOCATION]
           @Location_ID as int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
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
  FROM [dbo].[location]
 WHERE Location_ID = @Location_ID
End
GO
/***********************************************************/
/*************************************************/
/****** - INSERT STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_INSERT_LOCATION]    Script Date: 8/29/2014 2:05:26 PM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_INSERT_LOCATION]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_INSERT_LOCATION]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_INSERT_LOCATION]
	  @type as varchar(30),
	  @city as varchar(30),
	  @state as varchar(2),
	  @zip as int,
	  @county as varchar(15),
	  @location_desc as varchar(3000),
	  @n_long as decimal,
	  @s_long as decimal,
	  @e_long as decimal,
	  @w_long as decimal,
	  @n_lat as decimal,
	  @s_lat as decimal,
	  @e_lat as decimal,
	  @w_lat as decimal
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	  IF @type = ''
    BEGIN
    SET @type = null
    END
	  IF @city = ''
    BEGIN
    SET @city = null
    END
	  IF @state = ''
    BEGIN
    SET @state = null
    END
	  IF @zip = 0
    BEGIN
    SET @zip = null
    END
	  IF @county = ''
    BEGIN
    SET @county = null
    END
	  IF @location_desc = ''
    BEGIN
    SET @location_desc = null
    END
	  IF @n_long = 0
    BEGIN
    SET @n_long = null
    END
	  IF @s_long = 0
    BEGIN
    SET @s_long = null
    END
	  IF @e_long = 0
    BEGIN
    SET @e_long = null
    END
	  IF @w_long = 0
    BEGIN
    SET @w_long = null
    END
	  IF @n_lat = 0
    BEGIN
    SET @n_lat = null
    END
	  IF @s_lat = 0
    BEGIN
    SET @s_lat = null
    END
	  IF @e_lat = 0
    BEGIN
    SET @e_lat = null
    END
	  IF @w_lat = 0
    BEGIN
    SET @w_lat = null
    END
	Insert INTO [dbo].[location]
           (
            [type]
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
            )
     VALUES (
            @type
           ,@city
           ,@state
           ,@zip
           ,@county
           ,@location_desc
           ,@n_long
           ,@s_long
           ,@e_long
           ,@w_long
           ,@n_lat
           ,@s_lat
           ,@e_lat
           ,@w_lat
            )
END
GO
/***********************************************************/
/*************************************************/
/****** - GET STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_GET_LOCATION]    Script Date: 8/29/2014 2:05:26 PM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_GET_LOCATION]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_GET_LOCATION]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_GET_LOCATION]
	  @type as varchar(30),
	  @city as varchar(30),
	  @state as varchar(2),
	  @zip as int,
	  @county as varchar(15),
	  @location_desc as varchar(3000),
	  @n_long as decimal,
	  @s_long as decimal,
	  @e_long as decimal,
	  @w_long as decimal,
	  @n_lat as decimal,
	  @s_lat as decimal,
	  @e_lat as decimal,
	  @w_lat as decimal
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	  IF @type = ''
    BEGIN
    SET @type = null
    END
	  IF @city = ''
    BEGIN
    SET @city = null
    END
	  IF @state = ''
    BEGIN
    SET @state = null
    END
	  IF @zip = 0
    BEGIN
    SET @zip = null
    END
	  IF @county = ''
    BEGIN
    SET @county = null
    END
	  IF @location_desc = ''
    BEGIN
    SET @location_desc = null
    END
	  IF @n_long = 0
    BEGIN
    SET @n_long = null
    END
	  IF @s_long = 0
    BEGIN
    SET @s_long = null
    END
	  IF @e_long = 0
    BEGIN
    SET @e_long = null
    END
	  IF @w_long = 0
    BEGIN
    SET @w_long = null
    END
	  IF @n_lat = 0
    BEGIN
    SET @n_lat = null
    END
	  IF @s_lat = 0
    BEGIN
    SET @s_lat = null
    END
	  IF @e_lat = 0
    BEGIN
    SET @e_lat = null
    END
	  IF @w_lat = 0
    BEGIN
    SET @w_lat = null
    END
    SELECT [Location_ID] 
      FROM [dbo].[location] 
       WHERE ([type] like @type)
       AND ([city] like @city)
       AND ([state] like @state)
       AND ([zip] = @zip)
       AND ([county] like @county or [county] is null)
       AND ([location_desc] like @location_desc or [location_desc] is null)
       AND ([n_long] = @n_long or [n_long] is null)
       AND ([s_long] = @s_long or [s_long] is null)
       AND ([e_long] = @e_long or [e_long] is null)
       AND ([w_long] = @w_long or [w_long] is null)
       AND ([n_lat] = @n_lat or [n_lat] is null)
       AND ([s_lat] = @s_lat or [s_lat] is null)
       AND ([e_lat] = @e_lat or [e_lat] is null)
       AND ([w_lat] = @w_lat or [w_lat] is null)
END
GO
/***********************************************************/
/*************************************************/
/****** - UPDATE STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_UPDATE_LOCATION]    Script Date: 8/29/2014 2:05:26 PM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_UPDATE_LOCATION]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_UPDATE_LOCATION]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_UPDATE_LOCATION]
	  @Location_ID as int,
	  @type as varchar(30),
	  @city as varchar(30),
	  @state as varchar(2),
	  @zip as int,
	  @county as varchar(15),
	  @location_desc as varchar(3000),
	  @n_long as decimal,
	  @s_long as decimal,
	  @e_long as decimal,
	  @w_long as decimal,
	  @n_lat as decimal,
	  @s_lat as decimal,
	  @e_lat as decimal,
	  @w_lat as decimal
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	  IF @type = ''
    BEGIN
    SET @type = null
    END
	  IF @city = ''
    BEGIN
    SET @city = null
    END
	  IF @state = ''
    BEGIN
    SET @state = null
    END
	  IF @zip = 0
    BEGIN
    SET @zip = null
    END
	  IF @county = ''
    BEGIN
    SET @county = null
    END
	  IF @location_desc = ''
    BEGIN
    SET @location_desc = null
    END
	  IF @n_long = 0
    BEGIN
    SET @n_long = null
    END
	  IF @s_long = 0
    BEGIN
    SET @s_long = null
    END
	  IF @e_long = 0
    BEGIN
    SET @e_long = null
    END
	  IF @w_long = 0
    BEGIN
    SET @w_long = null
    END
	  IF @n_lat = 0
    BEGIN
    SET @n_lat = null
    END
	  IF @s_lat = 0
    BEGIN
    SET @s_lat = null
    END
	  IF @e_lat = 0
    BEGIN
    SET @e_lat = null
    END
	  IF @w_lat = 0
    BEGIN
    SET @w_lat = null
    END
	UPDATE [dbo].[location]
       SET
		   [type] = @type,
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
/***********************************************************/
/*************************************************/
/****** - DELETE STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_DELETE_LOCATION]    Script Date: 8/29/2014 2:05:26 PM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_DELETE_LOCATION]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_DELETE_LOCATION]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_DELETE_LOCATION]
	@Location_ID int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	Delete dbo.location
	where Location_ID = @Location_ID
END
GO
/***********************************************************/
/*************************************************/
/****** - WHERE CLAUSE STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_SELECT_LOCATION_WC]    Script Date: 8/29/2014 2:05:26 PM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_SELECT_LOCATION_WC]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_SELECT_LOCATION_WC]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_SELECT_LOCATION_WC]
	  @wareclause as varchar(MAX)
AS
Begin
    Declare @string as varchar(MAX)
	Set @string = 'Select * from location where ' + @wareclause
	Exec(@string)
END
GO

/***********************************************************/
/*************************************************/
/****** - SELECT STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_SELECT_EMERGENCY_MEDICAL]    Script Date: 8/29/2014 2:05:29 PM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_SELECT_EMERGENCY_MEDICAL]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_SELECT_EMERGENCY_MEDICAL]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_SELECT_EMERGENCY_MEDICAL]
           @em_id as int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
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
/***********************************************************/
/*************************************************/
/****** - INSERT STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_INSERT_EMERGENCY_MEDICAL]    Script Date: 8/29/2014 2:05:29 PM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_INSERT_EMERGENCY_MEDICAL]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_INSERT_EMERGENCY_MEDICAL]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_INSERT_EMERGENCY_MEDICAL]
	  @client_id as int,
	  @ambulance_company_name as varchar(50),
	  @ambulance_identification as varchar(30),
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
	  @other_remarks as text,
	  @prescription_medicines as text,
	  @time_of_service as datetime,
	  @total_cost as money,
	  @deceased_id as int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	  IF @client_id = 0
    BEGIN
    SET @client_id = null
    END
	  IF @ambulance_company_name = ''
    BEGIN
    SET @ambulance_company_name = null
    END
	  IF @ambulance_identification = ''
    BEGIN
    SET @ambulance_identification = null
    END
	  IF @appointment_date = '9/9/1900 12:00:00 AM'
    BEGIN
    SET @appointment_date = null
    END
	  IF @area_of_specialty = ''
    BEGIN
    SET @area_of_specialty = null
    END
	  IF @assistance_order = ''
    BEGIN
    SET @assistance_order = null
    END
	  IF @date_of_service = '9/9/1900 12:00:00 AM'
    BEGIN
    SET @date_of_service = null
    END
	  IF @doctor_appointments = ''
    BEGIN
    SET @doctor_appointments = null
    END
	  IF @doctor_id = 0
    BEGIN
    SET @doctor_id = null
    END
	  IF @doctor_start_date = '9/9/1900 12:00:00 AM'
    BEGIN
    SET @doctor_start_date = null
    END
	  IF @driver_id = 0
    BEGIN
    SET @driver_id = null
    END
	  IF @educational_institution_name = ''
    BEGIN
    SET @educational_institution_name = null
    END
	  IF @hospital_name = ''
    BEGIN
    SET @hospital_name = null
    END
	  IF @lights_sirens_to_scene = ''
    BEGIN
    SET @lights_sirens_to_scene = null
    END
	  IF @location_type = ''
    BEGIN
    SET @location_type = null
    END
	  IF @number_of_days_admitted = 0
    BEGIN
    SET @number_of_days_admitted = null
    END
	  IF @office_location = ''
    BEGIN
    SET @office_location = null
    END
	  IF @time_of_service = '9/9/1900 12:00:00 AM'
    BEGIN
    SET @time_of_service = null
    END
	  IF @total_cost = 0
    BEGIN
    SET @total_cost = null
    END
	  IF @deceased_id = 0
    BEGIN
    SET @deceased_id = null
    END
	Insert INTO [dbo].[emergency_medical]
           (
            [client_id]
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
            )
     VALUES (
            @client_id
           ,@ambulance_company_name
           ,@ambulance_identification
           ,@appointment_date
           ,@area_of_specialty
           ,@assistance_order
           ,@date_of_service
           ,@degree_certifications
           ,@doctor_appointments
           ,@doctor_id
           ,@doctor_start_date
           ,@driver_id
           ,@educational_institution_name
           ,@external_examination
           ,@hospital_name
           ,@internal_examination
           ,@lights_sirens_to_scene
           ,@location_type
           ,@number_of_days_admitted
           ,@office_location
           ,@other_remarks
           ,@prescription_medicines
           ,@time_of_service
           ,@total_cost
           ,@deceased_id
            )
END
GO
/***********************************************************/
/*************************************************/
/****** - GET STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_GET_EMERGENCY_MEDICAL]    Script Date: 8/29/2014 2:05:29 PM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_GET_EMERGENCY_MEDICAL]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_GET_EMERGENCY_MEDICAL]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_GET_EMERGENCY_MEDICAL]
	  @client_id as int,
	  @ambulance_company_name as varchar(50),
	  @ambulance_identification as varchar(30),
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
	  @other_remarks as text,
	  @prescription_medicines as text,
	  @time_of_service as datetime,
	  @total_cost as money,
	  @deceased_id as int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	  IF @client_id = 0
    BEGIN
    SET @client_id = null
    END
	  IF @ambulance_company_name = ''
    BEGIN
    SET @ambulance_company_name = null
    END
	  IF @ambulance_identification = ''
    BEGIN
    SET @ambulance_identification = null
    END
	  IF @appointment_date = '9/9/1900 12:00:00 AM'
    BEGIN
    SET @appointment_date = null
    END
	  IF @area_of_specialty = ''
    BEGIN
    SET @area_of_specialty = null
    END
	  IF @assistance_order = ''
    BEGIN
    SET @assistance_order = null
    END
	  IF @date_of_service = '9/9/1900 12:00:00 AM'
    BEGIN
    SET @date_of_service = null
    END
	  IF @doctor_appointments = ''
    BEGIN
    SET @doctor_appointments = null
    END
	  IF @doctor_id = 0
    BEGIN
    SET @doctor_id = null
    END
	  IF @doctor_start_date = '9/9/1900 12:00:00 AM'
    BEGIN
    SET @doctor_start_date = null
    END
	  IF @driver_id = 0
    BEGIN
    SET @driver_id = null
    END
	  IF @educational_institution_name = ''
    BEGIN
    SET @educational_institution_name = null
    END
	  IF @hospital_name = ''
    BEGIN
    SET @hospital_name = null
    END
	  IF @lights_sirens_to_scene = ''
    BEGIN
    SET @lights_sirens_to_scene = null
    END
	  IF @location_type = ''
    BEGIN
    SET @location_type = null
    END
	  IF @number_of_days_admitted = 0
    BEGIN
    SET @number_of_days_admitted = null
    END
	  IF @office_location = ''
    BEGIN
    SET @office_location = null
    END
	  IF @time_of_service = '9/9/1900 12:00:00 AM'
    BEGIN
    SET @time_of_service = null
    END
	  IF @total_cost = 0
    BEGIN
    SET @total_cost = null
    END
	  IF @deceased_id = 0
    BEGIN
    SET @deceased_id = null
    END
    SELECT [em_id] 
      FROM [dbo].[emergency_medical] 
       WHERE ([client_id] = @client_id)
       AND ([ambulance_company_name] like @ambulance_company_name)
       AND ([ambulance_identification] like @ambulance_identification)
       AND ([appointment_date] = @appointment_date or [appointment_date] is null)
       AND ([area_of_specialty] like @area_of_specialty or [area_of_specialty] is null)
       AND ([assistance_order] like @assistance_order or [assistance_order] is null)
       AND ([date_of_service] = @date_of_service)
       AND ([degree_certifications] like @degree_certifications or [degree_certifications] is null)
       AND ([doctor_appointments] like @doctor_appointments or [doctor_appointments] is null)
       AND ([doctor_id] = @doctor_id or [doctor_id] is null)
       AND ([doctor_start_date] = @doctor_start_date or [doctor_start_date] is null)
       AND ([driver_id] = @driver_id or [driver_id] is null)
       AND ([educational_institution_name] like @educational_institution_name or [educational_institution_name] is null)
       AND ([external_examination] like @external_examination or [external_examination] is null)
       AND ([hospital_name] like @hospital_name or [hospital_name] is null)
       AND ([internal_examination] like @internal_examination or [internal_examination] is null)
       AND ([lights_sirens_to_scene] like @lights_sirens_to_scene or [lights_sirens_to_scene] is null)
       AND ([location_type] like @location_type or [location_type] is null)
       AND ([number_of_days_admitted] = @number_of_days_admitted or [number_of_days_admitted] is null)
       AND ([office_location] like @office_location or [office_location] is null)
       AND ([other_remarks] like @other_remarks or [other_remarks] is null)
       AND ([prescription_medicines] like @prescription_medicines or [prescription_medicines] is null)
       AND ([time_of_service] = @time_of_service or [time_of_service] is null)
       AND ([total_cost] = @total_cost or [total_cost] is null)
       AND ([deceased_id] = @deceased_id or [deceased_id] is null)
END
GO
/***********************************************************/
/*************************************************/
/****** - UPDATE STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_UPDATE_EMERGENCY_MEDICAL]    Script Date: 8/29/2014 2:05:29 PM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_UPDATE_EMERGENCY_MEDICAL]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_UPDATE_EMERGENCY_MEDICAL]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_UPDATE_EMERGENCY_MEDICAL]
	  @em_id as int,
	  @client_id as int,
	  @ambulance_company_name as varchar(50),
	  @ambulance_identification as varchar(30),
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
	  @other_remarks as text,
	  @prescription_medicines as text,
	  @time_of_service as datetime,
	  @total_cost as money,
	  @deceased_id as int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	  IF @client_id = 0
    BEGIN
    SET @client_id = null
    END
	  IF @ambulance_company_name = ''
    BEGIN
    SET @ambulance_company_name = null
    END
	  IF @ambulance_identification = ''
    BEGIN
    SET @ambulance_identification = null
    END
	  IF @appointment_date = '9/9/1900 12:00:00 AM'
    BEGIN
    SET @appointment_date = null
    END
	  IF @area_of_specialty = ''
    BEGIN
    SET @area_of_specialty = null
    END
	  IF @assistance_order = ''
    BEGIN
    SET @assistance_order = null
    END
	  IF @date_of_service = '9/9/1900 12:00:00 AM'
    BEGIN
    SET @date_of_service = null
    END
	  IF @doctor_appointments = ''
    BEGIN
    SET @doctor_appointments = null
    END
	  IF @doctor_id = 0
    BEGIN
    SET @doctor_id = null
    END
	  IF @doctor_start_date = '9/9/1900 12:00:00 AM'
    BEGIN
    SET @doctor_start_date = null
    END
	  IF @driver_id = 0
    BEGIN
    SET @driver_id = null
    END
	  IF @educational_institution_name = ''
    BEGIN
    SET @educational_institution_name = null
    END
	  IF @hospital_name = ''
    BEGIN
    SET @hospital_name = null
    END
	  IF @lights_sirens_to_scene = ''
    BEGIN
    SET @lights_sirens_to_scene = null
    END
	  IF @location_type = ''
    BEGIN
    SET @location_type = null
    END
	  IF @number_of_days_admitted = 0
    BEGIN
    SET @number_of_days_admitted = null
    END
	  IF @office_location = ''
    BEGIN
    SET @office_location = null
    END
	  IF @time_of_service = '9/9/1900 12:00:00 AM'
    BEGIN
    SET @time_of_service = null
    END
	  IF @total_cost = 0
    BEGIN
    SET @total_cost = null
    END
	  IF @deceased_id = 0
    BEGIN
    SET @deceased_id = null
    END
	UPDATE [dbo].[emergency_medical]
       SET
		   [client_id] = @client_id,
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
END
GO
/***********************************************************/
/*************************************************/
/****** - DELETE STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_DELETE_EMERGENCY_MEDICAL]    Script Date: 8/29/2014 2:05:29 PM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_DELETE_EMERGENCY_MEDICAL]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_DELETE_EMERGENCY_MEDICAL]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_DELETE_EMERGENCY_MEDICAL]
	@em_id int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	Delete dbo.emergency_medical
	where em_id = @em_id
END
GO
/***********************************************************/
/*************************************************/
/****** - WHERE CLAUSE STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_SELECT_EMERGENCY_MEDICAL_WC]    Script Date: 8/29/2014 2:05:29 PM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_SELECT_EMERGENCY_MEDICAL_WC]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_SELECT_EMERGENCY_MEDICAL_WC]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_SELECT_EMERGENCY_MEDICAL_WC]
	  @wareclause as varchar(MAX)
AS
Begin
    Declare @string as varchar(MAX)
	Set @string = 'Select * from emergency_medical where ' + @wareclause
	Exec(@string)
END
GO

/***********************************************************/
/*************************************************/
/****** - SELECT STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_SELECT_ALERT]    Script Date: 8/29/2014 2:05:31 PM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_SELECT_ALERT]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_SELECT_ALERT]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_SELECT_ALERT]
           @Alert_ID as int
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
/****** Object:  StoredProcedure [dbo].[SP_DMCS_INSERT_ALERT]    Script Date: 8/29/2014 2:05:31 PM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_INSERT_ALERT]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_INSERT_ALERT]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_INSERT_ALERT]
	  @Alert_Message as varchar(MAX),
	  @Alert_Type as varchar(15),
	  @Date as datetime,
	  @Person_ID as int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	  IF @Alert_Message = ''
    BEGIN
    SET @Alert_Message = null
    END
	  IF @Alert_Type = ''
    BEGIN
    SET @Alert_Type = null
    END
	  IF @Date = '9/9/1900 12:00:00 AM'
    BEGIN
    SET @Date = null
    END
	  IF @Person_ID = 0
    BEGIN
    SET @Person_ID = null
    END
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
/****** Object:  StoredProcedure [dbo].[SP_DMCS_GET_ALERT]    Script Date: 8/29/2014 2:05:31 PM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_GET_ALERT]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_GET_ALERT]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_GET_ALERT]
	  @Alert_Message as varchar(MAX),
	  @Alert_Type as varchar(15),
	  @Date as datetime,
	  @Person_ID as int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	  IF @Alert_Message = ''
    BEGIN
    SET @Alert_Message = null
    END
	  IF @Alert_Type = ''
    BEGIN
    SET @Alert_Type = null
    END
	  IF @Date = '9/9/1900 12:00:00 AM'
    BEGIN
    SET @Date = null
    END
	  IF @Person_ID = 0
    BEGIN
    SET @Person_ID = null
    END
    SELECT [Alert_ID] 
      FROM [dbo].[Alert] 
       WHERE ([Alert_Message] like @Alert_Message)
       AND ([Alert_Type] like @Alert_Type)
       AND ([Date] = @Date)
       AND ([Person_ID] = @Person_ID)
END
GO
/***********************************************************/
/*************************************************/
/****** - UPDATE STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_UPDATE_ALERT]    Script Date: 8/29/2014 2:05:31 PM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_UPDATE_ALERT]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_UPDATE_ALERT]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_UPDATE_ALERT]
	  @Alert_ID as int,
	  @Alert_Message as varchar(MAX),
	  @Alert_Type as varchar(15),
	  @Date as datetime,
	  @Person_ID as int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	  IF @Alert_Message = ''
    BEGIN
    SET @Alert_Message = null
    END
	  IF @Alert_Type = ''
    BEGIN
    SET @Alert_Type = null
    END
	  IF @Date = '9/9/1900 12:00:00 AM'
    BEGIN
    SET @Date = null
    END
	  IF @Person_ID = 0
    BEGIN
    SET @Person_ID = null
    END
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
/****** Object:  StoredProcedure [dbo].[SP_DMCS_DELETE_ALERT]    Script Date: 8/29/2014 2:05:31 PM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_DELETE_ALERT]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_DELETE_ALERT]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_DELETE_ALERT]
	@Alert_ID int
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
/****** Object:  StoredProcedure [dbo].[SP_DMCS_SELECT_ALERT_WC]    Script Date: 8/29/2014 2:05:31 PM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_SELECT_ALERT_WC]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_SELECT_ALERT_WC]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_SELECT_ALERT_WC]
	  @wareclause as varchar(MAX)
AS
Begin
    Declare @string as varchar(MAX)
	Set @string = 'Select * from Alert where ' + @wareclause
	Exec(@string)
END
GO

/***********************************************************/
/*************************************************/
/****** - SELECT STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_SELECT_DECEASED]    Script Date: 8/29/2014 2:05:35 PM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_SELECT_DECEASED]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_SELECT_DECEASED]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_SELECT_DECEASED]
           @deceased_id as int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
SELECT [deceased_id]
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
/***********************************************************/
/*************************************************/
/****** - INSERT STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_INSERT_DECEASED]    Script Date: 8/29/2014 2:05:35 PM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_INSERT_DECEASED]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_INSERT_DECEASED]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_INSERT_DECEASED]
	  @deceased_id as int,
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
	  IF @date_of_autopsy = '9/9/1900 12:00:00 AM'
    BEGIN
    SET @date_of_autopsy = null
    END
	  IF @time_of_death = '9/9/1900 12:00:00 AM'
    BEGIN
    SET @time_of_death = null
    END
	Insert INTO [dbo].[deceased]
           (
            [deceased_id]
           ,[date_of_autopsy]
           ,[external_exam]
           ,[identifying_marks]
           ,[internal_exam]
           ,[reason_of_death]
           ,[time_of_death]
            )
     VALUES (
            @deceased_id
           ,@date_of_autopsy
           ,@external_exam
           ,@identifying_marks
           ,@internal_exam
           ,@reason_of_death
           ,@time_of_death
            )
END
GO
/***********************************************************/
/*************************************************/
/****** - GET STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_GET_DECEASED]    Script Date: 8/29/2014 2:05:35 PM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_GET_DECEASED]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_GET_DECEASED]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_GET_DECEASED]
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
	  IF @date_of_autopsy = '9/9/1900 12:00:00 AM'
    BEGIN
    SET @date_of_autopsy = null
    END
	  IF @time_of_death = '9/9/1900 12:00:00 AM'
    BEGIN
    SET @time_of_death = null
    END
    SELECT [deceased_id] 
      FROM [dbo].[deceased] 
       WHERE ([date_of_autopsy] = @date_of_autopsy)
       AND ([external_exam] like @external_exam or [external_exam] is null)
       AND ([identifying_marks] like @identifying_marks)
       AND ([internal_exam] like @internal_exam or [internal_exam] is null)
       AND ([reason_of_death] like @reason_of_death or [reason_of_death] is null)
       AND ([time_of_death] = @time_of_death or [time_of_death] is null)
END
GO
/***********************************************************/
/*************************************************/
/****** - UPDATE STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_UPDATE_DECEASED]    Script Date: 8/29/2014 2:05:35 PM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_UPDATE_DECEASED]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_UPDATE_DECEASED]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_UPDATE_DECEASED]
	  @deceased_id as int,
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
	  IF @date_of_autopsy = '9/9/1900 12:00:00 AM'
    BEGIN
    SET @date_of_autopsy = null
    END
	  IF @time_of_death = '9/9/1900 12:00:00 AM'
    BEGIN
    SET @time_of_death = null
    END
	UPDATE [dbo].[deceased]
       SET
		   [date_of_autopsy] = @date_of_autopsy,
		   [external_exam] = @external_exam,
		   [identifying_marks] = @identifying_marks,
		   [internal_exam] = @internal_exam,
		   [reason_of_death] = @reason_of_death,
		   [time_of_death] = @time_of_death
       WHERE deceased_id = @deceased_id
END
GO
/***********************************************************/
/*************************************************/
/****** - DELETE STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_DELETE_DECEASED]    Script Date: 8/29/2014 2:05:35 PM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_DELETE_DECEASED]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_DELETE_DECEASED]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_DELETE_DECEASED]
	@deceased_id int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	Delete dbo.deceased
	where deceased_id = @deceased_id
END
GO
/***********************************************************/
/*************************************************/
/****** - WHERE CLAUSE STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_SELECT_DECEASED_WC]    Script Date: 8/29/2014 2:05:35 PM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_SELECT_DECEASED_WC]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_SELECT_DECEASED_WC]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_SELECT_DECEASED_WC]
	  @wareclause as varchar(MAX)
AS
Begin
    Declare @string as varchar(MAX)
	Set @string = 'Select * from deceased where ' + @wareclause
	Exec(@string)
END
GO

/***********************************************************/
/*************************************************/
/****** - SELECT STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_SELECT_TIER_REQ]    Script Date: 8/29/2014 2:05:37 PM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_SELECT_TIER_REQ]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_SELECT_TIER_REQ]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_SELECT_TIER_REQ]
           @tier_req_id as int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
SELECT [tier_req_id]
      ,[req_id]
      ,[tier_id]
  FROM [dbo].[tier_req]
 WHERE tier_req_id = @tier_req_id
End
GO
/***********************************************************/
/*************************************************/
/****** - INSERT STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_INSERT_TIER_REQ]    Script Date: 8/29/2014 2:05:37 PM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_INSERT_TIER_REQ]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_INSERT_TIER_REQ]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_INSERT_TIER_REQ]
	  @req_id as int,
	  @tier_id as int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	  IF @req_id = 0
    BEGIN
    SET @req_id = null
    END
	  IF @tier_id = 0
    BEGIN
    SET @tier_id = null
    END
	Insert INTO [dbo].[tier_req]
           (
            [req_id]
           ,[tier_id]
            )
     VALUES (
            @req_id
           ,@tier_id
            )
END
GO
/***********************************************************/
/*************************************************/
/****** - GET STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_GET_TIER_REQ]    Script Date: 8/29/2014 2:05:37 PM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_GET_TIER_REQ]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_GET_TIER_REQ]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_GET_TIER_REQ]
	  @req_id as int,
	  @tier_id as int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	  IF @req_id = 0
    BEGIN
    SET @req_id = null
    END
	  IF @tier_id = 0
    BEGIN
    SET @tier_id = null
    END
    SELECT [tier_req_id] 
      FROM [dbo].[tier_req] 
       WHERE ([req_id] = @req_id)
       AND ([tier_id] = @tier_id)
END
GO
/***********************************************************/
/*************************************************/
/****** - UPDATE STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_UPDATE_TIER_REQ]    Script Date: 8/29/2014 2:05:37 PM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_UPDATE_TIER_REQ]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_UPDATE_TIER_REQ]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_UPDATE_TIER_REQ]
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
    SET @req_id = null
    END
	  IF @tier_id = 0
    BEGIN
    SET @tier_id = null
    END
	UPDATE [dbo].[tier_req]
       SET
		   [req_id] = @req_id,
		   [tier_id] = @tier_id
       WHERE tier_req_id = @tier_req_id
END
GO
/***********************************************************/
/*************************************************/
/****** - DELETE STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_DELETE_TIER_REQ]    Script Date: 8/29/2014 2:05:37 PM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_DELETE_TIER_REQ]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_DELETE_TIER_REQ]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_DELETE_TIER_REQ]
	@tier_req_id int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	Delete dbo.tier_req
	where tier_req_id = @tier_req_id
END
GO
/***********************************************************/
/*************************************************/
/****** - WHERE CLAUSE STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_SELECT_TIER_REQ_WC]    Script Date: 8/29/2014 2:05:37 PM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_SELECT_TIER_REQ_WC]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_SELECT_TIER_REQ_WC]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_SELECT_TIER_REQ_WC]
	  @wareclause as varchar(MAX)
AS
Begin
    Declare @string as varchar(MAX)
	Set @string = 'Select * from tier_req where ' + @wareclause
	Exec(@string)
END
GO

/***********************************************************/
/*************************************************/
/****** - SELECT STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_SELECT_TIER]    Script Date: 8/29/2014 2:05:40 PM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_SELECT_TIER]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_SELECT_TIER]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_SELECT_TIER]
           @tier_id as int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
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
/***********************************************************/
/*************************************************/
/****** - INSERT STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_INSERT_TIER]    Script Date: 8/29/2014 2:05:40 PM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_INSERT_TIER]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_INSERT_TIER]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_INSERT_TIER]
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
	  IF @include_req = ''
    BEGIN
    SET @include_req = null
    END
	  IF @campaign_id = 0
    BEGIN
    SET @campaign_id = null
    END
	  IF @Tier_Age_Begin_Month = 0
    BEGIN
    SET @Tier_Age_Begin_Month = null
    END
	  IF @Tier_Age_Begin_Year = 0
    BEGIN
    SET @Tier_Age_Begin_Year = null
    END
	  IF @Tier_Age_End_Month = 0
    BEGIN
    SET @Tier_Age_End_Month = null
    END
	  IF @Tier_Age_End_Year = 0
    BEGIN
    SET @Tier_Age_End_Year = null
    END
	Insert INTO [dbo].[tier]
           (
            [include_req]
           ,[campaign_id]
           ,[Tier_Age_Begin_Month]
           ,[Tier_Age_Begin_Year]
           ,[Tier_Age_End_Month]
           ,[Tier_Age_End_Year]
            )
     VALUES (
            @include_req
           ,@campaign_id
           ,@Tier_Age_Begin_Month
           ,@Tier_Age_Begin_Year
           ,@Tier_Age_End_Month
           ,@Tier_Age_End_Year
            )
END
GO
/***********************************************************/
/*************************************************/
/****** - GET STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_GET_TIER]    Script Date: 8/29/2014 2:05:40 PM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_GET_TIER]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_GET_TIER]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_GET_TIER]
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
	  IF @include_req = ''
    BEGIN
    SET @include_req = null
    END
	  IF @campaign_id = 0
    BEGIN
    SET @campaign_id = null
    END
	  IF @Tier_Age_Begin_Month = 0
    BEGIN
    SET @Tier_Age_Begin_Month = null
    END
	  IF @Tier_Age_Begin_Year = 0
    BEGIN
    SET @Tier_Age_Begin_Year = null
    END
	  IF @Tier_Age_End_Month = 0
    BEGIN
    SET @Tier_Age_End_Month = null
    END
	  IF @Tier_Age_End_Year = 0
    BEGIN
    SET @Tier_Age_End_Year = null
    END
    SELECT [tier_id] 
      FROM [dbo].[tier] 
       WHERE ([include_req] = @include_req)
       AND ([campaign_id] = @campaign_id)
       AND ([Tier_Age_Begin_Month] = @Tier_Age_Begin_Month or [Tier_Age_Begin_Month] is null)
       AND ([Tier_Age_Begin_Year] = @Tier_Age_Begin_Year or [Tier_Age_Begin_Year] is null)
       AND ([Tier_Age_End_Month] = @Tier_Age_End_Month or [Tier_Age_End_Month] is null)
       AND ([Tier_Age_End_Year] = @Tier_Age_End_Year or [Tier_Age_End_Year] is null)
END
GO
/***********************************************************/
/*************************************************/
/****** - UPDATE STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_UPDATE_TIER]    Script Date: 8/29/2014 2:05:40 PM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_UPDATE_TIER]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_UPDATE_TIER]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_UPDATE_TIER]
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
	  IF @include_req = ''
    BEGIN
    SET @include_req = null
    END
	  IF @campaign_id = 0
    BEGIN
    SET @campaign_id = null
    END
	  IF @Tier_Age_Begin_Month = 0
    BEGIN
    SET @Tier_Age_Begin_Month = null
    END
	  IF @Tier_Age_Begin_Year = 0
    BEGIN
    SET @Tier_Age_Begin_Year = null
    END
	  IF @Tier_Age_End_Month = 0
    BEGIN
    SET @Tier_Age_End_Month = null
    END
	  IF @Tier_Age_End_Year = 0
    BEGIN
    SET @Tier_Age_End_Year = null
    END
	UPDATE [dbo].[tier]
       SET
		   [include_req] = @include_req,
		   [campaign_id] = @campaign_id,
		   [Tier_Age_Begin_Month] = @Tier_Age_Begin_Month,
		   [Tier_Age_Begin_Year] = @Tier_Age_Begin_Year,
		   [Tier_Age_End_Month] = @Tier_Age_End_Month,
		   [Tier_Age_End_Year] = @Tier_Age_End_Year
       WHERE tier_id = @tier_id
END
GO
/***********************************************************/
/*************************************************/
/****** - DELETE STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_DELETE_TIER]    Script Date: 8/29/2014 2:05:40 PM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_DELETE_TIER]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_DELETE_TIER]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_DELETE_TIER]
	@tier_id int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	Delete dbo.tier
	where tier_id = @tier_id
END
GO
/***********************************************************/
/*************************************************/
/****** - WHERE CLAUSE STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_SELECT_TIER_WC]    Script Date: 8/29/2014 2:05:40 PM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_SELECT_TIER_WC]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_SELECT_TIER_WC]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_SELECT_TIER_WC]
	  @wareclause as varchar(MAX)
AS
Begin
    Declare @string as varchar(MAX)
	Set @string = 'Select * from tier where ' + @wareclause
	Exec(@string)
END
GO

/***********************************************************/
/*************************************************/
/****** - SELECT STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_SELECT_CLIENT]    Script Date: 8/29/2014 2:05:42 PM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_SELECT_CLIENT]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_SELECT_CLIENT]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_SELECT_CLIENT]
           @client_id as int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
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
 WHERE client_id = @client_id
End
GO
/***********************************************************/
/*************************************************/
/****** - INSERT STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_INSERT_CLIENT]    Script Date: 8/29/2014 2:05:42 PM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_INSERT_CLIENT]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_INSERT_CLIENT]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_INSERT_CLIENT]
	  @client_id as int,
	  @client_status as char(1),
	  @ethnicity as varchar(15),
	  @eye_color as varchar(10),
	  @hair_color as varchar(10),
	  @height as varchar(10),
	  @picture as image,
	  @weight as int,
	  @skin_color as varchar(15),
	  @Info_Field as text,
	  @Client_Shelter_ID as int,
	  @Emergency_Contact_Name as varchar(25),
	  @Emergency_Contact_Number as varchar(11),
	  @Subscribed_Alerts as char(1)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	  IF @client_status = ''
    BEGIN
    SET @client_status = null
    END
	  IF @ethnicity = ''
    BEGIN
    SET @ethnicity = null
    END
	  IF @eye_color = ''
    BEGIN
    SET @eye_color = null
    END
	  IF @hair_color = ''
    BEGIN
    SET @hair_color = null
    END
	  IF @height = ''
    BEGIN
    SET @height = null
    END
	  IF @weight = 0
    BEGIN
    SET @weight = null
    END
	  IF @skin_color = ''
    BEGIN
    SET @skin_color = null
    END
	  IF @Client_Shelter_ID = 0
    BEGIN
    SET @Client_Shelter_ID = null
    END
	  IF @Emergency_Contact_Name = ''
    BEGIN
    SET @Emergency_Contact_Name = null
    END
	  IF @Emergency_Contact_Number = ''
    BEGIN
    SET @Emergency_Contact_Number = null
    END
	  IF @Subscribed_Alerts = ''
    BEGIN
    SET @Subscribed_Alerts = null
    END
	Insert INTO [dbo].[client]
           (
            [client_id]
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
            )
     VALUES (
            @client_id
           ,@client_status
           ,@ethnicity
           ,@eye_color
           ,@hair_color
           ,@height
           ,@picture
           ,@weight
           ,@skin_color
           ,@Info_Field
           ,@Client_Shelter_ID
           ,@Emergency_Contact_Name
           ,@Emergency_Contact_Number
           ,@Subscribed_Alerts
            )
END
GO
/***********************************************************/
/*************************************************/
/****** - GET STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_GET_CLIENT]    Script Date: 8/29/2014 2:05:42 PM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_GET_CLIENT]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_GET_CLIENT]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_GET_CLIENT]
	  @client_status as char(1),
	  @ethnicity as varchar(15),
	  @eye_color as varchar(10),
	  @hair_color as varchar(10),
	  @height as varchar(10),
	  @picture as image,
	  @weight as int,
	  @skin_color as varchar(15),
	  @Info_Field as text,
	  @Client_Shelter_ID as int,
	  @Emergency_Contact_Name as varchar(25),
	  @Emergency_Contact_Number as varchar(11),
	  @Subscribed_Alerts as char(1)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	  IF @client_status = ''
    BEGIN
    SET @client_status = null
    END
	  IF @ethnicity = ''
    BEGIN
    SET @ethnicity = null
    END
	  IF @eye_color = ''
    BEGIN
    SET @eye_color = null
    END
	  IF @hair_color = ''
    BEGIN
    SET @hair_color = null
    END
	  IF @height = ''
    BEGIN
    SET @height = null
    END
	  IF @weight = 0
    BEGIN
    SET @weight = null
    END
	  IF @skin_color = ''
    BEGIN
    SET @skin_color = null
    END
	  IF @Client_Shelter_ID = 0
    BEGIN
    SET @Client_Shelter_ID = null
    END
	  IF @Emergency_Contact_Name = ''
    BEGIN
    SET @Emergency_Contact_Name = null
    END
	  IF @Emergency_Contact_Number = ''
    BEGIN
    SET @Emergency_Contact_Number = null
    END
	  IF @Subscribed_Alerts = ''
    BEGIN
    SET @Subscribed_Alerts = null
    END
    SELECT [client_id] 
      FROM [dbo].[client] 
       WHERE ([client_status] = @client_status)
       AND ([ethnicity] like @ethnicity or [ethnicity] is null)
       AND ([eye_color] like @eye_color or [eye_color] is null)
       AND ([hair_color] like @hair_color or [hair_color] is null)
       AND ([height] like @height or [height] is null)
       AND ([weight] = @weight or [weight] is null)
       AND ([skin_color] like @skin_color or [skin_color] is null)
       AND ([Info_Field] like @Info_Field or [Info_Field] is null)
       AND ([Client_Shelter_ID] = @Client_Shelter_ID or [Client_Shelter_ID] is null)
       AND ([Emergency_Contact_Name] like @Emergency_Contact_Name or [Emergency_Contact_Name] is null)
       AND ([Emergency_Contact_Number] like @Emergency_Contact_Number or [Emergency_Contact_Number] is null)
       AND ([Subscribed_Alerts] = @Subscribed_Alerts)
END
GO
/***********************************************************/
/*************************************************/
/****** - UPDATE STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_UPDATE_CLIENT]    Script Date: 8/29/2014 2:05:42 PM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_UPDATE_CLIENT]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_UPDATE_CLIENT]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_UPDATE_CLIENT]
	  @client_id as int,
	  @client_status as char(1),
	  @ethnicity as varchar(15),
	  @eye_color as varchar(10),
	  @hair_color as varchar(10),
	  @height as varchar(10),
	  @picture as image,
	  @weight as int,
	  @skin_color as varchar(15),
	  @Info_Field as text,
	  @Client_Shelter_ID as int,
	  @Emergency_Contact_Name as varchar(25),
	  @Emergency_Contact_Number as varchar(11),
	  @Subscribed_Alerts as char(1)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	  IF @client_status = ''
    BEGIN
    SET @client_status = null
    END
	  IF @ethnicity = ''
    BEGIN
    SET @ethnicity = null
    END
	  IF @eye_color = ''
    BEGIN
    SET @eye_color = null
    END
	  IF @hair_color = ''
    BEGIN
    SET @hair_color = null
    END
	  IF @height = ''
    BEGIN
    SET @height = null
    END
	  IF @weight = 0
    BEGIN
    SET @weight = null
    END
	  IF @skin_color = ''
    BEGIN
    SET @skin_color = null
    END
	  IF @Client_Shelter_ID = 0
    BEGIN
    SET @Client_Shelter_ID = null
    END
	  IF @Emergency_Contact_Name = ''
    BEGIN
    SET @Emergency_Contact_Name = null
    END
	  IF @Emergency_Contact_Number = ''
    BEGIN
    SET @Emergency_Contact_Number = null
    END
	  IF @Subscribed_Alerts = ''
    BEGIN
    SET @Subscribed_Alerts = null
    END
	UPDATE [dbo].[client]
       SET
		   [client_status] = @client_status,
		   [ethnicity] = @ethnicity,
		   [eye_color] = @eye_color,
		   [hair_color] = @hair_color,
		   [height] = @height,
		   [picture] = @picture,
		   [weight] = @weight,
		   [skin_color] = @skin_color,
		   [Info_Field] = @Info_Field,
		   [Client_Shelter_ID] = @Client_Shelter_ID,
		   [Emergency_Contact_Name] = @Emergency_Contact_Name,
		   [Emergency_Contact_Number] = @Emergency_Contact_Number,
		   [Subscribed_Alerts] = @Subscribed_Alerts
       WHERE client_id = @client_id
END
GO
/***********************************************************/
/*************************************************/
/****** - DELETE STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_DELETE_CLIENT]    Script Date: 8/29/2014 2:05:43 PM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_DELETE_CLIENT]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_DELETE_CLIENT]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_DELETE_CLIENT]
	@client_id int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	Delete dbo.client
	where client_id = @client_id
END
GO
/***********************************************************/
/*************************************************/
/****** - WHERE CLAUSE STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_SELECT_CLIENT_WC]    Script Date: 8/29/2014 2:05:43 PM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_SELECT_CLIENT_WC]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_SELECT_CLIENT_WC]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_SELECT_CLIENT_WC]
	  @wareclause as varchar(MAX)
AS
Begin
    Declare @string as varchar(MAX)
	Set @string = 'Select * from client where ' + @wareclause
	Exec(@string)
END
GO

/***********************************************************/
/*************************************************/
/****** - SELECT STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_SELECT_CAMPAIGN]    Script Date: 8/29/2014 2:05:45 PM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_SELECT_CAMPAIGN]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_SELECT_CAMPAIGN]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_SELECT_CAMPAIGN]
           @campaign_id as int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
SELECT [campaign_id]
      ,[campaign_name]
      ,[campaign_start_date]
      ,[campaign_end_date]
  FROM [dbo].[campaign]
 WHERE campaign_id = @campaign_id
End
GO
/***********************************************************/
/*************************************************/
/****** - INSERT STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_INSERT_CAMPAIGN]    Script Date: 8/29/2014 2:05:45 PM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_INSERT_CAMPAIGN]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_INSERT_CAMPAIGN]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_INSERT_CAMPAIGN]
	  @campaign_name as varchar(50),
	  @campaign_start_date as datetime,
	  @campaign_end_date as datetime
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	  IF @campaign_name = ''
    BEGIN
    SET @campaign_name = null
    END
	  IF @campaign_start_date = '9/9/1900 12:00:00 AM'
    BEGIN
    SET @campaign_start_date = null
    END
	  IF @campaign_end_date = '9/9/1900 12:00:00 AM'
    BEGIN
    SET @campaign_end_date = null
    END
	Insert INTO [dbo].[campaign]
           (
            [campaign_name]
           ,[campaign_start_date]
           ,[campaign_end_date]
            )
     VALUES (
            @campaign_name
           ,@campaign_start_date
           ,@campaign_end_date
            )
END
GO
/***********************************************************/
/*************************************************/
/****** - GET STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_GET_CAMPAIGN]    Script Date: 8/29/2014 2:05:45 PM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_GET_CAMPAIGN]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_GET_CAMPAIGN]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_GET_CAMPAIGN]
	  @campaign_name as varchar(50),
	  @campaign_start_date as datetime,
	  @campaign_end_date as datetime
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	  IF @campaign_name = ''
    BEGIN
    SET @campaign_name = null
    END
	  IF @campaign_start_date = '9/9/1900 12:00:00 AM'
    BEGIN
    SET @campaign_start_date = null
    END
	  IF @campaign_end_date = '9/9/1900 12:00:00 AM'
    BEGIN
    SET @campaign_end_date = null
    END
    SELECT [campaign_id] 
      FROM [dbo].[campaign] 
       WHERE ([campaign_name] like @campaign_name or [campaign_name] is null)
       AND ([campaign_start_date] = @campaign_start_date or [campaign_start_date] is null)
       AND ([campaign_end_date] = @campaign_end_date or [campaign_end_date] is null)
END
GO
/***********************************************************/
/*************************************************/
/****** - UPDATE STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_UPDATE_CAMPAIGN]    Script Date: 8/29/2014 2:05:45 PM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_UPDATE_CAMPAIGN]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_UPDATE_CAMPAIGN]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_UPDATE_CAMPAIGN]
	  @campaign_id as int,
	  @campaign_name as varchar(50),
	  @campaign_start_date as datetime,
	  @campaign_end_date as datetime
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	  IF @campaign_name = ''
    BEGIN
    SET @campaign_name = null
    END
	  IF @campaign_start_date = '9/9/1900 12:00:00 AM'
    BEGIN
    SET @campaign_start_date = null
    END
	  IF @campaign_end_date = '9/9/1900 12:00:00 AM'
    BEGIN
    SET @campaign_end_date = null
    END
	UPDATE [dbo].[campaign]
       SET
		   [campaign_name] = @campaign_name,
		   [campaign_start_date] = @campaign_start_date,
		   [campaign_end_date] = @campaign_end_date
       WHERE campaign_id = @campaign_id
END
GO
/***********************************************************/
/*************************************************/
/****** - DELETE STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_DELETE_CAMPAIGN]    Script Date: 8/29/2014 2:05:45 PM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_DELETE_CAMPAIGN]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_DELETE_CAMPAIGN]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_DELETE_CAMPAIGN]
	@campaign_id int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	Delete dbo.campaign
	where campaign_id = @campaign_id
END
GO
/***********************************************************/
/*************************************************/
/****** - WHERE CLAUSE STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_SELECT_CAMPAIGN_WC]    Script Date: 8/29/2014 2:05:45 PM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_SELECT_CAMPAIGN_WC]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_SELECT_CAMPAIGN_WC]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_SELECT_CAMPAIGN_WC]
	  @wareclause as varchar(MAX)
AS
Begin
    Declare @string as varchar(MAX)
	Set @string = 'Select * from campaign where ' + @wareclause
	Exec(@string)
END
GO

/***********************************************************/
/*************************************************/
/****** - SELECT STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_SELECT_CLIENT_SHELTER]    Script Date: 8/29/2014 2:05:47 PM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_SELECT_CLIENT_SHELTER]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_SELECT_CLIENT_SHELTER]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_SELECT_CLIENT_SHELTER]
           @Client_Shelter_ID as int
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
/****** Object:  StoredProcedure [dbo].[SP_DMCS_INSERT_CLIENT_SHELTER]    Script Date: 8/29/2014 2:05:47 PM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_INSERT_CLIENT_SHELTER]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_INSERT_CLIENT_SHELTER]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_INSERT_CLIENT_SHELTER]
	  @Shelter_ID as int,
	  @Client_ID as int,
	  @Current_address as varchar(30),
	  @Current_State as varchar(3),
	  @Current_City as varchar(30),
	  @Current_Zip as int,
	  @Client_registration_status as varchar(30),
	  @Household_size as int,
	  @Shelter_supplies as varchar(30),
	  @Shelter_occupancy_current as varchar(30),
	  @New_household_registered as varchar(30),
	  @New_Shelter_address as varchar(30),
	  @New_Shelter_city as varchar(30),
	  @New_Shelter_State as varchar(30),
	  @New_Shelter_Zip as int,
	  @New_Contact_Number as int,
	  @Current_household_members_safe as varchar(30),
	  @CheckIn_Date as datetime,
	  @CheckOut_Date as datetime
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	  IF @Shelter_ID = 0
    BEGIN
    SET @Shelter_ID = null
    END
	  IF @Client_ID = 0
    BEGIN
    SET @Client_ID = null
    END
	  IF @Current_address = ''
    BEGIN
    SET @Current_address = null
    END
	  IF @Current_State = ''
    BEGIN
    SET @Current_State = null
    END
	  IF @Current_City = ''
    BEGIN
    SET @Current_City = null
    END
	  IF @Current_Zip = 0
    BEGIN
    SET @Current_Zip = null
    END
	  IF @Client_registration_status = ''
    BEGIN
    SET @Client_registration_status = null
    END
	  IF @Household_size = 0
    BEGIN
    SET @Household_size = null
    END
	  IF @Shelter_supplies = ''
    BEGIN
    SET @Shelter_supplies = null
    END
	  IF @Shelter_occupancy_current = ''
    BEGIN
    SET @Shelter_occupancy_current = null
    END
	  IF @New_household_registered = ''
    BEGIN
    SET @New_household_registered = null
    END
	  IF @New_Shelter_address = ''
    BEGIN
    SET @New_Shelter_address = null
    END
	  IF @New_Shelter_city = ''
    BEGIN
    SET @New_Shelter_city = null
    END
	  IF @New_Shelter_State = ''
    BEGIN
    SET @New_Shelter_State = null
    END
	  IF @New_Shelter_Zip = 0
    BEGIN
    SET @New_Shelter_Zip = null
    END
	  IF @New_Contact_Number = 0
    BEGIN
    SET @New_Contact_Number = null
    END
	  IF @Current_household_members_safe = ''
    BEGIN
    SET @Current_household_members_safe = null
    END
	  IF @CheckIn_Date = '9/9/1900 12:00:00 AM'
    BEGIN
    SET @CheckIn_Date = null
    END
	  IF @CheckOut_Date = '9/9/1900 12:00:00 AM'
    BEGIN
    SET @CheckOut_Date = null
    END
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
/****** Object:  StoredProcedure [dbo].[SP_DMCS_GET_CLIENT_SHELTER]    Script Date: 8/29/2014 2:05:47 PM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_GET_CLIENT_SHELTER]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_GET_CLIENT_SHELTER]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_GET_CLIENT_SHELTER]
	  @Shelter_ID as int,
	  @Client_ID as int,
	  @Current_address as varchar(30),
	  @Current_State as varchar(3),
	  @Current_City as varchar(30),
	  @Current_Zip as int,
	  @Client_registration_status as varchar(30),
	  @Household_size as int,
	  @Shelter_supplies as varchar(30),
	  @Shelter_occupancy_current as varchar(30),
	  @New_household_registered as varchar(30),
	  @New_Shelter_address as varchar(30),
	  @New_Shelter_city as varchar(30),
	  @New_Shelter_State as varchar(30),
	  @New_Shelter_Zip as int,
	  @New_Contact_Number as int,
	  @Current_household_members_safe as varchar(30),
	  @CheckIn_Date as datetime,
	  @CheckOut_Date as datetime
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	  IF @Shelter_ID = 0
    BEGIN
    SET @Shelter_ID = null
    END
	  IF @Client_ID = 0
    BEGIN
    SET @Client_ID = null
    END
	  IF @Current_address = ''
    BEGIN
    SET @Current_address = null
    END
	  IF @Current_State = ''
    BEGIN
    SET @Current_State = null
    END
	  IF @Current_City = ''
    BEGIN
    SET @Current_City = null
    END
	  IF @Current_Zip = 0
    BEGIN
    SET @Current_Zip = null
    END
	  IF @Client_registration_status = ''
    BEGIN
    SET @Client_registration_status = null
    END
	  IF @Household_size = 0
    BEGIN
    SET @Household_size = null
    END
	  IF @Shelter_supplies = ''
    BEGIN
    SET @Shelter_supplies = null
    END
	  IF @Shelter_occupancy_current = ''
    BEGIN
    SET @Shelter_occupancy_current = null
    END
	  IF @New_household_registered = ''
    BEGIN
    SET @New_household_registered = null
    END
	  IF @New_Shelter_address = ''
    BEGIN
    SET @New_Shelter_address = null
    END
	  IF @New_Shelter_city = ''
    BEGIN
    SET @New_Shelter_city = null
    END
	  IF @New_Shelter_State = ''
    BEGIN
    SET @New_Shelter_State = null
    END
	  IF @New_Shelter_Zip = 0
    BEGIN
    SET @New_Shelter_Zip = null
    END
	  IF @New_Contact_Number = 0
    BEGIN
    SET @New_Contact_Number = null
    END
	  IF @Current_household_members_safe = ''
    BEGIN
    SET @Current_household_members_safe = null
    END
	  IF @CheckIn_Date = '9/9/1900 12:00:00 AM'
    BEGIN
    SET @CheckIn_Date = null
    END
	  IF @CheckOut_Date = '9/9/1900 12:00:00 AM'
    BEGIN
    SET @CheckOut_Date = null
    END
    SELECT [Client_Shelter_ID] 
      FROM [dbo].[Client_Shelter] 
       WHERE ([Shelter_ID] = @Shelter_ID)
       AND ([Client_ID] = @Client_ID)
       AND ([Current_address] like @Current_address)
       AND ([Current_State] like @Current_State)
       AND ([Current_City] like @Current_City)
       AND ([Current_Zip] = @Current_Zip)
       AND ([Client_registration_status] like @Client_registration_status)
       AND ([Household_size] = @Household_size)
       AND ([Shelter_supplies] like @Shelter_supplies or [Shelter_supplies] is null)
       AND ([Shelter_occupancy_current] like @Shelter_occupancy_current)
       AND ([New_household_registered] like @New_household_registered or [New_household_registered] is null)
       AND ([New_Shelter_address] like @New_Shelter_address or [New_Shelter_address] is null)
       AND ([New_Shelter_city] like @New_Shelter_city or [New_Shelter_city] is null)
       AND ([New_Shelter_State] like @New_Shelter_State or [New_Shelter_State] is null)
       AND ([New_Shelter_Zip] = @New_Shelter_Zip or [New_Shelter_Zip] is null)
       AND ([New_Contact_Number] = @New_Contact_Number or [New_Contact_Number] is null)
       AND ([Current_household_members_safe] like @Current_household_members_safe or [Current_household_members_safe] is null)
       AND ([CheckIn_Date] = @CheckIn_Date)
       AND ([CheckOut_Date] = @CheckOut_Date or [CheckOut_Date] is null)
END
GO
/***********************************************************/
/*************************************************/
/****** - UPDATE STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_UPDATE_CLIENT_SHELTER]    Script Date: 8/29/2014 2:05:47 PM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_UPDATE_CLIENT_SHELTER]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_UPDATE_CLIENT_SHELTER]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_UPDATE_CLIENT_SHELTER]
	  @Client_Shelter_ID as int,
	  @Shelter_ID as int,
	  @Client_ID as int,
	  @Current_address as varchar(30),
	  @Current_State as varchar(3),
	  @Current_City as varchar(30),
	  @Current_Zip as int,
	  @Client_registration_status as varchar(30),
	  @Household_size as int,
	  @Shelter_supplies as varchar(30),
	  @Shelter_occupancy_current as varchar(30),
	  @New_household_registered as varchar(30),
	  @New_Shelter_address as varchar(30),
	  @New_Shelter_city as varchar(30),
	  @New_Shelter_State as varchar(30),
	  @New_Shelter_Zip as int,
	  @New_Contact_Number as int,
	  @Current_household_members_safe as varchar(30),
	  @CheckIn_Date as datetime,
	  @CheckOut_Date as datetime
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	  IF @Shelter_ID = 0
    BEGIN
    SET @Shelter_ID = null
    END
	  IF @Client_ID = 0
    BEGIN
    SET @Client_ID = null
    END
	  IF @Current_address = ''
    BEGIN
    SET @Current_address = null
    END
	  IF @Current_State = ''
    BEGIN
    SET @Current_State = null
    END
	  IF @Current_City = ''
    BEGIN
    SET @Current_City = null
    END
	  IF @Current_Zip = 0
    BEGIN
    SET @Current_Zip = null
    END
	  IF @Client_registration_status = ''
    BEGIN
    SET @Client_registration_status = null
    END
	  IF @Household_size = 0
    BEGIN
    SET @Household_size = null
    END
	  IF @Shelter_supplies = ''
    BEGIN
    SET @Shelter_supplies = null
    END
	  IF @Shelter_occupancy_current = ''
    BEGIN
    SET @Shelter_occupancy_current = null
    END
	  IF @New_household_registered = ''
    BEGIN
    SET @New_household_registered = null
    END
	  IF @New_Shelter_address = ''
    BEGIN
    SET @New_Shelter_address = null
    END
	  IF @New_Shelter_city = ''
    BEGIN
    SET @New_Shelter_city = null
    END
	  IF @New_Shelter_State = ''
    BEGIN
    SET @New_Shelter_State = null
    END
	  IF @New_Shelter_Zip = 0
    BEGIN
    SET @New_Shelter_Zip = null
    END
	  IF @New_Contact_Number = 0
    BEGIN
    SET @New_Contact_Number = null
    END
	  IF @Current_household_members_safe = ''
    BEGIN
    SET @Current_household_members_safe = null
    END
	  IF @CheckIn_Date = '9/9/1900 12:00:00 AM'
    BEGIN
    SET @CheckIn_Date = null
    END
	  IF @CheckOut_Date = '9/9/1900 12:00:00 AM'
    BEGIN
    SET @CheckOut_Date = null
    END
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
/****** Object:  StoredProcedure [dbo].[SP_DMCS_DELETE_CLIENT_SHELTER]    Script Date: 8/29/2014 2:05:47 PM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_DELETE_CLIENT_SHELTER]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_DELETE_CLIENT_SHELTER]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_DELETE_CLIENT_SHELTER]
	@Client_Shelter_ID int
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
/****** Object:  StoredProcedure [dbo].[SP_DMCS_SELECT_CLIENT_SHELTER_WC]    Script Date: 8/29/2014 2:05:47 PM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_SELECT_CLIENT_SHELTER_WC]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_SELECT_CLIENT_SHELTER_WC]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_SELECT_CLIENT_SHELTER_WC]
	  @wareclause as varchar(MAX)
AS
Begin
    Declare @string as varchar(MAX)
	Set @string = 'Select * from Client_Shelter where ' + @wareclause
	Exec(@string)
END
GO

/***********************************************************/
/*************************************************/
/****** - SELECT STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_SELECT_VEHICLE]    Script Date: 8/29/2014 2:05:49 PM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_SELECT_VEHICLE]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_SELECT_VEHICLE]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_SELECT_VEHICLE]
           @vehicle_id as int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
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
/***********************************************************/
/*************************************************/
/****** - INSERT STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_INSERT_VEHICLE]    Script Date: 8/29/2014 2:05:49 PM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_INSERT_VEHICLE]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_INSERT_VEHICLE]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_INSERT_VEHICLE]
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
    SET @case_id = null
    END
	  IF @client_id = 0
    BEGIN
    SET @client_id = null
    END
	  IF @vehicle_make = ''
    BEGIN
    SET @vehicle_make = null
    END
	  IF @vehicle_model = ''
    BEGIN
    SET @vehicle_model = null
    END
	  IF @vehicle_type = ''
    BEGIN
    SET @vehicle_type = null
    END
	  IF @vehicle_year = 0
    BEGIN
    SET @vehicle_year = null
    END
	  IF @vehicle_desc = ''
    BEGIN
    SET @vehicle_desc = null
    END
	  IF @vin = ''
    BEGIN
    SET @vin = null
    END
	  IF @start_mileage = 0
    BEGIN
    SET @start_mileage = null
    END
	  IF @first_service_date = '9/9/1900 12:00:00 AM'
    BEGIN
    SET @first_service_date = null
    END
	  IF @last_service_date = '9/9/1900 12:00:00 AM'
    BEGIN
    SET @last_service_date = null
    END
	  IF @PLATENUMBER = ''
    BEGIN
    SET @PLATENUMBER = null
    END
	  IF @FUELTYPE = ''
    BEGIN
    SET @FUELTYPE = null
    END
	  IF @MPH = 0
    BEGIN
    SET @MPH = null
    END
	  IF @INSURED = ''
    BEGIN
    SET @INSURED = null
    END
	Insert INTO [dbo].[vehicle]
           (
            [case_id]
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
            )
     VALUES (
            @case_id
           ,@client_id
           ,@vehicle_make
           ,@vehicle_model
           ,@vehicle_type
           ,@vehicle_year
           ,@vehicle_desc
           ,@vin
           ,@start_mileage
           ,@first_service_date
           ,@last_service_date
           ,@PLATENUMBER
           ,@FUELTYPE
           ,@MPH
           ,@INSURED
            )
END
GO
/***********************************************************/
/*************************************************/
/****** - GET STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_GET_VEHICLE]    Script Date: 8/29/2014 2:05:49 PM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_GET_VEHICLE]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_GET_VEHICLE]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_GET_VEHICLE]
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
    SET @case_id = null
    END
	  IF @client_id = 0
    BEGIN
    SET @client_id = null
    END
	  IF @vehicle_make = ''
    BEGIN
    SET @vehicle_make = null
    END
	  IF @vehicle_model = ''
    BEGIN
    SET @vehicle_model = null
    END
	  IF @vehicle_type = ''
    BEGIN
    SET @vehicle_type = null
    END
	  IF @vehicle_year = 0
    BEGIN
    SET @vehicle_year = null
    END
	  IF @vehicle_desc = ''
    BEGIN
    SET @vehicle_desc = null
    END
	  IF @vin = ''
    BEGIN
    SET @vin = null
    END
	  IF @start_mileage = 0
    BEGIN
    SET @start_mileage = null
    END
	  IF @first_service_date = '9/9/1900 12:00:00 AM'
    BEGIN
    SET @first_service_date = null
    END
	  IF @last_service_date = '9/9/1900 12:00:00 AM'
    BEGIN
    SET @last_service_date = null
    END
	  IF @PLATENUMBER = ''
    BEGIN
    SET @PLATENUMBER = null
    END
	  IF @FUELTYPE = ''
    BEGIN
    SET @FUELTYPE = null
    END
	  IF @MPH = 0
    BEGIN
    SET @MPH = null
    END
	  IF @INSURED = ''
    BEGIN
    SET @INSURED = null
    END
    SELECT [vehicle_id] 
      FROM [dbo].[vehicle] 
       WHERE ([case_id] = @case_id or [case_id] is null)
       AND ([client_id] = @client_id or [client_id] is null)
       AND ([vehicle_make] like @vehicle_make)
       AND ([vehicle_model] like @vehicle_model)
       AND ([vehicle_type] like @vehicle_type)
       AND ([vehicle_year] = @vehicle_year)
       AND ([vehicle_desc] like @vehicle_desc or [vehicle_desc] is null)
       AND ([vin] like @vin or [vin] is null)
       AND ([start_mileage] = @start_mileage or [start_mileage] is null)
       AND ([first_service_date] = @first_service_date or [first_service_date] is null)
       AND ([last_service_date] = @last_service_date or [last_service_date] is null)
       AND ([PLATENUMBER] like @PLATENUMBER)
       AND ([FUELTYPE] = @FUELTYPE)
       AND ([MPH] = @MPH)
       AND ([INSURED] = @INSURED or [INSURED] is null)
END
GO
/***********************************************************/
/*************************************************/
/****** - UPDATE STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_UPDATE_VEHICLE]    Script Date: 8/29/2014 2:05:49 PM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_UPDATE_VEHICLE]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_UPDATE_VEHICLE]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_UPDATE_VEHICLE]
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
    SET @case_id = null
    END
	  IF @client_id = 0
    BEGIN
    SET @client_id = null
    END
	  IF @vehicle_make = ''
    BEGIN
    SET @vehicle_make = null
    END
	  IF @vehicle_model = ''
    BEGIN
    SET @vehicle_model = null
    END
	  IF @vehicle_type = ''
    BEGIN
    SET @vehicle_type = null
    END
	  IF @vehicle_year = 0
    BEGIN
    SET @vehicle_year = null
    END
	  IF @vehicle_desc = ''
    BEGIN
    SET @vehicle_desc = null
    END
	  IF @vin = ''
    BEGIN
    SET @vin = null
    END
	  IF @start_mileage = 0
    BEGIN
    SET @start_mileage = null
    END
	  IF @first_service_date = '9/9/1900 12:00:00 AM'
    BEGIN
    SET @first_service_date = null
    END
	  IF @last_service_date = '9/9/1900 12:00:00 AM'
    BEGIN
    SET @last_service_date = null
    END
	  IF @PLATENUMBER = ''
    BEGIN
    SET @PLATENUMBER = null
    END
	  IF @FUELTYPE = ''
    BEGIN
    SET @FUELTYPE = null
    END
	  IF @MPH = 0
    BEGIN
    SET @MPH = null
    END
	  IF @INSURED = ''
    BEGIN
    SET @INSURED = null
    END
	UPDATE [dbo].[vehicle]
       SET
		   [case_id] = @case_id,
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
END
GO
/***********************************************************/
/*************************************************/
/****** - DELETE STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_DELETE_VEHICLE]    Script Date: 8/29/2014 2:05:49 PM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_DELETE_VEHICLE]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_DELETE_VEHICLE]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_DELETE_VEHICLE]
	@vehicle_id int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	Delete dbo.vehicle
	where vehicle_id = @vehicle_id
END
GO
/***********************************************************/
/*************************************************/
/****** - WHERE CLAUSE STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_SELECT_VEHICLE_WC]    Script Date: 8/29/2014 2:05:49 PM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_SELECT_VEHICLE_WC]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_SELECT_VEHICLE_WC]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_SELECT_VEHICLE_WC]
	  @wareclause as varchar(MAX)
AS
Begin
    Declare @string as varchar(MAX)
	Set @string = 'Select * from vehicle where ' + @wareclause
	Exec(@string)
END
GO

/***********************************************************/
/*************************************************/
/****** - SELECT STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_SELECT_MISSING]    Script Date: 8/29/2014 2:05:51 PM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_SELECT_MISSING]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_SELECT_MISSING]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_SELECT_MISSING]
           @Missing_id as int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
SELECT [Missing_id]
      ,[client_other_info]
      ,[clothing]
      ,[date_of_disappearance]
      ,[last_known_location]
  FROM [dbo].[missing]
 WHERE Missing_id = @Missing_id
End
GO
/***********************************************************/
/*************************************************/
/****** - INSERT STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_INSERT_MISSING]    Script Date: 8/29/2014 2:05:51 PM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_INSERT_MISSING]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_INSERT_MISSING]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_INSERT_MISSING]
	  @Missing_id as int,
	  @client_other_info as varchar(250),
	  @clothing as varchar(150),
	  @date_of_disappearance as datetime,
	  @last_known_location as varchar(30)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	  IF @client_other_info = ''
    BEGIN
    SET @client_other_info = null
    END
	  IF @clothing = ''
    BEGIN
    SET @clothing = null
    END
	  IF @date_of_disappearance = '9/9/1900 12:00:00 AM'
    BEGIN
    SET @date_of_disappearance = null
    END
	  IF @last_known_location = ''
    BEGIN
    SET @last_known_location = null
    END
	Insert INTO [dbo].[missing]
           (
            [Missing_id]
           ,[client_other_info]
           ,[clothing]
           ,[date_of_disappearance]
           ,[last_known_location]
            )
     VALUES (
            @Missing_id
           ,@client_other_info
           ,@clothing
           ,@date_of_disappearance
           ,@last_known_location
            )
END
GO
/***********************************************************/
/*************************************************/
/****** - GET STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_GET_MISSING]    Script Date: 8/29/2014 2:05:51 PM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_GET_MISSING]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_GET_MISSING]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_GET_MISSING]
	  @client_other_info as varchar(250),
	  @clothing as varchar(150),
	  @date_of_disappearance as datetime,
	  @last_known_location as varchar(30)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	  IF @client_other_info = ''
    BEGIN
    SET @client_other_info = null
    END
	  IF @clothing = ''
    BEGIN
    SET @clothing = null
    END
	  IF @date_of_disappearance = '9/9/1900 12:00:00 AM'
    BEGIN
    SET @date_of_disappearance = null
    END
	  IF @last_known_location = ''
    BEGIN
    SET @last_known_location = null
    END
    SELECT [Missing_id] 
      FROM [dbo].[missing] 
       WHERE ([client_other_info] like @client_other_info or [client_other_info] is null)
       AND ([clothing] like @clothing or [clothing] is null)
       AND ([date_of_disappearance] = @date_of_disappearance)
       AND ([last_known_location] like @last_known_location)
END
GO
/***********************************************************/
/*************************************************/
/****** - UPDATE STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_UPDATE_MISSING]    Script Date: 8/29/2014 2:05:51 PM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_UPDATE_MISSING]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_UPDATE_MISSING]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_UPDATE_MISSING]
	  @Missing_id as int,
	  @client_other_info as varchar(250),
	  @clothing as varchar(150),
	  @date_of_disappearance as datetime,
	  @last_known_location as varchar(30)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	  IF @client_other_info = ''
    BEGIN
    SET @client_other_info = null
    END
	  IF @clothing = ''
    BEGIN
    SET @clothing = null
    END
	  IF @date_of_disappearance = '9/9/1900 12:00:00 AM'
    BEGIN
    SET @date_of_disappearance = null
    END
	  IF @last_known_location = ''
    BEGIN
    SET @last_known_location = null
    END
	UPDATE [dbo].[missing]
       SET
		   [client_other_info] = @client_other_info,
		   [clothing] = @clothing,
		   [date_of_disappearance] = @date_of_disappearance,
		   [last_known_location] = @last_known_location
       WHERE Missing_id = @Missing_id
END
GO
/***********************************************************/
/*************************************************/
/****** - DELETE STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_DELETE_MISSING]    Script Date: 8/29/2014 2:05:51 PM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_DELETE_MISSING]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_DELETE_MISSING]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_DELETE_MISSING]
	@Missing_id int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	Delete dbo.missing
	where Missing_id = @Missing_id
END
GO
/***********************************************************/
/*************************************************/
/****** - WHERE CLAUSE STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_SELECT_MISSING_WC]    Script Date: 8/29/2014 2:05:51 PM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_SELECT_MISSING_WC]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_SELECT_MISSING_WC]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_SELECT_MISSING_WC]
	  @wareclause as varchar(MAX)
AS
Begin
    Declare @string as varchar(MAX)
	Set @string = 'Select * from missing where ' + @wareclause
	Exec(@string)
END
GO

/***********************************************************/
/*************************************************/
/****** - SELECT STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_SELECT_SERVICES]    Script Date: 8/29/2014 2:05:53 PM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_SELECT_SERVICES]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_SELECT_SERVICES]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_SELECT_SERVICES]
           @service_id as int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
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
/***********************************************************/
/*************************************************/
/****** - INSERT STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_INSERT_SERVICES]    Script Date: 8/29/2014 2:05:53 PM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_INSERT_SERVICES]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_INSERT_SERVICES]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_INSERT_SERVICES]
	  @Company as varchar(15),
	  @service_type as char(1),
	  @Estimated_Time as datetime,
	  @Email as varchar(1),
	  @Phone_Number as int,
	  @Full_Cost as int,
	  @Estimated_Cost as int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	  IF @Company = ''
    BEGIN
    SET @Company = null
    END
	  IF @service_type = ''
    BEGIN
    SET @service_type = null
    END
	  IF @Estimated_Time = '9/9/1900 12:00:00 AM'
    BEGIN
    SET @Estimated_Time = null
    END
	  IF @Email = ''
    BEGIN
    SET @Email = null
    END
	  IF @Phone_Number = 0
    BEGIN
    SET @Phone_Number = null
    END
	  IF @Full_Cost = 0
    BEGIN
    SET @Full_Cost = null
    END
	  IF @Estimated_Cost = 0
    BEGIN
    SET @Estimated_Cost = null
    END
	Insert INTO [dbo].[services]
           (
            [Company]
           ,[service_type]
           ,[Estimated_Time]
           ,[Email]
           ,[Phone_Number]
           ,[Full_Cost]
           ,[Estimated_Cost]
            )
     VALUES (
            @Company
           ,@service_type
           ,@Estimated_Time
           ,@Email
           ,@Phone_Number
           ,@Full_Cost
           ,@Estimated_Cost
            )
END
GO
/***********************************************************/
/*************************************************/
/****** - GET STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_GET_SERVICES]    Script Date: 8/29/2014 2:05:53 PM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_GET_SERVICES]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_GET_SERVICES]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_GET_SERVICES]
	  @Company as varchar(15),
	  @service_type as char(1),
	  @Estimated_Time as datetime,
	  @Email as varchar(1),
	  @Phone_Number as int,
	  @Full_Cost as int,
	  @Estimated_Cost as int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	  IF @Company = ''
    BEGIN
    SET @Company = null
    END
	  IF @service_type = ''
    BEGIN
    SET @service_type = null
    END
	  IF @Estimated_Time = '9/9/1900 12:00:00 AM'
    BEGIN
    SET @Estimated_Time = null
    END
	  IF @Email = ''
    BEGIN
    SET @Email = null
    END
	  IF @Phone_Number = 0
    BEGIN
    SET @Phone_Number = null
    END
	  IF @Full_Cost = 0
    BEGIN
    SET @Full_Cost = null
    END
	  IF @Estimated_Cost = 0
    BEGIN
    SET @Estimated_Cost = null
    END
    SELECT [service_id] 
      FROM [dbo].[services] 
       WHERE ([Company] like @Company)
       AND ([service_type] = @service_type)
       AND ([Estimated_Time] = @Estimated_Time)
       AND ([Email] like @Email or [Email] is null)
       AND ([Phone_Number] = @Phone_Number)
       AND ([Full_Cost] = @Full_Cost or [Full_Cost] is null)
       AND ([Estimated_Cost] = @Estimated_Cost)
END
GO
/***********************************************************/
/*************************************************/
/****** - UPDATE STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_UPDATE_SERVICES]    Script Date: 8/29/2014 2:05:53 PM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_UPDATE_SERVICES]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_UPDATE_SERVICES]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_UPDATE_SERVICES]
	  @service_id as int,
	  @Company as varchar(15),
	  @service_type as char(1),
	  @Estimated_Time as datetime,
	  @Email as varchar(1),
	  @Phone_Number as int,
	  @Full_Cost as int,
	  @Estimated_Cost as int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	  IF @Company = ''
    BEGIN
    SET @Company = null
    END
	  IF @service_type = ''
    BEGIN
    SET @service_type = null
    END
	  IF @Estimated_Time = '9/9/1900 12:00:00 AM'
    BEGIN
    SET @Estimated_Time = null
    END
	  IF @Email = ''
    BEGIN
    SET @Email = null
    END
	  IF @Phone_Number = 0
    BEGIN
    SET @Phone_Number = null
    END
	  IF @Full_Cost = 0
    BEGIN
    SET @Full_Cost = null
    END
	  IF @Estimated_Cost = 0
    BEGIN
    SET @Estimated_Cost = null
    END
	UPDATE [dbo].[services]
       SET
		   [Company] = @Company,
		   [service_type] = @service_type,
		   [Estimated_Time] = @Estimated_Time,
		   [Email] = @Email,
		   [Phone_Number] = @Phone_Number,
		   [Full_Cost] = @Full_Cost,
		   [Estimated_Cost] = @Estimated_Cost
       WHERE service_id = @service_id
END
GO
/***********************************************************/
/*************************************************/
/****** - DELETE STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_DELETE_SERVICES]    Script Date: 8/29/2014 2:05:53 PM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_DELETE_SERVICES]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_DELETE_SERVICES]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_DELETE_SERVICES]
	@service_id int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	Delete dbo.services
	where service_id = @service_id
END
GO
/***********************************************************/
/*************************************************/
/****** - WHERE CLAUSE STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_SELECT_SERVICES_WC]    Script Date: 8/29/2014 2:05:53 PM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_SELECT_SERVICES_WC]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_SELECT_SERVICES_WC]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_SELECT_SERVICES_WC]
	  @wareclause as varchar(MAX)
AS
Begin
    Declare @string as varchar(MAX)
	Set @string = 'Select * from services where ' + @wareclause
	Exec(@string)
END
GO

/***********************************************************/
/*************************************************/
/****** - SELECT STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_SELECT_TRANSPORTATION]    Script Date: 8/29/2014 2:05:56 PM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_SELECT_TRANSPORTATION]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_SELECT_TRANSPORTATION]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_SELECT_TRANSPORTATION]
           @transport_id as int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
SELECT [transport_id]
      ,[location_from]
      ,[location_to]
      ,[no_of_passangers]
      ,[pickup_date]
      ,[trans_type]
      ,[Vehicle_id]
  FROM [dbo].[transportation]
 WHERE transport_id = @transport_id
End
GO
/***********************************************************/
/*************************************************/
/****** - INSERT STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_INSERT_TRANSPORTATION]    Script Date: 8/29/2014 2:05:56 PM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_INSERT_TRANSPORTATION]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_INSERT_TRANSPORTATION]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_INSERT_TRANSPORTATION]
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
	  IF @location_from = ''
    BEGIN
    SET @location_from = null
    END
	  IF @location_to = ''
    BEGIN
    SET @location_to = null
    END
	  IF @no_of_passangers = 0
    BEGIN
    SET @no_of_passangers = null
    END
	  IF @pickup_date = '9/9/1900 12:00:00 AM'
    BEGIN
    SET @pickup_date = null
    END
	  IF @trans_type = ''
    BEGIN
    SET @trans_type = null
    END
	  IF @Vehicle_id = 0
    BEGIN
    SET @Vehicle_id = null
    END
	Insert INTO [dbo].[transportation]
           (
            [transport_id]
           ,[location_from]
           ,[location_to]
           ,[no_of_passangers]
           ,[pickup_date]
           ,[trans_type]
           ,[Vehicle_id]
            )
     VALUES (
            @transport_id
           ,@location_from
           ,@location_to
           ,@no_of_passangers
           ,@pickup_date
           ,@trans_type
           ,@Vehicle_id
            )
END
GO
/***********************************************************/
/*************************************************/
/****** - GET STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_GET_TRANSPORTATION]    Script Date: 8/29/2014 2:05:56 PM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_GET_TRANSPORTATION]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_GET_TRANSPORTATION]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_GET_TRANSPORTATION]
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
	  IF @location_from = ''
    BEGIN
    SET @location_from = null
    END
	  IF @location_to = ''
    BEGIN
    SET @location_to = null
    END
	  IF @no_of_passangers = 0
    BEGIN
    SET @no_of_passangers = null
    END
	  IF @pickup_date = '9/9/1900 12:00:00 AM'
    BEGIN
    SET @pickup_date = null
    END
	  IF @trans_type = ''
    BEGIN
    SET @trans_type = null
    END
	  IF @Vehicle_id = 0
    BEGIN
    SET @Vehicle_id = null
    END
    SELECT [transport_id] 
      FROM [dbo].[transportation] 
       WHERE ([location_from] like @location_from)
       AND ([location_to] like @location_to)
       AND ([no_of_passangers] = @no_of_passangers)
       AND ([pickup_date] = @pickup_date)
       AND ([trans_type] like @trans_type)
       AND ([Vehicle_id] = @Vehicle_id)
END
GO
/***********************************************************/
/*************************************************/
/****** - UPDATE STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_UPDATE_TRANSPORTATION]    Script Date: 8/29/2014 2:05:56 PM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_UPDATE_TRANSPORTATION]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_UPDATE_TRANSPORTATION]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_UPDATE_TRANSPORTATION]
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
	  IF @location_from = ''
    BEGIN
    SET @location_from = null
    END
	  IF @location_to = ''
    BEGIN
    SET @location_to = null
    END
	  IF @no_of_passangers = 0
    BEGIN
    SET @no_of_passangers = null
    END
	  IF @pickup_date = '9/9/1900 12:00:00 AM'
    BEGIN
    SET @pickup_date = null
    END
	  IF @trans_type = ''
    BEGIN
    SET @trans_type = null
    END
	  IF @Vehicle_id = 0
    BEGIN
    SET @Vehicle_id = null
    END
	UPDATE [dbo].[transportation]
       SET
		   [location_from] = @location_from,
		   [location_to] = @location_to,
		   [no_of_passangers] = @no_of_passangers,
		   [pickup_date] = @pickup_date,
		   [trans_type] = @trans_type,
		   [Vehicle_id] = @Vehicle_id
       WHERE transport_id = @transport_id
END
GO
/***********************************************************/
/*************************************************/
/****** - DELETE STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_DELETE_TRANSPORTATION]    Script Date: 8/29/2014 2:05:56 PM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_DELETE_TRANSPORTATION]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_DELETE_TRANSPORTATION]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_DELETE_TRANSPORTATION]
	@transport_id int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	Delete dbo.transportation
	where transport_id = @transport_id
END
GO
/***********************************************************/
/*************************************************/
/****** - WHERE CLAUSE STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_SELECT_TRANSPORTATION_WC]    Script Date: 8/29/2014 2:05:56 PM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_SELECT_TRANSPORTATION_WC]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_SELECT_TRANSPORTATION_WC]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_SELECT_TRANSPORTATION_WC]
	  @wareclause as varchar(MAX)
AS
Begin
    Declare @string as varchar(MAX)
	Set @string = 'Select * from transportation where ' + @wareclause
	Exec(@string)
END
GO

/***********************************************************/
/*************************************************/
/****** - SELECT STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_SELECT_MOBILE_UNIT]    Script Date: 8/29/2014 2:05:58 PM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_SELECT_MOBILE_UNIT]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_SELECT_MOBILE_UNIT]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_SELECT_MOBILE_UNIT]
           @mobile_unit_id as int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
SELECT [mobile_unit_id]
      ,[vehicle_id]
      ,[mobile_desc]
      ,[call_center_id]
  FROM [dbo].[mobile_unit]
 WHERE mobile_unit_id = @mobile_unit_id
End
GO
/***********************************************************/
/*************************************************/
/****** - INSERT STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_INSERT_MOBILE_UNIT]    Script Date: 8/29/2014 2:05:58 PM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_INSERT_MOBILE_UNIT]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_INSERT_MOBILE_UNIT]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_INSERT_MOBILE_UNIT]
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
    SET @vehicle_id = null
    END
	  IF @mobile_desc = ''
    BEGIN
    SET @mobile_desc = null
    END
	  IF @call_center_id = 0
    BEGIN
    SET @call_center_id = null
    END
	Insert INTO [dbo].[mobile_unit]
           (
            [vehicle_id]
           ,[mobile_desc]
           ,[call_center_id]
            )
     VALUES (
            @vehicle_id
           ,@mobile_desc
           ,@call_center_id
            )
END
GO
/***********************************************************/
/*************************************************/
/****** - GET STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_GET_MOBILE_UNIT]    Script Date: 8/29/2014 2:05:58 PM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_GET_MOBILE_UNIT]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_GET_MOBILE_UNIT]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_GET_MOBILE_UNIT]
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
    SET @vehicle_id = null
    END
	  IF @mobile_desc = ''
    BEGIN
    SET @mobile_desc = null
    END
	  IF @call_center_id = 0
    BEGIN
    SET @call_center_id = null
    END
    SELECT [mobile_unit_id] 
      FROM [dbo].[mobile_unit] 
       WHERE ([vehicle_id] = @vehicle_id)
       AND ([mobile_desc] like @mobile_desc)
       AND ([call_center_id] = @call_center_id or [call_center_id] is null)
END
GO
/***********************************************************/
/*************************************************/
/****** - UPDATE STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_UPDATE_MOBILE_UNIT]    Script Date: 8/29/2014 2:05:58 PM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_UPDATE_MOBILE_UNIT]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_UPDATE_MOBILE_UNIT]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_UPDATE_MOBILE_UNIT]
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
    SET @vehicle_id = null
    END
	  IF @mobile_desc = ''
    BEGIN
    SET @mobile_desc = null
    END
	  IF @call_center_id = 0
    BEGIN
    SET @call_center_id = null
    END
	UPDATE [dbo].[mobile_unit]
       SET
		   [vehicle_id] = @vehicle_id,
		   [mobile_desc] = @mobile_desc,
		   [call_center_id] = @call_center_id
       WHERE mobile_unit_id = @mobile_unit_id
END
GO
/***********************************************************/
/*************************************************/
/****** - DELETE STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_DELETE_MOBILE_UNIT]    Script Date: 8/29/2014 2:05:58 PM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_DELETE_MOBILE_UNIT]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_DELETE_MOBILE_UNIT]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_DELETE_MOBILE_UNIT]
	@mobile_unit_id int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	Delete dbo.mobile_unit
	where mobile_unit_id = @mobile_unit_id
END
GO
/***********************************************************/
/*************************************************/
/****** - WHERE CLAUSE STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_SELECT_MOBILE_UNIT_WC]    Script Date: 8/29/2014 2:05:58 PM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_SELECT_MOBILE_UNIT_WC]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_SELECT_MOBILE_UNIT_WC]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_SELECT_MOBILE_UNIT_WC]
	  @wareclause as varchar(MAX)
AS
Begin
    Declare @string as varchar(MAX)
	Set @string = 'Select * from mobile_unit where ' + @wareclause
	Exec(@string)
END
GO

/***********************************************************/
/*************************************************/
/****** - SELECT STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_SELECT_EVACUATION_AREA]    Script Date: 8/29/2014 2:06:00 PM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_SELECT_EVACUATION_AREA]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_SELECT_EVACUATION_AREA]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_SELECT_EVACUATION_AREA]
           @Evacuation_Area_ID as int
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
/****** Object:  StoredProcedure [dbo].[SP_DMCS_INSERT_EVACUATION_AREA]    Script Date: 8/29/2014 2:06:00 PM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_INSERT_EVACUATION_AREA]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_INSERT_EVACUATION_AREA]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_INSERT_EVACUATION_AREA]
	  @Location_ID as int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	  IF @Location_ID = 0
    BEGIN
    SET @Location_ID = null
    END
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
/****** Object:  StoredProcedure [dbo].[SP_DMCS_GET_EVACUATION_AREA]    Script Date: 8/29/2014 2:06:00 PM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_GET_EVACUATION_AREA]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_GET_EVACUATION_AREA]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_GET_EVACUATION_AREA]
	  @Location_ID as int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	  IF @Location_ID = 0
    BEGIN
    SET @Location_ID = null
    END
    SELECT [Evacuation_Area_ID] 
      FROM [dbo].[Evacuation_Area] 
       WHERE ([Location_ID] = @Location_ID)
END
GO
/***********************************************************/
/*************************************************/
/****** - UPDATE STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_UPDATE_EVACUATION_AREA]    Script Date: 8/29/2014 2:06:00 PM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_UPDATE_EVACUATION_AREA]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_UPDATE_EVACUATION_AREA]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_UPDATE_EVACUATION_AREA]
	  @Evacuation_Area_ID as int,
	  @Location_ID as int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	  IF @Location_ID = 0
    BEGIN
    SET @Location_ID = null
    END
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
/****** Object:  StoredProcedure [dbo].[SP_DMCS_DELETE_EVACUATION_AREA]    Script Date: 8/29/2014 2:06:00 PM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_DELETE_EVACUATION_AREA]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_DELETE_EVACUATION_AREA]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_DELETE_EVACUATION_AREA]
	@Evacuation_Area_ID int
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
/****** Object:  StoredProcedure [dbo].[SP_DMCS_SELECT_EVACUATION_AREA_WC]    Script Date: 8/29/2014 2:06:00 PM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_SELECT_EVACUATION_AREA_WC]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_SELECT_EVACUATION_AREA_WC]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_SELECT_EVACUATION_AREA_WC]
	  @wareclause as varchar(MAX)
AS
Begin
    Declare @string as varchar(MAX)
	Set @string = 'Select * from Evacuation_Area where ' + @wareclause
	Exec(@string)
END
GO

/***********************************************************/
/*************************************************/
/****** - SELECT STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_SELECT_PERSON]    Script Date: 8/29/2014 2:06:02 PM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_SELECT_PERSON]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_SELECT_PERSON]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_SELECT_PERSON]
           @person_id as int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
SELECT [person_id]
      ,[Resource_ID]
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
      ,[Visa_Selected_Value_H_1B]
      ,[Visa_Selected_Value_H_2B]
      ,[Visa_Selected_Value_B_2]
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
  FROM [dbo].[person]
 WHERE person_id = @person_id
End
GO
/***********************************************************/
/*************************************************/
/****** - INSERT STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_INSERT_PERSON]    Script Date: 8/29/2014 2:06:02 PM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_INSERT_PERSON]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_INSERT_PERSON]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_INSERT_PERSON]
	  @Resource_ID as int,
	  @address_id as int,
	  @address_id2 as int,
	  @birthdate as datetime,
	  @certification_number as varchar(50),
	  @f_name as varchar(20),
	  @m_initial as char(1),
	  @l_name as varchar(20),
	  @gender as char(1),
	  @person_type as char(1),
	  @phone_primary as varchar(11),
	  @phone_secondary as varchar(11),
	  @email as varchar(50),
	  @ssn as int,
	  @Maiden_Name as varchar(50),
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
	  @Visa_Selected_Value_H_1B as int,
	  @Visa_Selected_Value_H_2B as int,
	  @Visa_Selected_Value_B_2 as int,
	  @Visa_Selected_Value_Schengen as int,
	  @Perm_Resident_Alien_Resid_Date as datetime,
	  @Perm_Resident_Alien_Expire_Date as datetime,
	  @Perm_Resident_Alien_A_number as int,
	  @Perm_Resident_Alien_USCIS_number as int,
	  @Perm_Resident_Alien_Birth_Country as varchar(50),
	  @Perm_Resident_Alien_Category as varchar(50),
	  @Driver_State_ID as varchar(15),
	  @Citizenship as varchar(3),
	  @Marital_Status as char(1),
	  @Minor_Children as int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	  IF @Resource_ID = 0
    BEGIN
    SET @Resource_ID = null
    END
	  IF @address_id = 0
    BEGIN
    SET @address_id = null
    END
	  IF @address_id2 = 0
    BEGIN
    SET @address_id2 = null
    END
	  IF @birthdate = '9/9/1900 12:00:00 AM'
    BEGIN
    SET @birthdate = null
    END
	  IF @certification_number = ''
    BEGIN
    SET @certification_number = null
    END
	  IF @f_name = ''
    BEGIN
    SET @f_name = null
    END
	  IF @m_initial = ''
    BEGIN
    SET @m_initial = null
    END
	  IF @l_name = ''
    BEGIN
    SET @l_name = null
    END
	  IF @gender = ''
    BEGIN
    SET @gender = null
    END
	  IF @person_type = ''
    BEGIN
    SET @person_type = null
    END
	  IF @phone_primary = ''
    BEGIN
    SET @phone_primary = null
    END
	  IF @phone_secondary = ''
    BEGIN
    SET @phone_secondary = null
    END
	  IF @email = ''
    BEGIN
    SET @email = null
    END
	  IF @ssn = 0
    BEGIN
    SET @ssn = null
    END
	  IF @Maiden_Name = ''
    BEGIN
    SET @Maiden_Name = null
    END
	  IF @Visa_Issue_Date = '9/9/1900 12:00:00 AM'
    BEGIN
    SET @Visa_Issue_Date = null
    END
	  IF @Visa_Expire_Date = '9/9/1900 12:00:00 AM'
    BEGIN
    SET @Visa_Expire_Date = null
    END
	  IF @Visa_Selected_Value_B1 = 0
    BEGIN
    SET @Visa_Selected_Value_B1 = null
    END
	  IF @Visa_Selected_Value_B2 = 0
    BEGIN
    SET @Visa_Selected_Value_B2 = null
    END
	  IF @Visa_Selected_Value_K1 = 0
    BEGIN
    SET @Visa_Selected_Value_K1 = null
    END
	  IF @Visa_Selected_Value_K3 = 0
    BEGIN
    SET @Visa_Selected_Value_K3 = null
    END
	  IF @Visa_Selected_Value_L1 = 0
    BEGIN
    SET @Visa_Selected_Value_L1 = null
    END
	  IF @Visa_Selected_Value_L2 = 0
    BEGIN
    SET @Visa_Selected_Value_L2 = null
    END
	  IF @Visa_Selected_Value_H4 = 0
    BEGIN
    SET @Visa_Selected_Value_H4 = null
    END
	  IF @Visa_Selected_Value_F1 = 0
    BEGIN
    SET @Visa_Selected_Value_F1 = null
    END
	  IF @Visa_Selected_Value_J1 = 0
    BEGIN
    SET @Visa_Selected_Value_J1 = null
    END
	  IF @Visa_Selected_Value_M1 = 0
    BEGIN
    SET @Visa_Selected_Value_M1 = null
    END
	  IF @Visa_Selected_Value_H_1B = 0
    BEGIN
    SET @Visa_Selected_Value_H_1B = null
    END
	  IF @Visa_Selected_Value_H_2B = 0
    BEGIN
    SET @Visa_Selected_Value_H_2B = null
    END
	  IF @Visa_Selected_Value_B_2 = 0
    BEGIN
    SET @Visa_Selected_Value_B_2 = null
    END
	  IF @Visa_Selected_Value_Schengen = 0
    BEGIN
    SET @Visa_Selected_Value_Schengen = null
    END
	  IF @Perm_Resident_Alien_Resid_Date = '9/9/1900 12:00:00 AM'
    BEGIN
    SET @Perm_Resident_Alien_Resid_Date = null
    END
	  IF @Perm_Resident_Alien_Expire_Date = '9/9/1900 12:00:00 AM'
    BEGIN
    SET @Perm_Resident_Alien_Expire_Date = null
    END
	  IF @Perm_Resident_Alien_A_number = 0
    BEGIN
    SET @Perm_Resident_Alien_A_number = null
    END
	  IF @Perm_Resident_Alien_USCIS_number = 0
    BEGIN
    SET @Perm_Resident_Alien_USCIS_number = null
    END
	  IF @Perm_Resident_Alien_Birth_Country = ''
    BEGIN
    SET @Perm_Resident_Alien_Birth_Country = null
    END
	  IF @Perm_Resident_Alien_Category = ''
    BEGIN
    SET @Perm_Resident_Alien_Category = null
    END
	  IF @Driver_State_ID = ''
    BEGIN
    SET @Driver_State_ID = null
    END
	  IF @Citizenship = ''
    BEGIN
    SET @Citizenship = null
    END
	  IF @Marital_Status = ''
    BEGIN
    SET @Marital_Status = null
    END
	  IF @Minor_Children = 0
    BEGIN
    SET @Minor_Children = null
    END
	Insert INTO [dbo].[person]
           (
            [Resource_ID]
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
           ,[Visa_Selected_Value_H_1B]
           ,[Visa_Selected_Value_H_2B]
           ,[Visa_Selected_Value_B_2]
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
            )
     VALUES (
            @Resource_ID
           ,@address_id
           ,@address_id2
           ,@birthdate
           ,@certification_number
           ,@f_name
           ,@m_initial
           ,@l_name
           ,@gender
           ,@person_type
           ,@phone_primary
           ,@phone_secondary
           ,@email
           ,@ssn
           ,@Maiden_Name
           ,@Visa_Issue_Date
           ,@Visa_Expire_Date
           ,@Visa_Selected_Value_B1
           ,@Visa_Selected_Value_B2
           ,@Visa_Selected_Value_K1
           ,@Visa_Selected_Value_K3
           ,@Visa_Selected_Value_L1
           ,@Visa_Selected_Value_L2
           ,@Visa_Selected_Value_H4
           ,@Visa_Selected_Value_F1
           ,@Visa_Selected_Value_J1
           ,@Visa_Selected_Value_M1
           ,@Visa_Selected_Value_H_1B
           ,@Visa_Selected_Value_H_2B
           ,@Visa_Selected_Value_B_2
           ,@Visa_Selected_Value_Schengen
           ,@Perm_Resident_Alien_Resid_Date
           ,@Perm_Resident_Alien_Expire_Date
           ,@Perm_Resident_Alien_A_number
           ,@Perm_Resident_Alien_USCIS_number
           ,@Perm_Resident_Alien_Birth_Country
           ,@Perm_Resident_Alien_Category
           ,@Driver_State_ID
           ,@Citizenship
           ,@Marital_Status
           ,@Minor_Children
            )
END
GO
/***********************************************************/
/*************************************************/
/****** - GET STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_GET_PERSON]    Script Date: 8/29/2014 2:06:02 PM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_GET_PERSON]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_GET_PERSON]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_GET_PERSON]
	  @Resource_ID as int,
	  @address_id as int,
	  @address_id2 as int,
	  @birthdate as datetime,
	  @certification_number as varchar(50),
	  @f_name as varchar(20),
	  @m_initial as char(1),
	  @l_name as varchar(20),
	  @gender as char(1),
	  @person_type as char(1),
	  @phone_primary as varchar(11),
	  @phone_secondary as varchar(11),
	  @email as varchar(50),
	  @ssn as int,
	  @Maiden_Name as varchar(50),
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
	  @Visa_Selected_Value_H_1B as int,
	  @Visa_Selected_Value_H_2B as int,
	  @Visa_Selected_Value_B_2 as int,
	  @Visa_Selected_Value_Schengen as int,
	  @Perm_Resident_Alien_Resid_Date as datetime,
	  @Perm_Resident_Alien_Expire_Date as datetime,
	  @Perm_Resident_Alien_A_number as int,
	  @Perm_Resident_Alien_USCIS_number as int,
	  @Perm_Resident_Alien_Birth_Country as varchar(50),
	  @Perm_Resident_Alien_Category as varchar(50),
	  @Driver_State_ID as varchar(15),
	  @Citizenship as varchar(3),
	  @Marital_Status as char(1),
	  @Minor_Children as int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	  IF @Resource_ID = 0
    BEGIN
    SET @Resource_ID = null
    END
	  IF @address_id = 0
    BEGIN
    SET @address_id = null
    END
	  IF @address_id2 = 0
    BEGIN
    SET @address_id2 = null
    END
	  IF @birthdate = '9/9/1900 12:00:00 AM'
    BEGIN
    SET @birthdate = null
    END
	  IF @certification_number = ''
    BEGIN
    SET @certification_number = null
    END
	  IF @f_name = ''
    BEGIN
    SET @f_name = null
    END
	  IF @m_initial = ''
    BEGIN
    SET @m_initial = null
    END
	  IF @l_name = ''
    BEGIN
    SET @l_name = null
    END
	  IF @gender = ''
    BEGIN
    SET @gender = null
    END
	  IF @person_type = ''
    BEGIN
    SET @person_type = null
    END
	  IF @phone_primary = ''
    BEGIN
    SET @phone_primary = null
    END
	  IF @phone_secondary = ''
    BEGIN
    SET @phone_secondary = null
    END
	  IF @email = ''
    BEGIN
    SET @email = null
    END
	  IF @ssn = 0
    BEGIN
    SET @ssn = null
    END
	  IF @Maiden_Name = ''
    BEGIN
    SET @Maiden_Name = null
    END
	  IF @Visa_Issue_Date = '9/9/1900 12:00:00 AM'
    BEGIN
    SET @Visa_Issue_Date = null
    END
	  IF @Visa_Expire_Date = '9/9/1900 12:00:00 AM'
    BEGIN
    SET @Visa_Expire_Date = null
    END
	  IF @Visa_Selected_Value_B1 = 0
    BEGIN
    SET @Visa_Selected_Value_B1 = null
    END
	  IF @Visa_Selected_Value_B2 = 0
    BEGIN
    SET @Visa_Selected_Value_B2 = null
    END
	  IF @Visa_Selected_Value_K1 = 0
    BEGIN
    SET @Visa_Selected_Value_K1 = null
    END
	  IF @Visa_Selected_Value_K3 = 0
    BEGIN
    SET @Visa_Selected_Value_K3 = null
    END
	  IF @Visa_Selected_Value_L1 = 0
    BEGIN
    SET @Visa_Selected_Value_L1 = null
    END
	  IF @Visa_Selected_Value_L2 = 0
    BEGIN
    SET @Visa_Selected_Value_L2 = null
    END
	  IF @Visa_Selected_Value_H4 = 0
    BEGIN
    SET @Visa_Selected_Value_H4 = null
    END
	  IF @Visa_Selected_Value_F1 = 0
    BEGIN
    SET @Visa_Selected_Value_F1 = null
    END
	  IF @Visa_Selected_Value_J1 = 0
    BEGIN
    SET @Visa_Selected_Value_J1 = null
    END
	  IF @Visa_Selected_Value_M1 = 0
    BEGIN
    SET @Visa_Selected_Value_M1 = null
    END
	  IF @Visa_Selected_Value_H_1B = 0
    BEGIN
    SET @Visa_Selected_Value_H_1B = null
    END
	  IF @Visa_Selected_Value_H_2B = 0
    BEGIN
    SET @Visa_Selected_Value_H_2B = null
    END
	  IF @Visa_Selected_Value_B_2 = 0
    BEGIN
    SET @Visa_Selected_Value_B_2 = null
    END
	  IF @Visa_Selected_Value_Schengen = 0
    BEGIN
    SET @Visa_Selected_Value_Schengen = null
    END
	  IF @Perm_Resident_Alien_Resid_Date = '9/9/1900 12:00:00 AM'
    BEGIN
    SET @Perm_Resident_Alien_Resid_Date = null
    END
	  IF @Perm_Resident_Alien_Expire_Date = '9/9/1900 12:00:00 AM'
    BEGIN
    SET @Perm_Resident_Alien_Expire_Date = null
    END
	  IF @Perm_Resident_Alien_A_number = 0
    BEGIN
    SET @Perm_Resident_Alien_A_number = null
    END
	  IF @Perm_Resident_Alien_USCIS_number = 0
    BEGIN
    SET @Perm_Resident_Alien_USCIS_number = null
    END
	  IF @Perm_Resident_Alien_Birth_Country = ''
    BEGIN
    SET @Perm_Resident_Alien_Birth_Country = null
    END
	  IF @Perm_Resident_Alien_Category = ''
    BEGIN
    SET @Perm_Resident_Alien_Category = null
    END
	  IF @Driver_State_ID = ''
    BEGIN
    SET @Driver_State_ID = null
    END
	  IF @Citizenship = ''
    BEGIN
    SET @Citizenship = null
    END
	  IF @Marital_Status = ''
    BEGIN
    SET @Marital_Status = null
    END
	  IF @Minor_Children = 0
    BEGIN
    SET @Minor_Children = null
    END
    SELECT [person_id] 
      FROM [dbo].[person] 
       WHERE ([Resource_ID] = @Resource_ID or [Resource_ID] is null)
       AND ([address_id] = @address_id)
       AND ([address_id2] = @address_id2 or [address_id2] is null)
       AND ([birthdate] = @birthdate or [birthdate] is null)
       AND ([certification_number] like @certification_number or [certification_number] is null)
       AND ([f_name] like @f_name)
       AND ([m_initial] = @m_initial or [m_initial] is null)
       AND ([l_name] like @l_name)
       AND ([gender] = @gender or [gender] is null)
       AND ([person_type] = @person_type)
       AND ([phone_primary] like @phone_primary or [phone_primary] is null)
       AND ([phone_secondary] like @phone_secondary or [phone_secondary] is null)
       AND ([email] like @email or [email] is null)
       AND ([ssn] = @ssn or [ssn] is null)
       AND ([Maiden_Name] like @Maiden_Name or [Maiden_Name] is null)
       AND ([Visa_Issue_Date] = @Visa_Issue_Date or [Visa_Issue_Date] is null)
       AND ([Visa_Expire_Date] = @Visa_Expire_Date or [Visa_Expire_Date] is null)
       AND ([Visa_Selected_Value_B1] = @Visa_Selected_Value_B1 or [Visa_Selected_Value_B1] is null)
       AND ([Visa_Selected_Value_B2] = @Visa_Selected_Value_B2 or [Visa_Selected_Value_B2] is null)
       AND ([Visa_Selected_Value_K1] = @Visa_Selected_Value_K1 or [Visa_Selected_Value_K1] is null)
       AND ([Visa_Selected_Value_K3] = @Visa_Selected_Value_K3 or [Visa_Selected_Value_K3] is null)
       AND ([Visa_Selected_Value_L1] = @Visa_Selected_Value_L1 or [Visa_Selected_Value_L1] is null)
       AND ([Visa_Selected_Value_L2] = @Visa_Selected_Value_L2 or [Visa_Selected_Value_L2] is null)
       AND ([Visa_Selected_Value_H4] = @Visa_Selected_Value_H4 or [Visa_Selected_Value_H4] is null)
       AND ([Visa_Selected_Value_F1] = @Visa_Selected_Value_F1 or [Visa_Selected_Value_F1] is null)
       AND ([Visa_Selected_Value_J1] = @Visa_Selected_Value_J1 or [Visa_Selected_Value_J1] is null)
       AND ([Visa_Selected_Value_M1] = @Visa_Selected_Value_M1 or [Visa_Selected_Value_M1] is null)
       AND ([Visa_Selected_Value_H_1B] = @Visa_Selected_Value_H_1B or [Visa_Selected_Value_H_1B] is null)
       AND ([Visa_Selected_Value_H_2B] = @Visa_Selected_Value_H_2B or [Visa_Selected_Value_H_2B] is null)
       AND ([Visa_Selected_Value_B_2] = @Visa_Selected_Value_B_2 or [Visa_Selected_Value_B_2] is null)
       AND ([Visa_Selected_Value_Schengen] = @Visa_Selected_Value_Schengen or [Visa_Selected_Value_Schengen] is null)
       AND ([Perm_Resident_Alien_Resid_Date] = @Perm_Resident_Alien_Resid_Date or [Perm_Resident_Alien_Resid_Date] is null)
       AND ([Perm_Resident_Alien_Expire_Date] = @Perm_Resident_Alien_Expire_Date or [Perm_Resident_Alien_Expire_Date] is null)
       AND ([Perm_Resident_Alien_A_number] = @Perm_Resident_Alien_A_number or [Perm_Resident_Alien_A_number] is null)
       AND ([Perm_Resident_Alien_USCIS_number] = @Perm_Resident_Alien_USCIS_number or [Perm_Resident_Alien_USCIS_number] is null)
       AND ([Perm_Resident_Alien_Birth_Country] like @Perm_Resident_Alien_Birth_Country or [Perm_Resident_Alien_Birth_Country] is null)
       AND ([Perm_Resident_Alien_Category] like @Perm_Resident_Alien_Category or [Perm_Resident_Alien_Category] is null)
       AND ([Driver_State_ID] like @Driver_State_ID or [Driver_State_ID] is null)
       AND ([Citizenship] like @Citizenship or [Citizenship] is null)
       AND ([Marital_Status] = @Marital_Status or [Marital_Status] is null)
       AND ([Minor_Children] = @Minor_Children or [Minor_Children] is null)
END
GO
/***********************************************************/
/*************************************************/
/****** - UPDATE STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_UPDATE_PERSON]    Script Date: 8/29/2014 2:06:02 PM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_UPDATE_PERSON]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_UPDATE_PERSON]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_UPDATE_PERSON]
	  @person_id as int,
	  @Resource_ID as int,
	  @address_id as int,
	  @address_id2 as int,
	  @birthdate as datetime,
	  @certification_number as varchar(50),
	  @f_name as varchar(20),
	  @m_initial as char(1),
	  @l_name as varchar(20),
	  @gender as char(1),
	  @person_type as char(1),
	  @phone_primary as varchar(11),
	  @phone_secondary as varchar(11),
	  @email as varchar(50),
	  @ssn as int,
	  @Maiden_Name as varchar(50),
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
	  @Visa_Selected_Value_H_1B as int,
	  @Visa_Selected_Value_H_2B as int,
	  @Visa_Selected_Value_B_2 as int,
	  @Visa_Selected_Value_Schengen as int,
	  @Perm_Resident_Alien_Resid_Date as datetime,
	  @Perm_Resident_Alien_Expire_Date as datetime,
	  @Perm_Resident_Alien_A_number as int,
	  @Perm_Resident_Alien_USCIS_number as int,
	  @Perm_Resident_Alien_Birth_Country as varchar(50),
	  @Perm_Resident_Alien_Category as varchar(50),
	  @Driver_State_ID as varchar(15),
	  @Citizenship as varchar(3),
	  @Marital_Status as char(1),
	  @Minor_Children as int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	  IF @Resource_ID = 0
    BEGIN
    SET @Resource_ID = null
    END
	  IF @address_id = 0
    BEGIN
    SET @address_id = null
    END
	  IF @address_id2 = 0
    BEGIN
    SET @address_id2 = null
    END
	  IF @birthdate = '9/9/1900 12:00:00 AM'
    BEGIN
    SET @birthdate = null
    END
	  IF @certification_number = ''
    BEGIN
    SET @certification_number = null
    END
	  IF @f_name = ''
    BEGIN
    SET @f_name = null
    END
	  IF @m_initial = ''
    BEGIN
    SET @m_initial = null
    END
	  IF @l_name = ''
    BEGIN
    SET @l_name = null
    END
	  IF @gender = ''
    BEGIN
    SET @gender = null
    END
	  IF @person_type = ''
    BEGIN
    SET @person_type = null
    END
	  IF @phone_primary = ''
    BEGIN
    SET @phone_primary = null
    END
	  IF @phone_secondary = ''
    BEGIN
    SET @phone_secondary = null
    END
	  IF @email = ''
    BEGIN
    SET @email = null
    END
	  IF @ssn = 0
    BEGIN
    SET @ssn = null
    END
	  IF @Maiden_Name = ''
    BEGIN
    SET @Maiden_Name = null
    END
	  IF @Visa_Issue_Date = '9/9/1900 12:00:00 AM'
    BEGIN
    SET @Visa_Issue_Date = null
    END
	  IF @Visa_Expire_Date = '9/9/1900 12:00:00 AM'
    BEGIN
    SET @Visa_Expire_Date = null
    END
	  IF @Visa_Selected_Value_B1 = 0
    BEGIN
    SET @Visa_Selected_Value_B1 = null
    END
	  IF @Visa_Selected_Value_B2 = 0
    BEGIN
    SET @Visa_Selected_Value_B2 = null
    END
	  IF @Visa_Selected_Value_K1 = 0
    BEGIN
    SET @Visa_Selected_Value_K1 = null
    END
	  IF @Visa_Selected_Value_K3 = 0
    BEGIN
    SET @Visa_Selected_Value_K3 = null
    END
	  IF @Visa_Selected_Value_L1 = 0
    BEGIN
    SET @Visa_Selected_Value_L1 = null
    END
	  IF @Visa_Selected_Value_L2 = 0
    BEGIN
    SET @Visa_Selected_Value_L2 = null
    END
	  IF @Visa_Selected_Value_H4 = 0
    BEGIN
    SET @Visa_Selected_Value_H4 = null
    END
	  IF @Visa_Selected_Value_F1 = 0
    BEGIN
    SET @Visa_Selected_Value_F1 = null
    END
	  IF @Visa_Selected_Value_J1 = 0
    BEGIN
    SET @Visa_Selected_Value_J1 = null
    END
	  IF @Visa_Selected_Value_M1 = 0
    BEGIN
    SET @Visa_Selected_Value_M1 = null
    END
	  IF @Visa_Selected_Value_H_1B = 0
    BEGIN
    SET @Visa_Selected_Value_H_1B = null
    END
	  IF @Visa_Selected_Value_H_2B = 0
    BEGIN
    SET @Visa_Selected_Value_H_2B = null
    END
	  IF @Visa_Selected_Value_B_2 = 0
    BEGIN
    SET @Visa_Selected_Value_B_2 = null
    END
	  IF @Visa_Selected_Value_Schengen = 0
    BEGIN
    SET @Visa_Selected_Value_Schengen = null
    END
	  IF @Perm_Resident_Alien_Resid_Date = '9/9/1900 12:00:00 AM'
    BEGIN
    SET @Perm_Resident_Alien_Resid_Date = null
    END
	  IF @Perm_Resident_Alien_Expire_Date = '9/9/1900 12:00:00 AM'
    BEGIN
    SET @Perm_Resident_Alien_Expire_Date = null
    END
	  IF @Perm_Resident_Alien_A_number = 0
    BEGIN
    SET @Perm_Resident_Alien_A_number = null
    END
	  IF @Perm_Resident_Alien_USCIS_number = 0
    BEGIN
    SET @Perm_Resident_Alien_USCIS_number = null
    END
	  IF @Perm_Resident_Alien_Birth_Country = ''
    BEGIN
    SET @Perm_Resident_Alien_Birth_Country = null
    END
	  IF @Perm_Resident_Alien_Category = ''
    BEGIN
    SET @Perm_Resident_Alien_Category = null
    END
	  IF @Driver_State_ID = ''
    BEGIN
    SET @Driver_State_ID = null
    END
	  IF @Citizenship = ''
    BEGIN
    SET @Citizenship = null
    END
	  IF @Marital_Status = ''
    BEGIN
    SET @Marital_Status = null
    END
	  IF @Minor_Children = 0
    BEGIN
    SET @Minor_Children = null
    END
	UPDATE [dbo].[person]
       SET
		   [Resource_ID] = @Resource_ID,
		   [address_id] = @address_id,
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
		   [Visa_Selected_Value_H_1B] = @Visa_Selected_Value_H_1B,
		   [Visa_Selected_Value_H_2B] = @Visa_Selected_Value_H_2B,
		   [Visa_Selected_Value_B_2] = @Visa_Selected_Value_B_2,
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
END
GO
/***********************************************************/
/*************************************************/
/****** - DELETE STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_DELETE_PERSON]    Script Date: 8/29/2014 2:06:02 PM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_DELETE_PERSON]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_DELETE_PERSON]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_DELETE_PERSON]
	@person_id int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	Delete dbo.person
	where person_id = @person_id
END
GO
/***********************************************************/
/*************************************************/
/****** - WHERE CLAUSE STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_SELECT_PERSON_WC]    Script Date: 8/29/2014 2:06:02 PM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_SELECT_PERSON_WC]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_SELECT_PERSON_WC]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_SELECT_PERSON_WC]
	  @wareclause as varchar(MAX)
AS
Begin
    Declare @string as varchar(MAX)
	Set @string = 'Select * from person where ' + @wareclause
	Exec(@string)
END
GO

/***********************************************************/
/*************************************************/
/****** - SELECT STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_SELECT_MOBILE_EMPLOYEES]    Script Date: 8/29/2014 2:06:05 PM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_SELECT_MOBILE_EMPLOYEES]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_SELECT_MOBILE_EMPLOYEES]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_SELECT_MOBILE_EMPLOYEES]
           @mobile_employee_id as int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
SELECT [mobile_employee_id]
      ,[mobile_unit_id]
      ,[employee_id]
  FROM [dbo].[mobile_employees]
 WHERE mobile_employee_id = @mobile_employee_id
End
GO
/***********************************************************/
/*************************************************/
/****** - INSERT STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_INSERT_MOBILE_EMPLOYEES]    Script Date: 8/29/2014 2:06:05 PM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_INSERT_MOBILE_EMPLOYEES]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_INSERT_MOBILE_EMPLOYEES]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_INSERT_MOBILE_EMPLOYEES]
	  @mobile_unit_id as int,
	  @employee_id as int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	  IF @mobile_unit_id = 0
    BEGIN
    SET @mobile_unit_id = null
    END
	  IF @employee_id = 0
    BEGIN
    SET @employee_id = null
    END
	Insert INTO [dbo].[mobile_employees]
           (
            [mobile_unit_id]
           ,[employee_id]
            )
     VALUES (
            @mobile_unit_id
           ,@employee_id
            )
END
GO
/***********************************************************/
/*************************************************/
/****** - GET STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_GET_MOBILE_EMPLOYEES]    Script Date: 8/29/2014 2:06:05 PM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_GET_MOBILE_EMPLOYEES]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_GET_MOBILE_EMPLOYEES]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_GET_MOBILE_EMPLOYEES]
	  @mobile_unit_id as int,
	  @employee_id as int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	  IF @mobile_unit_id = 0
    BEGIN
    SET @mobile_unit_id = null
    END
	  IF @employee_id = 0
    BEGIN
    SET @employee_id = null
    END
    SELECT [mobile_employee_id] 
      FROM [dbo].[mobile_employees] 
       WHERE ([mobile_unit_id] = @mobile_unit_id)
       AND ([employee_id] = @employee_id)
END
GO
/***********************************************************/
/*************************************************/
/****** - UPDATE STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_UPDATE_MOBILE_EMPLOYEES]    Script Date: 8/29/2014 2:06:05 PM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_UPDATE_MOBILE_EMPLOYEES]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_UPDATE_MOBILE_EMPLOYEES]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_UPDATE_MOBILE_EMPLOYEES]
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
    SET @mobile_unit_id = null
    END
	  IF @employee_id = 0
    BEGIN
    SET @employee_id = null
    END
	UPDATE [dbo].[mobile_employees]
       SET
		   [mobile_unit_id] = @mobile_unit_id,
		   [employee_id] = @employee_id
       WHERE mobile_employee_id = @mobile_employee_id
END
GO
/***********************************************************/
/*************************************************/
/****** - DELETE STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_DELETE_MOBILE_EMPLOYEES]    Script Date: 8/29/2014 2:06:05 PM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_DELETE_MOBILE_EMPLOYEES]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_DELETE_MOBILE_EMPLOYEES]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_DELETE_MOBILE_EMPLOYEES]
	@mobile_employee_id int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	Delete dbo.mobile_employees
	where mobile_employee_id = @mobile_employee_id
END
GO
/***********************************************************/
/*************************************************/
/****** - WHERE CLAUSE STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_SELECT_MOBILE_EMPLOYEES_WC]    Script Date: 8/29/2014 2:06:05 PM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_SELECT_MOBILE_EMPLOYEES_WC]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_SELECT_MOBILE_EMPLOYEES_WC]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_SELECT_MOBILE_EMPLOYEES_WC]
	  @wareclause as varchar(MAX)
AS
Begin
    Declare @string as varchar(MAX)
	Set @string = 'Select * from mobile_employees where ' + @wareclause
	Exec(@string)
END
GO

/***********************************************************/
/*************************************************/
/****** - SELECT STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_SELECT_PET_TYPE]    Script Date: 8/29/2014 2:06:07 PM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_SELECT_PET_TYPE]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_SELECT_PET_TYPE]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_SELECT_PET_TYPE]
           @Pet_Type_ID as int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
SELECT [Pet_Type_ID]
      ,[Pet_Species]
      ,[Pet_Type]
      ,[Pet_Breed]
  FROM [dbo].[Pet_type]
 WHERE Pet_Type_ID = @Pet_Type_ID
End
GO
/***********************************************************/
/*************************************************/
/****** - INSERT STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_INSERT_PET_TYPE]    Script Date: 8/29/2014 2:06:07 PM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_INSERT_PET_TYPE]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_INSERT_PET_TYPE]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_INSERT_PET_TYPE]
	  @Pet_Species as varchar(50),
	  @Pet_Type as varchar(50),
	  @Pet_Breed as varchar(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	  IF @Pet_Species = ''
    BEGIN
    SET @Pet_Species = null
    END
	  IF @Pet_Type = ''
    BEGIN
    SET @Pet_Type = null
    END
	  IF @Pet_Breed = ''
    BEGIN
    SET @Pet_Breed = null
    END
	Insert INTO [dbo].[Pet_type]
           (
            [Pet_Species]
           ,[Pet_Type]
           ,[Pet_Breed]
            )
     VALUES (
            @Pet_Species
           ,@Pet_Type
           ,@Pet_Breed
            )
END
GO
/***********************************************************/
/*************************************************/
/****** - GET STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_GET_PET_TYPE]    Script Date: 8/29/2014 2:06:07 PM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_GET_PET_TYPE]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_GET_PET_TYPE]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_GET_PET_TYPE]
	  @Pet_Species as varchar(50),
	  @Pet_Type as varchar(50),
	  @Pet_Breed as varchar(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	  IF @Pet_Species = ''
    BEGIN
    SET @Pet_Species = null
    END
	  IF @Pet_Type = ''
    BEGIN
    SET @Pet_Type = null
    END
	  IF @Pet_Breed = ''
    BEGIN
    SET @Pet_Breed = null
    END
    SELECT [Pet_Type_ID] 
      FROM [dbo].[Pet_type] 
       WHERE ([Pet_Species] like @Pet_Species or [Pet_Species] is null)
       AND ([Pet_Type] like @Pet_Type or [Pet_Type] is null)
       AND ([Pet_Breed] like @Pet_Breed or [Pet_Breed] is null)
END
GO
/***********************************************************/
/*************************************************/
/****** - UPDATE STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_UPDATE_PET_TYPE]    Script Date: 8/29/2014 2:06:07 PM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_UPDATE_PET_TYPE]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_UPDATE_PET_TYPE]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_UPDATE_PET_TYPE]
	  @Pet_Type_ID as int,
	  @Pet_Species as varchar(50),
	  @Pet_Type as varchar(50),
	  @Pet_Breed as varchar(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	  IF @Pet_Species = ''
    BEGIN
    SET @Pet_Species = null
    END
	  IF @Pet_Type = ''
    BEGIN
    SET @Pet_Type = null
    END
	  IF @Pet_Breed = ''
    BEGIN
    SET @Pet_Breed = null
    END
	UPDATE [dbo].[Pet_type]
       SET
		   [Pet_Species] = @Pet_Species,
		   [Pet_Type] = @Pet_Type,
		   [Pet_Breed] = @Pet_Breed
       WHERE Pet_Type_ID = @Pet_Type_ID
END
GO
/***********************************************************/
/*************************************************/
/****** - DELETE STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_DELETE_PET_TYPE]    Script Date: 8/29/2014 2:06:07 PM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_DELETE_PET_TYPE]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_DELETE_PET_TYPE]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_DELETE_PET_TYPE]
	@Pet_Type_ID int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	Delete dbo.Pet_type
	where Pet_Type_ID = @Pet_Type_ID
END
GO
/***********************************************************/
/*************************************************/
/****** - WHERE CLAUSE STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_SELECT_PET_TYPE_WC]    Script Date: 8/29/2014 2:06:07 PM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_SELECT_PET_TYPE_WC]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_SELECT_PET_TYPE_WC]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_SELECT_PET_TYPE_WC]
	  @wareclause as varchar(MAX)
AS
Begin
    Declare @string as varchar(MAX)
	Set @string = 'Select * from Pet_type where ' + @wareclause
	Exec(@string)
END
GO

/***********************************************************/
/*************************************************/
/****** - SELECT STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_SELECT_RELATIVE]    Script Date: 8/29/2014 2:06:09 PM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_SELECT_RELATIVE]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_SELECT_RELATIVE]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_SELECT_RELATIVE]
           @relative_id as int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
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
/***********************************************************/
/*************************************************/
/****** - INSERT STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_INSERT_RELATIVE]    Script Date: 8/29/2014 2:06:09 PM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_INSERT_RELATIVE]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_INSERT_RELATIVE]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_INSERT_RELATIVE]
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
	  IF @case_id = 0
    BEGIN
    SET @case_id = null
    END
	  IF @client_id = 0
    BEGIN
    SET @client_id = null
    END
	  IF @address_id = 0
    BEGIN
    SET @address_id = null
    END
	  IF @will_help = ''
    BEGIN
    SET @will_help = null
    END
	Insert INTO [dbo].[relative]
           (
            [case_id]
           ,[client_id]
           ,[address_id]
           ,[relative_help_memo]
           ,[will_help]
            )
     VALUES (
            @case_id
           ,@client_id
           ,@address_id
           ,@relative_help_memo
           ,@will_help
            )
END
GO
/***********************************************************/
/*************************************************/
/****** - GET STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_GET_RELATIVE]    Script Date: 8/29/2014 2:06:09 PM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_GET_RELATIVE]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_GET_RELATIVE]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_GET_RELATIVE]
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
	  IF @case_id = 0
    BEGIN
    SET @case_id = null
    END
	  IF @client_id = 0
    BEGIN
    SET @client_id = null
    END
	  IF @address_id = 0
    BEGIN
    SET @address_id = null
    END
	  IF @will_help = ''
    BEGIN
    SET @will_help = null
    END
    SELECT [relative_id] 
      FROM [dbo].[relative] 
       WHERE ([case_id] = @case_id)
       AND ([client_id] = @client_id)
       AND ([address_id] = @address_id or [address_id] is null)
       AND ([relative_help_memo] like @relative_help_memo or [relative_help_memo] is null)
       AND ([will_help] = @will_help)
END
GO
/***********************************************************/
/*************************************************/
/****** - UPDATE STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_UPDATE_RELATIVE]    Script Date: 8/29/2014 2:06:09 PM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_UPDATE_RELATIVE]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_UPDATE_RELATIVE]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_UPDATE_RELATIVE]
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
	  IF @case_id = 0
    BEGIN
    SET @case_id = null
    END
	  IF @client_id = 0
    BEGIN
    SET @client_id = null
    END
	  IF @address_id = 0
    BEGIN
    SET @address_id = null
    END
	  IF @will_help = ''
    BEGIN
    SET @will_help = null
    END
	UPDATE [dbo].[relative]
       SET
		   [case_id] = @case_id,
		   [client_id] = @client_id,
		   [address_id] = @address_id,
		   [relative_help_memo] = @relative_help_memo,
		   [will_help] = @will_help
       WHERE relative_id = @relative_id
END
GO
/***********************************************************/
/*************************************************/
/****** - DELETE STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_DELETE_RELATIVE]    Script Date: 8/29/2014 2:06:09 PM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_DELETE_RELATIVE]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_DELETE_RELATIVE]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_DELETE_RELATIVE]
	@relative_id int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	Delete dbo.relative
	where relative_id = @relative_id
END
GO
/***********************************************************/
/*************************************************/
/****** - WHERE CLAUSE STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_SELECT_RELATIVE_WC]    Script Date: 8/29/2014 2:06:09 PM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_SELECT_RELATIVE_WC]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_SELECT_RELATIVE_WC]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_SELECT_RELATIVE_WC]
	  @wareclause as varchar(MAX)
AS
Begin
    Declare @string as varchar(MAX)
	Set @string = 'Select * from relative where ' + @wareclause
	Exec(@string)
END
GO

/***********************************************************/
/*************************************************/
/****** - SELECT STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_SELECT_PROPERTY]    Script Date: 8/29/2014 2:06:11 PM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_SELECT_PROPERTY]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_SELECT_PROPERTY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_SELECT_PROPERTY]
           @property_id as int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
SELECT [property_id]
      ,[approx_mrkt_value]
      ,[address_id]
      ,[case_id]
      ,[client_id]
      ,[Homeowners_Insurance_Payment]
      ,[monthly_property_payment]
      ,[mortg_comp]
      ,[Property_Tax_Payment]
      ,[own_prop]
      ,[rent_prop]
      ,[date_purchased]
  FROM [dbo].[property]
 WHERE property_id = @property_id
End
GO
/***********************************************************/
/*************************************************/
/****** - INSERT STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_INSERT_PROPERTY]    Script Date: 8/29/2014 2:06:11 PM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_INSERT_PROPERTY]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_INSERT_PROPERTY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_INSERT_PROPERTY]
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
	  IF @approx_mrkt_value = 0
    BEGIN
    SET @approx_mrkt_value = null
    END
	  IF @address_id = 0
    BEGIN
    SET @address_id = null
    END
	  IF @case_id = 0
    BEGIN
    SET @case_id = null
    END
	  IF @client_id = 0
    BEGIN
    SET @client_id = null
    END
	  IF @Homeowners_Insurance_Payment = 0
    BEGIN
    SET @Homeowners_Insurance_Payment = null
    END
	  IF @monthly_property_payment = 0
    BEGIN
    SET @monthly_property_payment = null
    END
	  IF @mortg_comp = ''
    BEGIN
    SET @mortg_comp = null
    END
	  IF @Property_Tax_Payment = 0
    BEGIN
    SET @Property_Tax_Payment = null
    END
	  IF @own_prop = ''
    BEGIN
    SET @own_prop = null
    END
	  IF @rent_prop = ''
    BEGIN
    SET @rent_prop = null
    END
	  IF @date_purchased = 0
    BEGIN
    SET @date_purchased = null
    END
	Insert INTO [dbo].[property]
           (
            [approx_mrkt_value]
           ,[address_id]
           ,[case_id]
           ,[client_id]
           ,[Homeowners_Insurance_Payment]
           ,[monthly_property_payment]
           ,[mortg_comp]
           ,[Property_Tax_Payment]
           ,[own_prop]
           ,[rent_prop]
           ,[date_purchased]
            )
     VALUES (
            @approx_mrkt_value
           ,@address_id
           ,@case_id
           ,@client_id
           ,@Homeowners_Insurance_Payment
           ,@monthly_property_payment
           ,@mortg_comp
           ,@Property_Tax_Payment
           ,@own_prop
           ,@rent_prop
           ,@date_purchased
            )
END
GO
/***********************************************************/
/*************************************************/
/****** - GET STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_GET_PROPERTY]    Script Date: 8/29/2014 2:06:11 PM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_GET_PROPERTY]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_GET_PROPERTY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_GET_PROPERTY]
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
	  IF @approx_mrkt_value = 0
    BEGIN
    SET @approx_mrkt_value = null
    END
	  IF @address_id = 0
    BEGIN
    SET @address_id = null
    END
	  IF @case_id = 0
    BEGIN
    SET @case_id = null
    END
	  IF @client_id = 0
    BEGIN
    SET @client_id = null
    END
	  IF @Homeowners_Insurance_Payment = 0
    BEGIN
    SET @Homeowners_Insurance_Payment = null
    END
	  IF @monthly_property_payment = 0
    BEGIN
    SET @monthly_property_payment = null
    END
	  IF @mortg_comp = ''
    BEGIN
    SET @mortg_comp = null
    END
	  IF @Property_Tax_Payment = 0
    BEGIN
    SET @Property_Tax_Payment = null
    END
	  IF @own_prop = ''
    BEGIN
    SET @own_prop = null
    END
	  IF @rent_prop = ''
    BEGIN
    SET @rent_prop = null
    END
	  IF @date_purchased = 0
    BEGIN
    SET @date_purchased = null
    END
    SELECT [property_id] 
      FROM [dbo].[property] 
       WHERE ([approx_mrkt_value] = @approx_mrkt_value or [approx_mrkt_value] is null)
       AND ([address_id] = @address_id)
       AND ([case_id] = @case_id)
       AND ([client_id] = @client_id)
       AND ([Homeowners_Insurance_Payment] = @Homeowners_Insurance_Payment)
       AND ([monthly_property_payment] = @monthly_property_payment)
       AND ([mortg_comp] like @mortg_comp or [mortg_comp] is null)
       AND ([Property_Tax_Payment] = @Property_Tax_Payment)
       AND ([own_prop] = @own_prop or [own_prop] is null)
       AND ([rent_prop] = @rent_prop or [rent_prop] is null)
       AND ([date_purchased] = @date_purchased or [date_purchased] is null)
END
GO
/***********************************************************/
/*************************************************/
/****** - UPDATE STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_UPDATE_PROPERTY]    Script Date: 8/29/2014 2:06:11 PM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_UPDATE_PROPERTY]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_UPDATE_PROPERTY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_UPDATE_PROPERTY]
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
	  IF @approx_mrkt_value = 0
    BEGIN
    SET @approx_mrkt_value = null
    END
	  IF @address_id = 0
    BEGIN
    SET @address_id = null
    END
	  IF @case_id = 0
    BEGIN
    SET @case_id = null
    END
	  IF @client_id = 0
    BEGIN
    SET @client_id = null
    END
	  IF @Homeowners_Insurance_Payment = 0
    BEGIN
    SET @Homeowners_Insurance_Payment = null
    END
	  IF @monthly_property_payment = 0
    BEGIN
    SET @monthly_property_payment = null
    END
	  IF @mortg_comp = ''
    BEGIN
    SET @mortg_comp = null
    END
	  IF @Property_Tax_Payment = 0
    BEGIN
    SET @Property_Tax_Payment = null
    END
	  IF @own_prop = ''
    BEGIN
    SET @own_prop = null
    END
	  IF @rent_prop = ''
    BEGIN
    SET @rent_prop = null
    END
	  IF @date_purchased = 0
    BEGIN
    SET @date_purchased = null
    END
	UPDATE [dbo].[property]
       SET
		   [approx_mrkt_value] = @approx_mrkt_value,
		   [address_id] = @address_id,
		   [case_id] = @case_id,
		   [client_id] = @client_id,
		   [Homeowners_Insurance_Payment] = @Homeowners_Insurance_Payment,
		   [monthly_property_payment] = @monthly_property_payment,
		   [mortg_comp] = @mortg_comp,
		   [Property_Tax_Payment] = @Property_Tax_Payment,
		   [own_prop] = @own_prop,
		   [rent_prop] = @rent_prop,
		   [date_purchased] = @date_purchased
       WHERE property_id = @property_id
END
GO
/***********************************************************/
/*************************************************/
/****** - DELETE STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_DELETE_PROPERTY]    Script Date: 8/29/2014 2:06:11 PM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_DELETE_PROPERTY]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_DELETE_PROPERTY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_DELETE_PROPERTY]
	@property_id int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	Delete dbo.property
	where property_id = @property_id
END
GO
/***********************************************************/
/*************************************************/
/****** - WHERE CLAUSE STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_SELECT_PROPERTY_WC]    Script Date: 8/29/2014 2:06:11 PM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_SELECT_PROPERTY_WC]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_SELECT_PROPERTY_WC]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_SELECT_PROPERTY_WC]
	  @wareclause as varchar(MAX)
AS
Begin
    Declare @string as varchar(MAX)
	Set @string = 'Select * from property where ' + @wareclause
	Exec(@string)
END
GO

/***********************************************************/
/*************************************************/
/****** - SELECT STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_SELECT_RECEIPT]    Script Date: 8/29/2014 2:06:14 PM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_SELECT_RECEIPT]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_SELECT_RECEIPT]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_SELECT_RECEIPT]
           @Receipt_ID as int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
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
End
GO
/***********************************************************/
/*************************************************/
/****** - INSERT STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_INSERT_RECEIPT]    Script Date: 8/29/2014 2:06:14 PM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_INSERT_RECEIPT]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_INSERT_RECEIPT]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_INSERT_RECEIPT]
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
	  IF @Account_ID = 0
    BEGIN
    SET @Account_ID = null
    END
	  IF @Check_Num = 0
    BEGIN
    SET @Check_Num = null
    END
	  IF @DLN = 0
    BEGIN
    SET @DLN = null
    END
	  IF @Phone = 0
    BEGIN
    SET @Phone = null
    END
	  IF @Pay_Type = 0
    BEGIN
    SET @Pay_Type = null
    END
	  IF @Amount = 0
    BEGIN
    SET @Amount = null
    END
	  IF @Transfer = 0
    BEGIN
    SET @Transfer = null
    END
	  IF @Recieve = 0
    BEGIN
    SET @Recieve = null
    END
	Insert INTO [dbo].[receipt]
           (
            [Account_ID]
           ,[Check_Num]
           ,[DLN]
           ,[Phone]
           ,[Pay_Type]
           ,[Amount]
           ,[Transfer]
           ,[Recieve]
            )
     VALUES (
            @Account_ID
           ,@Check_Num
           ,@DLN
           ,@Phone
           ,@Pay_Type
           ,@Amount
           ,@Transfer
           ,@Recieve
            )
END
GO
/***********************************************************/
/*************************************************/
/****** - GET STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_GET_RECEIPT]    Script Date: 8/29/2014 2:06:14 PM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_GET_RECEIPT]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_GET_RECEIPT]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_GET_RECEIPT]
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
	  IF @Account_ID = 0
    BEGIN
    SET @Account_ID = null
    END
	  IF @Check_Num = 0
    BEGIN
    SET @Check_Num = null
    END
	  IF @DLN = 0
    BEGIN
    SET @DLN = null
    END
	  IF @Phone = 0
    BEGIN
    SET @Phone = null
    END
	  IF @Pay_Type = 0
    BEGIN
    SET @Pay_Type = null
    END
	  IF @Amount = 0
    BEGIN
    SET @Amount = null
    END
	  IF @Transfer = 0
    BEGIN
    SET @Transfer = null
    END
	  IF @Recieve = 0
    BEGIN
    SET @Recieve = null
    END
    SELECT [Receipt_ID] 
      FROM [dbo].[receipt] 
       WHERE ([Account_ID] = @Account_ID or [Account_ID] is null)
       AND ([Check_Num] = @Check_Num or [Check_Num] is null)
       AND ([DLN] = @DLN or [DLN] is null)
       AND ([Phone] = @Phone or [Phone] is null)
       AND ([Pay_Type] = @Pay_Type or [Pay_Type] is null)
       AND ([Amount] = @Amount or [Amount] is null)
       AND ([Transfer] = @Transfer or [Transfer] is null)
       AND ([Recieve] = @Recieve or [Recieve] is null)
END
GO
/***********************************************************/
/*************************************************/
/****** - UPDATE STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_UPDATE_RECEIPT]    Script Date: 8/29/2014 2:06:14 PM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_UPDATE_RECEIPT]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_UPDATE_RECEIPT]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_UPDATE_RECEIPT]
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
	  IF @Account_ID = 0
    BEGIN
    SET @Account_ID = null
    END
	  IF @Check_Num = 0
    BEGIN
    SET @Check_Num = null
    END
	  IF @DLN = 0
    BEGIN
    SET @DLN = null
    END
	  IF @Phone = 0
    BEGIN
    SET @Phone = null
    END
	  IF @Pay_Type = 0
    BEGIN
    SET @Pay_Type = null
    END
	  IF @Amount = 0
    BEGIN
    SET @Amount = null
    END
	  IF @Transfer = 0
    BEGIN
    SET @Transfer = null
    END
	  IF @Recieve = 0
    BEGIN
    SET @Recieve = null
    END
	UPDATE [dbo].[receipt]
       SET
		   [Account_ID] = @Account_ID,
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
/***********************************************************/
/*************************************************/
/****** - DELETE STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_DELETE_RECEIPT]    Script Date: 8/29/2014 2:06:14 PM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_DELETE_RECEIPT]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_DELETE_RECEIPT]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_DELETE_RECEIPT]
	@Receipt_ID int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	Delete dbo.receipt
	where Receipt_ID = @Receipt_ID
END
GO
/***********************************************************/
/*************************************************/
/****** - WHERE CLAUSE STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_SELECT_RECEIPT_WC]    Script Date: 8/29/2014 2:06:14 PM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_SELECT_RECEIPT_WC]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_SELECT_RECEIPT_WC]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_SELECT_RECEIPT_WC]
	  @wareclause as varchar(MAX)
AS
Begin
    Declare @string as varchar(MAX)
	Set @string = 'Select * from receipt where ' + @wareclause
	Exec(@string)
END
GO

/***********************************************************/
/*************************************************/
/****** - SELECT STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_SELECT_MILITARY]    Script Date: 8/29/2014 2:06:17 PM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_SELECT_MILITARY]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_SELECT_MILITARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_SELECT_MILITARY]
           @military_id as int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
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
/***********************************************************/
/*************************************************/
/****** - INSERT STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_INSERT_MILITARY]    Script Date: 8/29/2014 2:06:17 PM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_INSERT_MILITARY]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_INSERT_MILITARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_INSERT_MILITARY]
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
	  IF @case_id = 0
    BEGIN
    SET @case_id = null
    END
	  IF @client_id = 0
    BEGIN
    SET @client_id = null
    END
	  IF @discharge_date = '9/9/1900 12:00:00 AM'
    BEGIN
    SET @discharge_date = null
    END
	  IF @enlistment_date = '9/9/1900 12:00:00 AM'
    BEGIN
    SET @enlistment_date = null
    END
	  IF @military_branch = ''
    BEGIN
    SET @military_branch = null
    END
	  IF @serial_num = 0
    BEGIN
    SET @serial_num = null
    END
	Insert INTO [dbo].[military]
           (
            [case_id]
           ,[client_id]
           ,[discharge_date]
           ,[enlistment_date]
           ,[military_branch]
           ,[serial_num]
            )
     VALUES (
            @case_id
           ,@client_id
           ,@discharge_date
           ,@enlistment_date
           ,@military_branch
           ,@serial_num
            )
END
GO
/***********************************************************/
/*************************************************/
/****** - GET STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_GET_MILITARY]    Script Date: 8/29/2014 2:06:17 PM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_GET_MILITARY]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_GET_MILITARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_GET_MILITARY]
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
	  IF @case_id = 0
    BEGIN
    SET @case_id = null
    END
	  IF @client_id = 0
    BEGIN
    SET @client_id = null
    END
	  IF @discharge_date = '9/9/1900 12:00:00 AM'
    BEGIN
    SET @discharge_date = null
    END
	  IF @enlistment_date = '9/9/1900 12:00:00 AM'
    BEGIN
    SET @enlistment_date = null
    END
	  IF @military_branch = ''
    BEGIN
    SET @military_branch = null
    END
	  IF @serial_num = 0
    BEGIN
    SET @serial_num = null
    END
    SELECT [military_id] 
      FROM [dbo].[military] 
       WHERE ([case_id] = @case_id)
       AND ([client_id] = @client_id)
       AND ([discharge_date] = @discharge_date or [discharge_date] is null)
       AND ([enlistment_date] = @enlistment_date)
       AND ([military_branch] like @military_branch)
       AND ([serial_num] = @serial_num)
END
GO
/***********************************************************/
/*************************************************/
/****** - UPDATE STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_UPDATE_MILITARY]    Script Date: 8/29/2014 2:06:17 PM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_UPDATE_MILITARY]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_UPDATE_MILITARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_UPDATE_MILITARY]
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
	  IF @case_id = 0
    BEGIN
    SET @case_id = null
    END
	  IF @client_id = 0
    BEGIN
    SET @client_id = null
    END
	  IF @discharge_date = '9/9/1900 12:00:00 AM'
    BEGIN
    SET @discharge_date = null
    END
	  IF @enlistment_date = '9/9/1900 12:00:00 AM'
    BEGIN
    SET @enlistment_date = null
    END
	  IF @military_branch = ''
    BEGIN
    SET @military_branch = null
    END
	  IF @serial_num = 0
    BEGIN
    SET @serial_num = null
    END
	UPDATE [dbo].[military]
       SET
		   [case_id] = @case_id,
		   [client_id] = @client_id,
		   [discharge_date] = @discharge_date,
		   [enlistment_date] = @enlistment_date,
		   [military_branch] = @military_branch,
		   [serial_num] = @serial_num
       WHERE military_id = @military_id
END
GO
/***********************************************************/
/*************************************************/
/****** - DELETE STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_DELETE_MILITARY]    Script Date: 8/29/2014 2:06:17 PM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_DELETE_MILITARY]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_DELETE_MILITARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_DELETE_MILITARY]
	@military_id int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	Delete dbo.military
	where military_id = @military_id
END
GO
/***********************************************************/
/*************************************************/
/****** - WHERE CLAUSE STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_SELECT_MILITARY_WC]    Script Date: 8/29/2014 2:06:17 PM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_SELECT_MILITARY_WC]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_SELECT_MILITARY_WC]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_SELECT_MILITARY_WC]
	  @wareclause as varchar(MAX)
AS
Begin
    Declare @string as varchar(MAX)
	Set @string = 'Select * from military where ' + @wareclause
	Exec(@string)
END
GO

/***********************************************************/
/*************************************************/
/****** - SELECT STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_SELECT_INSPECTION_STATUS]    Script Date: 8/29/2014 2:06:20 PM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_SELECT_INSPECTION_STATUS]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_SELECT_INSPECTION_STATUS]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_SELECT_INSPECTION_STATUS]
           @InspectionStatus_ID as int
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
/****** Object:  StoredProcedure [dbo].[SP_DMCS_INSERT_INSPECTION_STATUS]    Script Date: 8/29/2014 2:06:20 PM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_INSERT_INSPECTION_STATUS]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_INSERT_INSPECTION_STATUS]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_INSERT_INSPECTION_STATUS]
	  @Evacuation_Area_ID as int,
	  @Address_ID as int,
	  @Inspection_Code as varchar(30),
	  @Client_Found as varchar(3),
	  @Client_Found_Status as varchar(30)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	  IF @Evacuation_Area_ID = 0
    BEGIN
    SET @Evacuation_Area_ID = null
    END
	  IF @Address_ID = 0
    BEGIN
    SET @Address_ID = null
    END
	  IF @Inspection_Code = ''
    BEGIN
    SET @Inspection_Code = null
    END
	  IF @Client_Found = ''
    BEGIN
    SET @Client_Found = null
    END
	  IF @Client_Found_Status = ''
    BEGIN
    SET @Client_Found_Status = null
    END
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
/****** Object:  StoredProcedure [dbo].[SP_DMCS_GET_INSPECTION_STATUS]    Script Date: 8/29/2014 2:06:20 PM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_GET_INSPECTION_STATUS]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_GET_INSPECTION_STATUS]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_GET_INSPECTION_STATUS]
	  @Evacuation_Area_ID as int,
	  @Address_ID as int,
	  @Inspection_Code as varchar(30),
	  @Client_Found as varchar(3),
	  @Client_Found_Status as varchar(30)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	  IF @Evacuation_Area_ID = 0
    BEGIN
    SET @Evacuation_Area_ID = null
    END
	  IF @Address_ID = 0
    BEGIN
    SET @Address_ID = null
    END
	  IF @Inspection_Code = ''
    BEGIN
    SET @Inspection_Code = null
    END
	  IF @Client_Found = ''
    BEGIN
    SET @Client_Found = null
    END
	  IF @Client_Found_Status = ''
    BEGIN
    SET @Client_Found_Status = null
    END
    SELECT [InspectionStatus_ID] 
      FROM [dbo].[Inspection_Status] 
       WHERE ([Evacuation_Area_ID] = @Evacuation_Area_ID)
       AND ([Address_ID] = @Address_ID)
       AND ([Inspection_Code] like @Inspection_Code or [Inspection_Code] is null)
       AND ([Client_Found] like @Client_Found)
       AND ([Client_Found_Status] like @Client_Found_Status or [Client_Found_Status] is null)
END
GO
/***********************************************************/
/*************************************************/
/****** - UPDATE STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_UPDATE_INSPECTION_STATUS]    Script Date: 8/29/2014 2:06:20 PM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_UPDATE_INSPECTION_STATUS]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_UPDATE_INSPECTION_STATUS]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_UPDATE_INSPECTION_STATUS]
	  @InspectionStatus_ID as int,
	  @Evacuation_Area_ID as int,
	  @Address_ID as int,
	  @Inspection_Code as varchar(30),
	  @Client_Found as varchar(3),
	  @Client_Found_Status as varchar(30)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	  IF @Evacuation_Area_ID = 0
    BEGIN
    SET @Evacuation_Area_ID = null
    END
	  IF @Address_ID = 0
    BEGIN
    SET @Address_ID = null
    END
	  IF @Inspection_Code = ''
    BEGIN
    SET @Inspection_Code = null
    END
	  IF @Client_Found = ''
    BEGIN
    SET @Client_Found = null
    END
	  IF @Client_Found_Status = ''
    BEGIN
    SET @Client_Found_Status = null
    END
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
/****** Object:  StoredProcedure [dbo].[SP_DMCS_DELETE_INSPECTION_STATUS]    Script Date: 8/29/2014 2:06:20 PM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_DELETE_INSPECTION_STATUS]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_DELETE_INSPECTION_STATUS]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_DELETE_INSPECTION_STATUS]
	@InspectionStatus_ID int
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
/****** Object:  StoredProcedure [dbo].[SP_DMCS_SELECT_INSPECTION_STATUS_WC]    Script Date: 8/29/2014 2:06:20 PM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_SELECT_INSPECTION_STATUS_WC]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_SELECT_INSPECTION_STATUS_WC]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_SELECT_INSPECTION_STATUS_WC]
	  @wareclause as varchar(MAX)
AS
Begin
    Declare @string as varchar(MAX)
	Set @string = 'Select * from Inspection_Status where ' + @wareclause
	Exec(@string)
END
GO

/***********************************************************/
/*************************************************/
/****** - SELECT STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_SELECT_INCOME_SOURCE]    Script Date: 8/29/2014 2:06:23 PM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_SELECT_INCOME_SOURCE]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_SELECT_INCOME_SOURCE]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_SELECT_INCOME_SOURCE]
           @income_source_id as int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
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
/***********************************************************/
/*************************************************/
/****** - INSERT STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_INSERT_INCOME_SOURCE]    Script Date: 8/29/2014 2:06:23 PM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_INSERT_INCOME_SOURCE]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_INSERT_INCOME_SOURCE]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_INSERT_INCOME_SOURCE]
	  @case_id as int,
	  @cash_amt as money,
	  @cash_on_hand as char(1),
	  @wages_stopped as char(1),
	  @waiting_on_income as char(1),
	  @recieving_income as char(1),
	  @no_income as char(1),
	  @currently_working as char(1),
	  @laid_off as char(1),
	  @never_worked as char(1),
	  @quit as char(1),
	  @fired as char(1),
	  @sick_leave as char(1),
	  @maternity_leave as char(1),
	  @on_strike as char(1),
	  @trying_to_find_work as char(1),
	  @ckg_acct as char(1),
	  @ckg_balance as money,
	  @ckg_bank as varchar(30),
	  @claims as char(1),
	  @claims_memo as text,
	  @client_id as int,
	  @gifts_amt as money,
	  @gifts_inc as char(1),
	  @investments as char(1),
	  @life_ins as char(1),
	  @other_ins as char(1),
	  @pension_amt as money,
	  @pension_inc as char(1),
	  @strike_benefits_amt as money,
	  @strike_benefits_inc as char(1),
	  @support_amt as money,
	  @support_inc as char(1),
	  @SSI_Amt as money,
	  @SSI_Inc as char(1),
	  @svgs_acct as char(1),
	  @svgs_balance as money,
	  @svgs_bank as varchar(30),
	  @wages_amt as money,
	  @wages_inc as char(1)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	  IF @case_id = 0
    BEGIN
    SET @case_id = null
    END
	  IF @cash_amt = 0
    BEGIN
    SET @cash_amt = null
    END
	  IF @cash_on_hand = ''
    BEGIN
    SET @cash_on_hand = null
    END
	  IF @wages_stopped = ''
    BEGIN
    SET @wages_stopped = null
    END
	  IF @waiting_on_income = ''
    BEGIN
    SET @waiting_on_income = null
    END
	  IF @recieving_income = ''
    BEGIN
    SET @recieving_income = null
    END
	  IF @no_income = ''
    BEGIN
    SET @no_income = null
    END
	  IF @currently_working = ''
    BEGIN
    SET @currently_working = null
    END
	  IF @laid_off = ''
    BEGIN
    SET @laid_off = null
    END
	  IF @never_worked = ''
    BEGIN
    SET @never_worked = null
    END
	  IF @quit = ''
    BEGIN
    SET @quit = null
    END
	  IF @fired = ''
    BEGIN
    SET @fired = null
    END
	  IF @sick_leave = ''
    BEGIN
    SET @sick_leave = null
    END
	  IF @maternity_leave = ''
    BEGIN
    SET @maternity_leave = null
    END
	  IF @on_strike = ''
    BEGIN
    SET @on_strike = null
    END
	  IF @trying_to_find_work = ''
    BEGIN
    SET @trying_to_find_work = null
    END
	  IF @ckg_acct = ''
    BEGIN
    SET @ckg_acct = null
    END
	  IF @ckg_balance = 0
    BEGIN
    SET @ckg_balance = null
    END
	  IF @ckg_bank = ''
    BEGIN
    SET @ckg_bank = null
    END
	  IF @claims = ''
    BEGIN
    SET @claims = null
    END
	  IF @client_id = 0
    BEGIN
    SET @client_id = null
    END
	  IF @gifts_amt = 0
    BEGIN
    SET @gifts_amt = null
    END
	  IF @gifts_inc = ''
    BEGIN
    SET @gifts_inc = null
    END
	  IF @investments = ''
    BEGIN
    SET @investments = null
    END
	  IF @life_ins = ''
    BEGIN
    SET @life_ins = null
    END
	  IF @other_ins = ''
    BEGIN
    SET @other_ins = null
    END
	  IF @pension_amt = 0
    BEGIN
    SET @pension_amt = null
    END
	  IF @pension_inc = ''
    BEGIN
    SET @pension_inc = null
    END
	  IF @strike_benefits_amt = 0
    BEGIN
    SET @strike_benefits_amt = null
    END
	  IF @strike_benefits_inc = ''
    BEGIN
    SET @strike_benefits_inc = null
    END
	  IF @support_amt = 0
    BEGIN
    SET @support_amt = null
    END
	  IF @support_inc = ''
    BEGIN
    SET @support_inc = null
    END
	  IF @SSI_Amt = 0
    BEGIN
    SET @SSI_Amt = null
    END
	  IF @SSI_Inc = ''
    BEGIN
    SET @SSI_Inc = null
    END
	  IF @svgs_acct = ''
    BEGIN
    SET @svgs_acct = null
    END
	  IF @svgs_balance = 0
    BEGIN
    SET @svgs_balance = null
    END
	  IF @svgs_bank = ''
    BEGIN
    SET @svgs_bank = null
    END
	  IF @wages_amt = 0
    BEGIN
    SET @wages_amt = null
    END
	  IF @wages_inc = ''
    BEGIN
    SET @wages_inc = null
    END
	Insert INTO [dbo].[income_source]
           (
            [case_id]
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
            )
     VALUES (
            @case_id
           ,@cash_amt
           ,@cash_on_hand
           ,@wages_stopped
           ,@waiting_on_income
           ,@recieving_income
           ,@no_income
           ,@currently_working
           ,@laid_off
           ,@never_worked
           ,@quit
           ,@fired
           ,@sick_leave
           ,@maternity_leave
           ,@on_strike
           ,@trying_to_find_work
           ,@ckg_acct
           ,@ckg_balance
           ,@ckg_bank
           ,@claims
           ,@claims_memo
           ,@client_id
           ,@gifts_amt
           ,@gifts_inc
           ,@investments
           ,@life_ins
           ,@other_ins
           ,@pension_amt
           ,@pension_inc
           ,@strike_benefits_amt
           ,@strike_benefits_inc
           ,@support_amt
           ,@support_inc
           ,@SSI_Amt
           ,@SSI_Inc
           ,@svgs_acct
           ,@svgs_balance
           ,@svgs_bank
           ,@wages_amt
           ,@wages_inc
            )
END
GO
/***********************************************************/
/*************************************************/
/****** - GET STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_GET_INCOME_SOURCE]    Script Date: 8/29/2014 2:06:23 PM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_GET_INCOME_SOURCE]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_GET_INCOME_SOURCE]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_GET_INCOME_SOURCE]
	  @case_id as int,
	  @cash_amt as money,
	  @cash_on_hand as char(1),
	  @wages_stopped as char(1),
	  @waiting_on_income as char(1),
	  @recieving_income as char(1),
	  @no_income as char(1),
	  @currently_working as char(1),
	  @laid_off as char(1),
	  @never_worked as char(1),
	  @quit as char(1),
	  @fired as char(1),
	  @sick_leave as char(1),
	  @maternity_leave as char(1),
	  @on_strike as char(1),
	  @trying_to_find_work as char(1),
	  @ckg_acct as char(1),
	  @ckg_balance as money,
	  @ckg_bank as varchar(30),
	  @claims as char(1),
	  @claims_memo as text,
	  @client_id as int,
	  @gifts_amt as money,
	  @gifts_inc as char(1),
	  @investments as char(1),
	  @life_ins as char(1),
	  @other_ins as char(1),
	  @pension_amt as money,
	  @pension_inc as char(1),
	  @strike_benefits_amt as money,
	  @strike_benefits_inc as char(1),
	  @support_amt as money,
	  @support_inc as char(1),
	  @SSI_Amt as money,
	  @SSI_Inc as char(1),
	  @svgs_acct as char(1),
	  @svgs_balance as money,
	  @svgs_bank as varchar(30),
	  @wages_amt as money,
	  @wages_inc as char(1)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	  IF @case_id = 0
    BEGIN
    SET @case_id = null
    END
	  IF @cash_amt = 0
    BEGIN
    SET @cash_amt = null
    END
	  IF @cash_on_hand = ''
    BEGIN
    SET @cash_on_hand = null
    END
	  IF @wages_stopped = ''
    BEGIN
    SET @wages_stopped = null
    END
	  IF @waiting_on_income = ''
    BEGIN
    SET @waiting_on_income = null
    END
	  IF @recieving_income = ''
    BEGIN
    SET @recieving_income = null
    END
	  IF @no_income = ''
    BEGIN
    SET @no_income = null
    END
	  IF @currently_working = ''
    BEGIN
    SET @currently_working = null
    END
	  IF @laid_off = ''
    BEGIN
    SET @laid_off = null
    END
	  IF @never_worked = ''
    BEGIN
    SET @never_worked = null
    END
	  IF @quit = ''
    BEGIN
    SET @quit = null
    END
	  IF @fired = ''
    BEGIN
    SET @fired = null
    END
	  IF @sick_leave = ''
    BEGIN
    SET @sick_leave = null
    END
	  IF @maternity_leave = ''
    BEGIN
    SET @maternity_leave = null
    END
	  IF @on_strike = ''
    BEGIN
    SET @on_strike = null
    END
	  IF @trying_to_find_work = ''
    BEGIN
    SET @trying_to_find_work = null
    END
	  IF @ckg_acct = ''
    BEGIN
    SET @ckg_acct = null
    END
	  IF @ckg_balance = 0
    BEGIN
    SET @ckg_balance = null
    END
	  IF @ckg_bank = ''
    BEGIN
    SET @ckg_bank = null
    END
	  IF @claims = ''
    BEGIN
    SET @claims = null
    END
	  IF @client_id = 0
    BEGIN
    SET @client_id = null
    END
	  IF @gifts_amt = 0
    BEGIN
    SET @gifts_amt = null
    END
	  IF @gifts_inc = ''
    BEGIN
    SET @gifts_inc = null
    END
	  IF @investments = ''
    BEGIN
    SET @investments = null
    END
	  IF @life_ins = ''
    BEGIN
    SET @life_ins = null
    END
	  IF @other_ins = ''
    BEGIN
    SET @other_ins = null
    END
	  IF @pension_amt = 0
    BEGIN
    SET @pension_amt = null
    END
	  IF @pension_inc = ''
    BEGIN
    SET @pension_inc = null
    END
	  IF @strike_benefits_amt = 0
    BEGIN
    SET @strike_benefits_amt = null
    END
	  IF @strike_benefits_inc = ''
    BEGIN
    SET @strike_benefits_inc = null
    END
	  IF @support_amt = 0
    BEGIN
    SET @support_amt = null
    END
	  IF @support_inc = ''
    BEGIN
    SET @support_inc = null
    END
	  IF @SSI_Amt = 0
    BEGIN
    SET @SSI_Amt = null
    END
	  IF @SSI_Inc = ''
    BEGIN
    SET @SSI_Inc = null
    END
	  IF @svgs_acct = ''
    BEGIN
    SET @svgs_acct = null
    END
	  IF @svgs_balance = 0
    BEGIN
    SET @svgs_balance = null
    END
	  IF @svgs_bank = ''
    BEGIN
    SET @svgs_bank = null
    END
	  IF @wages_amt = 0
    BEGIN
    SET @wages_amt = null
    END
	  IF @wages_inc = ''
    BEGIN
    SET @wages_inc = null
    END
    SELECT [income_source_id] 
      FROM [dbo].[income_source] 
       WHERE ([case_id] = @case_id)
       AND ([cash_amt] = @cash_amt or [cash_amt] is null)
       AND ([cash_on_hand] = @cash_on_hand)
       AND ([wages_stopped] = @wages_stopped)
       AND ([waiting_on_income] = @waiting_on_income)
       AND ([recieving_income] = @recieving_income)
       AND ([no_income] = @no_income)
       AND ([currently_working] = @currently_working)
       AND ([laid_off] = @laid_off)
       AND ([never_worked] = @never_worked)
       AND ([quit] = @quit)
       AND ([fired] = @fired)
       AND ([sick_leave] = @sick_leave)
       AND ([maternity_leave] = @maternity_leave)
       AND ([on_strike] = @on_strike)
       AND ([trying_to_find_work] = @trying_to_find_work)
       AND ([ckg_acct] = @ckg_acct)
       AND ([ckg_balance] = @ckg_balance or [ckg_balance] is null)
       AND ([ckg_bank] like @ckg_bank or [ckg_bank] is null)
       AND ([claims] = @claims)
       AND ([claims_memo] like @claims_memo or [claims_memo] is null)
       AND ([client_id] = @client_id or [client_id] is null)
       AND ([gifts_amt] = @gifts_amt or [gifts_amt] is null)
       AND ([gifts_inc] = @gifts_inc)
       AND ([investments] = @investments)
       AND ([life_ins] = @life_ins)
       AND ([other_ins] = @other_ins)
       AND ([pension_amt] = @pension_amt or [pension_amt] is null)
       AND ([pension_inc] = @pension_inc)
       AND ([strike_benefits_amt] = @strike_benefits_amt or [strike_benefits_amt] is null)
       AND ([strike_benefits_inc] = @strike_benefits_inc)
       AND ([support_amt] = @support_amt or [support_amt] is null)
       AND ([support_inc] = @support_inc)
       AND ([SSI_Amt] = @SSI_Amt)
       AND ([SSI_Inc] = @SSI_Inc or [SSI_Inc] is null)
       AND ([svgs_acct] = @svgs_acct)
       AND ([svgs_balance] = @svgs_balance or [svgs_balance] is null)
       AND ([svgs_bank] like @svgs_bank or [svgs_bank] is null)
       AND ([wages_amt] = @wages_amt or [wages_amt] is null)
       AND ([wages_inc] = @wages_inc)
END
GO
/***********************************************************/
/*************************************************/
/****** - UPDATE STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_UPDATE_INCOME_SOURCE]    Script Date: 8/29/2014 2:06:23 PM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_UPDATE_INCOME_SOURCE]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_UPDATE_INCOME_SOURCE]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_UPDATE_INCOME_SOURCE]
	  @income_source_id as int,
	  @case_id as int,
	  @cash_amt as money,
	  @cash_on_hand as char(1),
	  @wages_stopped as char(1),
	  @waiting_on_income as char(1),
	  @recieving_income as char(1),
	  @no_income as char(1),
	  @currently_working as char(1),
	  @laid_off as char(1),
	  @never_worked as char(1),
	  @quit as char(1),
	  @fired as char(1),
	  @sick_leave as char(1),
	  @maternity_leave as char(1),
	  @on_strike as char(1),
	  @trying_to_find_work as char(1),
	  @ckg_acct as char(1),
	  @ckg_balance as money,
	  @ckg_bank as varchar(30),
	  @claims as char(1),
	  @claims_memo as text,
	  @client_id as int,
	  @gifts_amt as money,
	  @gifts_inc as char(1),
	  @investments as char(1),
	  @life_ins as char(1),
	  @other_ins as char(1),
	  @pension_amt as money,
	  @pension_inc as char(1),
	  @strike_benefits_amt as money,
	  @strike_benefits_inc as char(1),
	  @support_amt as money,
	  @support_inc as char(1),
	  @SSI_Amt as money,
	  @SSI_Inc as char(1),
	  @svgs_acct as char(1),
	  @svgs_balance as money,
	  @svgs_bank as varchar(30),
	  @wages_amt as money,
	  @wages_inc as char(1)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	  IF @case_id = 0
    BEGIN
    SET @case_id = null
    END
	  IF @cash_amt = 0
    BEGIN
    SET @cash_amt = null
    END
	  IF @cash_on_hand = ''
    BEGIN
    SET @cash_on_hand = null
    END
	  IF @wages_stopped = ''
    BEGIN
    SET @wages_stopped = null
    END
	  IF @waiting_on_income = ''
    BEGIN
    SET @waiting_on_income = null
    END
	  IF @recieving_income = ''
    BEGIN
    SET @recieving_income = null
    END
	  IF @no_income = ''
    BEGIN
    SET @no_income = null
    END
	  IF @currently_working = ''
    BEGIN
    SET @currently_working = null
    END
	  IF @laid_off = ''
    BEGIN
    SET @laid_off = null
    END
	  IF @never_worked = ''
    BEGIN
    SET @never_worked = null
    END
	  IF @quit = ''
    BEGIN
    SET @quit = null
    END
	  IF @fired = ''
    BEGIN
    SET @fired = null
    END
	  IF @sick_leave = ''
    BEGIN
    SET @sick_leave = null
    END
	  IF @maternity_leave = ''
    BEGIN
    SET @maternity_leave = null
    END
	  IF @on_strike = ''
    BEGIN
    SET @on_strike = null
    END
	  IF @trying_to_find_work = ''
    BEGIN
    SET @trying_to_find_work = null
    END
	  IF @ckg_acct = ''
    BEGIN
    SET @ckg_acct = null
    END
	  IF @ckg_balance = 0
    BEGIN
    SET @ckg_balance = null
    END
	  IF @ckg_bank = ''
    BEGIN
    SET @ckg_bank = null
    END
	  IF @claims = ''
    BEGIN
    SET @claims = null
    END
	  IF @client_id = 0
    BEGIN
    SET @client_id = null
    END
	  IF @gifts_amt = 0
    BEGIN
    SET @gifts_amt = null
    END
	  IF @gifts_inc = ''
    BEGIN
    SET @gifts_inc = null
    END
	  IF @investments = ''
    BEGIN
    SET @investments = null
    END
	  IF @life_ins = ''
    BEGIN
    SET @life_ins = null
    END
	  IF @other_ins = ''
    BEGIN
    SET @other_ins = null
    END
	  IF @pension_amt = 0
    BEGIN
    SET @pension_amt = null
    END
	  IF @pension_inc = ''
    BEGIN
    SET @pension_inc = null
    END
	  IF @strike_benefits_amt = 0
    BEGIN
    SET @strike_benefits_amt = null
    END
	  IF @strike_benefits_inc = ''
    BEGIN
    SET @strike_benefits_inc = null
    END
	  IF @support_amt = 0
    BEGIN
    SET @support_amt = null
    END
	  IF @support_inc = ''
    BEGIN
    SET @support_inc = null
    END
	  IF @SSI_Amt = 0
    BEGIN
    SET @SSI_Amt = null
    END
	  IF @SSI_Inc = ''
    BEGIN
    SET @SSI_Inc = null
    END
	  IF @svgs_acct = ''
    BEGIN
    SET @svgs_acct = null
    END
	  IF @svgs_balance = 0
    BEGIN
    SET @svgs_balance = null
    END
	  IF @svgs_bank = ''
    BEGIN
    SET @svgs_bank = null
    END
	  IF @wages_amt = 0
    BEGIN
    SET @wages_amt = null
    END
	  IF @wages_inc = ''
    BEGIN
    SET @wages_inc = null
    END
	UPDATE [dbo].[income_source]
       SET
		   [case_id] = @case_id,
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
END
GO
/***********************************************************/
/*************************************************/
/****** - DELETE STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_DELETE_INCOME_SOURCE]    Script Date: 8/29/2014 2:06:23 PM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_DELETE_INCOME_SOURCE]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_DELETE_INCOME_SOURCE]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_DELETE_INCOME_SOURCE]
	@income_source_id int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	Delete dbo.income_source
	where income_source_id = @income_source_id
END
GO
/***********************************************************/
/*************************************************/
/****** - WHERE CLAUSE STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_SELECT_INCOME_SOURCE_WC]    Script Date: 8/29/2014 2:06:23 PM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_SELECT_INCOME_SOURCE_WC]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_SELECT_INCOME_SOURCE_WC]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_SELECT_INCOME_SOURCE_WC]
	  @wareclause as varchar(MAX)
AS
Begin
    Declare @string as varchar(MAX)
	Set @string = 'Select * from income_source where ' + @wareclause
	Exec(@string)
END
GO

/***********************************************************/
/*************************************************/
/****** - SELECT STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_SELECT_REQUIREMENTS]    Script Date: 8/29/2014 2:06:26 PM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_SELECT_REQUIREMENTS]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_SELECT_REQUIREMENTS]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_SELECT_REQUIREMENTS]
           @req_id as int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
SELECT [req_id]
      ,[requirement_desc]
  FROM [dbo].[requirements]
 WHERE req_id = @req_id
End
GO
/***********************************************************/
/*************************************************/
/****** - INSERT STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_INSERT_REQUIREMENTS]    Script Date: 8/29/2014 2:06:26 PM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_INSERT_REQUIREMENTS]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_INSERT_REQUIREMENTS]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_INSERT_REQUIREMENTS]
	  @requirement_desc as varchar(100)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	  IF @requirement_desc = ''
    BEGIN
    SET @requirement_desc = null
    END
	Insert INTO [dbo].[requirements]
           (
            [requirement_desc]
            )
     VALUES (
            @requirement_desc
            )
END
GO
/***********************************************************/
/*************************************************/
/****** - GET STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_GET_REQUIREMENTS]    Script Date: 8/29/2014 2:06:26 PM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_GET_REQUIREMENTS]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_GET_REQUIREMENTS]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_GET_REQUIREMENTS]
	  @requirement_desc as varchar(100)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	  IF @requirement_desc = ''
    BEGIN
    SET @requirement_desc = null
    END
    SELECT [req_id] 
      FROM [dbo].[requirements] 
       WHERE ([requirement_desc] like @requirement_desc)
END
GO
/***********************************************************/
/*************************************************/
/****** - UPDATE STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_UPDATE_REQUIREMENTS]    Script Date: 8/29/2014 2:06:26 PM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_UPDATE_REQUIREMENTS]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_UPDATE_REQUIREMENTS]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_UPDATE_REQUIREMENTS]
	  @req_id as int,
	  @requirement_desc as varchar(100)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	  IF @requirement_desc = ''
    BEGIN
    SET @requirement_desc = null
    END
	UPDATE [dbo].[requirements]
       SET
		   [requirement_desc] = @requirement_desc
       WHERE req_id = @req_id
END
GO
/***********************************************************/
/*************************************************/
/****** - DELETE STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_DELETE_REQUIREMENTS]    Script Date: 8/29/2014 2:06:26 PM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_DELETE_REQUIREMENTS]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_DELETE_REQUIREMENTS]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_DELETE_REQUIREMENTS]
	@req_id int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	Delete dbo.requirements
	where req_id = @req_id
END
GO
/***********************************************************/
/*************************************************/
/****** - WHERE CLAUSE STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_SELECT_REQUIREMENTS_WC]    Script Date: 8/29/2014 2:06:26 PM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_SELECT_REQUIREMENTS_WC]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_SELECT_REQUIREMENTS_WC]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_SELECT_REQUIREMENTS_WC]
	  @wareclause as varchar(MAX)
AS
Begin
    Declare @string as varchar(MAX)
	Set @string = 'Select * from requirements where ' + @wareclause
	Exec(@string)
END
GO

/***********************************************************/
/*************************************************/
/****** - SELECT STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_SELECT_RESOURCE]    Script Date: 8/29/2014 2:06:28 PM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_SELECT_RESOURCE]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_SELECT_RESOURCE]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_SELECT_RESOURCE]
           @Resource_ID as int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
SELECT [Resource_ID]
      ,[Location_ID]
      ,[Resource_Type]
      ,[Date_Requested]
  FROM [dbo].[resource]
 WHERE Resource_ID = @Resource_ID
End
GO
/***********************************************************/
/*************************************************/
/****** - INSERT STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_INSERT_RESOURCE]    Script Date: 8/29/2014 2:06:28 PM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_INSERT_RESOURCE]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_INSERT_RESOURCE]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_INSERT_RESOURCE]
	  @Location_ID as int,
	  @Resource_Type as varchar(150),
	  @Date_Requested as datetime
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	  IF @Location_ID = 0
    BEGIN
    SET @Location_ID = null
    END
	  IF @Resource_Type = ''
    BEGIN
    SET @Resource_Type = null
    END
	  IF @Date_Requested = '9/9/1900 12:00:00 AM'
    BEGIN
    SET @Date_Requested = null
    END
	Insert INTO [dbo].[resource]
           (
            [Location_ID]
           ,[Resource_Type]
           ,[Date_Requested]
            )
     VALUES (
            @Location_ID
           ,@Resource_Type
           ,@Date_Requested
            )
END
GO
/***********************************************************/
/*************************************************/
/****** - GET STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_GET_RESOURCE]    Script Date: 8/29/2014 2:06:28 PM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_GET_RESOURCE]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_GET_RESOURCE]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_GET_RESOURCE]
	  @Location_ID as int,
	  @Resource_Type as varchar(150),
	  @Date_Requested as datetime
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	  IF @Location_ID = 0
    BEGIN
    SET @Location_ID = null
    END
	  IF @Resource_Type = ''
    BEGIN
    SET @Resource_Type = null
    END
	  IF @Date_Requested = '9/9/1900 12:00:00 AM'
    BEGIN
    SET @Date_Requested = null
    END
    SELECT [Resource_ID] 
      FROM [dbo].[resource] 
       WHERE ([Location_ID] = @Location_ID or [Location_ID] is null)
       AND ([Resource_Type] like @Resource_Type)
       AND ([Date_Requested] = @Date_Requested or [Date_Requested] is null)
END
GO
/***********************************************************/
/*************************************************/
/****** - UPDATE STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_UPDATE_RESOURCE]    Script Date: 8/29/2014 2:06:28 PM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_UPDATE_RESOURCE]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_UPDATE_RESOURCE]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_UPDATE_RESOURCE]
	  @Resource_ID as int,
	  @Location_ID as int,
	  @Resource_Type as varchar(150),
	  @Date_Requested as datetime
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	  IF @Location_ID = 0
    BEGIN
    SET @Location_ID = null
    END
	  IF @Resource_Type = ''
    BEGIN
    SET @Resource_Type = null
    END
	  IF @Date_Requested = '9/9/1900 12:00:00 AM'
    BEGIN
    SET @Date_Requested = null
    END
	UPDATE [dbo].[resource]
       SET
		   [Location_ID] = @Location_ID,
		   [Resource_Type] = @Resource_Type,
		   [Date_Requested] = @Date_Requested
       WHERE Resource_ID = @Resource_ID
END
GO
/***********************************************************/
/*************************************************/
/****** - DELETE STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_DELETE_RESOURCE]    Script Date: 8/29/2014 2:06:28 PM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_DELETE_RESOURCE]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_DELETE_RESOURCE]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_DELETE_RESOURCE]
	@Resource_ID int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	Delete dbo.resource
	where Resource_ID = @Resource_ID
END
GO
/***********************************************************/
/*************************************************/
/****** - WHERE CLAUSE STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_SELECT_RESOURCE_WC]    Script Date: 8/29/2014 2:06:28 PM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_SELECT_RESOURCE_WC]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_SELECT_RESOURCE_WC]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_SELECT_RESOURCE_WC]
	  @wareclause as varchar(MAX)
AS
Begin
    Declare @string as varchar(MAX)
	Set @string = 'Select * from resource where ' + @wareclause
	Exec(@string)
END
GO

/***********************************************************/
/*************************************************/
/****** - SELECT STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_SELECT_EXPENSE]    Script Date: 8/29/2014 2:06:30 PM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_SELECT_EXPENSE]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_SELECT_EXPENSE]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_SELECT_EXPENSE]
           @expense_id as int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
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
/***********************************************************/
/*************************************************/
/****** - INSERT STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_INSERT_EXPENSE]    Script Date: 8/29/2014 2:06:30 PM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_INSERT_EXPENSE]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_INSERT_EXPENSE]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_INSERT_EXPENSE]
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
	  IF @case_id = 0
    BEGIN
    SET @case_id = null
    END
	  IF @client_id = 0
    BEGIN
    SET @client_id = null
    END
	  IF @date_paid = '9/9/1900 12:00:00 AM'
    BEGIN
    SET @date_paid = null
    END
	  IF @expense_amt_paid = 0
    BEGIN
    SET @expense_amt_paid = null
    END
	  IF @expense_amt_paid_to = ''
    BEGIN
    SET @expense_amt_paid_to = null
    END
	Insert INTO [dbo].[expense]
           (
            [case_id]
           ,[client_id]
           ,[date_paid]
           ,[expense_amt_paid]
           ,[expense_amt_paid_to]
            )
     VALUES (
            @case_id
           ,@client_id
           ,@date_paid
           ,@expense_amt_paid
           ,@expense_amt_paid_to
            )
END
GO
/***********************************************************/
/*************************************************/
/****** - GET STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_GET_EXPENSE]    Script Date: 8/29/2014 2:06:30 PM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_GET_EXPENSE]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_GET_EXPENSE]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_GET_EXPENSE]
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
	  IF @case_id = 0
    BEGIN
    SET @case_id = null
    END
	  IF @client_id = 0
    BEGIN
    SET @client_id = null
    END
	  IF @date_paid = '9/9/1900 12:00:00 AM'
    BEGIN
    SET @date_paid = null
    END
	  IF @expense_amt_paid = 0
    BEGIN
    SET @expense_amt_paid = null
    END
	  IF @expense_amt_paid_to = ''
    BEGIN
    SET @expense_amt_paid_to = null
    END
    SELECT [expense_id] 
      FROM [dbo].[expense] 
       WHERE ([case_id] = @case_id)
       AND ([client_id] = @client_id)
       AND ([date_paid] = @date_paid)
       AND ([expense_amt_paid] = @expense_amt_paid)
       AND ([expense_amt_paid_to] like @expense_amt_paid_to)
END
GO
/***********************************************************/
/*************************************************/
/****** - UPDATE STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_UPDATE_EXPENSE]    Script Date: 8/29/2014 2:06:30 PM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_UPDATE_EXPENSE]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_UPDATE_EXPENSE]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_UPDATE_EXPENSE]
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
	  IF @case_id = 0
    BEGIN
    SET @case_id = null
    END
	  IF @client_id = 0
    BEGIN
    SET @client_id = null
    END
	  IF @date_paid = '9/9/1900 12:00:00 AM'
    BEGIN
    SET @date_paid = null
    END
	  IF @expense_amt_paid = 0
    BEGIN
    SET @expense_amt_paid = null
    END
	  IF @expense_amt_paid_to = ''
    BEGIN
    SET @expense_amt_paid_to = null
    END
	UPDATE [dbo].[expense]
       SET
		   [case_id] = @case_id,
		   [client_id] = @client_id,
		   [date_paid] = @date_paid,
		   [expense_amt_paid] = @expense_amt_paid,
		   [expense_amt_paid_to] = @expense_amt_paid_to
       WHERE expense_id = @expense_id
END
GO
/***********************************************************/
/*************************************************/
/****** - DELETE STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_DELETE_EXPENSE]    Script Date: 8/29/2014 2:06:30 PM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_DELETE_EXPENSE]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_DELETE_EXPENSE]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_DELETE_EXPENSE]
	@expense_id int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	Delete dbo.expense
	where expense_id = @expense_id
END
GO
/***********************************************************/
/*************************************************/
/****** - WHERE CLAUSE STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_SELECT_EXPENSE_WC]    Script Date: 8/29/2014 2:06:30 PM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_SELECT_EXPENSE_WC]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_SELECT_EXPENSE_WC]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_SELECT_EXPENSE_WC]
	  @wareclause as varchar(MAX)
AS
Begin
    Declare @string as varchar(MAX)
	Set @string = 'Select * from expense where ' + @wareclause
	Exec(@string)
END
GO

/***********************************************************/
/*************************************************/
/****** - SELECT STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_SELECT_OBSTRUCTION]    Script Date: 8/29/2014 2:06:33 PM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_SELECT_OBSTRUCTION]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_SELECT_OBSTRUCTION]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_SELECT_OBSTRUCTION]
           @Obstruction_ID as int
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
/****** Object:  StoredProcedure [dbo].[SP_DMCS_INSERT_OBSTRUCTION]    Script Date: 8/29/2014 2:06:33 PM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_INSERT_OBSTRUCTION]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_INSERT_OBSTRUCTION]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_INSERT_OBSTRUCTION]
	  @Evacuation_Area_ID as int,
	  @Location_ID as int,
	  @Date_Reported as datetime,
	  @Expected_Recovery_Date as datetime,
	  @Type as varchar(15),
	  @Severity as varchar(15)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	  IF @Evacuation_Area_ID = 0
    BEGIN
    SET @Evacuation_Area_ID = null
    END
	  IF @Location_ID = 0
    BEGIN
    SET @Location_ID = null
    END
	  IF @Date_Reported = '9/9/1900 12:00:00 AM'
    BEGIN
    SET @Date_Reported = null
    END
	  IF @Expected_Recovery_Date = '9/9/1900 12:00:00 AM'
    BEGIN
    SET @Expected_Recovery_Date = null
    END
	  IF @Type = ''
    BEGIN
    SET @Type = null
    END
	  IF @Severity = ''
    BEGIN
    SET @Severity = null
    END
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
/****** Object:  StoredProcedure [dbo].[SP_DMCS_GET_OBSTRUCTION]    Script Date: 8/29/2014 2:06:33 PM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_GET_OBSTRUCTION]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_GET_OBSTRUCTION]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_GET_OBSTRUCTION]
	  @Evacuation_Area_ID as int,
	  @Location_ID as int,
	  @Date_Reported as datetime,
	  @Expected_Recovery_Date as datetime,
	  @Type as varchar(15),
	  @Severity as varchar(15)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	  IF @Evacuation_Area_ID = 0
    BEGIN
    SET @Evacuation_Area_ID = null
    END
	  IF @Location_ID = 0
    BEGIN
    SET @Location_ID = null
    END
	  IF @Date_Reported = '9/9/1900 12:00:00 AM'
    BEGIN
    SET @Date_Reported = null
    END
	  IF @Expected_Recovery_Date = '9/9/1900 12:00:00 AM'
    BEGIN
    SET @Expected_Recovery_Date = null
    END
	  IF @Type = ''
    BEGIN
    SET @Type = null
    END
	  IF @Severity = ''
    BEGIN
    SET @Severity = null
    END
    SELECT [Obstruction_ID] 
      FROM [dbo].[Obstruction] 
       WHERE ([Evacuation_Area_ID] = @Evacuation_Area_ID)
       AND ([Location_ID] = @Location_ID)
       AND ([Date_Reported] = @Date_Reported)
       AND ([Expected_Recovery_Date] = @Expected_Recovery_Date or [Expected_Recovery_Date] is null)
       AND ([Type] like @Type)
       AND ([Severity] like @Severity)
END
GO
/***********************************************************/
/*************************************************/
/****** - UPDATE STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_UPDATE_OBSTRUCTION]    Script Date: 8/29/2014 2:06:33 PM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_UPDATE_OBSTRUCTION]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_UPDATE_OBSTRUCTION]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_UPDATE_OBSTRUCTION]
	  @Obstruction_ID as int,
	  @Evacuation_Area_ID as int,
	  @Location_ID as int,
	  @Date_Reported as datetime,
	  @Expected_Recovery_Date as datetime,
	  @Type as varchar(15),
	  @Severity as varchar(15)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	  IF @Evacuation_Area_ID = 0
    BEGIN
    SET @Evacuation_Area_ID = null
    END
	  IF @Location_ID = 0
    BEGIN
    SET @Location_ID = null
    END
	  IF @Date_Reported = '9/9/1900 12:00:00 AM'
    BEGIN
    SET @Date_Reported = null
    END
	  IF @Expected_Recovery_Date = '9/9/1900 12:00:00 AM'
    BEGIN
    SET @Expected_Recovery_Date = null
    END
	  IF @Type = ''
    BEGIN
    SET @Type = null
    END
	  IF @Severity = ''
    BEGIN
    SET @Severity = null
    END
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
/****** Object:  StoredProcedure [dbo].[SP_DMCS_DELETE_OBSTRUCTION]    Script Date: 8/29/2014 2:06:33 PM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_DELETE_OBSTRUCTION]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_DELETE_OBSTRUCTION]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_DELETE_OBSTRUCTION]
	@Obstruction_ID int
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
/****** Object:  StoredProcedure [dbo].[SP_DMCS_SELECT_OBSTRUCTION_WC]    Script Date: 8/29/2014 2:06:33 PM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_SELECT_OBSTRUCTION_WC]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_SELECT_OBSTRUCTION_WC]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_SELECT_OBSTRUCTION_WC]
	  @wareclause as varchar(MAX)
AS
Begin
    Declare @string as varchar(MAX)
	Set @string = 'Select * from Obstruction where ' + @wareclause
	Exec(@string)
END
GO





/****** Object:  StoredProcedure [dbo].[SP_DMCS_Update_Pet_Type]    Script datetime: 8/17/2014 7:17:50 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

ALTER  PROCEDURE [dbo].[SP_DMCS_Update_Pet_Type]
	  @Pet_Type_ID as int,
	  @Pet_Species as varchar(MAX),
	  @Pet_Type as varchar(MAX),
	  @Pet_Breed as varchar(MAX)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	UPDATE [dbo].[Pet_type]
       SET
		   [Pet_Species] = @Pet_Species,
		   [Pet_Type] = @Pet_Type,
		   [Pet_Breed] = @Pet_Breed
       WHERE Pet_Type_ID = @Pet_Type_ID
END

GO


/****** Object:  StoredProcedure [dbo].[SP_DMCS_Update_pet]    Script datetime: 8/17/2014 8:08:13 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

Alter  PROCEDURE [dbo].[SP_DMCS_Update_pet]
	  @Pet_Record_ID as int,
	  @Pet_Location_Found_ID as int,
	  @Pet_Type_ID as int,
	  @Pet_Vet_ID as varchar(MAX),
	  @Pet_License_Tag as varchar(MAX),
	  @Pet_RFID as varchar(MAX),
	  @Pet_Tatoo_No as varchar(MAX),
	  @Pet_Name as varchar(MAX),
	  @Pet_Gender as char,
	  @Pet_Color as varchar(MAX),
	  @Pet_Weight as int,
	  @Pet_Description as varchar(MAX),
	  @Pet_Condition as varchar(MAX),
	  @Pet_Status as varchar(MAX),
	  @Pet_Date_Of_Birth as datetime,
	  @Pet_Picture as varbinary(MAX),
	  @Pet_Sterilized as char,
	  @Date_Modified as datetime,
	  @Date_Created as datetime
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	UPDATE [dbo].[Pet]
       SET
		   [Pet_Location_Found_ID] = @Pet_Location_Found_ID,
		   [Pet_Type_ID] = @Pet_Type_ID,
		   [Pet_Vet_ID] = @Pet_Vet_ID,
		   [Pet_License_Tag] = @Pet_License_Tag,
		   [Pet_RFID] = @Pet_RFID,
		   [Pet_Tatoo_No] = @Pet_Tatoo_No,
		   [Pet_Name] = @Pet_Name,
		   [Pet_Gender] = @Pet_Gender,
		   [Pet_Color] = @Pet_Color,
		   [Pet_Weight] = @Pet_Weight,
		   [Pet_Description] = @Pet_Description,
		   [Pet_Condition] = @Pet_Condition,
		   [Pet_Status] = @Pet_Status,
		   [Pet_Date_Of_Birth] = @Pet_Date_Of_Birth,
		   [Pet_Picture] = @Pet_Picture,
		   [Pet_Sterilized] = @Pet_Sterilized,
		   [Date_Modified] = @Date_Modified,
		   [Date_Created] = @Date_Created
       WHERE Pet_Record_ID = @Pet_Record_ID
END

GO

/****** Object:  StoredProcedure [dbo].[SP_DMCS_Select_PetAndPetType_WC]    Script datetime: 8/18/2014 8:41:43 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		jim
-- Create datetime: 6/12/2012
-- Description:	select Row from pets table
-- =============================================
alter PROCEDURE [dbo].[SP_DMCS_Select_PetAndPetType_WC]
	-- Add the parameters for the stored procedure here
	 @wareclause as varchar(max)
AS
BEGIN
											    
    Declare @string as varchar(MAX)
	Set @string = 'select distinct * from pet, Pet_type where pet.Pet_Type_ID = Pet_type.Pet_Type_ID ' + @wareclause
	Exec(@string)
END

GO


/****** Object:  StoredProcedure [dbo].[SP_DMCS_Insert_Pet_Deceased]    Script Date: 8/18/2014 12:21:28 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

ALTER  PROCEDURE [dbo].[SP_DMCS_Insert_Pet_Deceased]
	  @Pet_Deceased_ID as int,
	  @Date_Deceased as datetime,
	  @Location_ID as int,
	  @Funeral as varchar(MAX),
	  @Cemetary_Name as varchar(MAX),
	  @Deceased_Type as varchar(MAX),
	  @Date_CREATEd as datetime,
	  @Date_Modified as datetime
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	Insert INTO [dbo].[Pet_Deceased]
           ([Pet_Deceased_ID]
           ,[Date_Deceased]
           ,[Location_ID]
           ,[Funeral]
           ,[Cemetary_Name]
           ,[Deceased_Type]
           ,[Date_CREATEd]
           ,[Date_Modified]
            )
     VALUES (
			@Pet_Deceased_ID
           ,@Date_Deceased
           ,@Location_ID
           ,@Funeral
           ,@Cemetary_Name
           ,@Deceased_Type
           ,@Date_CREATEd
           ,@Date_Modified
            )
END

GO



/****** Object:  StoredProcedure [dbo].[SP_DMCS_Insert_Pet_Missing]    Script Date: 8/18/2014 12:19:26 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

ALTER  PROCEDURE [dbo].[SP_DMCS_Insert_Pet_Missing]
	  @Pet_Missing_ID as int,
	  @Last_Known_Location_ID as int,
	  @Date_Missing as datetime,
	  @Date_Reported as datetime,
	  @Collar_Description as varchar(MAX),
	  @Time_Lost as datetime,
	  @Lost_Explanation as varchar(MAX),
	  @Length_Owned as int,
	  @Reward_Amt as money,
	  @Breeder as varchar(MAX),
	  @Date_CREATEd as datetime,
	  @Date_Modified as datetime
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	Insert INTO [dbo].[Pet_Missing]
           (
			[Pet_Missing_ID]
           ,[Last_Known_Location_ID]
           ,[Date_Missing]
           ,[Date_Reported]
           ,[Collar_Description]
           ,[Time_Lost]
           ,[Lost_Explanation]
           ,[Length_Owned]
           ,[Reward_Amt]
           ,[Breeder]
           ,[Date_CREATEd]
           ,[Date_Modified]
            )
     VALUES (
		    @Pet_Missing_ID
           ,@Last_Known_Location_ID
           ,@Date_Missing
           ,@Date_Reported
           ,@Collar_Description
           ,@Time_Lost
           ,@Lost_Explanation
           ,@Length_Owned
           ,@Reward_Amt
           ,@Breeder
           ,@Date_CREATEd
           ,@Date_Modified
            )
END

GO
USE [disaster_management_DEV]
GO

/****** Object:  StoredProcedure [dbo].[SP_SCRIPT_GENERATOR_SELECT_PERCISION]    Script Date: 8/20/2014 5:40:09 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



/****** Object:  StoredProcedure [dbo].[SP_SCRIPT_GENERATOR_SELECT_PERCISION]    Script Date: 8/20/2014 4:52:47 PM ******/


CREATE PROCEDURE [dbo].[SP_SCRIPT_GENERATOR_SELECT_PERCISION]
           @table_name as varchar(max),
		   @column_name as varchar(max)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
SELECT character_maximum_length 
FROM information_schema.columns 
WHERE table_name = @table_name AND column_name = @column_name 
End




GO
/****** Object:  StoredProcedure [dbo].[SP_SCRIPT_GENERATOR_SELECT_PERCISION]    Script Date: 8/20/2014 4:52:47 PM ******/


CREATE PROCEDURE [dbo].[SP_SCRIPT_GENERATOR_SELECT_TABLE_IDENTITY]
           @table_name as varchar(max)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
SELECT OBJECTPROPERTY(OBJECT_ID(@table_name), 'TableHasIdentity') as Identity_Column; 

End





GO

/****** Object:  StoredProcedure [dbo].[SP_DMCS_SELECT_JOB]    Script Date: 8/22/2014 11:48:40 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[SP_DMCS_SELECT_XML_DATASOURCE_GENERATOR]

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
SELECT [product_name], [product_id]

  FROM [dbo].[products]

End

GO
/****** Object:  StoredProcedure [dbo].[SP_DMCS_SELECT_PET_WC]    Script Date: 8/29/2014 5:00:29 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[SP_DMCS_SHOW_IMAGE]
	  @wareclause as varchar(MAX)
AS
Begin
    Declare @string as varchar(MAX)
	Set @string = 'SELECT ' + @wareclause
	Exec(@string)
END

GO


/****** - Cleanup Complete -  ******/

/************ - MOD E Complete -  ******/





