/****** Object:  Table [dbo].[Client_Shelter]    Script Date: 9/7/2015 11:22:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Client_Shelter](
  [Client_Shelter_ID] int IDENTITY(1,1) NOT NULL,
  [Shelter_ID] int NOT NULL,
  [Client_ID] int NOT NULL,
  [Current_address] varchar(30) NOT NULL,
  [Current_State] varchar(3) NOT NULL,
  [Current_City] varchar(30) NOT NULL,
  [Current_Zip] int NOT NULL,
  [Client_registration_status] varchar(30) NOT NULL,
  [Household_size] int NOT NULL,
  [Shelter_supplies] varchar(30) NULL,
  [Shelter_occupancy_current] varchar(30) NOT NULL,
  [New_household_registered] varchar(30) NULL,
  [New_Shelter_address] varchar(30) NULL,
  [New_Shelter_city] varchar(30) NULL,
  [New_Shelter_State] varchar(30) NULL,
  [New_Shelter_Zip] int NULL,
  [New_Contact_Number] int NULL,
  [Current_household_members_safe] varchar(30) NULL,
  [CheckIn_Date] datetime NOT NULL,
  [CheckOut_Date] datetime NULL,
 CONSTRAINT [Client_Shelter_Client_Shelter_ID_pk] PRIMARY KEY CLUSTERED 
(
	[Client_Shelter_ID] ASC
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
/****** Object:  StoredProcedure [dbo].[SP_DMCS_SELECT_CLIENT_SHELTER]    Script Date: 9/7/2015 11:22:00 AM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_SELECT_CLIENT_SHELTER]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_SELECT_CLIENT_SHELTER]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_SELECT_CLIENT_SHELTER]
           @Client_Shelter_ID as int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
SELECT [Client_Shelter_ID]
      ,[Shelter_ID]
      ,[Client_ID]
      ,[Current_address]
      ,[Current_State]
      ,[Current_City]
      ,[Current_Zip]
      ,[Client_registration_status]
      ,[Household_size]
      ,[Shelter_supplies]
      ,[Shelter_occupancy_current]
      ,[New_household_registered]
      ,[New_Shelter_address]
      ,[New_Shelter_city]
      ,[New_Shelter_State]
      ,[New_Shelter_Zip]
      ,[New_Contact_Number]
      ,[Current_household_members_safe]
      ,[CheckIn_Date]
      ,[CheckOut_Date]
  FROM [dbo].[Client_Shelter]
 WHERE Client_Shelter_ID = @Client_Shelter_ID
End
GO
/***********************************************************/
/*************************************************/
/****** - INSERT STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_INSERT_CLIENT_SHELTER]    Script Date: 9/7/2015 11:22:00 AM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_INSERT_CLIENT_SHELTER]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_INSERT_CLIENT_SHELTER]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_INSERT_CLIENT_SHELTER]
	  @Shelter_ID as int,
	  @Client_ID as int,
	  @Current_address as varchar(30),
	  @Current_State as varchar(3),
	  @Current_City as varchar(30),
	  @Current_Zip as int,
	  @Client_registration_status as varchar(30),
	  @Household_size as int,
	  @Shelter_supplies as varchar(30),
	  @Shelter_occupancy_current as varchar(30),
	  @New_household_registered as varchar(30),
	  @New_Shelter_address as varchar(30),
	  @New_Shelter_city as varchar(30),
	  @New_Shelter_State as varchar(30),
	  @New_Shelter_Zip as int,
	  @New_Contact_Number as int,
	  @Current_household_members_safe as varchar(30),
	  @CheckIn_Date as datetime
	  @CheckOut_Date as datetime,
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	  IF @Shelter_ID = 0
    BEGIN
    SET @Shelter_ID = null
    END
	  IF @Client_ID = 0
    BEGIN
    SET @Client_ID = null
    END
	  IF @Current_address = ''
    BEGIN
    SET @Current_address = null
    END
	  IF @Current_State = ''
    BEGIN
    SET @Current_State = null
    END
	  IF @Current_City = ''
    BEGIN
    SET @Current_City = null
    END
	  IF @Current_Zip = 0
    BEGIN
    SET @Current_Zip = null
    END
	  IF @Client_registration_status = ''
    BEGIN
    SET @Client_registration_status = null
    END
	  IF @Household_size = 0
    BEGIN
    SET @Household_size = null
    END
	  IF @Shelter_supplies = ''
    BEGIN
    SET @Shelter_supplies = null
    END
	  IF @Shelter_occupancy_current = ''
    BEGIN
    SET @Shelter_occupancy_current = null
    END
	  IF @New_household_registered = ''
    BEGIN
    SET @New_household_registered = null
    END
	  IF @New_Shelter_address = ''
    BEGIN
    SET @New_Shelter_address = null
    END
	  IF @New_Shelter_city = ''
    BEGIN
    SET @New_Shelter_city = null
    END
	  IF @New_Shelter_State = ''
    BEGIN
    SET @New_Shelter_State = null
    END
	  IF @New_Shelter_Zip = 0
    BEGIN
    SET @New_Shelter_Zip = null
    END
	  IF @New_Contact_Number = 0
    BEGIN
    SET @New_Contact_Number = null
    END
	  IF @Current_household_members_safe = ''
    BEGIN
    SET @Current_household_members_safe = null
    END
	  IF @CheckIn_Date = '9/9/1900 12:00:00 AM'
    BEGIN
    SET @CheckIn_Date = null
    END
	  IF @CheckOut_Date = '9/9/1900 12:00:00 AM'
    BEGIN
    SET @CheckOut_Date = null
    END
	Insert INTO [dbo].[Client_Shelter]
           (
            [Shelter_ID]
           ,[Client_ID]
           ,[Current_address]
           ,[Current_State]
           ,[Current_City]
           ,[Current_Zip]
           ,[Client_registration_status]
           ,[Household_size]
           ,[Shelter_supplies]
           ,[Shelter_occupancy_current]
           ,[New_household_registered]
           ,[New_Shelter_address]
           ,[New_Shelter_city]
           ,[New_Shelter_State]
           ,[New_Shelter_Zip]
           ,[New_Contact_Number]
           ,[Current_household_members_safe]
           ,[CheckIn_Date]
           ,[CheckOut_Date]
            )
     VALUES (
            @Shelter_ID
           ,@Client_ID
           ,@Current_address
           ,@Current_State
           ,@Current_City
           ,@Current_Zip
           ,@Client_registration_status
           ,@Household_size
           ,@Shelter_supplies
           ,@Shelter_occupancy_current
           ,@New_household_registered
           ,@New_Shelter_address
           ,@New_Shelter_city
           ,@New_Shelter_State
           ,@New_Shelter_Zip
           ,@New_Contact_Number
           ,@Current_household_members_safe
           ,@CheckIn_Date
           ,@CheckOut_Date
            )
END
GO
/***********************************************************/
/*************************************************/
/****** - UPDATE STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_UPDATE_CLIENT_SHELTER]    Script Date: 9/7/2015 11:22:00 AM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_UPDATE_CLIENT_SHELTER]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_UPDATE_CLIENT_SHELTER]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_UPDATE_CLIENT_SHELTER]
	  @Client_Shelter_ID as int,
	  @Shelter_ID as int,
	  @Client_ID as int,
	  @Current_address as varchar(30),
	  @Current_State as varchar(3),
	  @Current_City as varchar(30),
	  @Current_Zip as int,
	  @Client_registration_status as varchar(30),
	  @Household_size as int,
	  @Shelter_supplies as varchar(30),
	  @Shelter_occupancy_current as varchar(30),
	  @New_household_registered as varchar(30),
	  @New_Shelter_address as varchar(30),
	  @New_Shelter_city as varchar(30),
	  @New_Shelter_State as varchar(30),
	  @New_Shelter_Zip as int,
	  @New_Contact_Number as int,
	  @Current_household_members_safe as varchar(30),
	  @CheckIn_Date as datetime
	  @CheckOut_Date as datetime,
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	  IF @Shelter_ID = 0
    BEGIN
    SET @Shelter_ID = null
    END
	  IF @Client_ID = 0
    BEGIN
    SET @Client_ID = null
    END
	  IF @Current_address = ''
    BEGIN
    SET @Current_address = null
    END
	  IF @Current_State = ''
    BEGIN
    SET @Current_State = null
    END
	  IF @Current_City = ''
    BEGIN
    SET @Current_City = null
    END
	  IF @Current_Zip = 0
    BEGIN
    SET @Current_Zip = null
    END
	  IF @Client_registration_status = ''
    BEGIN
    SET @Client_registration_status = null
    END
	  IF @Household_size = 0
    BEGIN
    SET @Household_size = null
    END
	  IF @Shelter_supplies = ''
    BEGIN
    SET @Shelter_supplies = null
    END
	  IF @Shelter_occupancy_current = ''
    BEGIN
    SET @Shelter_occupancy_current = null
    END
	  IF @New_household_registered = ''
    BEGIN
    SET @New_household_registered = null
    END
	  IF @New_Shelter_address = ''
    BEGIN
    SET @New_Shelter_address = null
    END
	  IF @New_Shelter_city = ''
    BEGIN
    SET @New_Shelter_city = null
    END
	  IF @New_Shelter_State = ''
    BEGIN
    SET @New_Shelter_State = null
    END
	  IF @New_Shelter_Zip = 0
    BEGIN
    SET @New_Shelter_Zip = null
    END
	  IF @New_Contact_Number = 0
    BEGIN
    SET @New_Contact_Number = null
    END
	  IF @Current_household_members_safe = ''
    BEGIN
    SET @Current_household_members_safe = null
    END
	  IF @CheckIn_Date = '9/9/1900 12:00:00 AM'
    BEGIN
    SET @CheckIn_Date = null
    END
	  IF @CheckOut_Date = '9/9/1900 12:00:00 AM'
    BEGIN
    SET @CheckOut_Date = null
    END
	UPDATE [dbo].[Client_Shelter]
       SET
		   [Shelter_ID] = @Shelter_ID,
		   [Client_ID] = @Client_ID,
		   [Current_address] = @Current_address,
		   [Current_State] = @Current_State,
		   [Current_City] = @Current_City,
		   [Current_Zip] = @Current_Zip,
		   [Client_registration_status] = @Client_registration_status,
		   [Household_size] = @Household_size,
		   [Shelter_supplies] = @Shelter_supplies,
		   [Shelter_occupancy_current] = @Shelter_occupancy_current,
		   [New_household_registered] = @New_household_registered,
		   [New_Shelter_address] = @New_Shelter_address,
		   [New_Shelter_city] = @New_Shelter_city,
		   [New_Shelter_State] = @New_Shelter_State,
		   [New_Shelter_Zip] = @New_Shelter_Zip,
		   [New_Contact_Number] = @New_Contact_Number,
		   [Current_household_members_safe] = @Current_household_members_safe,
		   [CheckIn_Date] = @CheckIn_Date,
		   [CheckOut_Date] = @CheckOut_Date
       WHERE Client_Shelter_ID = @Client_Shelter_ID
END
GO
/***********************************************************/
/*************************************************/
/****** - DELETE STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_DELETE_CLIENT_SHELTER]    Script Date: 9/7/2015 11:22:00 AM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_DELETE_CLIENT_SHELTER]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_DELETE_CLIENT_SHELTER]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_DELETE_CLIENT_SHELTER]
	@Client_Shelter_ID int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	Delete dbo.Client_Shelter
	where Client_Shelter_ID = @Client_Shelter_ID
END
GO
/***********************************************************/
/*************************************************/
/****** - GET STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_GET_CLIENT_SHELTER]    Script Date: 9/7/2015 11:22:00 AM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_GET_CLIENT_SHELTER]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_GET_CLIENT_SHELTER]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_GET_CLIENT_SHELTER]
	  @Shelter_ID as int,
	  @Client_ID as int,
	  @Current_address as varchar(30),
	  @Current_State as varchar(3),
	  @Current_City as varchar(30),
	  @Current_Zip as int,
	  @Client_registration_status as varchar(30),
	  @Household_size as int,
	  @Shelter_supplies as varchar(30),
	  @Shelter_occupancy_current as varchar(30),
	  @New_household_registered as varchar(30),
	  @New_Shelter_address as varchar(30),
	  @New_Shelter_city as varchar(30),
	  @New_Shelter_State as varchar(30),
	  @New_Shelter_Zip as int,
	  @New_Contact_Number as int,
	  @Current_household_members_safe as varchar(30),
	  @CheckIn_Date as datetime
	  @CheckOut_Date as datetime,
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	  IF @Shelter_ID = 0
    BEGIN
    SET @Shelter_ID = null
    END
	  IF @Client_ID = 0
    BEGIN
    SET @Client_ID = null
    END
	  IF @Current_address = ''
    BEGIN
    SET @Current_address = null
    END
	  IF @Current_State = ''
    BEGIN
    SET @Current_State = null
    END
	  IF @Current_City = ''
    BEGIN
    SET @Current_City = null
    END
	  IF @Current_Zip = 0
    BEGIN
    SET @Current_Zip = null
    END
	  IF @Client_registration_status = ''
    BEGIN
    SET @Client_registration_status = null
    END
	  IF @Household_size = 0
    BEGIN
    SET @Household_size = null
    END
	  IF @Shelter_supplies = ''
    BEGIN
    SET @Shelter_supplies = null
    END
	  IF @Shelter_occupancy_current = ''
    BEGIN
    SET @Shelter_occupancy_current = null
    END
	  IF @New_household_registered = ''
    BEGIN
    SET @New_household_registered = null
    END
	  IF @New_Shelter_address = ''
    BEGIN
    SET @New_Shelter_address = null
    END
	  IF @New_Shelter_city = ''
    BEGIN
    SET @New_Shelter_city = null
    END
	  IF @New_Shelter_State = ''
    BEGIN
    SET @New_Shelter_State = null
    END
	  IF @New_Shelter_Zip = 0
    BEGIN
    SET @New_Shelter_Zip = null
    END
	  IF @New_Contact_Number = 0
    BEGIN
    SET @New_Contact_Number = null
    END
	  IF @Current_household_members_safe = ''
    BEGIN
    SET @Current_household_members_safe = null
    END
	  IF @CheckIn_Date = '9/9/1900 12:00:00 AM'
    BEGIN
    SET @CheckIn_Date = null
    END
	  IF @CheckOut_Date = '9/9/1900 12:00:00 AM'
    BEGIN
    SET @CheckOut_Date = null
    END
    SELECT [Client_Shelter_ID] 
      FROM [dbo].[Client_Shelter] 
       WHERE ([Shelter_ID] = @Shelter_ID)
       AND ([Client_ID] = @Client_ID)
       AND ([Current_address] like @Current_address)
       AND ([Current_State] like @Current_State)
       AND ([Current_City] like @Current_City)
       AND ([Current_Zip] = @Current_Zip)
       AND ([Client_registration_status] like @Client_registration_status)
       AND ([Household_size] = @Household_size)
       AND ([Shelter_supplies] like @Shelter_supplies or [Shelter_supplies] is null)
       AND ([Shelter_occupancy_current] like @Shelter_occupancy_current)
       AND ([New_household_registered] like @New_household_registered or [New_household_registered] is null)
       AND ([New_Shelter_address] like @New_Shelter_address or [New_Shelter_address] is null)
       AND ([New_Shelter_city] like @New_Shelter_city or [New_Shelter_city] is null)
       AND ([New_Shelter_State] like @New_Shelter_State or [New_Shelter_State] is null)
       AND ([New_Shelter_Zip] = @New_Shelter_Zip or [New_Shelter_Zip] is null)
       AND ([New_Contact_Number] = @New_Contact_Number or [New_Contact_Number] is null)
       AND ([Current_household_members_safe] like @Current_household_members_safe or [Current_household_members_safe] is null)
       AND ([CheckIn_Date] = @CheckIn_Date)
       AND ([CheckOut_Date] = @CheckOut_Date or [CheckOut_Date] is null)
END
GO

