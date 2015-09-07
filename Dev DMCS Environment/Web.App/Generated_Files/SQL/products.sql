/****** Object:  Table [dbo].[products]    Script Date: 9/7/2015 11:23:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[products](
  [product_id] int IDENTITY(1,1) NOT NULL,
  [Resource_ID] int NULL,
  [product_name] varchar(MAX) NOT NULL,
  [product_type] varchar(MAX) NOT NULL,
  [product_qty] int NOT NULL,
  [product_desc] varchar(MAX) NOT NULL,
  [product_color] varchar(10) NULL,
  [product_size] varchar(50) NULL,
  [product_cost] money NULL,
  [Product_exp_date] datetime NULL,
  [Product_Alergy_info] varchar(50) NULL,
  [Product_refrigde] char(1) NULL,
  [Product_Flammable] char(1) NULL,
  [Product_Hazard] char(1) NULL,
  [Product_Other] varchar(1) NULL,
  [Product_Min_Inv] int NULL,
  [Product_Barcode] varchar(MAX) NULL,
  [Product_subtype] varchar(50) NULL,
  [Make] varchar(50) NULL,
  [Model] varchar(50) NULL,
  [FEMA_Description] varchar(2000) NULL,
  [Year] varchar(20) NULL,
  [RFID] varchar(20) NULL,
  [GPS] geography(MAX) NULL,
  [Serial_Number] varchar(20) NULL,
  [Height] varchar(20) NULL,
  [Length] varchar(20) NULL,
  [Depth] varchar(20) NULL,
  [Weight] varchar(20) NULL,
  [OAI] varchar(20) NULL,
  [OAI_Type] varchar(20) NULL,
  [Use] varchar(50) NULL,
  [Brand] varchar(50) NULL,
  [Power_Supply] varchar(20) NULL,
  [Gas_Type] varchar(20) NULL,
  [Needs_Gas] bit NULL,
  [Needs_Electricity] bit NULL,
  [Availability] varchar(1) NULL,
  [Datetime] datetime NULL,
  [OpenStatus] varchar(1) NULL,
 CONSTRAINT [products_product_id_pk] PRIMARY KEY CLUSTERED 
(
	[product_id] ASC
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
/****** Object:  StoredProcedure [dbo].[SP_DMCS_SELECT_PRODUCTS]    Script Date: 9/7/2015 11:23:07 AM ******/
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
/****** Object:  StoredProcedure [dbo].[SP_DMCS_INSERT_PRODUCTS]    Script Date: 9/7/2015 11:23:07 AM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_INSERT_PRODUCTS]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_INSERT_PRODUCTS]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_INSERT_PRODUCTS]
	  @Resource_ID as int,
	  @product_name as varchar(MAX),
	  @product_type as varchar(MAX),
	  @product_qty as int,
	  @product_desc as varchar(MAX),
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
	  @Datetime as datetime
	  @OpenStatus as varchar(1),
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
	  IF @product_desc = ''
    BEGIN
    SET @product_desc = null
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
/****** - UPDATE STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_UPDATE_PRODUCTS]    Script Date: 9/7/2015 11:23:07 AM ******/
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
	  @product_name as varchar(MAX),
	  @product_type as varchar(MAX),
	  @product_qty as int,
	  @product_desc as varchar(MAX),
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
	  @Datetime as datetime
	  @OpenStatus as varchar(1),
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
	  IF @product_desc = ''
    BEGIN
    SET @product_desc = null
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
/****** Object:  StoredProcedure [dbo].[SP_DMCS_DELETE_PRODUCTS]    Script Date: 9/7/2015 11:23:07 AM ******/
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
/****** - GET STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_GET_PRODUCTS]    Script Date: 9/7/2015 11:23:07 AM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_GET_PRODUCTS]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_GET_PRODUCTS]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_GET_PRODUCTS]
	  @Resource_ID as int,
	  @product_name as varchar(MAX),
	  @product_type as varchar(MAX),
	  @product_qty as int,
	  @product_desc as varchar(MAX),
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
	  @Datetime as datetime
	  @OpenStatus as varchar(1),
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
	  IF @product_desc = ''
    BEGIN
    SET @product_desc = null
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

