/****** Object:  Table [dbo].[Mobile_Product]    Script Date: 9/7/2015 11:22:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Mobile_Product](
  [Mobile_Product_id] int IDENTITY(1,1) NOT NULL,
  [Mobile_Unit_id] int NOT NULL,
  [Product_id] int NOT NULL,
  [Case_id] int NULL,
  [Lot_id] int NULL,
  [Min_inv] int NULL,
  [Quantity] int NULL,
  [Experiation_Date] datetime NULL,
 CONSTRAINT [Mobile_Product_Mobile_Product_id_pk] PRIMARY KEY CLUSTERED 
(
	[Mobile_Product_id] ASC
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
/****** Object:  StoredProcedure [dbo].[SP_DMCS_SELECT_MOBILE_PRODUCT]    Script Date: 9/7/2015 11:22:51 AM ******/
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
/****** Object:  StoredProcedure [dbo].[SP_DMCS_INSERT_MOBILE_PRODUCT]    Script Date: 9/7/2015 11:22:51 AM ******/
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
	  @Quantity as int
	  @Experiation_Date as datetime,
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
/****** - UPDATE STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_UPDATE_MOBILE_PRODUCT]    Script Date: 9/7/2015 11:22:51 AM ******/
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
	  @Quantity as int
	  @Experiation_Date as datetime,
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
/****** Object:  StoredProcedure [dbo].[SP_DMCS_DELETE_MOBILE_PRODUCT]    Script Date: 9/7/2015 11:22:51 AM ******/
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
/****** - GET STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_GET_MOBILE_PRODUCT]    Script Date: 9/7/2015 11:22:51 AM ******/
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
	  @Quantity as int
	  @Experiation_Date as datetime,
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

