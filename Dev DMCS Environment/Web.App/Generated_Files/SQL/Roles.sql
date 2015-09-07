/****** Object:  Table [dbo].[Roles]    Script Date: 9/7/2015 11:23:21 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Roles](
  [RoleID] bigint IDENTITY(1,1) NOT NULL,
  [Name] nvarchar(128) NOT NULL,
  [IsBuiltIn] int NOT NULL,
  [BackColor] nvarchar(24) NOT NULL,
  [ForeColor] nvarchar(24) NOT NULL,
  [Settings] nvarchar(4000) NULL,
  [Created] datetime NOT NULL,
  [Modified] datetime NULL,
 CONSTRAINT [Roles_RoleID_pk] PRIMARY KEY CLUSTERED 
(
	[RoleID] ASC
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
/****** Object:  StoredProcedure [dbo].[SP_DMCS_SELECT_ROLES]    Script Date: 9/7/2015 11:23:21 AM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_SELECT_ROLES]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_SELECT_ROLES]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_SELECT_ROLES]
           @RoleID as bigint
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
SELECT [RoleID]
      ,[Name]
      ,[IsBuiltIn]
      ,[BackColor]
      ,[ForeColor]
      ,[Settings]
      ,[Created]
      ,[Modified]
  FROM [dbo].[Roles]
 WHERE RoleID = @RoleID
End
GO
/***********************************************************/
/*************************************************/
/****** - INSERT STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_INSERT_ROLES]    Script Date: 9/7/2015 11:23:21 AM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_INSERT_ROLES]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_INSERT_ROLES]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_INSERT_ROLES]
	  @Name as nvarchar(128),
	  @IsBuiltIn as int,
	  @BackColor as nvarchar(24),
	  @ForeColor as nvarchar(24),
	  @Settings as nvarchar(4000),
	  @Created as datetime
	  @Modified as datetime,
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	  IF @Name = 0
    BEGIN
    SET @Name = null
    END
	  IF @IsBuiltIn = 0
    BEGIN
    SET @IsBuiltIn = null
    END
	  IF @BackColor = 0
    BEGIN
    SET @BackColor = null
    END
	  IF @ForeColor = 0
    BEGIN
    SET @ForeColor = null
    END
	  IF @Settings = 0
    BEGIN
    SET @Settings = null
    END
	  IF @Created = '9/9/1900 12:00:00 AM'
    BEGIN
    SET @Created = null
    END
	  IF @Modified = '9/9/1900 12:00:00 AM'
    BEGIN
    SET @Modified = null
    END
	Insert INTO [dbo].[Roles]
           (
            [Name]
           ,[IsBuiltIn]
           ,[BackColor]
           ,[ForeColor]
           ,[Settings]
           ,[Created]
           ,[Modified]
            )
     VALUES (
            @Name
           ,@IsBuiltIn
           ,@BackColor
           ,@ForeColor
           ,@Settings
           ,@Created
           ,@Modified
            )
END
GO
/***********************************************************/
/*************************************************/
/****** - UPDATE STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_UPDATE_ROLES]    Script Date: 9/7/2015 11:23:22 AM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_UPDATE_ROLES]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_UPDATE_ROLES]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_UPDATE_ROLES]
	  @RoleID as bigint,
	  @Name as nvarchar(128),
	  @IsBuiltIn as int,
	  @BackColor as nvarchar(24),
	  @ForeColor as nvarchar(24),
	  @Settings as nvarchar(4000),
	  @Created as datetime
	  @Modified as datetime,
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	  IF @Name = 0
    BEGIN
    SET @Name = null
    END
	  IF @IsBuiltIn = 0
    BEGIN
    SET @IsBuiltIn = null
    END
	  IF @BackColor = 0
    BEGIN
    SET @BackColor = null
    END
	  IF @ForeColor = 0
    BEGIN
    SET @ForeColor = null
    END
	  IF @Settings = 0
    BEGIN
    SET @Settings = null
    END
	  IF @Created = '9/9/1900 12:00:00 AM'
    BEGIN
    SET @Created = null
    END
	  IF @Modified = '9/9/1900 12:00:00 AM'
    BEGIN
    SET @Modified = null
    END
	UPDATE [dbo].[Roles]
       SET
		   [Name] = @Name,
		   [IsBuiltIn] = @IsBuiltIn,
		   [BackColor] = @BackColor,
		   [ForeColor] = @ForeColor,
		   [Settings] = @Settings,
		   [Created] = @Created,
		   [Modified] = @Modified
       WHERE RoleID = @RoleID
END
GO
/***********************************************************/
/*************************************************/
/****** - DELETE STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_DELETE_ROLES]    Script Date: 9/7/2015 11:23:22 AM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_DELETE_ROLES]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_DELETE_ROLES]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_DELETE_ROLES]
	@RoleID bigint
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	Delete dbo.Roles
	where RoleID = @RoleID
END
GO
/***********************************************************/
/*************************************************/
/****** - GET STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_GET_ROLES]    Script Date: 9/7/2015 11:23:22 AM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_GET_ROLES]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_GET_ROLES]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_GET_ROLES]
	  @Name as nvarchar(128),
	  @IsBuiltIn as int,
	  @BackColor as nvarchar(24),
	  @ForeColor as nvarchar(24),
	  @Settings as nvarchar(4000),
	  @Created as datetime
	  @Modified as datetime,
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	  IF @Name = 0
    BEGIN
    SET @Name = null
    END
	  IF @IsBuiltIn = 0
    BEGIN
    SET @IsBuiltIn = null
    END
	  IF @BackColor = 0
    BEGIN
    SET @BackColor = null
    END
	  IF @ForeColor = 0
    BEGIN
    SET @ForeColor = null
    END
	  IF @Settings = 0
    BEGIN
    SET @Settings = null
    END
	  IF @Created = '9/9/1900 12:00:00 AM'
    BEGIN
    SET @Created = null
    END
	  IF @Modified = '9/9/1900 12:00:00 AM'
    BEGIN
    SET @Modified = null
    END
    SELECT [RoleID] 
      FROM [dbo].[Roles] 
       WHERE ([Name] = @Name)
       AND ([IsBuiltIn] = @IsBuiltIn)
       AND ([BackColor] = @BackColor)
       AND ([ForeColor] = @ForeColor)
       AND ([Settings] = @Settings or [Settings] is null)
       AND ([Created] = @Created)
       AND ([Modified] = @Modified or [Modified] is null)
END
GO

