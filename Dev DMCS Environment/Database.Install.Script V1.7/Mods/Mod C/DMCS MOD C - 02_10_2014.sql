/****DMCS Mod: C****/
/****AUTHOR: James MIller****/
/****CREATED: 02/10/2014****/

/****DESCRIPTION:****/
/*This script contains the following changes/updates*/
/*Update 1:*/
/*Changed:	WAREHOUSE   Warehouse_Type	int	(4) = WAREHOUSE   Warehouse_Type	varchar	(10)*/

/*Update 2:*/
/*Changed:	WAREHOUSE	Address_ID = Allows null*/

/*Update 3:*/
/*Added: 		WAREHOUSE	Location_ID	= Allows null*/

/*Update 4:*/
/*Added:		WAREHOUSE_PRODUCT_LOCATION	Address_ID = Allows null*/



BEGIN TRANSACTION 
/**********************************/
/**********************************/
/***********DROP TABLES************/
/**********************************/
/**********************************/

/******Drilling down to Warehouse******/
DROP TABLE [dbo].[warehouse_product_Location]
DROP TABLE [dbo].[Order_Product]
DROP TABLE [dbo].[Vendor_Products_shipments]
DROP TABLE [dbo].[Shipment]
DROP TABLE [dbo].[warehouse]



/**********************************/
/**********************************/
/*********RECREATE TABLES**********/
/**********************************/
/**********************************/

/****** Object:  Table [dbo].[warehouse_product_Location]    Script Date: 2/10/2014 1:07:17 PM ******/
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
	[address_id] [int] NULL
 CONSTRAINT [warehouse_product_pk] PRIMARY KEY CLUSTERED 
(
	[warehouse_product_location_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO



/****** Object:  Table [dbo].[Order_Product]    Script Date: 2/10/2014 1:14:48 PM ******/
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


/****** Object:  Table [dbo].[Vendor_Products_shipments]    Script Date: 2/10/2014 1:23:21 PM ******/
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



/****** Object:  Table [dbo].[Shipment]    Script Date: 2/10/2014 1:16:43 PM ******/
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


/****** Object:  Table [dbo].[warehouse]    Script Date: 2/10/2014 1:17:35 PM ******/
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
	[Location_ID] [int] NULL
 CONSTRAINT [warehouse_pk] PRIMARY KEY CLUSTERED 
(
	[warehouse_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

/**********************************/
/**********************************/
/**************F Keys**************/
/**********************************/
/**********************************/

/********************************************/
/*******************WPL**********************/
/********************************************/
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

ALTER TABLE [dbo].[warehouse_product_Location]  WITH CHECK ADD  CONSTRAINT [w_p_address_id_fk] FOREIGN KEY([address_id])
REFERENCES [dbo].[address] ([address_id])
GO

ALTER TABLE [dbo].[warehouse_product_Location] CHECK CONSTRAINT [w_p_address_id_fk]
GO
/********************************************/
/**************Order Product*****************/
/********************************************/

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




/********************************************/
/*********Vendor_Product_Shipment************/
/********************************************/

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




/********************************************/
/****************Shipment********************/
/********************************************/

ALTER TABLE [dbo].[Shipment]  WITH CHECK ADD  CONSTRAINT [shipment_warehouse_id_fk] FOREIGN KEY([WarehouseID])
REFERENCES [dbo].[warehouse] ([warehouse_id])
GO

ALTER TABLE [dbo].[Shipment] CHECK CONSTRAINT [shipment_warehouse_id_fk]
GO

/********************************************/
/****************Warehouse*******************/
/********************************************/


ALTER TABLE [dbo].[warehouse]  WITH CHECK ADD  CONSTRAINT [warehouse_address_id_fk] FOREIGN KEY([address_id])
REFERENCES [dbo].[address] ([address_id])
GO

ALTER TABLE [dbo].[warehouse] CHECK CONSTRAINT [warehouse_address_id_fk]
GO

ALTER TABLE [dbo].[warehouse]  WITH CHECK ADD  CONSTRAINT [warehouse_location_id_fk] FOREIGN KEY([location_ID])
REFERENCES [dbo].[location] ([location_ID])
GO

ALTER TABLE [dbo].[warehouse] CHECK CONSTRAINT [warehouse_location_id_fk]
GO


/**********************************/
/**********************************/
/**************SPs*****************/
/**********************************/
/**********************************/



/****** Object:  StoredProcedure [dbo].[SP_DMCS_Insert_Warehouse]    Script Date: 2/10/2014 1:29:46 PM ******/
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


/****** Object:  StoredProcedure [dbo].[SP_DMCS_get_WarehouseID]    Script Date: 2/10/2014 1:32:32 PM ******/
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


/****** Object:  StoredProcedure [dbo].[SP_DMCS_Select_Warehouse]    Script Date: 2/10/2014 1:34:10 PM ******/
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
	  ,[Location_ID]
  FROM [dbo].[warehouse]
 WHERE warehouse_id = @warehouse_id
End


GO

/****** Object:  StoredProcedure [dbo].[SP_DMCS_Select_Warehouse_by_Address_id]    Script Date: 2/10/2014 1:35:05 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO




-- =============================================
-- Author:		Edward Sobanski
-- Create date: 5/22/2012
-- Description:	Select row on warehouse table
-- =============================================
ALTER PROCEDURE [dbo].[SP_DMCS_Select_Warehouse_by_Address_id]
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


/****** Object:  StoredProcedure [dbo].[SP_DMCS_Update_Warehouse]    Script Date: 2/10/2014 1:36:23 PM ******/
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


/****** Object:  StoredProcedure [dbo].[SP_DMCS_Insert_Warehouse_Products]    Script Date: 2/10/2014 1:40:06 PM ******/
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



/****** Object:  StoredProcedure [dbo].[SP_DMCS_Select_warehouse_product_location]    Script Date: 2/10/2014 1:43:05 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		Edward Sobanski
-- Create date: 5/22/2012
-- Description:	Select row on warehouse products table
-- =============================================
ALTER PROCEDURE [dbo].[SP_DMCS_Select_warehouse_product_location]
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

/****** Object:  StoredProcedure [dbo].[SP_DMCS_Select_warehouse_product_location_By_Product_ID]    Script Date: 2/10/2014 1:43:57 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		Edward Sobanski
-- Create date: 5/22/2012
-- Description:	Select row on warehouse products table
-- =============================================
ALTER PROCEDURE [dbo].[SP_DMCS_Select_warehouse_product_location_By_Product_ID]
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


/****** Object:  StoredProcedure [dbo].[SP_DMCS_Update_Warehouse_Product_Location]    Script Date: 2/10/2014 1:45:41 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Edward Sobanski
-- Create date: 5/22/2012
-- Description:	Update row on warehouse products table
-- =============================================
ALTER PROCEDURE [dbo].[SP_DMCS_Update_Warehouse_Product_Location]
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



/****** Object:  StoredProcedure [dbo].[SP_DMCS_Update_Warehouse_Products]    Script Date: 2/10/2014 1:49:03 PM ******/
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