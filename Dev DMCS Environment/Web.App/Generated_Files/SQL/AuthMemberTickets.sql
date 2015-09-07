/****** Object:  Table [dbo].[AuthMemberTickets]    Script Date: 9/7/2015 11:21:49 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[AuthMemberTickets](
  [AuthMemberTicketID] bigint IDENTITY(1,1) NOT NULL,
  [MemberID] bigint NOT NULL,
  [IssueDate] datetime NOT NULL,
  [Expiration] datetime NOT NULL,
  [IsPersistent] int NOT NULL,
  [Token] varchar(128) NOT NULL,
 CONSTRAINT [AuthMemberTickets_AuthMemberTicketID_pk] PRIMARY KEY CLUSTERED 
(
	[AuthMemberTicketID] ASC
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
/****** Object:  StoredProcedure [dbo].[SP_DMCS_SELECT_AUTHMEMBERTICKETS]    Script Date: 9/7/2015 11:21:49 AM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_SELECT_AUTHMEMBERTICKETS]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_SELECT_AUTHMEMBERTICKETS]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_SELECT_AUTHMEMBERTICKETS]
           @AuthMemberTicketID as bigint
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
SELECT [AuthMemberTicketID]
      ,[MemberID]
      ,[IssueDate]
      ,[Expiration]
      ,[IsPersistent]
      ,[Token]
  FROM [dbo].[AuthMemberTickets]
 WHERE AuthMemberTicketID = @AuthMemberTicketID
End
GO
/***********************************************************/
/*************************************************/
/****** - INSERT STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_INSERT_AUTHMEMBERTICKETS]    Script Date: 9/7/2015 11:21:49 AM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_INSERT_AUTHMEMBERTICKETS]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_INSERT_AUTHMEMBERTICKETS]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_INSERT_AUTHMEMBERTICKETS]
	  @MemberID as bigint,
	  @IssueDate as datetime,
	  @Expiration as datetime,
	  @IsPersistent as int
	  @Token as varchar(128),
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	  IF @MemberID = 0
    BEGIN
    SET @MemberID = null
    END
	  IF @IssueDate = '9/9/1900 12:00:00 AM'
    BEGIN
    SET @IssueDate = null
    END
	  IF @Expiration = '9/9/1900 12:00:00 AM'
    BEGIN
    SET @Expiration = null
    END
	  IF @IsPersistent = 0
    BEGIN
    SET @IsPersistent = null
    END
	  IF @Token = ''
    BEGIN
    SET @Token = null
    END
	Insert INTO [dbo].[AuthMemberTickets]
           (
            [MemberID]
           ,[IssueDate]
           ,[Expiration]
           ,[IsPersistent]
           ,[Token]
            )
     VALUES (
            @MemberID
           ,@IssueDate
           ,@Expiration
           ,@IsPersistent
           ,@Token
            )
END
GO
/***********************************************************/
/*************************************************/
/****** - UPDATE STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_UPDATE_AUTHMEMBERTICKETS]    Script Date: 9/7/2015 11:21:49 AM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_UPDATE_AUTHMEMBERTICKETS]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_UPDATE_AUTHMEMBERTICKETS]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_UPDATE_AUTHMEMBERTICKETS]
	  @AuthMemberTicketID as bigint,
	  @MemberID as bigint,
	  @IssueDate as datetime,
	  @Expiration as datetime,
	  @IsPersistent as int
	  @Token as varchar(128),
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	  IF @MemberID = 0
    BEGIN
    SET @MemberID = null
    END
	  IF @IssueDate = '9/9/1900 12:00:00 AM'
    BEGIN
    SET @IssueDate = null
    END
	  IF @Expiration = '9/9/1900 12:00:00 AM'
    BEGIN
    SET @Expiration = null
    END
	  IF @IsPersistent = 0
    BEGIN
    SET @IsPersistent = null
    END
	  IF @Token = ''
    BEGIN
    SET @Token = null
    END
	UPDATE [dbo].[AuthMemberTickets]
       SET
		   [MemberID] = @MemberID,
		   [IssueDate] = @IssueDate,
		   [Expiration] = @Expiration,
		   [IsPersistent] = @IsPersistent,
		   [Token] = @Token
       WHERE AuthMemberTicketID = @AuthMemberTicketID
END
GO
/***********************************************************/
/*************************************************/
/****** - DELETE STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_DELETE_AUTHMEMBERTICKETS]    Script Date: 9/7/2015 11:21:49 AM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_DELETE_AUTHMEMBERTICKETS]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_DELETE_AUTHMEMBERTICKETS]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_DELETE_AUTHMEMBERTICKETS]
	@AuthMemberTicketID bigint
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	Delete dbo.AuthMemberTickets
	where AuthMemberTicketID = @AuthMemberTicketID
END
GO
/***********************************************************/
/*************************************************/
/****** - GET STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_GET_AUTHMEMBERTICKETS]    Script Date: 9/7/2015 11:21:49 AM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_GET_AUTHMEMBERTICKETS]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_GET_AUTHMEMBERTICKETS]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_GET_AUTHMEMBERTICKETS]
	  @MemberID as bigint,
	  @IssueDate as datetime,
	  @Expiration as datetime,
	  @IsPersistent as int
	  @Token as varchar(128),
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	  IF @MemberID = 0
    BEGIN
    SET @MemberID = null
    END
	  IF @IssueDate = '9/9/1900 12:00:00 AM'
    BEGIN
    SET @IssueDate = null
    END
	  IF @Expiration = '9/9/1900 12:00:00 AM'
    BEGIN
    SET @Expiration = null
    END
	  IF @IsPersistent = 0
    BEGIN
    SET @IsPersistent = null
    END
	  IF @Token = ''
    BEGIN
    SET @Token = null
    END
    SELECT [AuthMemberTicketID] 
      FROM [dbo].[AuthMemberTickets] 
       WHERE ([MemberID] = @MemberID)
       AND ([IssueDate] = @IssueDate)
       AND ([Expiration] = @Expiration)
       AND ([IsPersistent] = @IsPersistent)
       AND ([Token] like @Token)
END
GO

