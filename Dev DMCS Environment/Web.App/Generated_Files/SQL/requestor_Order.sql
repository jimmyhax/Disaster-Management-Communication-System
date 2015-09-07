/****** Object:  Table [dbo].[requestor_Order]    Script Date: 9/7/2015 11:23:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[requestor_Order](
  [OrderID] int IDENTITY(1,1) NOT NULL,
  [Requestor_ID] int NULL,
  [EncounterID] int NULL,
  [OrderPriority] int NULL,
  [OrderNum] int NULL,
  [ShipToAddressID] int NULL,
  [OrderDeliveryType] varchar(20) NULL,
  [OrderPickUpDate] datetime NULL,
 CONSTRAINT [requestor_Order_OrderID_pk] PRIMARY KEY CLUSTERED 
(
	[OrderID] ASC
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
/****** Object:  StoredProcedure [dbo].[SP_DMCS_SELECT_REQUESTOR_ORDER]    Script Date: 9/7/2015 11:23:17 AM ******/
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
/****** Object:  StoredProcedure [dbo].[SP_DMCS_INSERT_REQUESTOR_ORDER]    Script Date: 9/7/2015 11:23:17 AM ******/
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
	  @OrderDeliveryType as varchar(20)
	  @OrderPickUpDate as datetime,
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
/****** - UPDATE STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_UPDATE_REQUESTOR_ORDER]    Script Date: 9/7/2015 11:23:17 AM ******/
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
	  @OrderDeliveryType as varchar(20)
	  @OrderPickUpDate as datetime,
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
/****** Object:  StoredProcedure [dbo].[SP_DMCS_DELETE_REQUESTOR_ORDER]    Script Date: 9/7/2015 11:23:17 AM ******/
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
/****** - GET STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_GET_REQUESTOR_ORDER]    Script Date: 9/7/2015 11:23:17 AM ******/
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
	  @OrderDeliveryType as varchar(20)
	  @OrderPickUpDate as datetime,
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

