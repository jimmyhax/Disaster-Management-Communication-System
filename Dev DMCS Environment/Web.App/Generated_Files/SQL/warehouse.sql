/****** Object:  Table [dbo].[warehouse]    Script Date: 9/7/2015 11:23:35 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[warehouse](
  [warehouse_id] int IDENTITY(1,1) NOT NULL,
  [warehouse_name] varchar(50) NOT NULL,
  [address_id] int NULL,
  [warehouse_type] varchar(10) NOT NULL,
  [Location_ID] int NULL,
 CONSTRAINT [warehouse_warehouse_id_pk] PRIMARY KEY CLUSTERED 
(
	[warehouse_id] ASC
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
/****** Object:  StoredProcedure [dbo].[SP_DMCS_SELECT_WAREHOUSE]    Script Date: 9/7/2015 11:23:35 AM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_SELECT_WAREHOUSE]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_SELECT_WAREHOUSE]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_SELECT_WAREHOUSE]
           @warehouse_id as int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
SELECT [warehouse_id]
      ,[warehouse_name]
      ,[address_id]
      ,[warehouse_type]
      ,[Location_ID]
  FROM [dbo].[warehouse]
 WHERE warehouse_id = @warehouse_id
End
GO
/***********************************************************/
/*************************************************/
/****** - INSERT STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_INSERT_WAREHOUSE]    Script Date: 9/7/2015 11:23:35 AM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_INSERT_WAREHOUSE]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_INSERT_WAREHOUSE]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_INSERT_WAREHOUSE]
	  @warehouse_name as varchar(50),
	  @address_id as int,
	  @warehouse_type as varchar(10)
	  @Location_ID as int,
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	  IF @warehouse_name = ''
    BEGIN
    SET @warehouse_name = null
    END
	  IF @address_id = 0
    BEGIN
    SET @address_id = null
    END
	  IF @warehouse_type = ''
    BEGIN
    SET @warehouse_type = null
    END
	  IF @Location_ID = 0
    BEGIN
    SET @Location_ID = null
    END
	Insert INTO [dbo].[warehouse]
           (
            [warehouse_name]
           ,[address_id]
           ,[warehouse_type]
           ,[Location_ID]
            )
     VALUES (
            @warehouse_name
           ,@address_id
           ,@warehouse_type
           ,@Location_ID
            )
END
GO
/***********************************************************/
/*************************************************/
/****** - UPDATE STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_UPDATE_WAREHOUSE]    Script Date: 9/7/2015 11:23:35 AM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_UPDATE_WAREHOUSE]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_UPDATE_WAREHOUSE]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_UPDATE_WAREHOUSE]
	  @warehouse_id as int,
	  @warehouse_name as varchar(50),
	  @address_id as int,
	  @warehouse_type as varchar(10)
	  @Location_ID as int,
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	  IF @warehouse_name = ''
    BEGIN
    SET @warehouse_name = null
    END
	  IF @address_id = 0
    BEGIN
    SET @address_id = null
    END
	  IF @warehouse_type = ''
    BEGIN
    SET @warehouse_type = null
    END
	  IF @Location_ID = 0
    BEGIN
    SET @Location_ID = null
    END
	UPDATE [dbo].[warehouse]
       SET
		   [warehouse_name] = @warehouse_name,
		   [address_id] = @address_id,
		   [warehouse_type] = @warehouse_type,
		   [Location_ID] = @Location_ID
       WHERE warehouse_id = @warehouse_id
END
GO
/***********************************************************/
/*************************************************/
/****** - DELETE STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_DELETE_WAREHOUSE]    Script Date: 9/7/2015 11:23:35 AM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_DELETE_WAREHOUSE]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_DELETE_WAREHOUSE]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_DELETE_WAREHOUSE]
	@warehouse_id int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	Delete dbo.warehouse
	where warehouse_id = @warehouse_id
END
GO
/***********************************************************/
/*************************************************/
/****** - GET STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_GET_WAREHOUSE]    Script Date: 9/7/2015 11:23:35 AM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_GET_WAREHOUSE]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_GET_WAREHOUSE]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_GET_WAREHOUSE]
	  @warehouse_name as varchar(50),
	  @address_id as int,
	  @warehouse_type as varchar(10)
	  @Location_ID as int,
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	  IF @warehouse_name = ''
    BEGIN
    SET @warehouse_name = null
    END
	  IF @address_id = 0
    BEGIN
    SET @address_id = null
    END
	  IF @warehouse_type = ''
    BEGIN
    SET @warehouse_type = null
    END
	  IF @Location_ID = 0
    BEGIN
    SET @Location_ID = null
    END
    SELECT [warehouse_id] 
      FROM [dbo].[warehouse] 
       WHERE ([warehouse_name] like @warehouse_name)
       AND ([address_id] = @address_id or [address_id] is null)
       AND ([warehouse_type] like @warehouse_type)
       AND ([Location_ID] = @Location_ID or [Location_ID] is null)
END
GO

