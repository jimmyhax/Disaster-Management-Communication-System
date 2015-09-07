/****** Object:  Table [dbo].[account]    Script Date: 9/7/2015 11:21:35 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[account](
  [Account_ID] int IDENTITY(1,1) NOT NULL,
  [Bank_ID] int NOT NULL,
  [Account_Num] varchar(15) NOT NULL,
  [Type] varchar(20) NOT NULL,
 CONSTRAINT [account_Account_ID_pk] PRIMARY KEY CLUSTERED 
(
	[Account_ID] ASC
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
/****** Object:  StoredProcedure [dbo].[SP_DMCS_SELECT_ACCOUNT]    Script Date: 9/7/2015 11:21:35 AM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_SELECT_ACCOUNT]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_SELECT_ACCOUNT]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_SELECT_ACCOUNT]
           @Account_ID as int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
SELECT [Account_ID]
      ,[Bank_ID]
      ,[Account_Num]
      ,[Type]
  FROM [dbo].[account]
 WHERE Account_ID = @Account_ID
End
GO
/***********************************************************/
/*************************************************/
/****** - INSERT STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_INSERT_ACCOUNT]    Script Date: 9/7/2015 11:21:35 AM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_INSERT_ACCOUNT]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_INSERT_ACCOUNT]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_INSERT_ACCOUNT]
	  @Bank_ID as int,
	  @Account_Num as varchar(15)
	  @Type as varchar(20),
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	  IF @Bank_ID = 0
    BEGIN
    SET @Bank_ID = null
    END
	  IF @Account_Num = ''
    BEGIN
    SET @Account_Num = null
    END
	  IF @Type = ''
    BEGIN
    SET @Type = null
    END
	Insert INTO [dbo].[account]
           (
            [Bank_ID]
           ,[Account_Num]
           ,[Type]
            )
     VALUES (
            @Bank_ID
           ,@Account_Num
           ,@Type
            )
END
GO
/***********************************************************/
/*************************************************/
/****** - UPDATE STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_UPDATE_ACCOUNT]    Script Date: 9/7/2015 11:21:35 AM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_UPDATE_ACCOUNT]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_UPDATE_ACCOUNT]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_UPDATE_ACCOUNT]
	  @Account_ID as int,
	  @Bank_ID as int,
	  @Account_Num as varchar(15)
	  @Type as varchar(20),
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	  IF @Bank_ID = 0
    BEGIN
    SET @Bank_ID = null
    END
	  IF @Account_Num = ''
    BEGIN
    SET @Account_Num = null
    END
	  IF @Type = ''
    BEGIN
    SET @Type = null
    END
	UPDATE [dbo].[account]
       SET
		   [Bank_ID] = @Bank_ID,
		   [Account_Num] = @Account_Num,
		   [Type] = @Type
       WHERE Account_ID = @Account_ID
END
GO
/***********************************************************/
/*************************************************/
/****** - DELETE STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_DELETE_ACCOUNT]    Script Date: 9/7/2015 11:21:35 AM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_DELETE_ACCOUNT]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_DELETE_ACCOUNT]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_DELETE_ACCOUNT]
	@Account_ID int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	Delete dbo.account
	where Account_ID = @Account_ID
END
GO
/***********************************************************/
/*************************************************/
/****** - GET STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_GET_ACCOUNT]    Script Date: 9/7/2015 11:21:35 AM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_GET_ACCOUNT]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_GET_ACCOUNT]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_GET_ACCOUNT]
	  @Bank_ID as int,
	  @Account_Num as varchar(15)
	  @Type as varchar(20),
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	  IF @Bank_ID = 0
    BEGIN
    SET @Bank_ID = null
    END
	  IF @Account_Num = ''
    BEGIN
    SET @Account_Num = null
    END
	  IF @Type = ''
    BEGIN
    SET @Type = null
    END
    SELECT [Account_ID] 
      FROM [dbo].[account] 
       WHERE ([Bank_ID] = @Bank_ID)
       AND ([Account_Num] like @Account_Num)
       AND ([Type] like @Type)
END
GO

