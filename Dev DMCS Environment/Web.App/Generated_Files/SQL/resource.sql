/****** Object:  Table [dbo].[resource]    Script Date: 9/7/2015 11:23:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[resource](
  [Resource_ID] int IDENTITY(1,1) NOT NULL,
  [Location_ID] int NULL,
  [Resource_Type] varchar(150) NOT NULL,
  [Date_Requested] datetime NULL,
 CONSTRAINT [resource_Resource_ID_pk] PRIMARY KEY CLUSTERED 
(
	[Resource_ID] ASC
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
/****** Object:  StoredProcedure [dbo].[SP_DMCS_SELECT_RESOURCE]    Script Date: 9/7/2015 11:23:19 AM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_SELECT_RESOURCE]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_SELECT_RESOURCE]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_SELECT_RESOURCE]
           @Resource_ID as int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
SELECT [Resource_ID]
      ,[Location_ID]
      ,[Resource_Type]
      ,[Date_Requested]
  FROM [dbo].[resource]
 WHERE Resource_ID = @Resource_ID
End
GO
/***********************************************************/
/*************************************************/
/****** - INSERT STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_INSERT_RESOURCE]    Script Date: 9/7/2015 11:23:19 AM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_INSERT_RESOURCE]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_INSERT_RESOURCE]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_INSERT_RESOURCE]
	  @Location_ID as int,
	  @Resource_Type as varchar(150)
	  @Date_Requested as datetime,
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	  IF @Location_ID = 0
    BEGIN
    SET @Location_ID = null
    END
	  IF @Resource_Type = ''
    BEGIN
    SET @Resource_Type = null
    END
	  IF @Date_Requested = '9/9/1900 12:00:00 AM'
    BEGIN
    SET @Date_Requested = null
    END
	Insert INTO [dbo].[resource]
           (
            [Location_ID]
           ,[Resource_Type]
           ,[Date_Requested]
            )
     VALUES (
            @Location_ID
           ,@Resource_Type
           ,@Date_Requested
            )
END
GO
/***********************************************************/
/*************************************************/
/****** - UPDATE STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_UPDATE_RESOURCE]    Script Date: 9/7/2015 11:23:19 AM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_UPDATE_RESOURCE]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_UPDATE_RESOURCE]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_UPDATE_RESOURCE]
	  @Resource_ID as int,
	  @Location_ID as int,
	  @Resource_Type as varchar(150)
	  @Date_Requested as datetime,
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	  IF @Location_ID = 0
    BEGIN
    SET @Location_ID = null
    END
	  IF @Resource_Type = ''
    BEGIN
    SET @Resource_Type = null
    END
	  IF @Date_Requested = '9/9/1900 12:00:00 AM'
    BEGIN
    SET @Date_Requested = null
    END
	UPDATE [dbo].[resource]
       SET
		   [Location_ID] = @Location_ID,
		   [Resource_Type] = @Resource_Type,
		   [Date_Requested] = @Date_Requested
       WHERE Resource_ID = @Resource_ID
END
GO
/***********************************************************/
/*************************************************/
/****** - DELETE STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_DELETE_RESOURCE]    Script Date: 9/7/2015 11:23:19 AM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_DELETE_RESOURCE]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_DELETE_RESOURCE]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_DELETE_RESOURCE]
	@Resource_ID int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	Delete dbo.resource
	where Resource_ID = @Resource_ID
END
GO
/***********************************************************/
/*************************************************/
/****** - GET STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_GET_RESOURCE]    Script Date: 9/7/2015 11:23:19 AM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_GET_RESOURCE]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_GET_RESOURCE]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_GET_RESOURCE]
	  @Location_ID as int,
	  @Resource_Type as varchar(150)
	  @Date_Requested as datetime,
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	  IF @Location_ID = 0
    BEGIN
    SET @Location_ID = null
    END
	  IF @Resource_Type = ''
    BEGIN
    SET @Resource_Type = null
    END
	  IF @Date_Requested = '9/9/1900 12:00:00 AM'
    BEGIN
    SET @Date_Requested = null
    END
    SELECT [Resource_ID] 
      FROM [dbo].[resource] 
       WHERE ([Location_ID] = @Location_ID or [Location_ID] is null)
       AND ([Resource_Type] like @Resource_Type)
       AND ([Date_Requested] = @Date_Requested or [Date_Requested] is null)
END
GO

