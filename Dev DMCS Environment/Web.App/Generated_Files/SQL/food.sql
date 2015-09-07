/****** Object:  Table [dbo].[food]    Script Date: 9/7/2015 11:22:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[food](
  [food_voucher_id] int IDENTITY(1,1) NOT NULL,
  [clients_served] int NOT NULL,
  [food_voucher_number] int NOT NULL,
  [date_issued] datetime NOT NULL,
  [Product_id] int NOT NULL,
 CONSTRAINT [food_food_voucher_id_pk] PRIMARY KEY CLUSTERED 
(
	[food_voucher_id] ASC
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
/****** Object:  StoredProcedure [dbo].[SP_DMCS_SELECT_FOOD]    Script Date: 9/7/2015 11:22:23 AM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_SELECT_FOOD]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_SELECT_FOOD]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_SELECT_FOOD]
           @food_voucher_id as int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
SELECT [food_voucher_id]
      ,[clients_served]
      ,[food_voucher_number]
      ,[date_issued]
      ,[Product_id]
  FROM [dbo].[food]
 WHERE food_voucher_id = @food_voucher_id
End
GO
/***********************************************************/
/*************************************************/
/****** - INSERT STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_INSERT_FOOD]    Script Date: 9/7/2015 11:22:23 AM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_INSERT_FOOD]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_INSERT_FOOD]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_INSERT_FOOD]
	  @food_voucher_id as int,
	  @clients_served as int,
	  @food_voucher_number as int,
	  @date_issued as datetime
	  @Product_id as int,
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	  IF @clients_served = 0
    BEGIN
    SET @clients_served = null
    END
	  IF @food_voucher_number = 0
    BEGIN
    SET @food_voucher_number = null
    END
	  IF @date_issued = '9/9/1900 12:00:00 AM'
    BEGIN
    SET @date_issued = null
    END
	  IF @Product_id = 0
    BEGIN
    SET @Product_id = null
    END
	Insert INTO [dbo].[food]
           (
            [food_voucher_id]
           ,[clients_served]
           ,[food_voucher_number]
           ,[date_issued]
           ,[Product_id]
            )
     VALUES (
            @food_voucher_id
           ,@clients_served
           ,@food_voucher_number
           ,@date_issued
           ,@Product_id
            )
END
GO
/***********************************************************/
/*************************************************/
/****** - UPDATE STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_UPDATE_FOOD]    Script Date: 9/7/2015 11:22:23 AM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_UPDATE_FOOD]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_UPDATE_FOOD]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_UPDATE_FOOD]
	  @food_voucher_id as int,
	  @clients_served as int,
	  @food_voucher_number as int,
	  @date_issued as datetime
	  @Product_id as int,
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	  IF @clients_served = 0
    BEGIN
    SET @clients_served = null
    END
	  IF @food_voucher_number = 0
    BEGIN
    SET @food_voucher_number = null
    END
	  IF @date_issued = '9/9/1900 12:00:00 AM'
    BEGIN
    SET @date_issued = null
    END
	  IF @Product_id = 0
    BEGIN
    SET @Product_id = null
    END
	UPDATE [dbo].[food]
       SET
		   [clients_served] = @clients_served,
		   [food_voucher_number] = @food_voucher_number,
		   [date_issued] = @date_issued,
		   [Product_id] = @Product_id
       WHERE food_voucher_id = @food_voucher_id
END
GO
/***********************************************************/
/*************************************************/
/****** - DELETE STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_DELETE_FOOD]    Script Date: 9/7/2015 11:22:23 AM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_DELETE_FOOD]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_DELETE_FOOD]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_DELETE_FOOD]
	@food_voucher_id int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	Delete dbo.food
	where food_voucher_id = @food_voucher_id
END
GO
/***********************************************************/
/*************************************************/
/****** - GET STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_GET_FOOD]    Script Date: 9/7/2015 11:22:23 AM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_GET_FOOD]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_GET_FOOD]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_GET_FOOD]
	  @clients_served as int,
	  @food_voucher_number as int,
	  @date_issued as datetime
	  @Product_id as int,
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	  IF @clients_served = 0
    BEGIN
    SET @clients_served = null
    END
	  IF @food_voucher_number = 0
    BEGIN
    SET @food_voucher_number = null
    END
	  IF @date_issued = '9/9/1900 12:00:00 AM'
    BEGIN
    SET @date_issued = null
    END
	  IF @Product_id = 0
    BEGIN
    SET @Product_id = null
    END
    SELECT [food_voucher_id] 
      FROM [dbo].[food] 
       WHERE ([clients_served] = @clients_served)
       AND ([food_voucher_number] = @food_voucher_number)
       AND ([date_issued] = @date_issued)
       AND ([Product_id] = @Product_id)
END
GO

