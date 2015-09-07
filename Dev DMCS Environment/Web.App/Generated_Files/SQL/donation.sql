/****** Object:  Table [dbo].[donation]    Script Date: 9/7/2015 11:22:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[donation](
  [Donation_ID] int IDENTITY(1,1) NOT NULL,
  [Receipt_ID] int NULL,
  [Resource_ID] int NOT NULL,
  [Donor_ID] int NOT NULL,
  [Date] datetime NOT NULL,
  [Quantity] int NULL,
  [Agency_ID] int NULL,
  [Is_Monetary] bit NOT NULL,
  [Is_FEMA] bit NOT NULL,
 CONSTRAINT [donation_Donation_ID_pk] PRIMARY KEY CLUSTERED 
(
	[Donation_ID] ASC
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
/****** Object:  StoredProcedure [dbo].[SP_DMCS_SELECT_DONATION]    Script Date: 9/7/2015 11:22:08 AM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_SELECT_DONATION]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_SELECT_DONATION]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_SELECT_DONATION]
           @Donation_ID as int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
SELECT [Donation_ID]
      ,[Receipt_ID]
      ,[Resource_ID]
      ,[Donor_ID]
      ,[Date]
      ,[Quantity]
      ,[Agency_ID]
      ,[Is_Monetary]
      ,[Is_FEMA]
  FROM [dbo].[donation]
 WHERE Donation_ID = @Donation_ID
End
GO
/***********************************************************/
/*************************************************/
/****** - INSERT STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_INSERT_DONATION]    Script Date: 9/7/2015 11:22:08 AM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_INSERT_DONATION]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_INSERT_DONATION]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_INSERT_DONATION]
	  @Receipt_ID as int,
	  @Resource_ID as int,
	  @Donor_ID as int,
	  @Date as datetime,
	  @Quantity as int,
	  @Agency_ID as int,
	  @Is_Monetary as bit
	  @Is_FEMA as bit,
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	  IF @Receipt_ID = 0
    BEGIN
    SET @Receipt_ID = null
    END
	  IF @Resource_ID = 0
    BEGIN
    SET @Resource_ID = null
    END
	  IF @Donor_ID = 0
    BEGIN
    SET @Donor_ID = null
    END
	  IF @Date = '9/9/1900 12:00:00 AM'
    BEGIN
    SET @Date = null
    END
	  IF @Quantity = 0
    BEGIN
    SET @Quantity = null
    END
	  IF @Agency_ID = 0
    BEGIN
    SET @Agency_ID = null
    END
	  IF @Is_Monetary = 0
    BEGIN
    SET @Is_Monetary = null
    END
	  IF @Is_FEMA = 0
    BEGIN
    SET @Is_FEMA = null
    END
	Insert INTO [dbo].[donation]
           (
            [Receipt_ID]
           ,[Resource_ID]
           ,[Donor_ID]
           ,[Date]
           ,[Quantity]
           ,[Agency_ID]
           ,[Is_Monetary]
           ,[Is_FEMA]
            )
     VALUES (
            @Receipt_ID
           ,@Resource_ID
           ,@Donor_ID
           ,@Date
           ,@Quantity
           ,@Agency_ID
           ,@Is_Monetary
           ,@Is_FEMA
            )
END
GO
/***********************************************************/
/*************************************************/
/****** - UPDATE STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_UPDATE_DONATION]    Script Date: 9/7/2015 11:22:08 AM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_UPDATE_DONATION]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_UPDATE_DONATION]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_UPDATE_DONATION]
	  @Donation_ID as int,
	  @Receipt_ID as int,
	  @Resource_ID as int,
	  @Donor_ID as int,
	  @Date as datetime,
	  @Quantity as int,
	  @Agency_ID as int,
	  @Is_Monetary as bit
	  @Is_FEMA as bit,
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	  IF @Receipt_ID = 0
    BEGIN
    SET @Receipt_ID = null
    END
	  IF @Resource_ID = 0
    BEGIN
    SET @Resource_ID = null
    END
	  IF @Donor_ID = 0
    BEGIN
    SET @Donor_ID = null
    END
	  IF @Date = '9/9/1900 12:00:00 AM'
    BEGIN
    SET @Date = null
    END
	  IF @Quantity = 0
    BEGIN
    SET @Quantity = null
    END
	  IF @Agency_ID = 0
    BEGIN
    SET @Agency_ID = null
    END
	  IF @Is_Monetary = 0
    BEGIN
    SET @Is_Monetary = null
    END
	  IF @Is_FEMA = 0
    BEGIN
    SET @Is_FEMA = null
    END
	UPDATE [dbo].[donation]
       SET
		   [Receipt_ID] = @Receipt_ID,
		   [Resource_ID] = @Resource_ID,
		   [Donor_ID] = @Donor_ID,
		   [Date] = @Date,
		   [Quantity] = @Quantity,
		   [Agency_ID] = @Agency_ID,
		   [Is_Monetary] = @Is_Monetary,
		   [Is_FEMA] = @Is_FEMA
       WHERE Donation_ID = @Donation_ID
END
GO
/***********************************************************/
/*************************************************/
/****** - DELETE STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_DELETE_DONATION]    Script Date: 9/7/2015 11:22:08 AM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_DELETE_DONATION]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_DELETE_DONATION]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_DELETE_DONATION]
	@Donation_ID int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	Delete dbo.donation
	where Donation_ID = @Donation_ID
END
GO
/***********************************************************/
/*************************************************/
/****** - GET STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_GET_DONATION]    Script Date: 9/7/2015 11:22:08 AM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_GET_DONATION]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_GET_DONATION]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_GET_DONATION]
	  @Receipt_ID as int,
	  @Resource_ID as int,
	  @Donor_ID as int,
	  @Date as datetime,
	  @Quantity as int,
	  @Agency_ID as int,
	  @Is_Monetary as bit
	  @Is_FEMA as bit,
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	  IF @Receipt_ID = 0
    BEGIN
    SET @Receipt_ID = null
    END
	  IF @Resource_ID = 0
    BEGIN
    SET @Resource_ID = null
    END
	  IF @Donor_ID = 0
    BEGIN
    SET @Donor_ID = null
    END
	  IF @Date = '9/9/1900 12:00:00 AM'
    BEGIN
    SET @Date = null
    END
	  IF @Quantity = 0
    BEGIN
    SET @Quantity = null
    END
	  IF @Agency_ID = 0
    BEGIN
    SET @Agency_ID = null
    END
	  IF @Is_Monetary = 0
    BEGIN
    SET @Is_Monetary = null
    END
	  IF @Is_FEMA = 0
    BEGIN
    SET @Is_FEMA = null
    END
    SELECT [Donation_ID] 
      FROM [dbo].[donation] 
       WHERE ([Receipt_ID] = @Receipt_ID or [Receipt_ID] is null)
       AND ([Resource_ID] = @Resource_ID)
       AND ([Donor_ID] = @Donor_ID)
       AND ([Date] = @Date)
       AND ([Quantity] = @Quantity or [Quantity] is null)
       AND ([Agency_ID] = @Agency_ID or [Agency_ID] is null)
       AND ([Is_Monetary] = @Is_Monetary)
       AND ([Is_FEMA] = @Is_FEMA)
END
GO

