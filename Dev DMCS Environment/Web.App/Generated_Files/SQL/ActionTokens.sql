/****** Object:  Table [dbo].[ActionTokens]    Script Date: 9/7/2015 11:21:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ActionTokens](
  [ActionID] bigint IDENTITY(1,1) NOT NULL,
  [ActionType] int NOT NULL,
  [Token] nvarchar(254) NOT NULL,
  [Email] nvarchar(254) NOT NULL,
  [Created] datetime NOT NULL,
  [ReturnURL] nvarchar(2048) NULL,
 CONSTRAINT [ActionTokens_ActionID_pk] PRIMARY KEY CLUSTERED 
(
	[ActionID] ASC
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
/****** Object:  StoredProcedure [dbo].[SP_DMCS_SELECT_ACTIONTOKENS]    Script Date: 9/7/2015 11:21:37 AM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_SELECT_ACTIONTOKENS]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_SELECT_ACTIONTOKENS]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_SELECT_ACTIONTOKENS]
           @ActionID as bigint
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
SELECT [ActionID]
      ,[ActionType]
      ,[Token]
      ,[Email]
      ,[Created]
      ,[ReturnURL]
  FROM [dbo].[ActionTokens]
 WHERE ActionID = @ActionID
End
GO
/***********************************************************/
/*************************************************/
/****** - INSERT STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_INSERT_ACTIONTOKENS]    Script Date: 9/7/2015 11:21:37 AM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_INSERT_ACTIONTOKENS]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_INSERT_ACTIONTOKENS]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_INSERT_ACTIONTOKENS]
	  @ActionType as int,
	  @Token as nvarchar(254),
	  @Email as nvarchar(254),
	  @Created as datetime
	  @ReturnURL as nvarchar(2048),
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	  IF @ActionType = 0
    BEGIN
    SET @ActionType = null
    END
	  IF @Token = 0
    BEGIN
    SET @Token = null
    END
	  IF @Email = 0
    BEGIN
    SET @Email = null
    END
	  IF @Created = '9/9/1900 12:00:00 AM'
    BEGIN
    SET @Created = null
    END
	  IF @ReturnURL = 0
    BEGIN
    SET @ReturnURL = null
    END
	Insert INTO [dbo].[ActionTokens]
           (
            [ActionType]
           ,[Token]
           ,[Email]
           ,[Created]
           ,[ReturnURL]
            )
     VALUES (
            @ActionType
           ,@Token
           ,@Email
           ,@Created
           ,@ReturnURL
            )
END
GO
/***********************************************************/
/*************************************************/
/****** - UPDATE STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_UPDATE_ACTIONTOKENS]    Script Date: 9/7/2015 11:21:37 AM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_UPDATE_ACTIONTOKENS]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_UPDATE_ACTIONTOKENS]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_UPDATE_ACTIONTOKENS]
	  @ActionID as bigint,
	  @ActionType as int,
	  @Token as nvarchar(254),
	  @Email as nvarchar(254),
	  @Created as datetime
	  @ReturnURL as nvarchar(2048),
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	  IF @ActionType = 0
    BEGIN
    SET @ActionType = null
    END
	  IF @Token = 0
    BEGIN
    SET @Token = null
    END
	  IF @Email = 0
    BEGIN
    SET @Email = null
    END
	  IF @Created = '9/9/1900 12:00:00 AM'
    BEGIN
    SET @Created = null
    END
	  IF @ReturnURL = 0
    BEGIN
    SET @ReturnURL = null
    END
	UPDATE [dbo].[ActionTokens]
       SET
		   [ActionType] = @ActionType,
		   [Token] = @Token,
		   [Email] = @Email,
		   [Created] = @Created,
		   [ReturnURL] = @ReturnURL
       WHERE ActionID = @ActionID
END
GO
/***********************************************************/
/*************************************************/
/****** - DELETE STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_DELETE_ACTIONTOKENS]    Script Date: 9/7/2015 11:21:37 AM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_DELETE_ACTIONTOKENS]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_DELETE_ACTIONTOKENS]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_DELETE_ACTIONTOKENS]
	@ActionID bigint
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	Delete dbo.ActionTokens
	where ActionID = @ActionID
END
GO
/***********************************************************/
/*************************************************/
/****** - GET STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_GET_ACTIONTOKENS]    Script Date: 9/7/2015 11:21:37 AM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_GET_ACTIONTOKENS]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_GET_ACTIONTOKENS]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_GET_ACTIONTOKENS]
	  @ActionType as int,
	  @Token as nvarchar(254),
	  @Email as nvarchar(254),
	  @Created as datetime
	  @ReturnURL as nvarchar(2048),
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	  IF @ActionType = 0
    BEGIN
    SET @ActionType = null
    END
	  IF @Token = 0
    BEGIN
    SET @Token = null
    END
	  IF @Email = 0
    BEGIN
    SET @Email = null
    END
	  IF @Created = '9/9/1900 12:00:00 AM'
    BEGIN
    SET @Created = null
    END
	  IF @ReturnURL = 0
    BEGIN
    SET @ReturnURL = null
    END
    SELECT [ActionID] 
      FROM [dbo].[ActionTokens] 
       WHERE ([ActionType] = @ActionType)
       AND ([Token] = @Token)
       AND ([Email] = @Email)
       AND ([Created] = @Created)
       AND ([ReturnURL] = @ReturnURL or [ReturnURL] is null)
END
GO

