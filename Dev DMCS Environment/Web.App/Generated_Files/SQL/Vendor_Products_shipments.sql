/****** Object:  Table [dbo].[Vendor_Products_shipments]    Script Date: 9/7/2015 11:23:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Vendor_Products_shipments](
  [PO_Order_no] int IDENTITY(1,1) NOT NULL,
  [ShipmentID] int NOT NULL,
  [VendorID] int NOT NULL,
  [ProductID] int NOT NULL,
  [Expect_Delivery_Date] datetime NULL,
  [orderdate] datetime NULL,
  [quantity] int NOT NULL,
  [OtherInfo] varchar(100) NULL,
  [DateReceived] datetime NULL,
  [AmountReceived] int NULL,
 CONSTRAINT [Vendor_Products_shipments_PO_Order_no_pk] PRIMARY KEY CLUSTERED 
(
	[PO_Order_no] ASC
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
/****** Object:  StoredProcedure [dbo].[SP_DMCS_SELECT_VENDOR_PRODUCTS_SHIPMENTS]    Script Date: 9/7/2015 11:23:34 AM ******/
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
/****** Object:  StoredProcedure [dbo].[SP_DMCS_INSERT_VENDOR_PRODUCTS_SHIPMENTS]    Script Date: 9/7/2015 11:23:34 AM ******/
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
	  @DateReceived as datetime
	  @AmountReceived as int,
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
/****** - UPDATE STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_UPDATE_VENDOR_PRODUCTS_SHIPMENTS]    Script Date: 9/7/2015 11:23:34 AM ******/
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
	  @DateReceived as datetime
	  @AmountReceived as int,
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
/****** Object:  StoredProcedure [dbo].[SP_DMCS_DELETE_VENDOR_PRODUCTS_SHIPMENTS]    Script Date: 9/7/2015 11:23:34 AM ******/
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
/****** - GET STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_GET_VENDOR_PRODUCTS_SHIPMENTS]    Script Date: 9/7/2015 11:23:34 AM ******/
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
	  @DateReceived as datetime
	  @AmountReceived as int,
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

