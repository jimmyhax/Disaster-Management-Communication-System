/****** Object:  Table [dbo].[bank]    Script Date: 9/7/2015 11:21:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[bank](
  [Bank_ID] int IDENTITY(1,1) NOT NULL,
  [Routing_Num] varchar(20) NOT NULL,
  [Name] varchar(50) NOT NULL,
  [IsFDIC] bit NOT NULL,
 CONSTRAINT [bank_Bank_ID_pk] PRIMARY KEY CLUSTERED 
(
	[Bank_ID] ASC
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
/****** Object:  StoredProcedure [dbo].[SP_DMCS_SELECT_BANK]    Script Date: 9/7/2015 11:21:50 AM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_SELECT_BANK]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_SELECT_BANK]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_SELECT_BANK]
           @Bank_ID as int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
SELECT [Bank_ID]
      ,[Routing_Num]
      ,[Name]
      ,[IsFDIC]
  FROM [dbo].[bank]
 WHERE Bank_ID = @Bank_ID
End
GO
/***********************************************************/
/*************************************************/
/****** - INSERT STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_INSERT_BANK]    Script Date: 9/7/2015 11:21:50 AM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_INSERT_BANK]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_INSERT_BANK]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_INSERT_BANK]
	  @Routing_Num as varchar(20),
	  @Name as varchar(50)
	  @IsFDIC as bit,
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	  IF @Routing_Num = ''
    BEGIN
    SET @Routing_Num = null
    END
	  IF @Name = ''
    BEGIN
    SET @Name = null
    END
	  IF @IsFDIC = 0
    BEGIN
    SET @IsFDIC = null
    END
	Insert INTO [dbo].[bank]
           (
            [Routing_Num]
           ,[Name]
           ,[IsFDIC]
            )
     VALUES (
            @Routing_Num
           ,@Name
           ,@IsFDIC
            )
END
GO
/***********************************************************/
/*************************************************/
/****** - UPDATE STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_UPDATE_BANK]    Script Date: 9/7/2015 11:21:50 AM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_UPDATE_BANK]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_UPDATE_BANK]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_UPDATE_BANK]
	  @Bank_ID as int,
	  @Routing_Num as varchar(20),
	  @Name as varchar(50)
	  @IsFDIC as bit,
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	  IF @Routing_Num = ''
    BEGIN
    SET @Routing_Num = null
    END
	  IF @Name = ''
    BEGIN
    SET @Name = null
    END
	  IF @IsFDIC = 0
    BEGIN
    SET @IsFDIC = null
    END
	UPDATE [dbo].[bank]
       SET
		   [Routing_Num] = @Routing_Num,
		   [Name] = @Name,
		   [IsFDIC] = @IsFDIC
       WHERE Bank_ID = @Bank_ID
END
GO
/***********************************************************/
/*************************************************/
/****** - DELETE STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_DELETE_BANK]    Script Date: 9/7/2015 11:21:50 AM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_DELETE_BANK]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_DELETE_BANK]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_DELETE_BANK]
	@Bank_ID int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	Delete dbo.bank
	where Bank_ID = @Bank_ID
END
GO
/***********************************************************/
/*************************************************/
/****** - GET STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_GET_BANK]    Script Date: 9/7/2015 11:21:50 AM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_GET_BANK]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_GET_BANK]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_GET_BANK]
	  @Routing_Num as varchar(20),
	  @Name as varchar(50)
	  @IsFDIC as bit,
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	  IF @Routing_Num = ''
    BEGIN
    SET @Routing_Num = null
    END
	  IF @Name = ''
    BEGIN
    SET @Name = null
    END
	  IF @IsFDIC = 0
    BEGIN
    SET @IsFDIC = null
    END
    SELECT [Bank_ID] 
      FROM [dbo].[bank] 
       WHERE ([Routing_Num] like @Routing_Num)
       AND ([Name] like @Name)
       AND ([IsFDIC] = @IsFDIC)
END
GO

