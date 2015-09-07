/****** Object:  Table [dbo].[missing_client_location]    Script Date: 9/7/2015 11:22:48 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[missing_client_location](
  [missing_client_location_id] int IDENTITY(1,1) NOT NULL,
  [missing_client_id] int NOT NULL,
  [reporting_client_id] int NOT NULL,
  [location_id] int NOT NULL,
  [datetime_reported] datetime NOT NULL,
 CONSTRAINT [missing_client_location_missing_client_location_id_pk] PRIMARY KEY CLUSTERED 
(
	[missing_client_location_id] ASC
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
/****** Object:  StoredProcedure [dbo].[SP_DMCS_SELECT_MISSING_CLIENT_LOCATION]    Script Date: 9/7/2015 11:22:48 AM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_SELECT_MISSING_CLIENT_LOCATION]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_SELECT_MISSING_CLIENT_LOCATION]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_SELECT_MISSING_CLIENT_LOCATION]
           @missing_client_location_id as int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
SELECT [missing_client_location_id]
      ,[missing_client_id]
      ,[reporting_client_id]
      ,[location_id]
      ,[datetime_reported]
  FROM [dbo].[missing_client_location]
 WHERE missing_client_location_id = @missing_client_location_id
End
GO
/***********************************************************/
/*************************************************/
/****** - INSERT STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_INSERT_MISSING_CLIENT_LOCATION]    Script Date: 9/7/2015 11:22:48 AM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_INSERT_MISSING_CLIENT_LOCATION]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_INSERT_MISSING_CLIENT_LOCATION]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_INSERT_MISSING_CLIENT_LOCATION]
	  @missing_client_id as int,
	  @reporting_client_id as int,
	  @location_id as int
	  @datetime_reported as datetime,
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	  IF @missing_client_id = 0
    BEGIN
    SET @missing_client_id = null
    END
	  IF @reporting_client_id = 0
    BEGIN
    SET @reporting_client_id = null
    END
	  IF @location_id = 0
    BEGIN
    SET @location_id = null
    END
	  IF @datetime_reported = '9/9/1900 12:00:00 AM'
    BEGIN
    SET @datetime_reported = null
    END
	Insert INTO [dbo].[missing_client_location]
           (
            [missing_client_id]
           ,[reporting_client_id]
           ,[location_id]
           ,[datetime_reported]
            )
     VALUES (
            @missing_client_id
           ,@reporting_client_id
           ,@location_id
           ,@datetime_reported
            )
END
GO
/***********************************************************/
/*************************************************/
/****** - UPDATE STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_UPDATE_MISSING_CLIENT_LOCATION]    Script Date: 9/7/2015 11:22:48 AM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_UPDATE_MISSING_CLIENT_LOCATION]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_UPDATE_MISSING_CLIENT_LOCATION]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_UPDATE_MISSING_CLIENT_LOCATION]
	  @missing_client_location_id as int,
	  @missing_client_id as int,
	  @reporting_client_id as int,
	  @location_id as int
	  @datetime_reported as datetime,
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	  IF @missing_client_id = 0
    BEGIN
    SET @missing_client_id = null
    END
	  IF @reporting_client_id = 0
    BEGIN
    SET @reporting_client_id = null
    END
	  IF @location_id = 0
    BEGIN
    SET @location_id = null
    END
	  IF @datetime_reported = '9/9/1900 12:00:00 AM'
    BEGIN
    SET @datetime_reported = null
    END
	UPDATE [dbo].[missing_client_location]
       SET
		   [missing_client_id] = @missing_client_id,
		   [reporting_client_id] = @reporting_client_id,
		   [location_id] = @location_id,
		   [datetime_reported] = @datetime_reported
       WHERE missing_client_location_id = @missing_client_location_id
END
GO
/***********************************************************/
/*************************************************/
/****** - DELETE STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_DELETE_MISSING_CLIENT_LOCATION]    Script Date: 9/7/2015 11:22:48 AM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_DELETE_MISSING_CLIENT_LOCATION]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_DELETE_MISSING_CLIENT_LOCATION]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_DELETE_MISSING_CLIENT_LOCATION]
	@missing_client_location_id int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	Delete dbo.missing_client_location
	where missing_client_location_id = @missing_client_location_id
END
GO
/***********************************************************/
/*************************************************/
/****** - GET STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_GET_MISSING_CLIENT_LOCATION]    Script Date: 9/7/2015 11:22:48 AM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_GET_MISSING_CLIENT_LOCATION]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_GET_MISSING_CLIENT_LOCATION]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_GET_MISSING_CLIENT_LOCATION]
	  @missing_client_id as int,
	  @reporting_client_id as int,
	  @location_id as int
	  @datetime_reported as datetime,
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	  IF @missing_client_id = 0
    BEGIN
    SET @missing_client_id = null
    END
	  IF @reporting_client_id = 0
    BEGIN
    SET @reporting_client_id = null
    END
	  IF @location_id = 0
    BEGIN
    SET @location_id = null
    END
	  IF @datetime_reported = '9/9/1900 12:00:00 AM'
    BEGIN
    SET @datetime_reported = null
    END
    SELECT [missing_client_location_id] 
      FROM [dbo].[missing_client_location] 
       WHERE ([missing_client_id] = @missing_client_id)
       AND ([reporting_client_id] = @reporting_client_id)
       AND ([location_id] = @location_id)
       AND ([datetime_reported] = @datetime_reported)
END
GO

