/****** Object:  Table [dbo].[ClientWPets]    Script Date: 9/7/2015 11:22:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ClientWPets](
  [CLIENTWPETS_ID] int IDENTITY(1,1) NOT NULL,
  [Pet_Record_ID] int NOT NULL,
  [Client_id] int NULL,
  [Location_ID] int NULL,
  [cp_Date] datetime NOT NULL,
  [ownership] char(1) NULL,
 CONSTRAINT [ClientWPets_CLIENTWPETS_ID_pk] PRIMARY KEY CLUSTERED 
(
	[CLIENTWPETS_ID] ASC
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
/****** Object:  StoredProcedure [dbo].[SP_DMCS_SELECT_CLIENTWPETS]    Script Date: 9/7/2015 11:22:01 AM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_SELECT_CLIENTWPETS]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_SELECT_CLIENTWPETS]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_SELECT_CLIENTWPETS]
           @CLIENTWPETS_ID as int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
SELECT [CLIENTWPETS_ID]
      ,[Pet_Record_ID]
      ,[Client_id]
      ,[Location_ID]
      ,[cp_Date]
      ,[ownership]
  FROM [dbo].[ClientWPets]
 WHERE CLIENTWPETS_ID = @CLIENTWPETS_ID
End
GO
/***********************************************************/
/*************************************************/
/****** - INSERT STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_INSERT_CLIENTWPETS]    Script Date: 9/7/2015 11:22:01 AM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_INSERT_CLIENTWPETS]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_INSERT_CLIENTWPETS]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_INSERT_CLIENTWPETS]
	  @Pet_Record_ID as int,
	  @Client_id as int,
	  @Location_ID as int,
	  @cp_Date as datetime
	  @ownership as char(1),
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	  IF @Pet_Record_ID = 0
    BEGIN
    SET @Pet_Record_ID = null
    END
	  IF @Client_id = 0
    BEGIN
    SET @Client_id = null
    END
	  IF @Location_ID = 0
    BEGIN
    SET @Location_ID = null
    END
	  IF @cp_Date = '9/9/1900 12:00:00 AM'
    BEGIN
    SET @cp_Date = null
    END
	  IF @ownership = ''
    BEGIN
    SET @ownership = null
    END
	Insert INTO [dbo].[ClientWPets]
           (
            [Pet_Record_ID]
           ,[Client_id]
           ,[Location_ID]
           ,[cp_Date]
           ,[ownership]
            )
     VALUES (
            @Pet_Record_ID
           ,@Client_id
           ,@Location_ID
           ,@cp_Date
           ,@ownership
            )
END
GO
/***********************************************************/
/*************************************************/
/****** - UPDATE STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_UPDATE_CLIENTWPETS]    Script Date: 9/7/2015 11:22:01 AM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_UPDATE_CLIENTWPETS]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_UPDATE_CLIENTWPETS]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_UPDATE_CLIENTWPETS]
	  @CLIENTWPETS_ID as int,
	  @Pet_Record_ID as int,
	  @Client_id as int,
	  @Location_ID as int,
	  @cp_Date as datetime
	  @ownership as char(1),
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	  IF @Pet_Record_ID = 0
    BEGIN
    SET @Pet_Record_ID = null
    END
	  IF @Client_id = 0
    BEGIN
    SET @Client_id = null
    END
	  IF @Location_ID = 0
    BEGIN
    SET @Location_ID = null
    END
	  IF @cp_Date = '9/9/1900 12:00:00 AM'
    BEGIN
    SET @cp_Date = null
    END
	  IF @ownership = ''
    BEGIN
    SET @ownership = null
    END
	UPDATE [dbo].[ClientWPets]
       SET
		   [Pet_Record_ID] = @Pet_Record_ID,
		   [Client_id] = @Client_id,
		   [Location_ID] = @Location_ID,
		   [cp_Date] = @cp_Date,
		   [ownership] = @ownership
       WHERE CLIENTWPETS_ID = @CLIENTWPETS_ID
END
GO
/***********************************************************/
/*************************************************/
/****** - DELETE STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_DELETE_CLIENTWPETS]    Script Date: 9/7/2015 11:22:01 AM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_DELETE_CLIENTWPETS]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_DELETE_CLIENTWPETS]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_DELETE_CLIENTWPETS]
	@CLIENTWPETS_ID int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	Delete dbo.ClientWPets
	where CLIENTWPETS_ID = @CLIENTWPETS_ID
END
GO
/***********************************************************/
/*************************************************/
/****** - GET STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_GET_CLIENTWPETS]    Script Date: 9/7/2015 11:22:01 AM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_GET_CLIENTWPETS]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_GET_CLIENTWPETS]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_GET_CLIENTWPETS]
	  @Pet_Record_ID as int,
	  @Client_id as int,
	  @Location_ID as int,
	  @cp_Date as datetime
	  @ownership as char(1),
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	  IF @Pet_Record_ID = 0
    BEGIN
    SET @Pet_Record_ID = null
    END
	  IF @Client_id = 0
    BEGIN
    SET @Client_id = null
    END
	  IF @Location_ID = 0
    BEGIN
    SET @Location_ID = null
    END
	  IF @cp_Date = '9/9/1900 12:00:00 AM'
    BEGIN
    SET @cp_Date = null
    END
	  IF @ownership = ''
    BEGIN
    SET @ownership = null
    END
    SELECT [CLIENTWPETS_ID] 
      FROM [dbo].[ClientWPets] 
       WHERE ([Pet_Record_ID] = @Pet_Record_ID)
       AND ([Client_id] = @Client_id or [Client_id] is null)
       AND ([Location_ID] = @Location_ID or [Location_ID] is null)
       AND ([cp_Date] = @cp_Date)
       AND ([ownership] = @ownership or [ownership] is null)
END
GO

