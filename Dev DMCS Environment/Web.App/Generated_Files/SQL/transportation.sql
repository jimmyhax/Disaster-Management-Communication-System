/****** Object:  Table [dbo].[transportation]    Script Date: 9/7/2015 11:23:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[transportation](
  [transport_id] int IDENTITY(1,1) NOT NULL,
  [location_from] varchar(30) NOT NULL,
  [location_to] varchar(30) NOT NULL,
  [no_of_passangers] int NOT NULL,
  [pickup_date] datetime NOT NULL,
  [trans_type] varchar(3) NOT NULL,
  [Vehicle_id] int NOT NULL,
 CONSTRAINT [transportation_transport_id_pk] PRIMARY KEY CLUSTERED 
(
	[transport_id] ASC
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
/****** Object:  StoredProcedure [dbo].[SP_DMCS_SELECT_TRANSPORTATION]    Script Date: 9/7/2015 11:23:28 AM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_SELECT_TRANSPORTATION]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_SELECT_TRANSPORTATION]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_SELECT_TRANSPORTATION]
           @transport_id as int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
SELECT [transport_id]
      ,[location_from]
      ,[location_to]
      ,[no_of_passangers]
      ,[pickup_date]
      ,[trans_type]
      ,[Vehicle_id]
  FROM [dbo].[transportation]
 WHERE transport_id = @transport_id
End
GO
/***********************************************************/
/*************************************************/
/****** - INSERT STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_INSERT_TRANSPORTATION]    Script Date: 9/7/2015 11:23:28 AM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_INSERT_TRANSPORTATION]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_INSERT_TRANSPORTATION]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_INSERT_TRANSPORTATION]
	  @transport_id as int,
	  @location_from as varchar(30),
	  @location_to as varchar(30),
	  @no_of_passangers as int,
	  @pickup_date as datetime,
	  @trans_type as varchar(3)
	  @Vehicle_id as int,
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	  IF @location_from = ''
    BEGIN
    SET @location_from = null
    END
	  IF @location_to = ''
    BEGIN
    SET @location_to = null
    END
	  IF @no_of_passangers = 0
    BEGIN
    SET @no_of_passangers = null
    END
	  IF @pickup_date = '9/9/1900 12:00:00 AM'
    BEGIN
    SET @pickup_date = null
    END
	  IF @trans_type = ''
    BEGIN
    SET @trans_type = null
    END
	  IF @Vehicle_id = 0
    BEGIN
    SET @Vehicle_id = null
    END
	Insert INTO [dbo].[transportation]
           (
            [transport_id]
           ,[location_from]
           ,[location_to]
           ,[no_of_passangers]
           ,[pickup_date]
           ,[trans_type]
           ,[Vehicle_id]
            )
     VALUES (
            @transport_id
           ,@location_from
           ,@location_to
           ,@no_of_passangers
           ,@pickup_date
           ,@trans_type
           ,@Vehicle_id
            )
END
GO
/***********************************************************/
/*************************************************/
/****** - UPDATE STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_UPDATE_TRANSPORTATION]    Script Date: 9/7/2015 11:23:28 AM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_UPDATE_TRANSPORTATION]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_UPDATE_TRANSPORTATION]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_UPDATE_TRANSPORTATION]
	  @transport_id as int,
	  @location_from as varchar(30),
	  @location_to as varchar(30),
	  @no_of_passangers as int,
	  @pickup_date as datetime,
	  @trans_type as varchar(3)
	  @Vehicle_id as int,
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	  IF @location_from = ''
    BEGIN
    SET @location_from = null
    END
	  IF @location_to = ''
    BEGIN
    SET @location_to = null
    END
	  IF @no_of_passangers = 0
    BEGIN
    SET @no_of_passangers = null
    END
	  IF @pickup_date = '9/9/1900 12:00:00 AM'
    BEGIN
    SET @pickup_date = null
    END
	  IF @trans_type = ''
    BEGIN
    SET @trans_type = null
    END
	  IF @Vehicle_id = 0
    BEGIN
    SET @Vehicle_id = null
    END
	UPDATE [dbo].[transportation]
       SET
		   [location_from] = @location_from,
		   [location_to] = @location_to,
		   [no_of_passangers] = @no_of_passangers,
		   [pickup_date] = @pickup_date,
		   [trans_type] = @trans_type,
		   [Vehicle_id] = @Vehicle_id
       WHERE transport_id = @transport_id
END
GO
/***********************************************************/
/*************************************************/
/****** - DELETE STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_DELETE_TRANSPORTATION]    Script Date: 9/7/2015 11:23:28 AM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_DELETE_TRANSPORTATION]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_DELETE_TRANSPORTATION]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_DELETE_TRANSPORTATION]
	@transport_id int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	Delete dbo.transportation
	where transport_id = @transport_id
END
GO
/***********************************************************/
/*************************************************/
/****** - GET STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_GET_TRANSPORTATION]    Script Date: 9/7/2015 11:23:28 AM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_GET_TRANSPORTATION]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_GET_TRANSPORTATION]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_GET_TRANSPORTATION]
	  @location_from as varchar(30),
	  @location_to as varchar(30),
	  @no_of_passangers as int,
	  @pickup_date as datetime,
	  @trans_type as varchar(3)
	  @Vehicle_id as int,
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	  IF @location_from = ''
    BEGIN
    SET @location_from = null
    END
	  IF @location_to = ''
    BEGIN
    SET @location_to = null
    END
	  IF @no_of_passangers = 0
    BEGIN
    SET @no_of_passangers = null
    END
	  IF @pickup_date = '9/9/1900 12:00:00 AM'
    BEGIN
    SET @pickup_date = null
    END
	  IF @trans_type = ''
    BEGIN
    SET @trans_type = null
    END
	  IF @Vehicle_id = 0
    BEGIN
    SET @Vehicle_id = null
    END
    SELECT [transport_id] 
      FROM [dbo].[transportation] 
       WHERE ([location_from] like @location_from)
       AND ([location_to] like @location_to)
       AND ([no_of_passangers] = @no_of_passangers)
       AND ([pickup_date] = @pickup_date)
       AND ([trans_type] like @trans_type)
       AND ([Vehicle_id] = @Vehicle_id)
END
GO

