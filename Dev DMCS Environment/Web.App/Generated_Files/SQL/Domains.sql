/****** Object:  Table [dbo].[Domains]    Script Date: 9/7/2015 11:22:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Domains](
  [DomainID] int IDENTITY(1,1) NOT NULL,
  [Name] nvarchar(128) NOT NULL,
  [Description] nvarchar(2047) NULL,
  [Created] datetime NOT NULL,
  [Modified] datetime NULL,
 CONSTRAINT [Domains_DomainID_pk] PRIMARY KEY CLUSTERED 
(
	[DomainID] ASC
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
/****** Object:  StoredProcedure [dbo].[SP_DMCS_SELECT_DOMAINS]    Script Date: 9/7/2015 11:22:07 AM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_SELECT_DOMAINS]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_SELECT_DOMAINS]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_SELECT_DOMAINS]
           @DomainID as int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
SELECT [DomainID]
      ,[Name]
      ,[Description]
      ,[Created]
      ,[Modified]
  FROM [dbo].[Domains]
 WHERE DomainID = @DomainID
End
GO
/***********************************************************/
/*************************************************/
/****** - INSERT STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_INSERT_DOMAINS]    Script Date: 9/7/2015 11:22:07 AM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_INSERT_DOMAINS]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_INSERT_DOMAINS]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_INSERT_DOMAINS]
	  @Name as nvarchar(128),
	  @Description as nvarchar(2047),
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
	  IF @Description = 0
    BEGIN
    SET @Description = null
    END
	  IF @Created = '9/9/1900 12:00:00 AM'
    BEGIN
    SET @Created = null
    END
	  IF @Modified = '9/9/1900 12:00:00 AM'
    BEGIN
    SET @Modified = null
    END
	Insert INTO [dbo].[Domains]
           (
            [Name]
           ,[Description]
           ,[Created]
           ,[Modified]
            )
     VALUES (
            @Name
           ,@Description
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
/****** Object:  StoredProcedure [dbo].[SP_DMCS_UPDATE_DOMAINS]    Script Date: 9/7/2015 11:22:07 AM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_UPDATE_DOMAINS]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_UPDATE_DOMAINS]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_UPDATE_DOMAINS]
	  @DomainID as int,
	  @Name as nvarchar(128),
	  @Description as nvarchar(2047),
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
	  IF @Description = 0
    BEGIN
    SET @Description = null
    END
	  IF @Created = '9/9/1900 12:00:00 AM'
    BEGIN
    SET @Created = null
    END
	  IF @Modified = '9/9/1900 12:00:00 AM'
    BEGIN
    SET @Modified = null
    END
	UPDATE [dbo].[Domains]
       SET
		   [Name] = @Name,
		   [Description] = @Description,
		   [Created] = @Created,
		   [Modified] = @Modified
       WHERE DomainID = @DomainID
END
GO
/***********************************************************/
/*************************************************/
/****** - DELETE STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_DELETE_DOMAINS]    Script Date: 9/7/2015 11:22:07 AM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_DELETE_DOMAINS]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_DELETE_DOMAINS]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_DELETE_DOMAINS]
	@DomainID int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	Delete dbo.Domains
	where DomainID = @DomainID
END
GO
/***********************************************************/
/*************************************************/
/****** - GET STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_GET_DOMAINS]    Script Date: 9/7/2015 11:22:07 AM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_GET_DOMAINS]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_GET_DOMAINS]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_GET_DOMAINS]
	  @Name as nvarchar(128),
	  @Description as nvarchar(2047),
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
	  IF @Description = 0
    BEGIN
    SET @Description = null
    END
	  IF @Created = '9/9/1900 12:00:00 AM'
    BEGIN
    SET @Created = null
    END
	  IF @Modified = '9/9/1900 12:00:00 AM'
    BEGIN
    SET @Modified = null
    END
    SELECT [DomainID] 
      FROM [dbo].[Domains] 
       WHERE ([Name] = @Name)
       AND ([Description] = @Description or [Description] is null)
       AND ([Created] = @Created)
       AND ([Modified] = @Modified or [Modified] is null)
END
GO

