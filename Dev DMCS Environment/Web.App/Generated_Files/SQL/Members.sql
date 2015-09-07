/****** Object:  Table [dbo].[Members]    Script Date: 9/7/2015 11:22:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Members](
  [MemberID] bigint IDENTITY(1,1) NOT NULL,
  [Name] nvarchar(128) NOT NULL,
  [Email] nvarchar(128) NOT NULL,
  [Password] nvarchar(128) NOT NULL,
  [Avatar] nvarchar(64) NULL,
  [IsEnable] int NOT NULL,
  [IsBuiltIn] int NOT NULL,
  [LastLogin] datetime NULL,
  [Created] datetime NOT NULL,
  [Modified] datetime NULL,
  [TimeZoneID] nvarchar(64) NULL,
 CONSTRAINT [Members_MemberID_pk] PRIMARY KEY CLUSTERED 
(
	[MemberID] ASC
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
/****** Object:  StoredProcedure [dbo].[SP_DMCS_SELECT_MEMBERS]    Script Date: 9/7/2015 11:22:42 AM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_SELECT_MEMBERS]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_SELECT_MEMBERS]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_SELECT_MEMBERS]
           @MemberID as bigint
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
SELECT [MemberID]
      ,[Name]
      ,[Email]
      ,[Password]
      ,[Avatar]
      ,[IsEnable]
      ,[IsBuiltIn]
      ,[LastLogin]
      ,[Created]
      ,[Modified]
      ,[TimeZoneID]
  FROM [dbo].[Members]
 WHERE MemberID = @MemberID
End
GO
/***********************************************************/
/*************************************************/
/****** - INSERT STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_INSERT_MEMBERS]    Script Date: 9/7/2015 11:22:42 AM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_INSERT_MEMBERS]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_INSERT_MEMBERS]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_INSERT_MEMBERS]
	  @Name as nvarchar(128),
	  @Email as nvarchar(128),
	  @Password as nvarchar(128),
	  @Avatar as nvarchar(64),
	  @IsEnable as int,
	  @IsBuiltIn as int,
	  @LastLogin as datetime,
	  @Created as datetime,
	  @Modified as datetime
	  @TimeZoneID as nvarchar(64),
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	  IF @Name = 0
    BEGIN
    SET @Name = null
    END
	  IF @Email = 0
    BEGIN
    SET @Email = null
    END
	  IF @Password = 0
    BEGIN
    SET @Password = null
    END
	  IF @Avatar = 0
    BEGIN
    SET @Avatar = null
    END
	  IF @IsEnable = 0
    BEGIN
    SET @IsEnable = null
    END
	  IF @IsBuiltIn = 0
    BEGIN
    SET @IsBuiltIn = null
    END
	  IF @LastLogin = '9/9/1900 12:00:00 AM'
    BEGIN
    SET @LastLogin = null
    END
	  IF @Created = '9/9/1900 12:00:00 AM'
    BEGIN
    SET @Created = null
    END
	  IF @Modified = '9/9/1900 12:00:00 AM'
    BEGIN
    SET @Modified = null
    END
	  IF @TimeZoneID = 0
    BEGIN
    SET @TimeZoneID = null
    END
	Insert INTO [dbo].[Members]
           (
            [Name]
           ,[Email]
           ,[Password]
           ,[Avatar]
           ,[IsEnable]
           ,[IsBuiltIn]
           ,[LastLogin]
           ,[Created]
           ,[Modified]
           ,[TimeZoneID]
            )
     VALUES (
            @Name
           ,@Email
           ,@Password
           ,@Avatar
           ,@IsEnable
           ,@IsBuiltIn
           ,@LastLogin
           ,@Created
           ,@Modified
           ,@TimeZoneID
            )
END
GO
/***********************************************************/
/*************************************************/
/****** - UPDATE STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_UPDATE_MEMBERS]    Script Date: 9/7/2015 11:22:42 AM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_UPDATE_MEMBERS]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_UPDATE_MEMBERS]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_UPDATE_MEMBERS]
	  @MemberID as bigint,
	  @Name as nvarchar(128),
	  @Email as nvarchar(128),
	  @Password as nvarchar(128),
	  @Avatar as nvarchar(64),
	  @IsEnable as int,
	  @IsBuiltIn as int,
	  @LastLogin as datetime,
	  @Created as datetime,
	  @Modified as datetime
	  @TimeZoneID as nvarchar(64),
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	  IF @Name = 0
    BEGIN
    SET @Name = null
    END
	  IF @Email = 0
    BEGIN
    SET @Email = null
    END
	  IF @Password = 0
    BEGIN
    SET @Password = null
    END
	  IF @Avatar = 0
    BEGIN
    SET @Avatar = null
    END
	  IF @IsEnable = 0
    BEGIN
    SET @IsEnable = null
    END
	  IF @IsBuiltIn = 0
    BEGIN
    SET @IsBuiltIn = null
    END
	  IF @LastLogin = '9/9/1900 12:00:00 AM'
    BEGIN
    SET @LastLogin = null
    END
	  IF @Created = '9/9/1900 12:00:00 AM'
    BEGIN
    SET @Created = null
    END
	  IF @Modified = '9/9/1900 12:00:00 AM'
    BEGIN
    SET @Modified = null
    END
	  IF @TimeZoneID = 0
    BEGIN
    SET @TimeZoneID = null
    END
	UPDATE [dbo].[Members]
       SET
		   [Name] = @Name,
		   [Email] = @Email,
		   [Password] = @Password,
		   [Avatar] = @Avatar,
		   [IsEnable] = @IsEnable,
		   [IsBuiltIn] = @IsBuiltIn,
		   [LastLogin] = @LastLogin,
		   [Created] = @Created,
		   [Modified] = @Modified,
		   [TimeZoneID] = @TimeZoneID
       WHERE MemberID = @MemberID
END
GO
/***********************************************************/
/*************************************************/
/****** - DELETE STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_DELETE_MEMBERS]    Script Date: 9/7/2015 11:22:42 AM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_DELETE_MEMBERS]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_DELETE_MEMBERS]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_DELETE_MEMBERS]
	@MemberID bigint
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	Delete dbo.Members
	where MemberID = @MemberID
END
GO
/***********************************************************/
/*************************************************/
/****** - GET STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_GET_MEMBERS]    Script Date: 9/7/2015 11:22:42 AM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_GET_MEMBERS]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_GET_MEMBERS]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_GET_MEMBERS]
	  @Name as nvarchar(128),
	  @Email as nvarchar(128),
	  @Password as nvarchar(128),
	  @Avatar as nvarchar(64),
	  @IsEnable as int,
	  @IsBuiltIn as int,
	  @LastLogin as datetime,
	  @Created as datetime,
	  @Modified as datetime
	  @TimeZoneID as nvarchar(64),
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	  IF @Name = 0
    BEGIN
    SET @Name = null
    END
	  IF @Email = 0
    BEGIN
    SET @Email = null
    END
	  IF @Password = 0
    BEGIN
    SET @Password = null
    END
	  IF @Avatar = 0
    BEGIN
    SET @Avatar = null
    END
	  IF @IsEnable = 0
    BEGIN
    SET @IsEnable = null
    END
	  IF @IsBuiltIn = 0
    BEGIN
    SET @IsBuiltIn = null
    END
	  IF @LastLogin = '9/9/1900 12:00:00 AM'
    BEGIN
    SET @LastLogin = null
    END
	  IF @Created = '9/9/1900 12:00:00 AM'
    BEGIN
    SET @Created = null
    END
	  IF @Modified = '9/9/1900 12:00:00 AM'
    BEGIN
    SET @Modified = null
    END
	  IF @TimeZoneID = 0
    BEGIN
    SET @TimeZoneID = null
    END
    SELECT [MemberID] 
      FROM [dbo].[Members] 
       WHERE ([Name] = @Name)
       AND ([Email] = @Email)
       AND ([Password] = @Password)
       AND ([Avatar] = @Avatar or [Avatar] is null)
       AND ([IsEnable] = @IsEnable)
       AND ([IsBuiltIn] = @IsBuiltIn)
       AND ([LastLogin] = @LastLogin or [LastLogin] is null)
       AND ([Created] = @Created)
       AND ([Modified] = @Modified or [Modified] is null)
       AND ([TimeZoneID] = @TimeZoneID or [TimeZoneID] is null)
END
GO

