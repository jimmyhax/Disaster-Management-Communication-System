/****** Object:  Table [dbo].[MemberTokens]    Script Date: 9/7/2015 11:22:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[MemberTokens](
  [MemberTokenID] bigint IDENTITY(1,1) NOT NULL,
  [MemberID] bigint NOT NULL,
  [Token] nvarchar(254) NOT NULL,
  [GeneratedBy] nvarchar(64) NOT NULL,
  [Created] datetime NOT NULL,
  [Modified] datetime NULL,
 CONSTRAINT [MemberTokens_MemberTokenID_pk] PRIMARY KEY CLUSTERED 
(
	[MemberTokenID] ASC
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
/****** Object:  StoredProcedure [dbo].[SP_DMCS_SELECT_MEMBERTOKENS]    Script Date: 9/7/2015 11:22:45 AM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_SELECT_MEMBERTOKENS]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_SELECT_MEMBERTOKENS]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_SELECT_MEMBERTOKENS]
           @MemberTokenID as bigint
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
SELECT [MemberTokenID]
      ,[MemberID]
      ,[Token]
      ,[GeneratedBy]
      ,[Created]
      ,[Modified]
  FROM [dbo].[MemberTokens]
 WHERE MemberTokenID = @MemberTokenID
End
GO
/***********************************************************/
/*************************************************/
/****** - INSERT STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_INSERT_MEMBERTOKENS]    Script Date: 9/7/2015 11:22:45 AM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_INSERT_MEMBERTOKENS]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_INSERT_MEMBERTOKENS]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_INSERT_MEMBERTOKENS]
	  @MemberID as bigint,
	  @Token as nvarchar(254),
	  @GeneratedBy as nvarchar(64),
	  @Created as datetime
	  @Modified as datetime,
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	  IF @MemberID = 0
    BEGIN
    SET @MemberID = null
    END
	  IF @Token = 0
    BEGIN
    SET @Token = null
    END
	  IF @GeneratedBy = 0
    BEGIN
    SET @GeneratedBy = null
    END
	  IF @Created = '9/9/1900 12:00:00 AM'
    BEGIN
    SET @Created = null
    END
	  IF @Modified = '9/9/1900 12:00:00 AM'
    BEGIN
    SET @Modified = null
    END
	Insert INTO [dbo].[MemberTokens]
           (
            [MemberID]
           ,[Token]
           ,[GeneratedBy]
           ,[Created]
           ,[Modified]
            )
     VALUES (
            @MemberID
           ,@Token
           ,@GeneratedBy
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
/****** Object:  StoredProcedure [dbo].[SP_DMCS_UPDATE_MEMBERTOKENS]    Script Date: 9/7/2015 11:22:45 AM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_UPDATE_MEMBERTOKENS]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_UPDATE_MEMBERTOKENS]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_UPDATE_MEMBERTOKENS]
	  @MemberTokenID as bigint,
	  @MemberID as bigint,
	  @Token as nvarchar(254),
	  @GeneratedBy as nvarchar(64),
	  @Created as datetime
	  @Modified as datetime,
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	  IF @MemberID = 0
    BEGIN
    SET @MemberID = null
    END
	  IF @Token = 0
    BEGIN
    SET @Token = null
    END
	  IF @GeneratedBy = 0
    BEGIN
    SET @GeneratedBy = null
    END
	  IF @Created = '9/9/1900 12:00:00 AM'
    BEGIN
    SET @Created = null
    END
	  IF @Modified = '9/9/1900 12:00:00 AM'
    BEGIN
    SET @Modified = null
    END
	UPDATE [dbo].[MemberTokens]
       SET
		   [MemberID] = @MemberID,
		   [Token] = @Token,
		   [GeneratedBy] = @GeneratedBy,
		   [Created] = @Created,
		   [Modified] = @Modified
       WHERE MemberTokenID = @MemberTokenID
END
GO
/***********************************************************/
/*************************************************/
/****** - DELETE STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_DELETE_MEMBERTOKENS]    Script Date: 9/7/2015 11:22:45 AM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_DELETE_MEMBERTOKENS]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_DELETE_MEMBERTOKENS]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_DELETE_MEMBERTOKENS]
	@MemberTokenID bigint
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	Delete dbo.MemberTokens
	where MemberTokenID = @MemberTokenID
END
GO
/***********************************************************/
/*************************************************/
/****** - GET STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_GET_MEMBERTOKENS]    Script Date: 9/7/2015 11:22:45 AM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_GET_MEMBERTOKENS]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_GET_MEMBERTOKENS]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_GET_MEMBERTOKENS]
	  @MemberID as bigint,
	  @Token as nvarchar(254),
	  @GeneratedBy as nvarchar(64),
	  @Created as datetime
	  @Modified as datetime,
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	  IF @MemberID = 0
    BEGIN
    SET @MemberID = null
    END
	  IF @Token = 0
    BEGIN
    SET @Token = null
    END
	  IF @GeneratedBy = 0
    BEGIN
    SET @GeneratedBy = null
    END
	  IF @Created = '9/9/1900 12:00:00 AM'
    BEGIN
    SET @Created = null
    END
	  IF @Modified = '9/9/1900 12:00:00 AM'
    BEGIN
    SET @Modified = null
    END
    SELECT [MemberTokenID] 
      FROM [dbo].[MemberTokens] 
       WHERE ([MemberID] = @MemberID)
       AND ([Token] = @Token)
       AND ([GeneratedBy] = @GeneratedBy)
       AND ([Created] = @Created)
       AND ([Modified] = @Modified or [Modified] is null)
END
GO

