/****** Object:  Table [dbo].[MemberSocialNetworks]    Script Date: 9/7/2015 11:22:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[MemberSocialNetworks](
  [MemberSocialNetworkID] bigint IDENTITY(1,1) NOT NULL,
  [MemberID] bigint NOT NULL,
  [SocialNetworkID] int NOT NULL,
  [SocialNetworkUserID] nvarchar(100) NOT NULL,
  [SocialNetworkUserEmail] nvarchar(100) NULL,
  [SocialNetworkUserName] nvarchar(100) NULL,
  [AccessToken] nvarchar(1024) NULL,
 CONSTRAINT [MemberSocialNetworks_MemberSocialNetworkID_pk] PRIMARY KEY CLUSTERED 
(
	[MemberSocialNetworkID] ASC
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
/****** Object:  StoredProcedure [dbo].[SP_DMCS_SELECT_MEMBERSOCIALNETWORKS]    Script Date: 9/7/2015 11:22:43 AM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_SELECT_MEMBERSOCIALNETWORKS]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_SELECT_MEMBERSOCIALNETWORKS]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_SELECT_MEMBERSOCIALNETWORKS]
           @MemberSocialNetworkID as bigint
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
SELECT [MemberSocialNetworkID]
      ,[MemberID]
      ,[SocialNetworkID]
      ,[SocialNetworkUserID]
      ,[SocialNetworkUserEmail]
      ,[SocialNetworkUserName]
      ,[AccessToken]
  FROM [dbo].[MemberSocialNetworks]
 WHERE MemberSocialNetworkID = @MemberSocialNetworkID
End
GO
/***********************************************************/
/*************************************************/
/****** - INSERT STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_INSERT_MEMBERSOCIALNETWORKS]    Script Date: 9/7/2015 11:22:43 AM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_INSERT_MEMBERSOCIALNETWORKS]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_INSERT_MEMBERSOCIALNETWORKS]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_INSERT_MEMBERSOCIALNETWORKS]
	  @MemberID as bigint,
	  @SocialNetworkID as int,
	  @SocialNetworkUserID as nvarchar(100),
	  @SocialNetworkUserEmail as nvarchar(100),
	  @SocialNetworkUserName as nvarchar(100)
	  @AccessToken as nvarchar(1024),
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	  IF @MemberID = 0
    BEGIN
    SET @MemberID = null
    END
	  IF @SocialNetworkID = 0
    BEGIN
    SET @SocialNetworkID = null
    END
	  IF @SocialNetworkUserID = 0
    BEGIN
    SET @SocialNetworkUserID = null
    END
	  IF @SocialNetworkUserEmail = 0
    BEGIN
    SET @SocialNetworkUserEmail = null
    END
	  IF @SocialNetworkUserName = 0
    BEGIN
    SET @SocialNetworkUserName = null
    END
	  IF @AccessToken = 0
    BEGIN
    SET @AccessToken = null
    END
	Insert INTO [dbo].[MemberSocialNetworks]
           (
            [MemberID]
           ,[SocialNetworkID]
           ,[SocialNetworkUserID]
           ,[SocialNetworkUserEmail]
           ,[SocialNetworkUserName]
           ,[AccessToken]
            )
     VALUES (
            @MemberID
           ,@SocialNetworkID
           ,@SocialNetworkUserID
           ,@SocialNetworkUserEmail
           ,@SocialNetworkUserName
           ,@AccessToken
            )
END
GO
/***********************************************************/
/*************************************************/
/****** - UPDATE STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_UPDATE_MEMBERSOCIALNETWORKS]    Script Date: 9/7/2015 11:22:43 AM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_UPDATE_MEMBERSOCIALNETWORKS]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_UPDATE_MEMBERSOCIALNETWORKS]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_UPDATE_MEMBERSOCIALNETWORKS]
	  @MemberSocialNetworkID as bigint,
	  @MemberID as bigint,
	  @SocialNetworkID as int,
	  @SocialNetworkUserID as nvarchar(100),
	  @SocialNetworkUserEmail as nvarchar(100),
	  @SocialNetworkUserName as nvarchar(100)
	  @AccessToken as nvarchar(1024),
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	  IF @MemberID = 0
    BEGIN
    SET @MemberID = null
    END
	  IF @SocialNetworkID = 0
    BEGIN
    SET @SocialNetworkID = null
    END
	  IF @SocialNetworkUserID = 0
    BEGIN
    SET @SocialNetworkUserID = null
    END
	  IF @SocialNetworkUserEmail = 0
    BEGIN
    SET @SocialNetworkUserEmail = null
    END
	  IF @SocialNetworkUserName = 0
    BEGIN
    SET @SocialNetworkUserName = null
    END
	  IF @AccessToken = 0
    BEGIN
    SET @AccessToken = null
    END
	UPDATE [dbo].[MemberSocialNetworks]
       SET
		   [MemberID] = @MemberID,
		   [SocialNetworkID] = @SocialNetworkID,
		   [SocialNetworkUserID] = @SocialNetworkUserID,
		   [SocialNetworkUserEmail] = @SocialNetworkUserEmail,
		   [SocialNetworkUserName] = @SocialNetworkUserName,
		   [AccessToken] = @AccessToken
       WHERE MemberSocialNetworkID = @MemberSocialNetworkID
END
GO
/***********************************************************/
/*************************************************/
/****** - DELETE STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_DELETE_MEMBERSOCIALNETWORKS]    Script Date: 9/7/2015 11:22:43 AM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_DELETE_MEMBERSOCIALNETWORKS]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_DELETE_MEMBERSOCIALNETWORKS]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_DELETE_MEMBERSOCIALNETWORKS]
	@MemberSocialNetworkID bigint
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	Delete dbo.MemberSocialNetworks
	where MemberSocialNetworkID = @MemberSocialNetworkID
END
GO
/***********************************************************/
/*************************************************/
/****** - GET STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_GET_MEMBERSOCIALNETWORKS]    Script Date: 9/7/2015 11:22:43 AM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_GET_MEMBERSOCIALNETWORKS]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_GET_MEMBERSOCIALNETWORKS]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_GET_MEMBERSOCIALNETWORKS]
	  @MemberID as bigint,
	  @SocialNetworkID as int,
	  @SocialNetworkUserID as nvarchar(100),
	  @SocialNetworkUserEmail as nvarchar(100),
	  @SocialNetworkUserName as nvarchar(100)
	  @AccessToken as nvarchar(1024),
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	  IF @MemberID = 0
    BEGIN
    SET @MemberID = null
    END
	  IF @SocialNetworkID = 0
    BEGIN
    SET @SocialNetworkID = null
    END
	  IF @SocialNetworkUserID = 0
    BEGIN
    SET @SocialNetworkUserID = null
    END
	  IF @SocialNetworkUserEmail = 0
    BEGIN
    SET @SocialNetworkUserEmail = null
    END
	  IF @SocialNetworkUserName = 0
    BEGIN
    SET @SocialNetworkUserName = null
    END
	  IF @AccessToken = 0
    BEGIN
    SET @AccessToken = null
    END
    SELECT [MemberSocialNetworkID] 
      FROM [dbo].[MemberSocialNetworks] 
       WHERE ([MemberID] = @MemberID)
       AND ([SocialNetworkID] = @SocialNetworkID)
       AND ([SocialNetworkUserID] = @SocialNetworkUserID)
       AND ([SocialNetworkUserEmail] = @SocialNetworkUserEmail or [SocialNetworkUserEmail] is null)
       AND ([SocialNetworkUserName] = @SocialNetworkUserName or [SocialNetworkUserName] is null)
       AND ([AccessToken] = @AccessToken or [AccessToken] is null)
END
GO

