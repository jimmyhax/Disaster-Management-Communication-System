/****** Object:  Table [dbo].[location]    Script Date: 9/7/2015 11:22:32 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[location](
  [Location_ID] int IDENTITY(1,1) NOT NULL,
  [type] varchar(30) NOT NULL,
  [city] varchar(30) NOT NULL,
  [state] varchar(2) NOT NULL,
  [zip] int NOT NULL,
  [county] varchar(15) NULL,
  [location_desc] varchar(3000) NULL,
  [n_long] decimal NULL,
  [s_long] decimal NULL,
  [e_long] decimal NULL,
  [w_long] decimal NULL,
  [n_lat] decimal NULL,
  [s_lat] decimal NULL,
  [e_lat] decimal NULL,
  [w_lat] decimal NULL,
 CONSTRAINT [location_Location_ID_pk] PRIMARY KEY CLUSTERED 
(
	[Location_ID] ASC
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
/****** Object:  StoredProcedure [dbo].[SP_DMCS_SELECT_LOCATION]    Script Date: 9/7/2015 11:22:32 AM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_SELECT_LOCATION]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_SELECT_LOCATION]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_SELECT_LOCATION]
           @Location_ID as int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
SELECT [Location_ID]
      ,[type]
      ,[city]
      ,[state]
      ,[zip]
      ,[county]
      ,[location_desc]
      ,[n_long]
      ,[s_long]
      ,[e_long]
      ,[w_long]
      ,[n_lat]
      ,[s_lat]
      ,[e_lat]
      ,[w_lat]
  FROM [dbo].[location]
 WHERE Location_ID = @Location_ID
End
GO
/***********************************************************/
/*************************************************/
/****** - INSERT STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_INSERT_LOCATION]    Script Date: 9/7/2015 11:22:32 AM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_INSERT_LOCATION]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_INSERT_LOCATION]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_INSERT_LOCATION]
	  @type as varchar(30),
	  @city as varchar(30),
	  @state as varchar(2),
	  @zip as int,
	  @county as varchar(15),
	  @location_desc as varchar(3000),
	  @n_long as decimal,
	  @s_long as decimal,
	  @e_long as decimal,
	  @w_long as decimal,
	  @n_lat as decimal,
	  @s_lat as decimal,
	  @e_lat as decimal
	  @w_lat as decimal,
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	  IF @type = ''
    BEGIN
    SET @type = null
    END
	  IF @city = ''
    BEGIN
    SET @city = null
    END
	  IF @state = ''
    BEGIN
    SET @state = null
    END
	  IF @zip = 0
    BEGIN
    SET @zip = null
    END
	  IF @county = ''
    BEGIN
    SET @county = null
    END
	  IF @location_desc = ''
    BEGIN
    SET @location_desc = null
    END
	  IF @n_long = 0
    BEGIN
    SET @n_long = null
    END
	  IF @s_long = 0
    BEGIN
    SET @s_long = null
    END
	  IF @e_long = 0
    BEGIN
    SET @e_long = null
    END
	  IF @w_long = 0
    BEGIN
    SET @w_long = null
    END
	  IF @n_lat = 0
    BEGIN
    SET @n_lat = null
    END
	  IF @s_lat = 0
    BEGIN
    SET @s_lat = null
    END
	  IF @e_lat = 0
    BEGIN
    SET @e_lat = null
    END
	  IF @w_lat = 0
    BEGIN
    SET @w_lat = null
    END
	Insert INTO [dbo].[location]
           (
            [type]
           ,[city]
           ,[state]
           ,[zip]
           ,[county]
           ,[location_desc]
           ,[n_long]
           ,[s_long]
           ,[e_long]
           ,[w_long]
           ,[n_lat]
           ,[s_lat]
           ,[e_lat]
           ,[w_lat]
            )
     VALUES (
            @type
           ,@city
           ,@state
           ,@zip
           ,@county
           ,@location_desc
           ,@n_long
           ,@s_long
           ,@e_long
           ,@w_long
           ,@n_lat
           ,@s_lat
           ,@e_lat
           ,@w_lat
            )
END
GO
/***********************************************************/
/*************************************************/
/****** - UPDATE STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_UPDATE_LOCATION]    Script Date: 9/7/2015 11:22:32 AM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_UPDATE_LOCATION]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_UPDATE_LOCATION]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_UPDATE_LOCATION]
	  @Location_ID as int,
	  @type as varchar(30),
	  @city as varchar(30),
	  @state as varchar(2),
	  @zip as int,
	  @county as varchar(15),
	  @location_desc as varchar(3000),
	  @n_long as decimal,
	  @s_long as decimal,
	  @e_long as decimal,
	  @w_long as decimal,
	  @n_lat as decimal,
	  @s_lat as decimal,
	  @e_lat as decimal
	  @w_lat as decimal,
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	  IF @type = ''
    BEGIN
    SET @type = null
    END
	  IF @city = ''
    BEGIN
    SET @city = null
    END
	  IF @state = ''
    BEGIN
    SET @state = null
    END
	  IF @zip = 0
    BEGIN
    SET @zip = null
    END
	  IF @county = ''
    BEGIN
    SET @county = null
    END
	  IF @location_desc = ''
    BEGIN
    SET @location_desc = null
    END
	  IF @n_long = 0
    BEGIN
    SET @n_long = null
    END
	  IF @s_long = 0
    BEGIN
    SET @s_long = null
    END
	  IF @e_long = 0
    BEGIN
    SET @e_long = null
    END
	  IF @w_long = 0
    BEGIN
    SET @w_long = null
    END
	  IF @n_lat = 0
    BEGIN
    SET @n_lat = null
    END
	  IF @s_lat = 0
    BEGIN
    SET @s_lat = null
    END
	  IF @e_lat = 0
    BEGIN
    SET @e_lat = null
    END
	  IF @w_lat = 0
    BEGIN
    SET @w_lat = null
    END
	UPDATE [dbo].[location]
       SET
		   [type] = @type,
		   [city] = @city,
		   [state] = @state,
		   [zip] = @zip,
		   [county] = @county,
		   [location_desc] = @location_desc,
		   [n_long] = @n_long,
		   [s_long] = @s_long,
		   [e_long] = @e_long,
		   [w_long] = @w_long,
		   [n_lat] = @n_lat,
		   [s_lat] = @s_lat,
		   [e_lat] = @e_lat,
		   [w_lat] = @w_lat
       WHERE Location_ID = @Location_ID
END
GO
/***********************************************************/
/*************************************************/
/****** - DELETE STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_DELETE_LOCATION]    Script Date: 9/7/2015 11:22:32 AM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_DELETE_LOCATION]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_DELETE_LOCATION]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_DELETE_LOCATION]
	@Location_ID int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	Delete dbo.location
	where Location_ID = @Location_ID
END
GO
/***********************************************************/
/*************************************************/
/****** - GET STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_GET_LOCATION]    Script Date: 9/7/2015 11:22:32 AM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_GET_LOCATION]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_GET_LOCATION]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_GET_LOCATION]
	  @type as varchar(30),
	  @city as varchar(30),
	  @state as varchar(2),
	  @zip as int,
	  @county as varchar(15),
	  @location_desc as varchar(3000),
	  @n_long as decimal,
	  @s_long as decimal,
	  @e_long as decimal,
	  @w_long as decimal,
	  @n_lat as decimal,
	  @s_lat as decimal,
	  @e_lat as decimal
	  @w_lat as decimal,
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	  IF @type = ''
    BEGIN
    SET @type = null
    END
	  IF @city = ''
    BEGIN
    SET @city = null
    END
	  IF @state = ''
    BEGIN
    SET @state = null
    END
	  IF @zip = 0
    BEGIN
    SET @zip = null
    END
	  IF @county = ''
    BEGIN
    SET @county = null
    END
	  IF @location_desc = ''
    BEGIN
    SET @location_desc = null
    END
	  IF @n_long = 0
    BEGIN
    SET @n_long = null
    END
	  IF @s_long = 0
    BEGIN
    SET @s_long = null
    END
	  IF @e_long = 0
    BEGIN
    SET @e_long = null
    END
	  IF @w_long = 0
    BEGIN
    SET @w_long = null
    END
	  IF @n_lat = 0
    BEGIN
    SET @n_lat = null
    END
	  IF @s_lat = 0
    BEGIN
    SET @s_lat = null
    END
	  IF @e_lat = 0
    BEGIN
    SET @e_lat = null
    END
	  IF @w_lat = 0
    BEGIN
    SET @w_lat = null
    END
    SELECT [Location_ID] 
      FROM [dbo].[location] 
       WHERE ([type] like @type)
       AND ([city] like @city)
       AND ([state] like @state)
       AND ([zip] = @zip)
       AND ([county] like @county or [county] is null)
       AND ([location_desc] like @location_desc or [location_desc] is null)
       AND ([n_long] = @n_long or [n_long] is null)
       AND ([s_long] = @s_long or [s_long] is null)
       AND ([e_long] = @e_long or [e_long] is null)
       AND ([w_long] = @w_long or [w_long] is null)
       AND ([n_lat] = @n_lat or [n_lat] is null)
       AND ([s_lat] = @s_lat or [s_lat] is null)
       AND ([e_lat] = @e_lat or [e_lat] is null)
       AND ([w_lat] = @w_lat or [w_lat] is null)
END
GO

