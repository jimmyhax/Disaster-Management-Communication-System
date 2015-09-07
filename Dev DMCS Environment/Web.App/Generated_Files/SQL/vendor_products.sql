/****** Object:  Table [dbo].[vendor_products]    Script Date: 9/7/2015 11:23:33 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[vendor_products](
  [vendor_prod_id] int IDENTITY(1,1) NOT NULL,
  [vendor_id] int NOT NULL,
  [product_id] int NOT NULL,
  [product_qty] int NOT NULL,
  [Product_exp_date] char(1) NULL,
  [lot_id] int NULL,
  [Department] varchar(100) NULL,
 CONSTRAINT [vendor_products_vendor_prod_id_pk] PRIMARY KEY CLUSTERED 
(
	[vendor_prod_id] ASC
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
/****** Object:  StoredProcedure [dbo].[SP_DMCS_SELECT_VENDOR_PRODUCTS]    Script Date: 9/7/2015 11:23:33 AM ******/
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
/****** Object:  StoredProcedure [dbo].[SP_DMCS_INSERT_VENDOR_PRODUCTS]    Script Date: 9/7/2015 11:23:33 AM ******/
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
	  @lot_id as int
	  @Department as varchar(100),
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
/****** - UPDATE STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_UPDATE_VENDOR_PRODUCTS]    Script Date: 9/7/2015 11:23:33 AM ******/
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
	  @lot_id as int
	  @Department as varchar(100),
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
/****** Object:  StoredProcedure [dbo].[SP_DMCS_DELETE_VENDOR_PRODUCTS]    Script Date: 9/7/2015 11:23:33 AM ******/
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
/****** - GET STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_GET_VENDOR_PRODUCTS]    Script Date: 9/7/2015 11:23:33 AM ******/
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
	  @lot_id as int
	  @Department as varchar(100),
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

