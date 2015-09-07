/****** Object:  Table [dbo].[Donor_Product]    Script Date: 9/7/2015 11:22:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Donor_Product](
  [DonorProductID] int IDENTITY(1,1) NOT NULL,
  [DonorID] int NOT NULL,
  [ProductID] int NOT NULL,
  [quantity] int NULL,
  [other_info] varchar(50) NULL,
  [Product_rec_date] datetime NOT NULL,
  [AmountOfProdDonated] varchar(1) NULL,
 CONSTRAINT [Donor_Product_DonorProductID_pk] PRIMARY KEY CLUSTERED 
(
	[DonorProductID] ASC
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
/****** Object:  StoredProcedure [dbo].[SP_DMCS_SELECT_DONOR_PRODUCT]    Script Date: 9/7/2015 11:22:09 AM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_SELECT_DONOR_PRODUCT]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_SELECT_DONOR_PRODUCT]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_SELECT_DONOR_PRODUCT]
           @DonorProductID as int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
SELECT [DonorProductID]
      ,[DonorID]
      ,[ProductID]
      ,[quantity]
      ,[other_info]
      ,[Product_rec_date]
      ,[AmountOfProdDonated]
  FROM [dbo].[Donor_Product]
 WHERE DonorProductID = @DonorProductID
End
GO
/***********************************************************/
/*************************************************/
/****** - INSERT STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_INSERT_DONOR_PRODUCT]    Script Date: 9/7/2015 11:22:09 AM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_INSERT_DONOR_PRODUCT]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_INSERT_DONOR_PRODUCT]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_INSERT_DONOR_PRODUCT]
	  @DonorID as int,
	  @ProductID as int,
	  @quantity as int,
	  @other_info as varchar(50),
	  @Product_rec_date as datetime
	  @AmountOfProdDonated as varchar(1),
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	  IF @DonorID = 0
    BEGIN
    SET @DonorID = null
    END
	  IF @ProductID = 0
    BEGIN
    SET @ProductID = null
    END
	  IF @quantity = 0
    BEGIN
    SET @quantity = null
    END
	  IF @other_info = ''
    BEGIN
    SET @other_info = null
    END
	  IF @Product_rec_date = '9/9/1900 12:00:00 AM'
    BEGIN
    SET @Product_rec_date = null
    END
	  IF @AmountOfProdDonated = ''
    BEGIN
    SET @AmountOfProdDonated = null
    END
	Insert INTO [dbo].[Donor_Product]
           (
            [DonorID]
           ,[ProductID]
           ,[quantity]
           ,[other_info]
           ,[Product_rec_date]
           ,[AmountOfProdDonated]
            )
     VALUES (
            @DonorID
           ,@ProductID
           ,@quantity
           ,@other_info
           ,@Product_rec_date
           ,@AmountOfProdDonated
            )
END
GO
/***********************************************************/
/*************************************************/
/****** - UPDATE STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_UPDATE_DONOR_PRODUCT]    Script Date: 9/7/2015 11:22:09 AM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_UPDATE_DONOR_PRODUCT]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_UPDATE_DONOR_PRODUCT]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_UPDATE_DONOR_PRODUCT]
	  @DonorProductID as int,
	  @DonorID as int,
	  @ProductID as int,
	  @quantity as int,
	  @other_info as varchar(50),
	  @Product_rec_date as datetime
	  @AmountOfProdDonated as varchar(1),
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	  IF @DonorID = 0
    BEGIN
    SET @DonorID = null
    END
	  IF @ProductID = 0
    BEGIN
    SET @ProductID = null
    END
	  IF @quantity = 0
    BEGIN
    SET @quantity = null
    END
	  IF @other_info = ''
    BEGIN
    SET @other_info = null
    END
	  IF @Product_rec_date = '9/9/1900 12:00:00 AM'
    BEGIN
    SET @Product_rec_date = null
    END
	  IF @AmountOfProdDonated = ''
    BEGIN
    SET @AmountOfProdDonated = null
    END
	UPDATE [dbo].[Donor_Product]
       SET
		   [DonorID] = @DonorID,
		   [ProductID] = @ProductID,
		   [quantity] = @quantity,
		   [other_info] = @other_info,
		   [Product_rec_date] = @Product_rec_date,
		   [AmountOfProdDonated] = @AmountOfProdDonated
       WHERE DonorProductID = @DonorProductID
END
GO
/***********************************************************/
/*************************************************/
/****** - DELETE STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_DELETE_DONOR_PRODUCT]    Script Date: 9/7/2015 11:22:09 AM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_DELETE_DONOR_PRODUCT]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_DELETE_DONOR_PRODUCT]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_DELETE_DONOR_PRODUCT]
	@DonorProductID int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	Delete dbo.Donor_Product
	where DonorProductID = @DonorProductID
END
GO
/***********************************************************/
/*************************************************/
/****** - GET STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_GET_DONOR_PRODUCT]    Script Date: 9/7/2015 11:22:09 AM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_GET_DONOR_PRODUCT]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_GET_DONOR_PRODUCT]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_GET_DONOR_PRODUCT]
	  @DonorID as int,
	  @ProductID as int,
	  @quantity as int,
	  @other_info as varchar(50),
	  @Product_rec_date as datetime
	  @AmountOfProdDonated as varchar(1),
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	  IF @DonorID = 0
    BEGIN
    SET @DonorID = null
    END
	  IF @ProductID = 0
    BEGIN
    SET @ProductID = null
    END
	  IF @quantity = 0
    BEGIN
    SET @quantity = null
    END
	  IF @other_info = ''
    BEGIN
    SET @other_info = null
    END
	  IF @Product_rec_date = '9/9/1900 12:00:00 AM'
    BEGIN
    SET @Product_rec_date = null
    END
	  IF @AmountOfProdDonated = ''
    BEGIN
    SET @AmountOfProdDonated = null
    END
    SELECT [DonorProductID] 
      FROM [dbo].[Donor_Product] 
       WHERE ([DonorID] = @DonorID)
       AND ([ProductID] = @ProductID)
       AND ([quantity] = @quantity or [quantity] is null)
       AND ([other_info] like @other_info or [other_info] is null)
       AND ([Product_rec_date] = @Product_rec_date)
       AND ([AmountOfProdDonated] like @AmountOfProdDonated or [AmountOfProdDonated] is null)
END
GO

