/****** Object:  Table [dbo].[warehouse_product_Location]    Script Date: 9/7/2015 11:23:36 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[warehouse_product_Location](
  [warehouse_product_location_id] int IDENTITY(1,1) NOT NULL,
  [warehouse_id] int NOT NULL,
  [product_id] int NOT NULL,
  [Location_ID] int NULL,
  [service_id] int NULL,
  [Time_Date_MIA] datetime NULL,
  [Experiation_Date] datetime NULL,
  [min_inv] int NULL,
  [status] varchar(1) NOT NULL,
  [Exp_delivery_date] datetime NULL,
  [qty_onhand] int NOT NULL,
  [qty_commit] int NOT NULL,
  [qty_order] int NOT NULL,
  [encounter_id] int NULL,
  [address_id] int NULL,
 CONSTRAINT [warehouse_product_Location_warehouse_product_location_id_pk] PRIMARY KEY CLUSTERED 
(
	[warehouse_product_location_id] ASC
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
/****** Object:  StoredProcedure [dbo].[SP_DMCS_SELECT_WAREHOUSE_PRODUCT_LOCATION]    Script Date: 9/7/2015 11:23:36 AM ******/
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
/****** Object:  StoredProcedure [dbo].[SP_DMCS_INSERT_WAREHOUSE_PRODUCT_LOCATION]    Script Date: 9/7/2015 11:23:36 AM ******/
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
	  @encounter_id as int
	  @address_id as int,
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
/****** - UPDATE STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_UPDATE_WAREHOUSE_PRODUCT_LOCATION]    Script Date: 9/7/2015 11:23:36 AM ******/
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
	  @encounter_id as int
	  @address_id as int,
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
/****** Object:  StoredProcedure [dbo].[SP_DMCS_DELETE_WAREHOUSE_PRODUCT_LOCATION]    Script Date: 9/7/2015 11:23:36 AM ******/
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
/****** - GET STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_GET_WAREHOUSE_PRODUCT_LOCATION]    Script Date: 9/7/2015 11:23:36 AM ******/
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
	  @encounter_id as int
	  @address_id as int,
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

