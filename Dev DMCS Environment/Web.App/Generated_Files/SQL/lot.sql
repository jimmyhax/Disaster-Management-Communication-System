/****** Object:  Table [dbo].[lot]    Script Date: 9/7/2015 11:22:33 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[lot](
  [lot_id] int IDENTITY(1,1) NOT NULL,
  [product_id] int NOT NULL,
  [manufactured_date] datetime NULL,
  [expiration_date] datetime NULL,
  [manufacture_name] varchar(50) NULL,
 CONSTRAINT [lot_lot_id_pk] PRIMARY KEY CLUSTERED 
(
	[lot_id] ASC
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
/****** Object:  StoredProcedure [dbo].[SP_DMCS_SELECT_LOT]    Script Date: 9/7/2015 11:22:33 AM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_SELECT_LOT]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_SELECT_LOT]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_SELECT_LOT]
           @lot_id as int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
SELECT [lot_id]
      ,[product_id]
      ,[manufactured_date]
      ,[expiration_date]
      ,[manufacture_name]
  FROM [dbo].[lot]
 WHERE lot_id = @lot_id
End
GO
/***********************************************************/
/*************************************************/
/****** - INSERT STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_INSERT_LOT]    Script Date: 9/7/2015 11:22:33 AM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_INSERT_LOT]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_INSERT_LOT]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_INSERT_LOT]
	  @product_id as int,
	  @manufactured_date as datetime,
	  @expiration_date as datetime
	  @manufacture_name as varchar(50),
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	  IF @product_id = 0
    BEGIN
    SET @product_id = null
    END
	  IF @manufactured_date = '9/9/1900 12:00:00 AM'
    BEGIN
    SET @manufactured_date = null
    END
	  IF @expiration_date = '9/9/1900 12:00:00 AM'
    BEGIN
    SET @expiration_date = null
    END
	  IF @manufacture_name = ''
    BEGIN
    SET @manufacture_name = null
    END
	Insert INTO [dbo].[lot]
           (
            [product_id]
           ,[manufactured_date]
           ,[expiration_date]
           ,[manufacture_name]
            )
     VALUES (
            @product_id
           ,@manufactured_date
           ,@expiration_date
           ,@manufacture_name
            )
END
GO
/***********************************************************/
/*************************************************/
/****** - UPDATE STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_UPDATE_LOT]    Script Date: 9/7/2015 11:22:33 AM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_UPDATE_LOT]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_UPDATE_LOT]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_UPDATE_LOT]
	  @lot_id as int,
	  @product_id as int,
	  @manufactured_date as datetime,
	  @expiration_date as datetime
	  @manufacture_name as varchar(50),
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	  IF @product_id = 0
    BEGIN
    SET @product_id = null
    END
	  IF @manufactured_date = '9/9/1900 12:00:00 AM'
    BEGIN
    SET @manufactured_date = null
    END
	  IF @expiration_date = '9/9/1900 12:00:00 AM'
    BEGIN
    SET @expiration_date = null
    END
	  IF @manufacture_name = ''
    BEGIN
    SET @manufacture_name = null
    END
	UPDATE [dbo].[lot]
       SET
		   [product_id] = @product_id,
		   [manufactured_date] = @manufactured_date,
		   [expiration_date] = @expiration_date,
		   [manufacture_name] = @manufacture_name
       WHERE lot_id = @lot_id
END
GO
/***********************************************************/
/*************************************************/
/****** - DELETE STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_DELETE_LOT]    Script Date: 9/7/2015 11:22:33 AM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_DELETE_LOT]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_DELETE_LOT]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_DELETE_LOT]
	@lot_id int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	Delete dbo.lot
	where lot_id = @lot_id
END
GO
/***********************************************************/
/*************************************************/
/****** - GET STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_GET_LOT]    Script Date: 9/7/2015 11:22:33 AM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_GET_LOT]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_GET_LOT]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_GET_LOT]
	  @product_id as int,
	  @manufactured_date as datetime,
	  @expiration_date as datetime
	  @manufacture_name as varchar(50),
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	  IF @product_id = 0
    BEGIN
    SET @product_id = null
    END
	  IF @manufactured_date = '9/9/1900 12:00:00 AM'
    BEGIN
    SET @manufactured_date = null
    END
	  IF @expiration_date = '9/9/1900 12:00:00 AM'
    BEGIN
    SET @expiration_date = null
    END
	  IF @manufacture_name = ''
    BEGIN
    SET @manufacture_name = null
    END
    SELECT [lot_id] 
      FROM [dbo].[lot] 
       WHERE ([product_id] = @product_id)
       AND ([manufactured_date] = @manufactured_date or [manufactured_date] is null)
       AND ([expiration_date] = @expiration_date or [expiration_date] is null)
       AND ([manufacture_name] like @manufacture_name or [manufacture_name] is null)
END
GO

