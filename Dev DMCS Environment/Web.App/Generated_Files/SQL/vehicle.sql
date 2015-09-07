/****** Object:  Table [dbo].[vehicle]    Script Date: 9/7/2015 11:23:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[vehicle](
  [vehicle_id] int IDENTITY(1,1) NOT NULL,
  [case_id] int NULL,
  [client_id] int NULL,
  [vehicle_make] varchar(15) NOT NULL,
  [vehicle_model] varchar(30) NOT NULL,
  [vehicle_type] varchar(15) NOT NULL,
  [vehicle_year] int NOT NULL,
  [vehicle_desc] varchar(50) NULL,
  [vin] varchar(17) NULL,
  [start_mileage] int NULL,
  [first_service_date] datetime NULL,
  [last_service_date] datetime NULL,
  [PLATENUMBER] varchar(10) NOT NULL,
  [FUELTYPE] char(1) NOT NULL,
  [MPH] int NULL,
  [INSURED] char(1) NULL,
 CONSTRAINT [vehicle_vehicle_id_pk] PRIMARY KEY CLUSTERED 
(
	[vehicle_id] ASC
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
/****** Object:  StoredProcedure [dbo].[SP_DMCS_SELECT_VEHICLE]    Script Date: 9/7/2015 11:23:31 AM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_SELECT_VEHICLE]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_SELECT_VEHICLE]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_SELECT_VEHICLE]
           @vehicle_id as int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
SELECT [vehicle_id]
      ,[case_id]
      ,[client_id]
      ,[vehicle_make]
      ,[vehicle_model]
      ,[vehicle_type]
      ,[vehicle_year]
      ,[vehicle_desc]
      ,[vin]
      ,[start_mileage]
      ,[first_service_date]
      ,[last_service_date]
      ,[PLATENUMBER]
      ,[FUELTYPE]
      ,[MPH]
      ,[INSURED]
  FROM [dbo].[vehicle]
 WHERE vehicle_id = @vehicle_id
End
GO
/***********************************************************/
/*************************************************/
/****** - INSERT STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_INSERT_VEHICLE]    Script Date: 9/7/2015 11:23:31 AM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_INSERT_VEHICLE]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_INSERT_VEHICLE]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_INSERT_VEHICLE]
	  @case_id as int,
	  @client_id as int,
	  @vehicle_make as varchar(15),
	  @vehicle_model as varchar(30),
	  @vehicle_type as varchar(15),
	  @vehicle_year as int,
	  @vehicle_desc as varchar(50),
	  @vin as varchar(17),
	  @start_mileage as int,
	  @first_service_date as datetime,
	  @last_service_date as datetime,
	  @PLATENUMBER as varchar(10),
	  @FUELTYPE as char(1),
	  @MPH as int
	  @INSURED as char(1),
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	  IF @case_id = 0
    BEGIN
    SET @case_id = null
    END
	  IF @client_id = 0
    BEGIN
    SET @client_id = null
    END
	  IF @vehicle_make = ''
    BEGIN
    SET @vehicle_make = null
    END
	  IF @vehicle_model = ''
    BEGIN
    SET @vehicle_model = null
    END
	  IF @vehicle_type = ''
    BEGIN
    SET @vehicle_type = null
    END
	  IF @vehicle_year = 0
    BEGIN
    SET @vehicle_year = null
    END
	  IF @vehicle_desc = ''
    BEGIN
    SET @vehicle_desc = null
    END
	  IF @vin = ''
    BEGIN
    SET @vin = null
    END
	  IF @start_mileage = 0
    BEGIN
    SET @start_mileage = null
    END
	  IF @first_service_date = '9/9/1900 12:00:00 AM'
    BEGIN
    SET @first_service_date = null
    END
	  IF @last_service_date = '9/9/1900 12:00:00 AM'
    BEGIN
    SET @last_service_date = null
    END
	  IF @PLATENUMBER = ''
    BEGIN
    SET @PLATENUMBER = null
    END
	  IF @FUELTYPE = ''
    BEGIN
    SET @FUELTYPE = null
    END
	  IF @MPH = 0
    BEGIN
    SET @MPH = null
    END
	  IF @INSURED = ''
    BEGIN
    SET @INSURED = null
    END
	Insert INTO [dbo].[vehicle]
           (
            [case_id]
           ,[client_id]
           ,[vehicle_make]
           ,[vehicle_model]
           ,[vehicle_type]
           ,[vehicle_year]
           ,[vehicle_desc]
           ,[vin]
           ,[start_mileage]
           ,[first_service_date]
           ,[last_service_date]
           ,[PLATENUMBER]
           ,[FUELTYPE]
           ,[MPH]
           ,[INSURED]
            )
     VALUES (
            @case_id
           ,@client_id
           ,@vehicle_make
           ,@vehicle_model
           ,@vehicle_type
           ,@vehicle_year
           ,@vehicle_desc
           ,@vin
           ,@start_mileage
           ,@first_service_date
           ,@last_service_date
           ,@PLATENUMBER
           ,@FUELTYPE
           ,@MPH
           ,@INSURED
            )
END
GO
/***********************************************************/
/*************************************************/
/****** - UPDATE STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_UPDATE_VEHICLE]    Script Date: 9/7/2015 11:23:31 AM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_UPDATE_VEHICLE]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_UPDATE_VEHICLE]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_UPDATE_VEHICLE]
	  @vehicle_id as int,
	  @case_id as int,
	  @client_id as int,
	  @vehicle_make as varchar(15),
	  @vehicle_model as varchar(30),
	  @vehicle_type as varchar(15),
	  @vehicle_year as int,
	  @vehicle_desc as varchar(50),
	  @vin as varchar(17),
	  @start_mileage as int,
	  @first_service_date as datetime,
	  @last_service_date as datetime,
	  @PLATENUMBER as varchar(10),
	  @FUELTYPE as char(1),
	  @MPH as int
	  @INSURED as char(1),
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	  IF @case_id = 0
    BEGIN
    SET @case_id = null
    END
	  IF @client_id = 0
    BEGIN
    SET @client_id = null
    END
	  IF @vehicle_make = ''
    BEGIN
    SET @vehicle_make = null
    END
	  IF @vehicle_model = ''
    BEGIN
    SET @vehicle_model = null
    END
	  IF @vehicle_type = ''
    BEGIN
    SET @vehicle_type = null
    END
	  IF @vehicle_year = 0
    BEGIN
    SET @vehicle_year = null
    END
	  IF @vehicle_desc = ''
    BEGIN
    SET @vehicle_desc = null
    END
	  IF @vin = ''
    BEGIN
    SET @vin = null
    END
	  IF @start_mileage = 0
    BEGIN
    SET @start_mileage = null
    END
	  IF @first_service_date = '9/9/1900 12:00:00 AM'
    BEGIN
    SET @first_service_date = null
    END
	  IF @last_service_date = '9/9/1900 12:00:00 AM'
    BEGIN
    SET @last_service_date = null
    END
	  IF @PLATENUMBER = ''
    BEGIN
    SET @PLATENUMBER = null
    END
	  IF @FUELTYPE = ''
    BEGIN
    SET @FUELTYPE = null
    END
	  IF @MPH = 0
    BEGIN
    SET @MPH = null
    END
	  IF @INSURED = ''
    BEGIN
    SET @INSURED = null
    END
	UPDATE [dbo].[vehicle]
       SET
		   [case_id] = @case_id,
		   [client_id] = @client_id,
		   [vehicle_make] = @vehicle_make,
		   [vehicle_model] = @vehicle_model,
		   [vehicle_type] = @vehicle_type,
		   [vehicle_year] = @vehicle_year,
		   [vehicle_desc] = @vehicle_desc,
		   [vin] = @vin,
		   [start_mileage] = @start_mileage,
		   [first_service_date] = @first_service_date,
		   [last_service_date] = @last_service_date,
		   [PLATENUMBER] = @PLATENUMBER,
		   [FUELTYPE] = @FUELTYPE,
		   [MPH] = @MPH,
		   [INSURED] = @INSURED
       WHERE vehicle_id = @vehicle_id
END
GO
/***********************************************************/
/*************************************************/
/****** - DELETE STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_DELETE_VEHICLE]    Script Date: 9/7/2015 11:23:31 AM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_DELETE_VEHICLE]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_DELETE_VEHICLE]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_DELETE_VEHICLE]
	@vehicle_id int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	Delete dbo.vehicle
	where vehicle_id = @vehicle_id
END
GO
/***********************************************************/
/*************************************************/
/****** - GET STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_GET_VEHICLE]    Script Date: 9/7/2015 11:23:31 AM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_GET_VEHICLE]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_GET_VEHICLE]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_GET_VEHICLE]
	  @case_id as int,
	  @client_id as int,
	  @vehicle_make as varchar(15),
	  @vehicle_model as varchar(30),
	  @vehicle_type as varchar(15),
	  @vehicle_year as int,
	  @vehicle_desc as varchar(50),
	  @vin as varchar(17),
	  @start_mileage as int,
	  @first_service_date as datetime,
	  @last_service_date as datetime,
	  @PLATENUMBER as varchar(10),
	  @FUELTYPE as char(1),
	  @MPH as int
	  @INSURED as char(1),
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	  IF @case_id = 0
    BEGIN
    SET @case_id = null
    END
	  IF @client_id = 0
    BEGIN
    SET @client_id = null
    END
	  IF @vehicle_make = ''
    BEGIN
    SET @vehicle_make = null
    END
	  IF @vehicle_model = ''
    BEGIN
    SET @vehicle_model = null
    END
	  IF @vehicle_type = ''
    BEGIN
    SET @vehicle_type = null
    END
	  IF @vehicle_year = 0
    BEGIN
    SET @vehicle_year = null
    END
	  IF @vehicle_desc = ''
    BEGIN
    SET @vehicle_desc = null
    END
	  IF @vin = ''
    BEGIN
    SET @vin = null
    END
	  IF @start_mileage = 0
    BEGIN
    SET @start_mileage = null
    END
	  IF @first_service_date = '9/9/1900 12:00:00 AM'
    BEGIN
    SET @first_service_date = null
    END
	  IF @last_service_date = '9/9/1900 12:00:00 AM'
    BEGIN
    SET @last_service_date = null
    END
	  IF @PLATENUMBER = ''
    BEGIN
    SET @PLATENUMBER = null
    END
	  IF @FUELTYPE = ''
    BEGIN
    SET @FUELTYPE = null
    END
	  IF @MPH = 0
    BEGIN
    SET @MPH = null
    END
	  IF @INSURED = ''
    BEGIN
    SET @INSURED = null
    END
    SELECT [vehicle_id] 
      FROM [dbo].[vehicle] 
       WHERE ([case_id] = @case_id or [case_id] is null)
       AND ([client_id] = @client_id or [client_id] is null)
       AND ([vehicle_make] like @vehicle_make)
       AND ([vehicle_model] like @vehicle_model)
       AND ([vehicle_type] like @vehicle_type)
       AND ([vehicle_year] = @vehicle_year)
       AND ([vehicle_desc] like @vehicle_desc or [vehicle_desc] is null)
       AND ([vin] like @vin or [vin] is null)
       AND ([start_mileage] = @start_mileage or [start_mileage] is null)
       AND ([first_service_date] = @first_service_date or [first_service_date] is null)
       AND ([last_service_date] = @last_service_date or [last_service_date] is null)
       AND ([PLATENUMBER] like @PLATENUMBER)
       AND ([FUELTYPE] = @FUELTYPE)
       AND ([MPH] = @MPH or [MPH] is null)
       AND ([INSURED] = @INSURED or [INSURED] is null)
END
GO

