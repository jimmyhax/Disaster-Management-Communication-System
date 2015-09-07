/****** Object:  Table [dbo].[agency]    Script Date: 9/7/2015 11:21:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[agency](
  [agency_id] int IDENTITY(1,1) NOT NULL,
  [address_id] int NOT NULL,
  [agency_name] varchar(50) NOT NULL,
  [primary_fName] varchar(50) NOT NULL,
  [primary_lName] varchar(50) NOT NULL,
  [primary_phone] varchar(50) NOT NULL,
  [sec_fName] varchar(50) NULL,
  [sec_lName] varchar(50) NULL,
  [sec_phone] varchar(50) NULL,
 CONSTRAINT [agency_agency_id_pk] PRIMARY KEY CLUSTERED 
(
	[agency_id] ASC
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
/****** Object:  StoredProcedure [dbo].[SP_DMCS_SELECT_AGENCY]    Script Date: 9/7/2015 11:21:43 AM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_SELECT_AGENCY]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_SELECT_AGENCY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_SELECT_AGENCY]
           @agency_id as int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
SELECT [agency_id]
      ,[address_id]
      ,[agency_name]
      ,[primary_fName]
      ,[primary_lName]
      ,[primary_phone]
      ,[sec_fName]
      ,[sec_lName]
      ,[sec_phone]
  FROM [dbo].[agency]
 WHERE agency_id = @agency_id
End
GO
/***********************************************************/
/*************************************************/
/****** - INSERT STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_INSERT_AGENCY]    Script Date: 9/7/2015 11:21:43 AM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_INSERT_AGENCY]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_INSERT_AGENCY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_INSERT_AGENCY]
	  @address_id as int,
	  @agency_name as varchar(50),
	  @primary_fName as varchar(50),
	  @primary_lName as varchar(50),
	  @primary_phone as varchar(50),
	  @sec_fName as varchar(50),
	  @sec_lName as varchar(50)
	  @sec_phone as varchar(50),
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	  IF @address_id = 0
    BEGIN
    SET @address_id = null
    END
	  IF @agency_name = ''
    BEGIN
    SET @agency_name = null
    END
	  IF @primary_fName = ''
    BEGIN
    SET @primary_fName = null
    END
	  IF @primary_lName = ''
    BEGIN
    SET @primary_lName = null
    END
	  IF @primary_phone = ''
    BEGIN
    SET @primary_phone = null
    END
	  IF @sec_fName = ''
    BEGIN
    SET @sec_fName = null
    END
	  IF @sec_lName = ''
    BEGIN
    SET @sec_lName = null
    END
	  IF @sec_phone = ''
    BEGIN
    SET @sec_phone = null
    END
	Insert INTO [dbo].[agency]
           (
            [address_id]
           ,[agency_name]
           ,[primary_fName]
           ,[primary_lName]
           ,[primary_phone]
           ,[sec_fName]
           ,[sec_lName]
           ,[sec_phone]
            )
     VALUES (
            @address_id
           ,@agency_name
           ,@primary_fName
           ,@primary_lName
           ,@primary_phone
           ,@sec_fName
           ,@sec_lName
           ,@sec_phone
            )
END
GO
/***********************************************************/
/*************************************************/
/****** - UPDATE STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_UPDATE_AGENCY]    Script Date: 9/7/2015 11:21:43 AM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_UPDATE_AGENCY]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_UPDATE_AGENCY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_UPDATE_AGENCY]
	  @agency_id as int,
	  @address_id as int,
	  @agency_name as varchar(50),
	  @primary_fName as varchar(50),
	  @primary_lName as varchar(50),
	  @primary_phone as varchar(50),
	  @sec_fName as varchar(50),
	  @sec_lName as varchar(50)
	  @sec_phone as varchar(50),
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	  IF @address_id = 0
    BEGIN
    SET @address_id = null
    END
	  IF @agency_name = ''
    BEGIN
    SET @agency_name = null
    END
	  IF @primary_fName = ''
    BEGIN
    SET @primary_fName = null
    END
	  IF @primary_lName = ''
    BEGIN
    SET @primary_lName = null
    END
	  IF @primary_phone = ''
    BEGIN
    SET @primary_phone = null
    END
	  IF @sec_fName = ''
    BEGIN
    SET @sec_fName = null
    END
	  IF @sec_lName = ''
    BEGIN
    SET @sec_lName = null
    END
	  IF @sec_phone = ''
    BEGIN
    SET @sec_phone = null
    END
	UPDATE [dbo].[agency]
       SET
		   [address_id] = @address_id,
		   [agency_name] = @agency_name,
		   [primary_fName] = @primary_fName,
		   [primary_lName] = @primary_lName,
		   [primary_phone] = @primary_phone,
		   [sec_fName] = @sec_fName,
		   [sec_lName] = @sec_lName,
		   [sec_phone] = @sec_phone
       WHERE agency_id = @agency_id
END
GO
/***********************************************************/
/*************************************************/
/****** - DELETE STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_DELETE_AGENCY]    Script Date: 9/7/2015 11:21:43 AM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_DELETE_AGENCY]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_DELETE_AGENCY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_DELETE_AGENCY]
	@agency_id int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	Delete dbo.agency
	where agency_id = @agency_id
END
GO
/***********************************************************/
/*************************************************/
/****** - GET STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_GET_AGENCY]    Script Date: 9/7/2015 11:21:43 AM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_GET_AGENCY]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_GET_AGENCY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_GET_AGENCY]
	  @address_id as int,
	  @agency_name as varchar(50),
	  @primary_fName as varchar(50),
	  @primary_lName as varchar(50),
	  @primary_phone as varchar(50),
	  @sec_fName as varchar(50),
	  @sec_lName as varchar(50)
	  @sec_phone as varchar(50),
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	  IF @address_id = 0
    BEGIN
    SET @address_id = null
    END
	  IF @agency_name = ''
    BEGIN
    SET @agency_name = null
    END
	  IF @primary_fName = ''
    BEGIN
    SET @primary_fName = null
    END
	  IF @primary_lName = ''
    BEGIN
    SET @primary_lName = null
    END
	  IF @primary_phone = ''
    BEGIN
    SET @primary_phone = null
    END
	  IF @sec_fName = ''
    BEGIN
    SET @sec_fName = null
    END
	  IF @sec_lName = ''
    BEGIN
    SET @sec_lName = null
    END
	  IF @sec_phone = ''
    BEGIN
    SET @sec_phone = null
    END
    SELECT [agency_id] 
      FROM [dbo].[agency] 
       WHERE ([address_id] = @address_id)
       AND ([agency_name] like @agency_name)
       AND ([primary_fName] like @primary_fName)
       AND ([primary_lName] like @primary_lName)
       AND ([primary_phone] like @primary_phone)
       AND ([sec_fName] like @sec_fName or [sec_fName] is null)
       AND ([sec_lName] like @sec_lName or [sec_lName] is null)
       AND ([sec_phone] like @sec_phone or [sec_phone] is null)
END
GO

