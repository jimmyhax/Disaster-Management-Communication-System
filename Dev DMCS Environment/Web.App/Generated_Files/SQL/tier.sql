/****** Object:  Table [dbo].[tier]    Script Date: 9/7/2015 11:23:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tier](
  [tier_id] int IDENTITY(1,1) NOT NULL,
  [include_req] char(1) NOT NULL,
  [campaign_id] int NOT NULL,
  [Tier_Age_Begin_Month] int NULL,
  [Tier_Age_Begin_Year] int NULL,
  [Tier_Age_End_Month] int NULL,
  [Tier_Age_End_Year] int NULL,
 CONSTRAINT [tier_tier_id_pk] PRIMARY KEY CLUSTERED 
(
	[tier_id] ASC
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
/****** Object:  StoredProcedure [dbo].[SP_DMCS_SELECT_TIER]    Script Date: 9/7/2015 11:23:26 AM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_SELECT_TIER]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_SELECT_TIER]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_SELECT_TIER]
           @tier_id as int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
SELECT [tier_id]
      ,[include_req]
      ,[campaign_id]
      ,[Tier_Age_Begin_Month]
      ,[Tier_Age_Begin_Year]
      ,[Tier_Age_End_Month]
      ,[Tier_Age_End_Year]
  FROM [dbo].[tier]
 WHERE tier_id = @tier_id
End
GO
/***********************************************************/
/*************************************************/
/****** - INSERT STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_INSERT_TIER]    Script Date: 9/7/2015 11:23:26 AM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_INSERT_TIER]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_INSERT_TIER]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_INSERT_TIER]
	  @include_req as char(1),
	  @campaign_id as int,
	  @Tier_Age_Begin_Month as int,
	  @Tier_Age_Begin_Year as int,
	  @Tier_Age_End_Month as int
	  @Tier_Age_End_Year as int,
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	  IF @include_req = ''
    BEGIN
    SET @include_req = null
    END
	  IF @campaign_id = 0
    BEGIN
    SET @campaign_id = null
    END
	  IF @Tier_Age_Begin_Month = 0
    BEGIN
    SET @Tier_Age_Begin_Month = null
    END
	  IF @Tier_Age_Begin_Year = 0
    BEGIN
    SET @Tier_Age_Begin_Year = null
    END
	  IF @Tier_Age_End_Month = 0
    BEGIN
    SET @Tier_Age_End_Month = null
    END
	  IF @Tier_Age_End_Year = 0
    BEGIN
    SET @Tier_Age_End_Year = null
    END
	Insert INTO [dbo].[tier]
           (
            [include_req]
           ,[campaign_id]
           ,[Tier_Age_Begin_Month]
           ,[Tier_Age_Begin_Year]
           ,[Tier_Age_End_Month]
           ,[Tier_Age_End_Year]
            )
     VALUES (
            @include_req
           ,@campaign_id
           ,@Tier_Age_Begin_Month
           ,@Tier_Age_Begin_Year
           ,@Tier_Age_End_Month
           ,@Tier_Age_End_Year
            )
END
GO
/***********************************************************/
/*************************************************/
/****** - UPDATE STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_UPDATE_TIER]    Script Date: 9/7/2015 11:23:26 AM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_UPDATE_TIER]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_UPDATE_TIER]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_UPDATE_TIER]
	  @tier_id as int,
	  @include_req as char(1),
	  @campaign_id as int,
	  @Tier_Age_Begin_Month as int,
	  @Tier_Age_Begin_Year as int,
	  @Tier_Age_End_Month as int
	  @Tier_Age_End_Year as int,
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	  IF @include_req = ''
    BEGIN
    SET @include_req = null
    END
	  IF @campaign_id = 0
    BEGIN
    SET @campaign_id = null
    END
	  IF @Tier_Age_Begin_Month = 0
    BEGIN
    SET @Tier_Age_Begin_Month = null
    END
	  IF @Tier_Age_Begin_Year = 0
    BEGIN
    SET @Tier_Age_Begin_Year = null
    END
	  IF @Tier_Age_End_Month = 0
    BEGIN
    SET @Tier_Age_End_Month = null
    END
	  IF @Tier_Age_End_Year = 0
    BEGIN
    SET @Tier_Age_End_Year = null
    END
	UPDATE [dbo].[tier]
       SET
		   [include_req] = @include_req,
		   [campaign_id] = @campaign_id,
		   [Tier_Age_Begin_Month] = @Tier_Age_Begin_Month,
		   [Tier_Age_Begin_Year] = @Tier_Age_Begin_Year,
		   [Tier_Age_End_Month] = @Tier_Age_End_Month,
		   [Tier_Age_End_Year] = @Tier_Age_End_Year
       WHERE tier_id = @tier_id
END
GO
/***********************************************************/
/*************************************************/
/****** - DELETE STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_DELETE_TIER]    Script Date: 9/7/2015 11:23:26 AM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_DELETE_TIER]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_DELETE_TIER]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_DELETE_TIER]
	@tier_id int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	Delete dbo.tier
	where tier_id = @tier_id
END
GO
/***********************************************************/
/*************************************************/
/****** - GET STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_GET_TIER]    Script Date: 9/7/2015 11:23:26 AM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_GET_TIER]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_GET_TIER]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_GET_TIER]
	  @include_req as char(1),
	  @campaign_id as int,
	  @Tier_Age_Begin_Month as int,
	  @Tier_Age_Begin_Year as int,
	  @Tier_Age_End_Month as int
	  @Tier_Age_End_Year as int,
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	  IF @include_req = ''
    BEGIN
    SET @include_req = null
    END
	  IF @campaign_id = 0
    BEGIN
    SET @campaign_id = null
    END
	  IF @Tier_Age_Begin_Month = 0
    BEGIN
    SET @Tier_Age_Begin_Month = null
    END
	  IF @Tier_Age_Begin_Year = 0
    BEGIN
    SET @Tier_Age_Begin_Year = null
    END
	  IF @Tier_Age_End_Month = 0
    BEGIN
    SET @Tier_Age_End_Month = null
    END
	  IF @Tier_Age_End_Year = 0
    BEGIN
    SET @Tier_Age_End_Year = null
    END
    SELECT [tier_id] 
      FROM [dbo].[tier] 
       WHERE ([include_req] = @include_req)
       AND ([campaign_id] = @campaign_id)
       AND ([Tier_Age_Begin_Month] = @Tier_Age_Begin_Month or [Tier_Age_Begin_Month] is null)
       AND ([Tier_Age_Begin_Year] = @Tier_Age_Begin_Year or [Tier_Age_Begin_Year] is null)
       AND ([Tier_Age_End_Month] = @Tier_Age_End_Month or [Tier_Age_End_Month] is null)
       AND ([Tier_Age_End_Year] = @Tier_Age_End_Year or [Tier_Age_End_Year] is null)
END
GO

