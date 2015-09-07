/****** Object:  Table [dbo].[Parameters]    Script Date: 9/7/2015 11:22:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Parameters](
  [ID] int IDENTITY(1,1) NOT NULL,
  [Name] nvarchar(256) NOT NULL,
  [Value] ntext(1073741823) NULL,
  [MemberID] bigint NOT NULL,
  [Created] datetime NOT NULL,
  [TypeID] int NOT NULL,
  [Modified] datetime NULL,
 CONSTRAINT [Parameters_ID_pk] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
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
/****** Object:  StoredProcedure [dbo].[SP_DMCS_SELECT_PARAMETERS]    Script Date: 9/7/2015 11:22:55 AM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_SELECT_PARAMETERS]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_SELECT_PARAMETERS]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_SELECT_PARAMETERS]
           @ID as int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
SELECT [ID]
      ,[Name]
      ,[Value]
      ,[MemberID]
      ,[Created]
      ,[TypeID]
      ,[Modified]
  FROM [dbo].[Parameters]
 WHERE ID = @ID
End
GO
/***********************************************************/
/*************************************************/
/****** - INSERT STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_INSERT_PARAMETERS]    Script Date: 9/7/2015 11:22:55 AM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_INSERT_PARAMETERS]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_INSERT_PARAMETERS]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_INSERT_PARAMETERS]
	  @Name as nvarchar(256),
	  @Value as ntext(1073741823),
	  @MemberID as bigint,
	  @Created as datetime,
	  @TypeID as int
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
	  IF @Value = 0
    BEGIN
    SET @Value = null
    END
	  IF @MemberID = 0
    BEGIN
    SET @MemberID = null
    END
	  IF @Created = '9/9/1900 12:00:00 AM'
    BEGIN
    SET @Created = null
    END
	  IF @TypeID = 0
    BEGIN
    SET @TypeID = null
    END
	  IF @Modified = '9/9/1900 12:00:00 AM'
    BEGIN
    SET @Modified = null
    END
	Insert INTO [dbo].[Parameters]
           (
            [Name]
           ,[Value]
           ,[MemberID]
           ,[Created]
           ,[TypeID]
           ,[Modified]
            )
     VALUES (
            @Name
           ,@Value
           ,@MemberID
           ,@Created
           ,@TypeID
           ,@Modified
            )
END
GO
/***********************************************************/
/*************************************************/
/****** - UPDATE STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_UPDATE_PARAMETERS]    Script Date: 9/7/2015 11:22:55 AM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_UPDATE_PARAMETERS]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_UPDATE_PARAMETERS]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_UPDATE_PARAMETERS]
	  @ID as int,
	  @Name as nvarchar(256),
	  @Value as ntext(1073741823),
	  @MemberID as bigint,
	  @Created as datetime,
	  @TypeID as int
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
	  IF @Value = 0
    BEGIN
    SET @Value = null
    END
	  IF @MemberID = 0
    BEGIN
    SET @MemberID = null
    END
	  IF @Created = '9/9/1900 12:00:00 AM'
    BEGIN
    SET @Created = null
    END
	  IF @TypeID = 0
    BEGIN
    SET @TypeID = null
    END
	  IF @Modified = '9/9/1900 12:00:00 AM'
    BEGIN
    SET @Modified = null
    END
	UPDATE [dbo].[Parameters]
       SET
		   [Name] = @Name,
		   [Value] = @Value,
		   [MemberID] = @MemberID,
		   [Created] = @Created,
		   [TypeID] = @TypeID,
		   [Modified] = @Modified
       WHERE ID = @ID
END
GO
/***********************************************************/
/*************************************************/
/****** - DELETE STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_DELETE_PARAMETERS]    Script Date: 9/7/2015 11:22:55 AM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_DELETE_PARAMETERS]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_DELETE_PARAMETERS]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_DELETE_PARAMETERS]
	@ID int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	Delete dbo.Parameters
	where ID = @ID
END
GO
/***********************************************************/
/*************************************************/
/****** - GET STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_GET_PARAMETERS]    Script Date: 9/7/2015 11:22:55 AM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_GET_PARAMETERS]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_GET_PARAMETERS]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_GET_PARAMETERS]
	  @Name as nvarchar(256),
	  @Value as ntext(1073741823),
	  @MemberID as bigint,
	  @Created as datetime,
	  @TypeID as int
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
	  IF @Value = 0
    BEGIN
    SET @Value = null
    END
	  IF @MemberID = 0
    BEGIN
    SET @MemberID = null
    END
	  IF @Created = '9/9/1900 12:00:00 AM'
    BEGIN
    SET @Created = null
    END
	  IF @TypeID = 0
    BEGIN
    SET @TypeID = null
    END
	  IF @Modified = '9/9/1900 12:00:00 AM'
    BEGIN
    SET @Modified = null
    END
    SELECT [ID] 
      FROM [dbo].[Parameters] 
       WHERE ([Name] = @Name)
       AND ([Value] = @Value or [Value] is null)
       AND ([MemberID] = @MemberID)
       AND ([Created] = @Created)
       AND ([TypeID] = @TypeID)
       AND ([Modified] = @Modified or [Modified] is null)
END
GO

