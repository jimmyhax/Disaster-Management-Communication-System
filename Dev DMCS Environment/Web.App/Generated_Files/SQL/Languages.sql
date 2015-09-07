/****** Object:  Table [dbo].[Languages]    Script Date: 9/7/2015 11:22:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Languages](
  [LanguageID] int IDENTITY(1,1) NOT NULL,
  [Code] varchar(3) NOT NULL,
  [EnglishName] nvarchar(128) NOT NULL,
  [NativeName] nvarchar(128) NULL,
  [IsEnabled] int NOT NULL,
 CONSTRAINT [Languages_LanguageID_pk] PRIMARY KEY CLUSTERED 
(
	[LanguageID] ASC
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
/****** Object:  StoredProcedure [dbo].[SP_DMCS_SELECT_LANGUAGES]    Script Date: 9/7/2015 11:22:31 AM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_SELECT_LANGUAGES]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_SELECT_LANGUAGES]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_SELECT_LANGUAGES]
           @LanguageID as int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
SELECT [LanguageID]
      ,[Code]
      ,[EnglishName]
      ,[NativeName]
      ,[IsEnabled]
  FROM [dbo].[Languages]
 WHERE LanguageID = @LanguageID
End
GO
/***********************************************************/
/*************************************************/
/****** - INSERT STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_INSERT_LANGUAGES]    Script Date: 9/7/2015 11:22:31 AM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_INSERT_LANGUAGES]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_INSERT_LANGUAGES]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_INSERT_LANGUAGES]
	  @LanguageID as int,
	  @Code as varchar(3),
	  @EnglishName as nvarchar(128),
	  @NativeName as nvarchar(128)
	  @IsEnabled as int,
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	  IF @Code = ''
    BEGIN
    SET @Code = null
    END
	  IF @EnglishName = 0
    BEGIN
    SET @EnglishName = null
    END
	  IF @NativeName = 0
    BEGIN
    SET @NativeName = null
    END
	  IF @IsEnabled = 0
    BEGIN
    SET @IsEnabled = null
    END
	Insert INTO [dbo].[Languages]
           (
            [LanguageID]
           ,[Code]
           ,[EnglishName]
           ,[NativeName]
           ,[IsEnabled]
            )
     VALUES (
            @LanguageID
           ,@Code
           ,@EnglishName
           ,@NativeName
           ,@IsEnabled
            )
END
GO
/***********************************************************/
/*************************************************/
/****** - UPDATE STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_UPDATE_LANGUAGES]    Script Date: 9/7/2015 11:22:31 AM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_UPDATE_LANGUAGES]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_UPDATE_LANGUAGES]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_UPDATE_LANGUAGES]
	  @LanguageID as int,
	  @Code as varchar(3),
	  @EnglishName as nvarchar(128),
	  @NativeName as nvarchar(128)
	  @IsEnabled as int,
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	  IF @Code = ''
    BEGIN
    SET @Code = null
    END
	  IF @EnglishName = 0
    BEGIN
    SET @EnglishName = null
    END
	  IF @NativeName = 0
    BEGIN
    SET @NativeName = null
    END
	  IF @IsEnabled = 0
    BEGIN
    SET @IsEnabled = null
    END
	UPDATE [dbo].[Languages]
       SET
		   [Code] = @Code,
		   [EnglishName] = @EnglishName,
		   [NativeName] = @NativeName,
		   [IsEnabled] = @IsEnabled
       WHERE LanguageID = @LanguageID
END
GO
/***********************************************************/
/*************************************************/
/****** - DELETE STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_DELETE_LANGUAGES]    Script Date: 9/7/2015 11:22:31 AM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_DELETE_LANGUAGES]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_DELETE_LANGUAGES]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_DELETE_LANGUAGES]
	@LanguageID int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	Delete dbo.Languages
	where LanguageID = @LanguageID
END
GO
/***********************************************************/
/*************************************************/
/****** - GET STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_GET_LANGUAGES]    Script Date: 9/7/2015 11:22:31 AM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_GET_LANGUAGES]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_GET_LANGUAGES]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_GET_LANGUAGES]
	  @Code as varchar(3),
	  @EnglishName as nvarchar(128),
	  @NativeName as nvarchar(128)
	  @IsEnabled as int,
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	  IF @Code = ''
    BEGIN
    SET @Code = null
    END
	  IF @EnglishName = 0
    BEGIN
    SET @EnglishName = null
    END
	  IF @NativeName = 0
    BEGIN
    SET @NativeName = null
    END
	  IF @IsEnabled = 0
    BEGIN
    SET @IsEnabled = null
    END
    SELECT [LanguageID] 
      FROM [dbo].[Languages] 
       WHERE ([Code] like @Code)
       AND ([EnglishName] = @EnglishName)
       AND ([NativeName] = @NativeName or [NativeName] is null)
       AND ([IsEnabled] = @IsEnabled)
END
GO

