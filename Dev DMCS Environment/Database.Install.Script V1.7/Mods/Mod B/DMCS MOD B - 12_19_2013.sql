

begin transaction

DROP TABLE [dbo].[agency_employees]
DROP TABLE [dbo].[case_client]
DROP TABLE [dbo].[debt]
DROP TABLE [dbo].[employer]
DROP TABLE [dbo].[disaster_encounter]
DROP TABLE [dbo].[encounter_client_vaccine]
DROP TABLE [dbo].[encounter_services]
DROP TABLE [dbo].[Order_Product]
DROP TABLE [dbo].[requestor_Order]
DROP TABLE [dbo].[requestor]
DROP TABLE [dbo].[warehouse_product_Location]
DROP TABLE [dbo].[encounter]
DROP TABLE [dbo].[ClientWPets] 
DROP TABLE [dbo].[Pet_Vaccine] 
DROP TABLE [dbo].[Pet]	
DROP TABLE [dbo].[Pet_Missing]
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
DROP TABLE [dbo].[case_intake]
DROP TABLE [dbo].[donation] 
DROP TABLE [dbo].[Donor_Product] 
DROP TABLE [dbo].[Donor]
DROP TABLE [dbo].[agency]------------------------/*Adding (primary_fName - varchar 50 - not null), (primary_lName - varchar 50 - not null), (primary_phone- varchar 50 - not null), (sec_fName - varchar 50 - null), (sec_lName - varchar 50 - null), (sec_phone - varchar 50 - null)*/









/****** Object:  Table [dbo].[Pet_Missing]    Script Date: 12/20/2013 15:25:28 ******/
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
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO




/****** Object:  Table [dbo].[Pet]    Script Date: 12/20/2013 15:23:35 ******/
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
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
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



/****** Object:  Table [dbo].[ClientWPets]    Script Date: 12/20/2013 15:22:56 ******/
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
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
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



/****** Object:  Table [dbo].[Pet_Vaccine]    Script Date: 12/20/2013 15:23:28 ******/
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
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO



/****** Object:  Table [dbo].[agency]    Script Date: 12/20/2013 2:31:17 PM ******/
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

ALTER TABLE [dbo].[agency]  WITH CHECK ADD  CONSTRAINT [agency_address_id_fk] FOREIGN KEY([address_id])
REFERENCES [dbo].[address] ([address_id])
GO

ALTER TABLE [dbo].[agency] CHECK CONSTRAINT [agency_address_id_fk]
GO



/****** Object:  Table [dbo].[Donor]    Script Date: 12/20/2013 15:02:08 ******/
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
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
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





/****** Object:  Table [dbo].[Donor_Product]    Script Date: 12/20/2013 15:01:54 ******/
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
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
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











/****** Object:  Table [dbo].[donation]    Script Date: 12/20/2013 15:01:18 ******/
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
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

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



/****** Object:  Table [dbo].[case_intake]    Script Date: 12/20/2013 3:16:42 PM ******/
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







/****** Object:  Table [dbo].[vehicle]    Script Date: 12/20/2013 14:55:14 ******/
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
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
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

/****** Object:  Table [dbo].[mobile_unit]    Script Date: 12/20/2013 14:57:22 ******/
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
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
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




/****** Object:  Table [dbo].[Mobile_Product]    Script Date: 12/20/2013 14:59:02 ******/
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
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
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


/****** Object:  Table [dbo].[mobile_employees]    Script Date: 12/20/2013 14:58:35 ******/
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
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
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




/****** Object:  Table [dbo].[transportation]    Script Date: 12/20/2013 14:56:07 ******/
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
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

ALTER TABLE [dbo].[transportation]  WITH CHECK ADD  CONSTRAINT [FK_transportation_vehicle] FOREIGN KEY([Vehicle_id])
REFERENCES [dbo].[vehicle] ([vehicle_id])
GO

ALTER TABLE [dbo].[transportation] CHECK CONSTRAINT [FK_transportation_vehicle]
GO




/****** Object:  Table [dbo].[relative]    Script Date: 12/20/2013 14:54:39 ******/
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
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
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









/****** Object:  Table [dbo].[property]    Script Date: 12/20/2013 14:54:11 ******/
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
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
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




/****** Object:  Table [dbo].[military]    Script Date: 12/20/2013 14:53:40 ******/
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
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
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


/****** Object:  Table [dbo].[income_source]    Script Date: 12/20/2013 14:52:49 ******/
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
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
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




/****** Object:  Table [dbo].[expense]    Script Date: 12/20/2013 14:52:06 ******/
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
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
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






/****** Object:  Table [dbo].[encounter]    Script Date: 12/20/2013 14:51:17 ******/
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
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
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




/****** Object:  Table [dbo].[warehouse_product_Location]    Script Date: 12/20/2013 14:50:31 ******/
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
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
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


/****** Object:  Table [dbo].[requestor]    Script Date: 12/20/2013 14:50:00 ******/
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
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
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


/****** Object:  Table [dbo].[requestor_Order]    Script Date: 12/20/2013 14:49:30 ******/
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
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
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







/****** Object:  Table [dbo].[Order_Product]    Script Date: 12/20/2013 14:48:58 ******/
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
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
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




/****** Object:  Table [dbo].[encounter_services]    Script Date: 12/20/2013 14:48:32 ******/
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
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
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



/****** Object:  Table [dbo].[encounter_client_vaccine]    Script Date: 12/20/2013 14:47:54 ******/
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
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
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





/****** Object:  Table [dbo].[disaster_encounter]    Script Date: 12/20/2013 14:47:18 ******/
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
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

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


/****** Object:  Table [dbo].[employer]    Script Date: 12/20/2013 2:42:37 PM ******/
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


/****** Object:  Table [dbo].[debt]    Script Date: 12/20/2013 14:42:37 ******/
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
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
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


/****** Object:  Table [dbo].[case_client]    Script Date: 12/20/2013 2:37:44 PM ******/
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


/****** Object:  Table [dbo].[agency_employees]    Script Date: 12/20/2013 2:32:36 PM ******/
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










/****** Object:  StoredProcedure [dbo].[SP_DMCS_get_pet_missingID]    Script Date: 12/20/2013 4:26:25 PM ******/
DROP PROCEDURE [dbo].[SP_DMCS_get_pet_missingID]
GO

/****** Object:  StoredProcedure [dbo].[SP_DMCS_get_pet_missingID]    Script Date: 12/20/2013 4:26:25 PM ******/
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




/****** Object:  StoredProcedure [dbo].[SP_DMCS_Insert_Pet_Missing]    Script Date: 12/20/2013 4:27:25 PM ******/
DROP PROCEDURE [dbo].[SP_DMCS_Insert_Pet_Missing]
GO

/****** Object:  StoredProcedure [dbo].[SP_DMCS_Insert_Pet_Missing]    Script Date: 12/20/2013 4:27:25 PM ******/
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


/****** Object:  StoredProcedure [dbo].[SP_DMCS_Select_Pet_missing]    Script Date: 12/20/2013 4:30:24 PM ******/
DROP PROCEDURE [dbo].[SP_DMCS_Select_Pet_missing]
GO

/****** Object:  StoredProcedure [dbo].[SP_DMCS_Select_Pet_missing]    Script Date: 12/20/2013 4:30:24 PM ******/
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
/****** Object:  StoredProcedure [dbo].[SP_DMCS_Select_Pet_missing_WC]    Script Date: 12/20/2013 4:31:55 PM ******/
DROP PROCEDURE [dbo].[SP_DMCS_Select_Pet_missing_WC]
GO

/****** Object:  StoredProcedure [dbo].[SP_DMCS_Select_Pet_missing_WC]    Script Date: 12/20/2013 4:31:55 PM ******/
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


/****** Object:  StoredProcedure [dbo].[SP_DMCS_Update_Pet_Missing]    Script Date: 12/20/2013 4:32:40 PM ******/
DROP PROCEDURE [dbo].[SP_DMCS_Update_Pet_Missing]
GO

/****** Object:  StoredProcedure [dbo].[SP_DMCS_Update_Pet_Missing]    Script Date: 12/20/2013 4:32:40 PM ******/
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

Commit