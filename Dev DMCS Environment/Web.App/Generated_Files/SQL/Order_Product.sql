/****** Object:  Table [dbo].[Order_Product]    Script Date: 9/7/2015 11:22:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Order_Product](
  [order_Product_ID] int IDENTITY(1,1) NOT NULL,
  [orderID] int NOT NULL,
  [ProductID] int NOT NULL,
  [Quantity] int NOT NULL,
  [warehouseid] int NOT NULL,
  [DatePicked] datetime NULL,
  [Qtypicked] int NULL,
 CONSTRAINT [Order_Product_order_Product_ID_pk] PRIMARY KEY CLUSTERED 
(
	[order_Product_ID] ASC
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
/****** Object:  StoredProcedure [dbo].[SP_DMCS_SELECT_ORDER_PRODUCT]    Script Date: 9/7/2015 11:22:54 AM ******/
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
/****** Object:  StoredProcedure [dbo].[SP_DMCS_INSERT_ORDER_PRODUCT]    Script Date: 9/7/2015 11:22:54 AM ******/
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
	  @DatePicked as datetime
	  @Qtypicked as int,
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
/****** - UPDATE STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_UPDATE_ORDER_PRODUCT]    Script Date: 9/7/2015 11:22:54 AM ******/
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
	  @DatePicked as datetime
	  @Qtypicked as int,
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
/****** Object:  StoredProcedure [dbo].[SP_DMCS_DELETE_ORDER_PRODUCT]    Script Date: 9/7/2015 11:22:54 AM ******/
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
/****** - GET STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_GET_ORDER_PRODUCT]    Script Date: 9/7/2015 11:22:54 AM ******/
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
	  @DatePicked as datetime
	  @Qtypicked as int,
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

