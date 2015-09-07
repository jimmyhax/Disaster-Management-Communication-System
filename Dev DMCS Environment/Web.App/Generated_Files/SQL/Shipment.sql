/****** Object:  Table [dbo].[Shipment]    Script Date: 9/7/2015 11:23:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Shipment](
  [ShipmentID] int IDENTITY(1,1) NOT NULL,
  [WarehouseID] int NOT NULL,
  [Tracking_Num] varchar(128) NOT NULL,
  [Ship_Method] varchar(30) NOT NULL,
  [Other] text(2147483647) NULL,
  [OrderRecByID] int NULL,
  [FullOrderReceived] char(1) NULL,
 CONSTRAINT [Shipment_ShipmentID_pk] PRIMARY KEY CLUSTERED 
(
	[ShipmentID] ASC
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
/****** Object:  StoredProcedure [dbo].[SP_DMCS_SELECT_SHIPMENT]    Script Date: 9/7/2015 11:23:25 AM ******/
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
/****** Object:  StoredProcedure [dbo].[SP_DMCS_INSERT_SHIPMENT]    Script Date: 9/7/2015 11:23:25 AM ******/
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
	  @OrderRecByID as int
	  @FullOrderReceived as char(1),
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
/****** - UPDATE STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_UPDATE_SHIPMENT]    Script Date: 9/7/2015 11:23:25 AM ******/
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
	  @OrderRecByID as int
	  @FullOrderReceived as char(1),
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
/****** Object:  StoredProcedure [dbo].[SP_DMCS_DELETE_SHIPMENT]    Script Date: 9/7/2015 11:23:25 AM ******/
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
/****** - GET STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_GET_SHIPMENT]    Script Date: 9/7/2015 11:23:25 AM ******/
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
	  @OrderRecByID as int
	  @FullOrderReceived as char(1),
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

