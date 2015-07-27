/****** Object:  Table [dbo].[address]    Script Date: 7/22/2015 5:32:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[address](
  [address_id] int IDENTITY(1,1) NOT NULL,
  [address_type_id] int NOT NULL,
  [city] varchar(30) NOT NULL,
  [country] varchar(30) NOT NULL,
  [County_Township] varchar(30) NULL,
  [longitude] decimal NULL,
  [latitude] decimal NULL,
  [state] char(2) NOT NULL,
  [str_add] varchar(MAX) NOT NULL,
  [str_add2] varchar(MAX) NULL,
  [zip_plus_four] varchar(10) NULL,
 CONSTRAINT [address_address_id_pk] PRIMARY KEY CLUSTERED 
(
	[address_id] ASC
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
/****** Object:  StoredProcedure [dbo].[SP_DMCS_SELECT_ADDRESS]    Script Date: 7/22/2015 5:32:45 PM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_SELECT_ADDRESS]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_SELECT_ADDRESS]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_SELECT_ADDRESS]
           @address_id as int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
SELECT [address_id]
      ,[address_type_id]
      ,[city]
      ,[country]
      ,[County_Township]
      ,[longitude]
      ,[latitude]
      ,[state]
      ,[str_add]
      ,[str_add2]
      ,[zip_plus_four]
  FROM [dbo].[address]
 WHERE address_id = @address_id
End
GO
/***********************************************************/
/*************************************************/
/****** - INSERT STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_INSERT_ADDRESS]    Script Date: 7/22/2015 5:32:45 PM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_INSERT_ADDRESS]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_INSERT_ADDRESS]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_INSERT_ADDRESS]
	  @address_type_id as int,
	  @city as varchar(30),
	  @country as varchar(30),
	  @County_Township as varchar(30),
	  @longitude as decimal,
	  @latitude as decimal,
	  @state as char(2),
	  @str_add as varchar(MAX),
	  @str_add2 as varchar(MAX)
	  @zip_plus_four as varchar(10),
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	  IF @address_type_id = 0
    BEGIN
    SET @address_type_id = null
    END
	  IF @city = ''
    BEGIN
    SET @city = null
    END
	  IF @country = ''
    BEGIN
    SET @country = null
    END
	  IF @County_Township = ''
    BEGIN
    SET @County_Township = null
    END
	  IF @longitude = 0
    BEGIN
    SET @longitude = null
    END
	  IF @latitude = 0
    BEGIN
    SET @latitude = null
    END
	  IF @state = ''
    BEGIN
    SET @state = null
    END
	  IF @str_add = ''
    BEGIN
    SET @str_add = null
    END
	  IF @str_add2 = ''
    BEGIN
    SET @str_add2 = null
    END
	  IF @zip_plus_four = ''
    BEGIN
    SET @zip_plus_four = null
    END
	Insert INTO [dbo].[address]
           (
            [address_type_id]
           ,[city]
           ,[country]
           ,[County_Township]
           ,[longitude]
           ,[latitude]
           ,[state]
           ,[str_add]
           ,[str_add2]
           ,[zip_plus_four]
            )
     VALUES (
            @address_type_id
           ,@city
           ,@country
           ,@County_Township
           ,@longitude
           ,@latitude
           ,@state
           ,@str_add
           ,@str_add2
           ,@zip_plus_four
            )
END
GO
/***********************************************************/
/*************************************************/
/****** - UPDATE STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_UPDATE_ADDRESS]    Script Date: 7/22/2015 5:32:45 PM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_UPDATE_ADDRESS]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_UPDATE_ADDRESS]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_UPDATE_ADDRESS]
	  @address_id as int,
	  @address_type_id as int,
	  @city as varchar(30),
	  @country as varchar(30),
	  @County_Township as varchar(30),
	  @longitude as decimal,
	  @latitude as decimal,
	  @state as char(2),
	  @str_add as varchar(MAX),
	  @str_add2 as varchar(MAX)
	  @zip_plus_four as varchar(10),
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	  IF @address_type_id = 0
    BEGIN
    SET @address_type_id = null
    END
	  IF @city = ''
    BEGIN
    SET @city = null
    END
	  IF @country = ''
    BEGIN
    SET @country = null
    END
	  IF @County_Township = ''
    BEGIN
    SET @County_Township = null
    END
	  IF @longitude = 0
    BEGIN
    SET @longitude = null
    END
	  IF @latitude = 0
    BEGIN
    SET @latitude = null
    END
	  IF @state = ''
    BEGIN
    SET @state = null
    END
	  IF @str_add = ''
    BEGIN
    SET @str_add = null
    END
	  IF @str_add2 = ''
    BEGIN
    SET @str_add2 = null
    END
	  IF @zip_plus_four = ''
    BEGIN
    SET @zip_plus_four = null
    END
	UPDATE [dbo].[address]
       SET
		   [address_type_id] = @address_type_id,
		   [city] = @city,
		   [country] = @country,
		   [County_Township] = @County_Township,
		   [longitude] = @longitude,
		   [latitude] = @latitude,
		   [state] = @state,
		   [str_add] = @str_add,
		   [str_add2] = @str_add2,
		   [zip_plus_four] = @zip_plus_four
       WHERE address_id = @address_id
END
GO
/***********************************************************/
/*************************************************/
/****** - DELETE STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_DELETE_ADDRESS]    Script Date: 7/22/2015 5:32:45 PM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_DELETE_ADDRESS]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_DELETE_ADDRESS]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_DELETE_ADDRESS]
	@address_id int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	Delete dbo.address
	where address_id = @address_id
END
GO
/***********************************************************/
/*************************************************/
/****** - GET STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_GET_ADDRESS]    Script Date: 7/22/2015 5:32:45 PM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_GET_ADDRESS]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_GET_ADDRESS]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_GET_ADDRESS]
	  @address_type_id as int,
	  @city as varchar(30),
	  @country as varchar(30),
	  @County_Township as varchar(30),
	  @longitude as decimal,
	  @latitude as decimal,
	  @state as char(2),
	  @str_add as varchar(MAX),
	  @str_add2 as varchar(MAX)
	  @zip_plus_four as varchar(10),
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	  IF @address_type_id = 0
    BEGIN
    SET @address_type_id = null
    END
	  IF @city = ''
    BEGIN
    SET @city = null
    END
	  IF @country = ''
    BEGIN
    SET @country = null
    END
	  IF @County_Township = ''
    BEGIN
    SET @County_Township = null
    END
	  IF @longitude = 0
    BEGIN
    SET @longitude = null
    END
	  IF @latitude = 0
    BEGIN
    SET @latitude = null
    END
	  IF @state = ''
    BEGIN
    SET @state = null
    END
	  IF @str_add = ''
    BEGIN
    SET @str_add = null
    END
	  IF @str_add2 = ''
    BEGIN
    SET @str_add2 = null
    END
	  IF @zip_plus_four = ''
    BEGIN
    SET @zip_plus_four = null
    END
    SELECT [address_id] 
      FROM [dbo].[address] 
       WHERE ([address_type_id] = @address_type_id)
       AND ([city] like @city)
       AND ([country] like @country)
       AND ([County_Township] like @County_Township or [County_Township] is null)
       AND ([longitude] = @longitude or [longitude] is null)
       AND ([latitude] = @latitude or [latitude] is null)
       AND ([state] = @state)
       AND ([str_add] like @str_add)
       AND ([str_add2] like @str_add2 or [str_add2] is null)
       AND ([zip_plus_four] like @zip_plus_four or [zip_plus_four] is null)
END
GO

