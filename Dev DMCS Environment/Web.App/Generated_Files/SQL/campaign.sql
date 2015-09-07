/****** Object:  Table [dbo].[campaign]    Script Date: 9/7/2015 11:21:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[campaign](
  [campaign_id] int IDENTITY(1,1) NOT NULL,
  [campaign_name] varchar(50) NULL,
  [campaign_start_date] datetime NULL,
  [campaign_end_date] datetime NULL,
 CONSTRAINT [campaign_campaign_id_pk] PRIMARY KEY CLUSTERED 
(
	[campaign_id] ASC
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
/****** Object:  StoredProcedure [dbo].[SP_DMCS_SELECT_CAMPAIGN]    Script Date: 9/7/2015 11:21:54 AM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_SELECT_CAMPAIGN]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_SELECT_CAMPAIGN]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_SELECT_CAMPAIGN]
           @campaign_id as int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
SELECT [campaign_id]
      ,[campaign_name]
      ,[campaign_start_date]
      ,[campaign_end_date]
  FROM [dbo].[campaign]
 WHERE campaign_id = @campaign_id
End
GO
/***********************************************************/
/*************************************************/
/****** - INSERT STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_INSERT_CAMPAIGN]    Script Date: 9/7/2015 11:21:54 AM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_INSERT_CAMPAIGN]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_INSERT_CAMPAIGN]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_INSERT_CAMPAIGN]
	  @campaign_name as varchar(50),
	  @campaign_start_date as datetime
	  @campaign_end_date as datetime,
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	  IF @campaign_name = ''
    BEGIN
    SET @campaign_name = null
    END
	  IF @campaign_start_date = '9/9/1900 12:00:00 AM'
    BEGIN
    SET @campaign_start_date = null
    END
	  IF @campaign_end_date = '9/9/1900 12:00:00 AM'
    BEGIN
    SET @campaign_end_date = null
    END
	Insert INTO [dbo].[campaign]
           (
            [campaign_name]
           ,[campaign_start_date]
           ,[campaign_end_date]
            )
     VALUES (
            @campaign_name
           ,@campaign_start_date
           ,@campaign_end_date
            )
END
GO
/***********************************************************/
/*************************************************/
/****** - UPDATE STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_UPDATE_CAMPAIGN]    Script Date: 9/7/2015 11:21:54 AM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_UPDATE_CAMPAIGN]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_UPDATE_CAMPAIGN]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_UPDATE_CAMPAIGN]
	  @campaign_id as int,
	  @campaign_name as varchar(50),
	  @campaign_start_date as datetime
	  @campaign_end_date as datetime,
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	  IF @campaign_name = ''
    BEGIN
    SET @campaign_name = null
    END
	  IF @campaign_start_date = '9/9/1900 12:00:00 AM'
    BEGIN
    SET @campaign_start_date = null
    END
	  IF @campaign_end_date = '9/9/1900 12:00:00 AM'
    BEGIN
    SET @campaign_end_date = null
    END
	UPDATE [dbo].[campaign]
       SET
		   [campaign_name] = @campaign_name,
		   [campaign_start_date] = @campaign_start_date,
		   [campaign_end_date] = @campaign_end_date
       WHERE campaign_id = @campaign_id
END
GO
/***********************************************************/
/*************************************************/
/****** - DELETE STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_DELETE_CAMPAIGN]    Script Date: 9/7/2015 11:21:54 AM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_DELETE_CAMPAIGN]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_DELETE_CAMPAIGN]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_DELETE_CAMPAIGN]
	@campaign_id int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	Delete dbo.campaign
	where campaign_id = @campaign_id
END
GO
/***********************************************************/
/*************************************************/
/****** - GET STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_GET_CAMPAIGN]    Script Date: 9/7/2015 11:21:54 AM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_GET_CAMPAIGN]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_GET_CAMPAIGN]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_GET_CAMPAIGN]
	  @campaign_name as varchar(50),
	  @campaign_start_date as datetime
	  @campaign_end_date as datetime,
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	  IF @campaign_name = ''
    BEGIN
    SET @campaign_name = null
    END
	  IF @campaign_start_date = '9/9/1900 12:00:00 AM'
    BEGIN
    SET @campaign_start_date = null
    END
	  IF @campaign_end_date = '9/9/1900 12:00:00 AM'
    BEGIN
    SET @campaign_end_date = null
    END
    SELECT [campaign_id] 
      FROM [dbo].[campaign] 
       WHERE ([campaign_name] like @campaign_name or [campaign_name] is null)
       AND ([campaign_start_date] = @campaign_start_date or [campaign_start_date] is null)
       AND ([campaign_end_date] = @campaign_end_date or [campaign_end_date] is null)
END
GO

