/****** Object:  Table [dbo].[disaster]    Script Date: 9/7/2015 11:22:04 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[disaster](
  [disaster_id] int IDENTITY(1,1) NOT NULL,
  [disaster_name] varchar(50) NOT NULL,
  [disaster_type] varchar(30) NOT NULL,
  [disaster_start_date] datetime NOT NULL,
  [disaster_end_date] datetime NULL,
  [disaster_north_latitude] decimal NULL,
  [disaster_north_longitude] decimal NULL,
  [disaster_south_latitude] decimal NULL,
  [disaster_south_longitude] decimal NULL,
  [disaster_east_latitude] decimal NULL,
  [disaster_east_longitude] decimal NULL,
  [disaster_west_latitude] decimal NULL,
  [disaster_west_longitude] decimal NULL,
 CONSTRAINT [disaster_disaster_id_pk] PRIMARY KEY CLUSTERED 
(
	[disaster_id] ASC
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
/****** Object:  StoredProcedure [dbo].[SP_DMCS_SELECT_DISASTER]    Script Date: 9/7/2015 11:22:04 AM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_SELECT_DISASTER]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_SELECT_DISASTER]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_SELECT_DISASTER]
           @disaster_id as int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
SELECT [disaster_id]
      ,[disaster_name]
      ,[disaster_type]
      ,[disaster_start_date]
      ,[disaster_end_date]
      ,[disaster_north_latitude]
      ,[disaster_north_longitude]
      ,[disaster_south_latitude]
      ,[disaster_south_longitude]
      ,[disaster_east_latitude]
      ,[disaster_east_longitude]
      ,[disaster_west_latitude]
      ,[disaster_west_longitude]
  FROM [dbo].[disaster]
 WHERE disaster_id = @disaster_id
End
GO
/***********************************************************/
/*************************************************/
/****** - INSERT STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_INSERT_DISASTER]    Script Date: 9/7/2015 11:22:04 AM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_INSERT_DISASTER]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_INSERT_DISASTER]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_INSERT_DISASTER]
	  @disaster_name as varchar(50),
	  @disaster_type as varchar(30),
	  @disaster_start_date as datetime,
	  @disaster_end_date as datetime,
	  @disaster_north_latitude as decimal,
	  @disaster_north_longitude as decimal,
	  @disaster_south_latitude as decimal,
	  @disaster_south_longitude as decimal,
	  @disaster_east_latitude as decimal,
	  @disaster_east_longitude as decimal,
	  @disaster_west_latitude as decimal
	  @disaster_west_longitude as decimal,
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	  IF @disaster_name = ''
    BEGIN
    SET @disaster_name = null
    END
	  IF @disaster_type = ''
    BEGIN
    SET @disaster_type = null
    END
	  IF @disaster_start_date = '9/9/1900 12:00:00 AM'
    BEGIN
    SET @disaster_start_date = null
    END
	  IF @disaster_end_date = '9/9/1900 12:00:00 AM'
    BEGIN
    SET @disaster_end_date = null
    END
	  IF @disaster_north_latitude = 0
    BEGIN
    SET @disaster_north_latitude = null
    END
	  IF @disaster_north_longitude = 0
    BEGIN
    SET @disaster_north_longitude = null
    END
	  IF @disaster_south_latitude = 0
    BEGIN
    SET @disaster_south_latitude = null
    END
	  IF @disaster_south_longitude = 0
    BEGIN
    SET @disaster_south_longitude = null
    END
	  IF @disaster_east_latitude = 0
    BEGIN
    SET @disaster_east_latitude = null
    END
	  IF @disaster_east_longitude = 0
    BEGIN
    SET @disaster_east_longitude = null
    END
	  IF @disaster_west_latitude = 0
    BEGIN
    SET @disaster_west_latitude = null
    END
	  IF @disaster_west_longitude = 0
    BEGIN
    SET @disaster_west_longitude = null
    END
	Insert INTO [dbo].[disaster]
           (
            [disaster_name]
           ,[disaster_type]
           ,[disaster_start_date]
           ,[disaster_end_date]
           ,[disaster_north_latitude]
           ,[disaster_north_longitude]
           ,[disaster_south_latitude]
           ,[disaster_south_longitude]
           ,[disaster_east_latitude]
           ,[disaster_east_longitude]
           ,[disaster_west_latitude]
           ,[disaster_west_longitude]
            )
     VALUES (
            @disaster_name
           ,@disaster_type
           ,@disaster_start_date
           ,@disaster_end_date
           ,@disaster_north_latitude
           ,@disaster_north_longitude
           ,@disaster_south_latitude
           ,@disaster_south_longitude
           ,@disaster_east_latitude
           ,@disaster_east_longitude
           ,@disaster_west_latitude
           ,@disaster_west_longitude
            )
END
GO
/***********************************************************/
/*************************************************/
/****** - UPDATE STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_UPDATE_DISASTER]    Script Date: 9/7/2015 11:22:04 AM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_UPDATE_DISASTER]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_UPDATE_DISASTER]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_UPDATE_DISASTER]
	  @disaster_id as int,
	  @disaster_name as varchar(50),
	  @disaster_type as varchar(30),
	  @disaster_start_date as datetime,
	  @disaster_end_date as datetime,
	  @disaster_north_latitude as decimal,
	  @disaster_north_longitude as decimal,
	  @disaster_south_latitude as decimal,
	  @disaster_south_longitude as decimal,
	  @disaster_east_latitude as decimal,
	  @disaster_east_longitude as decimal,
	  @disaster_west_latitude as decimal
	  @disaster_west_longitude as decimal,
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	  IF @disaster_name = ''
    BEGIN
    SET @disaster_name = null
    END
	  IF @disaster_type = ''
    BEGIN
    SET @disaster_type = null
    END
	  IF @disaster_start_date = '9/9/1900 12:00:00 AM'
    BEGIN
    SET @disaster_start_date = null
    END
	  IF @disaster_end_date = '9/9/1900 12:00:00 AM'
    BEGIN
    SET @disaster_end_date = null
    END
	  IF @disaster_north_latitude = 0
    BEGIN
    SET @disaster_north_latitude = null
    END
	  IF @disaster_north_longitude = 0
    BEGIN
    SET @disaster_north_longitude = null
    END
	  IF @disaster_south_latitude = 0
    BEGIN
    SET @disaster_south_latitude = null
    END
	  IF @disaster_south_longitude = 0
    BEGIN
    SET @disaster_south_longitude = null
    END
	  IF @disaster_east_latitude = 0
    BEGIN
    SET @disaster_east_latitude = null
    END
	  IF @disaster_east_longitude = 0
    BEGIN
    SET @disaster_east_longitude = null
    END
	  IF @disaster_west_latitude = 0
    BEGIN
    SET @disaster_west_latitude = null
    END
	  IF @disaster_west_longitude = 0
    BEGIN
    SET @disaster_west_longitude = null
    END
	UPDATE [dbo].[disaster]
       SET
		   [disaster_name] = @disaster_name,
		   [disaster_type] = @disaster_type,
		   [disaster_start_date] = @disaster_start_date,
		   [disaster_end_date] = @disaster_end_date,
		   [disaster_north_latitude] = @disaster_north_latitude,
		   [disaster_north_longitude] = @disaster_north_longitude,
		   [disaster_south_latitude] = @disaster_south_latitude,
		   [disaster_south_longitude] = @disaster_south_longitude,
		   [disaster_east_latitude] = @disaster_east_latitude,
		   [disaster_east_longitude] = @disaster_east_longitude,
		   [disaster_west_latitude] = @disaster_west_latitude,
		   [disaster_west_longitude] = @disaster_west_longitude
       WHERE disaster_id = @disaster_id
END
GO
/***********************************************************/
/*************************************************/
/****** - DELETE STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_DELETE_DISASTER]    Script Date: 9/7/2015 11:22:04 AM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_DELETE_DISASTER]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_DELETE_DISASTER]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_DELETE_DISASTER]
	@disaster_id int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	Delete dbo.disaster
	where disaster_id = @disaster_id
END
GO
/***********************************************************/
/*************************************************/
/****** - GET STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_GET_DISASTER]    Script Date: 9/7/2015 11:22:04 AM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_GET_DISASTER]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_GET_DISASTER]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_GET_DISASTER]
	  @disaster_name as varchar(50),
	  @disaster_type as varchar(30),
	  @disaster_start_date as datetime,
	  @disaster_end_date as datetime,
	  @disaster_north_latitude as decimal,
	  @disaster_north_longitude as decimal,
	  @disaster_south_latitude as decimal,
	  @disaster_south_longitude as decimal,
	  @disaster_east_latitude as decimal,
	  @disaster_east_longitude as decimal,
	  @disaster_west_latitude as decimal
	  @disaster_west_longitude as decimal,
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	  IF @disaster_name = ''
    BEGIN
    SET @disaster_name = null
    END
	  IF @disaster_type = ''
    BEGIN
    SET @disaster_type = null
    END
	  IF @disaster_start_date = '9/9/1900 12:00:00 AM'
    BEGIN
    SET @disaster_start_date = null
    END
	  IF @disaster_end_date = '9/9/1900 12:00:00 AM'
    BEGIN
    SET @disaster_end_date = null
    END
	  IF @disaster_north_latitude = 0
    BEGIN
    SET @disaster_north_latitude = null
    END
	  IF @disaster_north_longitude = 0
    BEGIN
    SET @disaster_north_longitude = null
    END
	  IF @disaster_south_latitude = 0
    BEGIN
    SET @disaster_south_latitude = null
    END
	  IF @disaster_south_longitude = 0
    BEGIN
    SET @disaster_south_longitude = null
    END
	  IF @disaster_east_latitude = 0
    BEGIN
    SET @disaster_east_latitude = null
    END
	  IF @disaster_east_longitude = 0
    BEGIN
    SET @disaster_east_longitude = null
    END
	  IF @disaster_west_latitude = 0
    BEGIN
    SET @disaster_west_latitude = null
    END
	  IF @disaster_west_longitude = 0
    BEGIN
    SET @disaster_west_longitude = null
    END
    SELECT [disaster_id] 
      FROM [dbo].[disaster] 
       WHERE ([disaster_name] like @disaster_name)
       AND ([disaster_type] like @disaster_type)
       AND ([disaster_start_date] = @disaster_start_date)
       AND ([disaster_end_date] = @disaster_end_date or [disaster_end_date] is null)
       AND ([disaster_north_latitude] = @disaster_north_latitude or [disaster_north_latitude] is null)
       AND ([disaster_north_longitude] = @disaster_north_longitude or [disaster_north_longitude] is null)
       AND ([disaster_south_latitude] = @disaster_south_latitude or [disaster_south_latitude] is null)
       AND ([disaster_south_longitude] = @disaster_south_longitude or [disaster_south_longitude] is null)
       AND ([disaster_east_latitude] = @disaster_east_latitude or [disaster_east_latitude] is null)
       AND ([disaster_east_longitude] = @disaster_east_longitude or [disaster_east_longitude] is null)
       AND ([disaster_west_latitude] = @disaster_west_latitude or [disaster_west_latitude] is null)
       AND ([disaster_west_longitude] = @disaster_west_longitude or [disaster_west_longitude] is null)
END
GO

