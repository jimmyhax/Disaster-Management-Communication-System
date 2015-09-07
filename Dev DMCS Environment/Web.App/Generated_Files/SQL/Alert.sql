/****** Object:  Table [dbo].[Alert]    Script Date: 9/7/2015 11:21:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Alert](
  [Alert_ID] int IDENTITY(1,1) NOT NULL,
  [Alert_Message] varchar(MAX) NOT NULL,
  [Alert_Type] varchar(15) NOT NULL,
  [Date] datetime NOT NULL,
  [Person_ID] int NOT NULL,
 CONSTRAINT [Alert_Alert_ID_pk] PRIMARY KEY CLUSTERED 
(
	[Alert_ID] ASC
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
/****** Object:  StoredProcedure [dbo].[SP_DMCS_SELECT_ALERT]    Script Date: 9/7/2015 11:21:45 AM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_SELECT_ALERT]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_SELECT_ALERT]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_SELECT_ALERT]
           @Alert_ID as int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
SELECT [Alert_ID]
      ,[Alert_Message]
      ,[Alert_Type]
      ,[Date]
      ,[Person_ID]
  FROM [dbo].[Alert]
 WHERE Alert_ID = @Alert_ID
End
GO
/***********************************************************/
/*************************************************/
/****** - INSERT STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_INSERT_ALERT]    Script Date: 9/7/2015 11:21:45 AM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_INSERT_ALERT]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_INSERT_ALERT]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_INSERT_ALERT]
	  @Alert_Message as varchar(MAX),
	  @Alert_Type as varchar(15),
	  @Date as datetime
	  @Person_ID as int,
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	  IF @Alert_Message = ''
    BEGIN
    SET @Alert_Message = null
    END
	  IF @Alert_Type = ''
    BEGIN
    SET @Alert_Type = null
    END
	  IF @Date = '9/9/1900 12:00:00 AM'
    BEGIN
    SET @Date = null
    END
	  IF @Person_ID = 0
    BEGIN
    SET @Person_ID = null
    END
	Insert INTO [dbo].[Alert]
           (
            [Alert_Message]
           ,[Alert_Type]
           ,[Date]
           ,[Person_ID]
            )
     VALUES (
            @Alert_Message
           ,@Alert_Type
           ,@Date
           ,@Person_ID
            )
END
GO
/***********************************************************/
/*************************************************/
/****** - UPDATE STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_UPDATE_ALERT]    Script Date: 9/7/2015 11:21:45 AM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_UPDATE_ALERT]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_UPDATE_ALERT]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_UPDATE_ALERT]
	  @Alert_ID as int,
	  @Alert_Message as varchar(MAX),
	  @Alert_Type as varchar(15),
	  @Date as datetime
	  @Person_ID as int,
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	  IF @Alert_Message = ''
    BEGIN
    SET @Alert_Message = null
    END
	  IF @Alert_Type = ''
    BEGIN
    SET @Alert_Type = null
    END
	  IF @Date = '9/9/1900 12:00:00 AM'
    BEGIN
    SET @Date = null
    END
	  IF @Person_ID = 0
    BEGIN
    SET @Person_ID = null
    END
	UPDATE [dbo].[Alert]
       SET
		   [Alert_Message] = @Alert_Message,
		   [Alert_Type] = @Alert_Type,
		   [Date] = @Date,
		   [Person_ID] = @Person_ID
       WHERE Alert_ID = @Alert_ID
END
GO
/***********************************************************/
/*************************************************/
/****** - DELETE STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_DELETE_ALERT]    Script Date: 9/7/2015 11:21:45 AM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_DELETE_ALERT]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_DELETE_ALERT]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_DELETE_ALERT]
	@Alert_ID int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	Delete dbo.Alert
	where Alert_ID = @Alert_ID
END
GO
/***********************************************************/
/*************************************************/
/****** - GET STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_GET_ALERT]    Script Date: 9/7/2015 11:21:45 AM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_GET_ALERT]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_GET_ALERT]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_GET_ALERT]
	  @Alert_Message as varchar(MAX),
	  @Alert_Type as varchar(15),
	  @Date as datetime
	  @Person_ID as int,
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	  IF @Alert_Message = ''
    BEGIN
    SET @Alert_Message = null
    END
	  IF @Alert_Type = ''
    BEGIN
    SET @Alert_Type = null
    END
	  IF @Date = '9/9/1900 12:00:00 AM'
    BEGIN
    SET @Date = null
    END
	  IF @Person_ID = 0
    BEGIN
    SET @Person_ID = null
    END
    SELECT [Alert_ID] 
      FROM [dbo].[Alert] 
       WHERE ([Alert_Message] like @Alert_Message)
       AND ([Alert_Type] like @Alert_Type)
       AND ([Date] = @Date)
       AND ([Person_ID] = @Person_ID)
END
GO

